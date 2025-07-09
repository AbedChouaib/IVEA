package com.uniSaarland_CIPMM.ivea;

import java.awt.Polygon;
import java.util.Arrays;
import java.util.Map;
import java.util.stream.IntStream;

import ij.ImagePlus;
import ij.gui.OvalRoi;
import ij.gui.Roi;
import ij.plugin.filter.MaximumFinder;
import ij.process.ImageProcessor;
import ij.process.ImageStatistics;

public class LocalMeasurement
{
	public double[] ApproximateParameters(ImagePlus Img, ImageProcessor ip, Polygon points,
			int R, int dim_length, int ScanPoints, double imMu, boolean Synapse)
	{
		double[] results = new double[6];
		int numPoints = points.npoints > ScanPoints ? ScanPoints : points.npoints;
		double[][] BufferedResults = new double[numPoints][2];
		double segma = 0;
		double max = 0;
		for (int j = 0; j < numPoints; j++)
		{
			int X = points.xpoints[j];
			int Y = points.ypoints[j];
			int[] Center = { X, Y };
			EstimatePSF ePSF = new EstimatePSF();
			segma += ePSF.CalculateFWHM(Img, Center);

			X = (int) (X - R); // R/2
			Y = (int) (Y - R); // R/2
			OvalRoi circle = new OvalRoi(X, Y, dim_length, dim_length);
			Img.setRoi(circle);
			ImageStatistics ImStat = circle.getStatistics();
			BufferedResults[j][0] = ImStat.mean;
			BufferedResults[j][1] = ImStat.stdDev;
			max = j < 2 ? max + BufferedResults[j][0] : max;
		}
		segma /= numPoints;
//		SPmean /= numPoints;
		for (int i = 0; i < numPoints; i++)
		{
			results[0] = results[0] + BufferedResults[i][0];
			results[1] = results[1] + BufferedResults[i][1];
		}
		results[0] = results[0] / numPoints;
		results[1] = 0;// results[1] / numPoints;
		results[2] = ApproximateProminece(ip, Synapse);
		results[3] = segma;
		results[4] = max / numPoints;
		results[5] = imMu;
		return results;
	}

	int ApproximateProminece(ImageProcessor ip, boolean Synapse)
	{
		int prom = 10;
		int numPoints = 2;
		boolean SafeEixt = false; // protect from infinite looping.
		int BufferedNumPoints = numPoints;
		int count = 1;
		while (numPoints > 1 && !SafeEixt)
		{
			MaximumFinder FM = new MaximumFinder();
			Polygon points = FM.getMaxima(ip, prom, true);
			numPoints = points.npoints;
			prom = prom + 10;
			if (BufferedNumPoints == numPoints)
			{
				count++;
			}
			BufferedNumPoints = numPoints;
			SafeEixt = count > 4 ? true : false;
		}
//		prom = Synapse ? prom - (count - 1) * 10 : prom;
		return prom - (count - 1) * 10;
	}

	int AdjustProminece(ImageProcessor ip, int numPoints, int prom, int max_LMs)
	{
		int nPoints = numPoints;
		while (nPoints > max_LMs)
		{
			MaximumFinder FM = new MaximumFinder();
			Polygon points = FM.getMaxima(ip, prom, true);
			nPoints = points.npoints;
			prom = prom + 10;
		}
		return prom;
	}

	public void SpatialTemporalSearch(ImagePlus Img, int frame, Map<Integer, EventTracking> eTrackMap, int prominence, int R,
			int TemporalFrames, int DetectionCount)
	{
		int backPro = 3;
		ImagePlus SubImg = new ImagePlus("STS", Img.getStack().getProcessor(frame)).duplicate();
		R = R < 8 ? 8 : R; // used to track maximum point in radius of 8 pixels.
		IntStream.range(0, eTrackMap.size()).parallel().forEach(i ->
		{
			EventTracking eT = eTrackMap.get(i);
			if (eT.getTrackMaxPoint() < TemporalFrames && eT.getDetectionCount() < DetectionCount)
			{
				if (eT.getFlag() == -10)
				{
					int temp = frame - backPro - 1;
					int endFrame = temp < 1 ? 1 : temp;
					for (int ki = frame - 1; ki > frame - endFrame; ki--)
					{
						ImagePlus pImg = new ImagePlus("STS", Img.getStack().getProcessor(ki)).duplicate();
						TrackMaxima(pImg, eT, prominence);
					}
					eT.setFlag(0);
				}
				TrackMaxima(SubImg, eT, prominence);
				SubImg.changes = false;
				SubImg.close();
			}
		});
	}

	private void TrackMaxima(ImagePlus SubImg, EventTracking eT, int prominence)
	{
		double Dim = eT.getLargesRoi().getFloatWidth();
//		double Dim = 20;
		double[] Co = eT.getCenter(0);
		double X = Co[0];
		double Y = Co[1];
		double temp = Dim / 2;
		X = X - temp;
		Y = Y - temp;
//		Roi roi = new OvalRoi(X, Y, Dim * 1.5, Dim * 1.5);
		Roi roi = new Roi(X, Y, Dim, Dim);
		ImagePlus imp = SubImg.duplicate();
//		IJ.run(imp, "Select None", "");
		imp.setRoi(roi);
		ImageProcessor ip = SubImg.getProcessor().duplicate();
		ip.setRoi(roi);
		MaximumFinder FM = new MaximumFinder();
		Polygon points = FM.getMaxima(ip, prominence, false);
		eT.AddCenter(points.xpoints[0], points.ypoints[0]);
		if (points.npoints != 0)
		{
			double dist = Math.sqrt(Math.pow(points.xpoints[0] - Co[0], 2) + Math.pow(points.ypoints[0] - Co[1], 2));
			imp.changes = false;
			imp.close();
			if (dist > 4)
			{
				eT.IncrementTrackMaxPoint(10000); // do not search anymore.
				eT.setFlagPrint(false);
			} else
			{
				eT.IncrementTrackMaxPoint(1);
			}
		}
	}

	public void TemporalIntensityVariation(ImagePlus Img, int frame, Map<Integer, EventTracking> eTrackMap)
	{

		IntStream.range(0, eTrackMap.size()).parallel().forEach(i ->
		{
			EventTracking eT = eTrackMap.get(i);
			if (eT.getFlag() == -10)
			{
				ImagePlus SubImg = new ImagePlus("TIV", Img.getStack().getProcessor(frame)).duplicate();
				TrackIntensity(SubImg, eT, frame);
			}
		});
	}

	public void TrackIntensity(ImagePlus SubImg, EventTracking eT, int frame)
	{
		Roi roi = eT.getRoi(-1);
		SubImg.setRoi(roi);
		ImageStatistics imStat = SubImg.getStatistics();
		double Mu = imStat.mean;
		double maxMu = eT.getDeltaMaxMean();
		double AvgMu = eT.getAvgMean();

		if (Mu > maxMu)
		{
			double pMu = eT.getpMean();
			AvgMu = (Mu + pMu) / 2;
			eT.setDeltaMaxMean(Mu);
			eT.setAvgMean(AvgMu);
		}

		if (!eT.getBackPropagation())
		{
			if (Mu >= AvgMu)
			{
				eT.addContinuousFrames(frame);
				eT.IncrementContinuousDetection(1);
			} else
			{
				eT.setFlag(0);
				eT.setpMean(0);
				eT.setDeltaMaxMean(0);
			}
		}
		SubImg.changes = false;
		SubImg.close();
	}
}
