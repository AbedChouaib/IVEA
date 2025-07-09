package com.uniSaarland_CIPMM.ivea;

import java.awt.Color;
import java.util.Arrays;
import java.util.stream.IntStream;

import ij.ImagePlus;
import ij.gui.Plot;
import ij.process.ImageProcessor;

public class FusionEventMetrics
{
	private static final double EPSILON = 1e-9;
	public static class MeasurementConfig
	{
		public boolean riseTime = true;
		public boolean decayTime = true;
		public boolean tfwhm = true;
		public boolean spread = true;
		public boolean use2DGaussian = true;
		public boolean debug = false; // show diagnostic plot

		public MeasurementConfig setRiseTime(boolean b)
		{
			riseTime = b;
			return this;
		}

		public MeasurementConfig setDecayTime(boolean b)
		{
			decayTime = b;
			return this;
		}

		public MeasurementConfig setTFWHM(boolean b)
		{
			tfwhm = b;
			return this;
		}

		public MeasurementConfig setSpread(boolean b)
		{
			spread = b;
			return this;
		}

		public MeasurementConfig setUse2DGaussian(boolean b)
		{
			use2DGaussian = b;
			return this;
		}

		public MeasurementConfig setDebug(boolean b)
		{
			debug = b;
			return this;
		}
	}

	public static class MeasurementResult
	{
		public Double riseTime, decayTau, tfwhm, sigmaXY;

		@Override
		public String toString()
		{
			return String.format("rise=%.4f, decay=%.4f, fwhm=%.4f, σ=%.4f",
					riseTime, decayTau, tfwhm, sigmaXY);
		}
	}

	public static class EventInput
	{
		public final double[] trace;
		public final int z;
		public final double x, y;
		public final int initialPeak, eventID;

		public EventInput(double[] trace, int z, double x, double y, int initialPeak, int eventID)
		{
			this.trace = trace;
			this.z = z;
			this.x = x;
			this.y = y;
			this.initialPeak = initialPeak;
			this.eventID = eventID;
		}
	}

	public static MeasurementResult[] analyseBatch(ImagePlus imp, EventInput[] events, MeasurementConfig cfg, boolean parallel)
	{
		MeasurementResult[] out = new MeasurementResult[events.length];
		IntStream range = IntStream.range(0, events.length);
		if (parallel)
			range = range.parallel();
		range.forEach(i ->
		{
			try
			{
				EventInput e = events[i];
				out[i] = analyseSingle(imp, e.trace, e.z, e.x, e.y, e.initialPeak, e.eventID, cfg); // z is the ROI position
			} catch (Exception ex)
			{
				out[i] = new MeasurementResult();
			}
		});

		return out;
	}

	public static MeasurementResult analyseSingle(ImagePlus imp,
			double[] trace, int z, double x, double y, int initialPeak, int eventID, MeasurementConfig cfg)
	{
		MeasurementResult r = new MeasurementResult();
		int peakIdx = indexOfMax(trace, initialPeak);
		double[] baseline = computePotentialBaselines(trace, peakIdx);

		double riseStart = Double.NaN;
		double riseEnd = Double.NaN;

		if (cfg.riseTime)
		{
			double[] riseBounds = calculateRiseTime(trace, baseline[0], peakIdx);
			r.riseTime = (riseBounds != null) ? (riseBounds[1] - riseBounds[0]) : Double.NaN;
			if (riseBounds != null)
			{
				riseStart = riseBounds[0];
				riseEnd = riseBounds[1];
			}
		}

		if (cfg.tfwhm)
			r.tfwhm = tfwhm(trace, baseline[0], peakIdx);
		if (cfg.spread)
			r.sigmaXY = cfg.use2DGaussian ? sigma2D(imp, z, x, y) : sigma1D(imp, z, x, y);

		if (cfg.decayTime)
		{
			DecayFitter.DecayFitResult result = DecayFitter.fitMonoExponentialDecay(trace, peakIdx, baseline[1]);
			double tau = result.tau;
			double[] fit = result.fit;
			r.decayTau = tau;
			if (cfg.debug)
				debugPlot(trace, baseline, fit, peakIdx, riseStart, riseEnd, tau, eventID);
		}

		return r;
	}

