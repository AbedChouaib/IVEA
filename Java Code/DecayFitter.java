package com.uniSaarland_CIPMM.ivea;

import java.util.ArrayList;
import java.util.List;

public class DecayFitter
{
	public static class DecayFitResult
	{
		public final double amplitude; // A
		public final double tau; // τ
		public final double[] fit; // fitted decay curve

		/**
		 * @param amplitude fitted amplitude A
		 * @param tau       fitted time constant τ
		 * @param fit       array of fitted values (length n)
		 */
		public DecayFitResult(double amplitude, double tau, double[] fit)
		{
			this.amplitude = amplitude;
			this.tau = tau;
			this.fit = fit;
		}
	}

	public static DecayFitResult fitMonoExponentialDecay(double[] v, int peakIdx, double baseline)
	{
		int n = v.length;
		double[] fit = new double[n];
		for (int i = 0; i < peakIdx; i++)
		{
			fit[i] = Double.NaN;
		}

		List<Double> xList = new ArrayList<>();
		List<Double> logYList = new ArrayList<>();

		double lastY = v[peakIdx];
		for (int i = peakIdx; i < n; i++)
		{
			double y = v[i];
			if (y > lastY + 1e-6)
				break; // stop if signal rises again
			lastY = y;
			double yAdj = y - baseline;
			if (yAdj <= 0)
				continue;
			double x = i - peakIdx;
			xList.add(x);
			logYList.add(Math.log(yAdj));
		}

		int count = xList.size();
		if (count < 2)
			throw new IllegalArgumentException("Insufficient valid decay points after peak.");

		double sumX = 0, sumY = 0, sumXX = 0, sumXY = 0;
		for (int i = 0; i < count; i++)
		{
			double x = xList.get(i);
			double y = logYList.get(i);
			sumX += x;
			sumY += y;
			sumXX += x * x;
			sumXY += x * y;
		}

		double slope = (count * sumXY - sumX * sumY) / (count * sumXX - sumX * sumX);
		if (slope >= 0)
			throw new IllegalArgumentException("Decay slope is not negative. Signal likely not decaying.");


		double A = v[peakIdx] - baseline;
		double tau = -1.0 / slope;
		// Generate fitted curve
		for (int i = peakIdx; i < n; i++)
		{
			double x = i - peakIdx;
			fit[i] = baseline + A * Math.exp(-x / tau);
		}

		return new DecayFitResult(A, tau, fit);
	}

	public static double calculateDecayTau(double[] v, int peakIdx, double baseline)
	{
		return fitMonoExponentialDecay(v, peakIdx, baseline).tau;
	}

	public static double[] calculateDecayFit(double[] v, int peakIdx, double baseline)
	{
		return fitMonoExponentialDecay(v, peakIdx, baseline).fit;
	}
}