	public static double[] computePotentialBaselines(double[] v, int peakIdx)
	{
		if (v == null || v.length < 2 || peakIdx < 0 || peakIdx >= v.length)
			return new double[] { Double.NaN, Double.NaN };

		// --- Compute baseUpper ---
		int preEnd = (peakIdx == 0) ? Math.min(Math.max(1, (int) (0.15 * v.length)), v.length) : peakIdx;
		double baseUpper = computeTrimmedMean(v, 0, preEnd);
		if (Double.isNaN(baseUpper))
			baseUpper = v[0];

		// --- Compute baseLower ---
		int minTailLen = Math.max(5, (int) (0.20 * v.length));
		int tailStart = peakIdx + Math.max(1, (v.length - 1 - peakIdx) / 3);
		tailStart = Math.min(tailStart, v.length - minTailLen);

		double baseLower = Double.NaN;
		if (tailStart < v.length && (v.length - tailStart >= minTailLen))
		{
			double[] tail = Arrays.copyOfRange(v, tailStart, v.length);
			Arrays.sort(tail);
			baseLower = tail[tail.length / 2]; // median
		}

		// fallback
		if (Double.isNaN(baseLower))
		{
			baseLower = baseUpper;
		} else if (Math.abs(baseUpper - baseLower) < 0.05 * Math.abs(baseUpper) + EPSILON)
		{
			baseLower = baseUpper;
		}

		return new double[] { baseUpper, baseLower };
	}

	// trimmed mean (average of lowest 20%) for a given range.
	private static double computeTrimmedMean(double[] v, int from, int to)
	{
		if (from >= to || from < 0 || to > v.length)
			return Double.NaN;
		double[] seg = Arrays.copyOfRange(v, from, to);
		Arrays.sort(seg);
		int n = Math.max(1, (int) (0.2 * seg.length));
		double sum = 0;
		for (int i = 0; i < n; i++)
			sum += seg[i];
		return sum / n;
	}

	// ======= Rise: 90 → 10 % of peak amplitude (backward) =======
	public static double[] calculateRiseTime(double[] v, double base, int peakIdx)
	{
		if (v == null || v.length < 2 || peakIdx <= 0 || peakIdx >= v.length)
			return new double[] { Double.NaN, Double.NaN };

		double peak = v[peakIdx];
		double amp = peak - base;
		if (amp <= EPSILON)
			return new double[] { Double.NaN, Double.NaN };

		double amp10 = base + 0.1 * amp;
		double amp90 = base + 0.9 * amp;

		int minIdx = peakIdx;
		double minVal = peak;
		boolean risingDetected = false;

//		for (int i = peakIdx - 1; i >= Math.max(0, peakIdx - MAX_BACKSEARCH); i--)
		for (int i = peakIdx - 1; i >= 0; i--)
		{
			if (!risingDetected && v[i] < minVal)
			{
				minVal = v[i];
				minIdx = i;
			}
			// If signal starts rising again after a fall, lock min point
			if (v[i] > v[i + 1] + EPSILON)
			{
				risingDetected = true;
			}
		}

		// If no a clear minimum was found, fallback to just before peakIdx
		if (!risingDetected)
		{
			minIdx = Math.max(0, peakIdx - 1);
		}

		double riseStart = findThresholdCrossingBackward(v, amp10, peakIdx, minIdx);
		double riseEnd = findThresholdCrossingBackward(v, amp90, peakIdx, minIdx);

		if (Double.isNaN(riseStart))
			riseStart = minIdx;
		if (Double.isNaN(riseEnd))
			riseEnd = peakIdx;

		return new double[] { riseStart, riseEnd };
	}

	private static double findThresholdCrossingBackward(double[] v, double threshold, int from, int minIdx)
	{
		for (int i = from - 1; i >= minIdx && i >= 0; i--)
		{
			if (v[i] <= threshold && v[i + 1] > threshold)
			{
				double delta = v[i + 1] - v[i];
				if (Math.abs(delta) < EPSILON)
					return Double.NaN;
				return i + (threshold - v[i]) / delta;
			}
		}
		return Double.NaN;
	}

	private static int indexOfMax(double[] v, int center)
	{
		int n = v.length;
		int from = Math.max(0, center - 5);
		int to = Math.min(n - 1, center + 5);
		int idx = from;
		double max = v[from];
		for (int i = from + 1; i <= to; i++)
		{
			if (v[i] > max)
			{
				max = v[i];
				idx = i;
			}
		}
		return idx;
	}

	// =========================== Curve Plot ===========================
	private static double[] debugPlot(double[] raw, double[] baseline, double[] fit,
			int peakIdx, double riseStart,
			double riseEnd, double tau, int eventID)
	{
		double baseUpper = baseline[0];
		double baseLower = baseline[1];
		int n = raw.length;

		double[] x = new double[n];
		for (int i = 0; i < n; i++)
			x[i] = i;

		double peak = raw[peakIdx];

		Plot plot = new Plot("e(" + eventID + ")", "Frame", "Intensity");
		plot.setColor(Color.GRAY);
		plot.addPoints(x, raw, Plot.LINE);

		plot.setColor(Color.RED);
		double[] baseArr = new double[n];
		Arrays.fill(baseArr, baseUpper);
		plot.addPoints(x, baseArr, Plot.LINE);

		plot.setColor(Color.RED.darker());
		Arrays.fill(baseArr, baseLower);
		plot.addPoints(x, baseArr, Plot.LINE);

		plot.setColor(Color.BLUE);
		plot.addPoints(x, fit, Plot.LINE);

		if (!Double.isNaN(riseStart) && !Double.isNaN(riseEnd))
		{
			plot.setColor(Color.GREEN);
			double y10 = baseUpper + 0.10 * (peak - baseUpper);
			double y90 = baseUpper + 0.90 * (peak - baseUpper);
			plot.drawLine((int) riseStart, (int) y10,
					(int) riseEnd, (int) y90);
		}

		plot.show();
		return fit;
	}

	// =========================== Temporal FWHM ===========================
	public static double tfwhm(double[] v, double base, int peakIdx)
	{
		if (v == null || v.length < 2 || Double.isNaN(base) || peakIdx < 0 || peakIdx >= v.length)
			return Double.NaN;

		double peak = v[peakIdx];
		double amp = peak - base;
		if (amp <= EPSILON)
			return Double.NaN;

		double half = base + 0.5 * amp;

		double left = findHalfMaxLeft(v, half, peakIdx);
		double right = findHalfMaxRight(v, half, peakIdx);

		return (!Double.isNaN(left) && !Double.isNaN(right) && right > left + EPSILON)
				? (right - left)
				: Double.NaN;
	}

	private static double findHalfMaxLeft(double[] v, double half, int peakIdx)
	{
		for (int i = peakIdx - 1; i >= 0; i--)
		{
			double y1 = v[i], y2 = v[i + 1];
			if (y1 <= half && y2 >= half)
			{
				double delta = y2 - y1;
				return (Math.abs(delta) < EPSILON)
						? (Math.abs(y1 - half) < EPSILON ? i : i + 1.0)
						: i + (half - y1) / delta;
			}
		}
		return (v[0] >= half - EPSILON) ? 0.0 : Double.NaN;
	}

	private static double findHalfMaxRight(double[] v, double half, int peakIdx)
	{
		for (int i = peakIdx + 1; i < v.length; i++)
		{
			double y1 = v[i - 1], y2 = v[i];
			if (y1 >= half && y2 <= half)
			{
				double delta = y1 - y2;
				return (Math.abs(delta) < EPSILON)
						? (Math.abs(y1 - half) < EPSILON ? i - 1.0 : i)
						: (i - 1.0) + (y1 - half) / delta;
			}
		}
		return (v[v.length - 1] >= half - EPSILON) ? (double) (v.length - 1) : Double.NaN;
	}
	// =========================== Temporal FWHM ===========================

	// =========================== Sigma Estimation ===========================
	private static double sigma2D(ImagePlus imp, int z, double cx, double cy)
	{
		ImageProcessor ip = imp.getStack().getProcessor(z + 1);
		int x0 = (int) Math.round(cx), y0 = (int) Math.round(cy);
		int rad = 3, w = ip.getWidth(), h = ip.getHeight();
		double sum = 0, sx = 0, sy = 0, sx2 = 0, sy2 = 0;
		for (int y = Math.max(0, y0 - rad); y <= Math.min(h - 1, y0 + rad); y++)
			for (int x = Math.max(0, x0 - rad); x <= Math.min(w - 1, x0 + rad); x++)
			{
				double val = ip.getPixelValue(x, y);
				if (val <= 0)
					continue;
				sum += val;
				sx += val * x;
				sy += val * y;
				sx2 += val * x * x;
				sy2 += val * y * y;
			}
		if (sum == 0)
			return Double.NaN;
		double muX = sx / sum, muY = sy / sum;
		double sigX = Math.sqrt(Math.max((sx2 / sum) - muX * muX, 0));
		double sigY = Math.sqrt(Math.max((sy2 / sum) - muY * muY, 0));
		return 0.5 * (sigX + sigY);
	}

	private static double sigma1D(ImagePlus imp, int z, double cx, double cy)
	{
		ImageProcessor ip = imp.getStack().getProcessor(z + 1);
		int w = ip.getWidth(), h = ip.getHeight();
		int x0 = (int) Math.round(cx), y0 = (int) Math.round(cy);
		double sigX = sigmaMoments(ip, 0, w - 1, xi -> ip.getPixelValue(xi, y0));
		double sigY = sigmaMoments(ip, 0, h - 1, yi -> ip.getPixelValue(x0, yi));
		if (Double.isNaN(sigX) || Double.isNaN(sigY))
			return Double.NaN;
		return 0.5 * (sigX + sigY);
	}

	private static double sigmaMoments(ImageProcessor ip, int from, int to, java.util.function.IntToDoubleFunction f)
	{
		double sum = 0, s = 0, s2 = 0;
		for (int i = from; i <= to; i++)
		{
			double val = Math.max(f.applyAsDouble(i), 0);
			sum += val;
			s += val * i;
			s2 += val * i * i;
		}
		if (sum == 0)
			return Double.NaN;
		double mu = s / sum;
		double var = (s2 / sum) - mu * mu;
		return Math.sqrt(Math.max(var, 0));
	}
	// =========================== Sigma Estimation ===========================
}
