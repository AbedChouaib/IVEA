package com.uniSaarland_CIPMM.ivea;

import java.awt.Polygon;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.OptionalInt;
import java.util.Random;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.stream.IntStream;

import com.uniSaarland_CIPMM.ivea.gui.IVEAsetup;

import ij.IJ;
import ij.ImagePlus;
import ij.ImageStack;
import ij.gui.OvalRoi;
import ij.gui.Roi;
import ij.plugin.filter.MaximumFinder;
import ij.plugin.frame.RoiManager;
import ij.process.FloatProcessor;
import ij.process.ImageProcessor;
import ij.process.ImageStatistics;

public class EventManager
{
//	public static int mtrxDim;
	private static final DecimalFormat df = new DecimalFormat("0.000");
	private double NoiseMean = 0;

	public Map<Integer, EventTracking> EliminateFalseFusion(Map<Integer, EventTracking> eTrackMap)
	{
		Map<Integer, EventTracking> fMap = new HashMap<Integer, EventTracking>();
		int count = 0;
		for (int i = 0; i < eTrackMap.size(); i++)
		{
			EventTracking eMap = eTrackMap.get(i);
			if (eMap != null)
			{
				if (eMap.getContinuousCount() > 0 && eMap.getDetectionCount() < 4)
				{
					fMap.put(count, eMap);
					count++;
				}
			}
		}
		return fMap;
	}

	public Map<Integer, double[]> GetPosssibleFusion(Map<Integer, double[]> eMap)
	{
		Map<Integer, double[]> fMap = new HashMap<Integer, double[]>();
		int count = 0;
		for (int i = 0; i < eMap.size(); i++)
		{
			double[] temp = eMap.get(i);
			if (temp[6] == 0)
			{
				fMap.put(count, temp);
				count++;
			}
		}
		return fMap;
	}

	public void AdjustFusionCenter(ImagePlus imp, Map<Integer, EventTracking> eTrackMap,
			int frame, int deltaFrame, int prominence, boolean TrackInt)
	{

		IntStream.range(0, eTrackMap.size()).parallel().forEach(i ->
		{
			EventTracking eMap = eTrackMap.get(i);
			if (!eMap.getCenterStatus())
			{
				Roi mask = eMap.getLargesRoi();
				ImageProcessor ip = imp.getStack().getProcessor(eMap.getFirstFrame());
				ip.setRoi(mask);
				int Cx;
				int Cy;
				MaximumFinder FM = new MaximumFinder();
				Polygon points = FM.getMaxima(ip, 10, false);
				int numPoints = points.npoints;
				if (numPoints == 0)
				{
					ImageStatistics imStat = ip.getStatistics();
					Cx = (int) imStat.xCenterOfMass; // xCenterOfMass
					Cy = (int) imStat.yCenterOfMass;
				} else
				{
					Cx = points.xpoints[0];
					Cy = points.ypoints[0];
				}
				eMap.replaceCenter(Cx, Cy, 0);
				eMap.setCenterStatus(true);
			}
			if (TrackInt)
			{
				if (eMap.getFlag() == -10)
				{
					if (eMap.getpMean() == 0)
					{
						int preFrame = eMap.getFusionStatus() ? 0 : -1;
						ImagePlus pImg = new ImagePlus("Slice_" + Integer.toString(frame + preFrame),
								imp.getStack().getProcessor(frame + preFrame)).duplicate();
						Roi roi = eMap.getLargesRoi();
						pImg.setRoi(roi);
						ImageStatistics pStat = pImg.getStatistics();
						eMap.setpMean(pStat.mean);
					}
					ImagePlus SubImg = new ImagePlus("TIV", imp.getStack().getProcessor(frame).duplicate());
					LocalMeasurement Lm = new LocalMeasurement();

					if (!eMap.getFusionStatus())
					{
						Lm.TrackIntensity(SubImg, eMap, frame);
					}
				}
			}
		});
	}

	public void addROIs(ImagePlus imp, Map<Integer, EventTracking> eTrack, RoiManager MaskROI, boolean dualID,
			int Dim, int minCluster, boolean fixedFBE)
	{
		int counter = MaskROI.getCount();
		String stat = "";

		for (int i = 0; i < eTrack.size(); i++)
		{
			EventTracking eMap = eTrack.get(i);
			if (eMap != null && eMap.getFlagPrint())
			{
				int frame = eMap.getFirstFrame();
				imp.setSlice(frame);
				double[] Center = eMap.getCenter(0);
				int X = (int) Center[0];
				int Y = (int) Center[1];
				int temp = Dim / 2;
				X = X - temp;
				Y = Y - temp;
				Roi roi = new OvalRoi(X, Y, Dim, Dim);
				int ID = dualID ? eMap.getDualID() : counter;
				ID = ID == -1 ? eMap.getID() : ID;
				boolean isBG = eMap.getCenterLayerPosition() == minCluster || eMap.getCenterLayerPosition() == minCluster + 1;
				String PosStatus = isBG && fixedFBE ? " BG" : "";
				String StimStatus = fixedFBE ? "-Stim " + eMap.getStimulationID() : "";
				if (fixedFBE)
				{
					roi.setName(
							stat + "event {" + ID + "} | frame " + frame + StimStatus + ", "
									+ eMap.getFusionTypeStatus() + PosStatus);
				} else
				{
					roi.setName(
							stat + "event {" + ID + "} | frame " + frame);
				}
				MaskROI.add(imp, roi, counter);
				imp.setRoi(roi);
				MaskROI.select(counter);
				MaskROI.runCommand(imp, "Update");
				IJ.run(imp, "Select None", "");
				counter++;
			}
		}
	}

	public void addROIs_For_Training(ImagePlus imp, Map<Integer, EventTracking> eTrack, Map<Integer, EventTracking> eFusion,
			RoiManager MaskROI, boolean dualID,
			int Dim, int minCluster)
	{
		int counter = MaskROI.getCount();
		String stat = "";
		for (int i = 0; i < eFusion.size(); i++)
		{
			EventTracking eMap = eFusion.get(i);
			if (eMap != null && eMap.getFlagPrint())
			{
				int frame = eMap.getFirstFrame();
				imp.setSlice(frame);
				double[] Center = eMap.getCenter(0);
				int X = (int) Center[0];
				int Y = (int) Center[1];
				int temp = Dim / 2;
				X = X - temp;
				Y = Y - temp;
				Roi roi = new OvalRoi(X, Y, Dim, Dim);
				roi.setName(
						stat + "event {" + i + "} | frame " + frame + eMap.getFusionTypeStatus() + eMap.getFusionType());
				MaskROI.add(imp, roi, counter);
				imp.setRoi(roi);
				MaskROI.select(counter);
				MaskROI.runCommand(imp, "Update");
				IJ.run(imp, "Select None", "");
				counter++;
			}
		}
		for (int i = 0; i < eTrack.size(); i++)
		{
			EventTracking eMap = eTrack.get(i);
			if (eMap != null && !eMap.getFlagPrint())
			{
				int frame = eMap.getFirstFrame();
				imp.setSlice(frame);
				double[] Center = eMap.getCenter(0);
				int X = (int) Center[0];
				int Y = (int) Center[1];
				int temp = Dim / 2;
				X = X - temp;
				Y = Y - temp;
				Roi roi = new OvalRoi(X, Y, Dim, Dim);
				int ID = eMap.getID();
				roi.setName(
						stat + "event {" + ID + "} | frame " + frame + eMap.getFusionTypeStatus() + eMap.getFusionType());
				MaskROI.add(imp, roi, counter);
				imp.setRoi(roi);
				MaskROI.select(counter);
				MaskROI.runCommand(imp, "Update");
				IJ.run(imp, "Select None", "");
				counter++;
			}
		}
	}

	public void addROIsType(ImagePlus imp, Map<Integer, EventTracking> eTrack, RoiManager MaskROI, int Dim,
			int StimID, int minCluster)
	{
		int counter = MaskROI.getCount();
		String stat = "";
		for (int i = 0; i < eTrack.size(); i++)
		{
			EventTracking eMap = eTrack.get(i);
			if (eMap != null && eMap.getFlagPrint() && eMap.getStimulationID() == StimID && eMap.getDualID() == -1)
			{
				int frame = eMap.getFirstFrame();
				imp.setSlice(frame);
				double[] Center = eMap.getCenter(-1);
				int X = (int) Center[0];
				int Y = (int) Center[1];
				int temp = Dim / 2;
				X = X - temp;
				Y = Y - temp;
				Roi roi = new OvalRoi(X, Y, Dim, Dim);
				int ID = eMap.getID();
				boolean isBG = eMap.getCenterLayerPosition() == minCluster || eMap.getCenterLayerPosition() == minCluster + 1;
				String PosStatus = isBG ? " BG" : "";
				roi.setName(
						stat + "event {" + ID + "} | frame " + frame + "-Stim " + eMap.getStimulationID() + ", "
								+ eMap.getFusionTypeStatus() + PosStatus);
				MaskROI.add(imp, roi, counter);
				imp.setRoi(roi);
				MaskROI.select(counter);
				MaskROI.runCommand(imp, "Update");
				IJ.run(imp, "Select None", "");
				counter++;
			}
		}
	}

	public double[][] StartFeatureExtraction_lstmv2(
			ImagePlus OImg,
			Map<Integer, EventTracking> eTrackMap,
			int nframes,
			int mtrx_R,
			int ImageCount,
			int type,
			int extendFrames,
			int nRegions,
			boolean RangeNorm,
			boolean fixedFBE)
	{
		boolean scale_data = (mtrx_R != 6);

		int dim = (mtrx_R * 2) + 1; // Patch dimension
		int stepF = (nframes - 1) / 2;

		if (!fixedFBE)
		{
			stepF += (int) Math.floor(extendFrames / 2.0);
		}

		int totalFrames = (2 * stepF) + 1 + extendFrames;
		PatchMeasurements pm = new PatchMeasurements(true, mtrx_R, type);
		int height = OImg.getHeight();
		int width = OImg.getWidth();

		double[][] EventsPatchData = new double[eTrackMap.size()][];

		for (int i = 0; i < eTrackMap.size(); i++)
		{
			EventTracking eMap = eTrackMap.get(i);
			int eFrame = eMap.getFirstFrame();

			double[][][] mtrx3D = new double[totalFrames][dim][dim];

			boolean[] outOfRangeFlags = new boolean[totalFrames];

			int stepFx = stepF;
			IntStream.range(0, totalFrames).parallel().forEach(t ->
			{
				int cFrame = (eFrame - stepFx) + t; 

				if (cFrame < 1 || cFrame > ImageCount)
				{
					outOfRangeFlags[t] = true;
				} else
				{
					ImageProcessor ip = OImg.getStack().getProcessor(cFrame);
					double[][] patch = getPatchMatrix(ip, eMap.getCenter(0), mtrx_R, dim, height, width);

					if (scale_data)
					{
						LocalMath LM = new LocalMath();
						patch = LM.Bilinear_interpolate(patch, 13, 13);
					}

					mtrx3D[t] = patch;
				}
			});
			double[] rawFeatures = pm.CalculateFixedEventData(mtrx3D, eMap.getID(), nRegions, RangeNorm);
			int nFeatures = nRegions;

			java.util.concurrent.atomic.DoubleAdder[] sumVals = new java.util.concurrent.atomic.DoubleAdder[nFeatures];
			for (int f = 0; f < nFeatures; f++)
			{
				sumVals[f] = new java.util.concurrent.atomic.DoubleAdder();
			}

			java.util.concurrent.atomic.AtomicInteger validCount = new java.util.concurrent.atomic.AtomicInteger(0);

			IntStream.range(0, totalFrames).parallel().forEach(t ->
			{
				if (!outOfRangeFlags[t])
				{
					int offset = t * nFeatures;
					for (int f = 0; f < nFeatures; f++)
					{
						sumVals[f].add(rawFeatures[offset + f]);
					}
					validCount.incrementAndGet();
				}
			});

			int vCount = validCount.get();
			double[] avgVals = new double[nFeatures];
			for (int f = 0; f < nFeatures; f++)
			{
				avgVals[f] = (vCount > 0) ? (sumVals[f].sum() / vCount) : 0.0;
			}
			if (vCount < totalFrames)
			{
				IntStream.range(0, totalFrames).parallel().forEach(t ->
				{
					if (outOfRangeFlags[t])
					{
						int offset = t * nFeatures;
						for (int f = 0; f < nFeatures; f++)
						{
							rawFeatures[offset + f] = avgVals[f];
						}
					}
				});
			}

			double maxMu = 0.0;
			int maxTimeShiftIndex = 0; // in [0..totalFrames-1]
			for (int t = 0; t < totalFrames; t++)
			{
				double val = rawFeatures[t * nFeatures]; // your "center" feature
				if (val > maxMu)
				{
					maxMu = val;
					maxTimeShiftIndex = t;
				}
			}
			int maxTimeShift = stepF + 1 - maxTimeShiftIndex;
			eMap.setMaxPointTimeShift(-maxTimeShift);
			eMap.setTimeShiftedFrame(eFrame + eMap.getMaxPointTimeShift());

			pm.NormalizeVector(rawFeatures, RangeNorm);

			EventsPatchData[i] = rawFeatures;
		}

		return EventsPatchData;
	}

	public double[][] StartFeatureExtraction_lstm(ImagePlus OImg, Map<Integer, EventTracking> eTrackMap, int nframes,
			int mtrx_R, int type, int extandFrames, int nRegions, boolean RangeNorm, boolean fixedFBE)
	{
		int ImageCount = OImg.getStackSize();
		boolean scale_data = mtrx_R != 6;
		int dim = (mtrx_R * 2) + 1;
		int stepF = ((nframes - 1) / 2);
		PatchMeasurements pm = new PatchMeasurements(true, mtrx_R, type);
		int height = OImg.getHeight();
		int width = OImg.getWidth();
		double[][] EventsPatchData = new double[eTrackMap.size()][];
		int totalFrames = nframes + 2 + extandFrames;
		LocalMath LM = new LocalMath();
		if (!fixedFBE)
		{
			stepF = (int) (stepF + Math.floor(extandFrames / 2));
		}
		for (int i = 0; i < eTrackMap.size(); i++)
		{
			EventTracking eMap = eTrackMap.get(i);
			int eFrame = eMap.getFirstFrame();
			int FixPosition = 0;
			int FrameLimit = eFrame + stepF + 1;
			if (FrameLimit > ImageCount)
			{
				FixPosition = ImageCount - (FrameLimit);
			} else if (eFrame - stepF < 1)
			{
				FixPosition = stepF - eFrame + 1;
			}
			int StartFrame = eFrame - stepF + FixPosition;
			double[][][] mtrx3D = new double[totalFrames][dim][dim];
			double[] RecoredZeros = new double[totalFrames];
			AtomicBoolean fillEvent = new AtomicBoolean();
			fillEvent.set(false);
			IntStream.range(0, totalFrames).parallel().forEach(j ->
			{
				int cFrame = j + StartFrame - 1; // current frame. -1 align center frame.
				cFrame = cFrame < 1 ? 1 : cFrame;
				if (cFrame <= ImageCount)
				{
					ImageProcessor ip = OImg.getStack().getProcessor(cFrame); // .duplicate()
					mtrx3D[j] = getPatchMatrix(ip, eMap.getCenter(0), mtrx_R, dim, height, width);
					if (scale_data)
					{
						double[][] temp = mtrx3D[j];
						mtrx3D[j] = LM.Bilinear_interpolate(temp, 13, 13);
					}
				} else
				{
					RecoredZeros[j] = -1;
					fillEvent.set(true);
				}
			});
			EventsPatchData[i] = pm.CalculateFixedEventData(mtrx3D, eMap.getID(), nRegions, RangeNorm);

			double maxMu = 0;
			int counter = 0;
			int MaxTimeShift = 0;
			int nonZeroCounter = 0;
			int nFeatures = 13;
			// ----------------------------- fill last frames -----------------------------
			double[] Vf = new double[nFeatures];
			if (fillEvent.get())
			{
				for (int t = 0; t < totalFrames; t++)
				{
					if (RecoredZeros[t] == -1)
					{
						int tx = t;
						int ID = i;
						int Nt = nonZeroCounter;
						IntStream.range(0, nFeatures).parallel().forEach(f ->
						{
							EventsPatchData[ID][tx * nFeatures + f] = Vf[f] / Nt;
						});
					} else
					{
						nonZeroCounter++;
						int tx = t;
						int ID = i;
						IntStream.range(0, nFeatures).parallel().forEach(f ->
						{
							Vf[f] += EventsPatchData[ID][tx * nFeatures + f];
						});
					}
				}
			}
			// ----------------------------- end -----------------------------
			for (int t = 0; t < EventsPatchData[i].length; t += nFeatures) // just the center.
			{
				if (maxMu < EventsPatchData[i][t])
				{
					maxMu = EventsPatchData[i][t];
					MaxTimeShift = counter;
				}
				counter++;
			}
			MaxTimeShift = stepF + 1 - MaxTimeShift;
			eMap.setMaxPointTimeShift(-MaxTimeShift);
			eMap.setTimeShiftedFrame(eMap.getFirstFrame() + eMap.getMaxPointTimeShift());
			pm.NormalizeVector(EventsPatchData[i], RangeNorm);
		}
		return EventsPatchData;
	}

	public float[][][][] CollectTimeSeriesData(ImagePlus imStack, Map<Integer, EventTracking> eTrackMap,
			int rad, int timeseries, int FixedRad)
	{
		boolean scaleData = rad != FixedRad;
		int kernel = rad * 2 + 1;
		int FixedKernel = FixedRad * 2 + 1;
		int lowerF = timeseries;
		int upperF = timeseries + 1;
		int height = imStack.getHeight();
		int width = imStack.getWidth();
		int nSlices = imStack.getStackSize();
		LocalMath LM = new LocalMath();
		int cropArea = kernel * kernel;
		int totalFrames = lowerF + upperF;
		float[][][][] matrix4D = new float[eTrackMap.size()][totalFrames][FixedKernel][FixedKernel];

		for (int id = 0; id < eTrackMap.size(); id++)
		{
			EventTracking eMap = eTrackMap.get(id);
			double[] cetner = eMap.getCenter(0);
			int cx = (int) cetner[0]; // Cy in Python is Cx in ImageJ
			int cy = (int) cetner[1]; // Cx in Python is Cy in ImageJ
			int frame = eMap.getFirstFrame();
			int syncFrame = 0;
			if (frame < lowerF)
			{
				frame = lowerF;
			} else if (frame >= nSlices - lowerF)
			{
				frame = nSlices - upperF;
			}

			syncFrame = frame - lowerF == 0 ? 1 : 0;
			final int Lrange = frame - lowerF + syncFrame;
			final int Urange = frame + upperF + syncFrame;
			int eID = id;
			int imXStart = Math.max(0, cx - rad);
			int imXEnd = Math.min(width, cx + rad + 1);
			int imYStart = Math.max(0, cy - rad);
			int imYEnd = Math.min(height, cy + rad + 1);
			int cropXStart = Math.max(0, rad - cx);
			int cropXEnd = cropXStart + (imXEnd - imXStart);
			int cropYStart = Math.max(0, rad - cy);
			int cropYEnd = cropYStart + (imYEnd - imYStart);
			double mean[] = new double[totalFrames];
			double[][][] matrix3D = new double[totalFrames][FixedKernel][FixedKernel];
			IntStream.range(Lrange, Urange).parallel().forEach(i ->
			{
				int ndx = i - (Lrange);
				double[][] tempMatrix = new double[kernel][kernel];
				ImageProcessor ip = imStack.getStack().getProcessor(i);
				mean[ndx] = cropAreaAndGetMean(ip, tempMatrix, cropXStart, cropXEnd,
						cropYStart, cropYEnd, imXStart, imYStart, cropArea);
				if (scaleData)
				{
					matrix3D[ndx] = LM.Bilinear_interpolate(tempMatrix, FixedKernel, FixedKernel);
				} else
				{
					matrix3D[ndx] = tempMatrix;
				}
			});
			matrix4D[eID] = normalizeTimeSeries(matrix3D);

			eMap.setTimeShiftedFrame(frame);
		}
		return matrix4D;
	}

	/*
	 * ========================================================================
	 * -----------------[0]---------[1]----------[2]---------[3]---------------
	 * ClassesTags = ["pH-sens","pH-insens", "ph-sens NC","pH-insens NC",
	 * ----[-1]-----[-2]---[-3]-------[-4]-----[-5]---[-6]---[-7]-----[-8]-----
	 * "HighNoise","Noise","Motion","zMotion","Wave","Rise","Fall","Artifact"];
	 * ========================================================================
	 */
	// NC means no cloud
	public ArrayList<double[]> applyPredictionTcell(Map<Integer, EventTracking> eTrackMap, float[][] Vy,
			double amp, double[][] EventsPatchData, boolean[] fusionCtrl,
			int nClasses, boolean useCustomModel, int FirstClasses, boolean exportTraining)
	{
		ArrayList<double[]> Vp = new ArrayList<double[]>(); // TODO:
		int num_artificial = 8;
		int fusion_numbers = nClasses - num_artificial;
		double NoiseMu = 0;
		int Nt = 0;
		int fusion_length = Math.min(fusion_numbers, fusionCtrl.length);
		for (int i = 0; i < Vy.length; i++)
		{
			int ki = i;
			EventTracking eMap = eTrackMap.get(i);
			// pH_sens[0], ph_insens[1], tiny[2], x_fusion[3]
			boolean[] fusionEvents = new boolean[fusion_numbers];
			boolean[] randEvents = new boolean[num_artificial];
			IntStream.range(0, fusionEvents.length).parallel().forEach(k ->
			{
				fusionEvents[k] = Vy[ki][k] >= amp;
			});
			// randEvents[0] High noise, randEvents[1] Noise for average noise level
			IntStream.range(0, randEvents.length).parallel().forEach(k ->
			{
				randEvents[k] = Vy[ki][k + fusion_numbers] >= amp;
			});

			for (int j = 0; j < nClasses; j++)
			{
				int kj = j;
				IntStream.range(0, fusionEvents.length).parallel().forEach(k ->
				{
					fusionEvents[k] = fusionEvents[k] && Vy[ki][k] >= Vy[ki][kj];
				});
				IntStream.range(0, randEvents.length).parallel().forEach(k ->
				{
					randEvents[k] = randEvents[k] && Vy[ki][k + fusion_numbers] >= Vy[ki][kj];
				});
			}
			for (int j = 0; j < fusion_length; j++)
			{
				fusionEvents[j] = fusionCtrl[j] && fusionEvents[j];
			}

			boolean accept = false;
			for (int k = 0; k < fusionEvents.length; k++)
			{
				accept = fusionEvents[k] ? fusionEvents[k] : accept;
				if (fusionEvents[k])
				{
					eMap.setFusionTypeStatus("_class_", k);
					break;
				}
			}
			if (accept) // || randEvents[6] // intensity fall event
			{
				Vp.add(EventsPatchData[i]);
				if (eMap.getFlag() <= 0)
				{
					eMap.setFlag(1);
					eMap.setFlagPrint(true);
					if (eMap.getDualID() > 0)
					{
						EventTracking eMapx = eTrackMap.get(eMap.getDualID());
						eMapx.setFlagPrint(true);
						eMapx.setFlag(2);
						eMap.setFlag(2);
					}
				}
			} else
			{
				if (exportTraining)
				{
					boolean entered = false;
					for (int k = 0; k < randEvents.length; k++)
					{
						if (randEvents[k])
						{
							entered = true;
							eMap.setFusionTypeStatus("_class_", -(k + 1));
						}
						if (k == randEvents.length - 1 && !entered)
						{
							eMap.setFusionTypeStatus("_class_", -(99));
						}
					}
				}
				if (randEvents[1])
				{
					NoiseMu += eMap.getAreaIntensityRecorded();
					Nt++;
				}
				eMap.setFlagPrint(false);
			}
		}
		NoiseMu /= Nt;
		NoiseMean = NoiseMu;
		return Vp;
	}

	public double getNoiseMean()
	{
		return NoiseMean;
	}

	public ArrayList<double[]> applyPredictionNeuronsV2(Map<Integer, EventTracking> eTrackMap, float[][] Vy,
			double[][] EventsPatchData, boolean[] fusionCtrl, int nClasses, double amp)
	{
		ArrayList<double[]> Vp = new ArrayList<double[]>();
		for (int i = 0; i < Vy.length; i++)
		{
			EventTracking eMap = eTrackMap.get(i);
			boolean fusion = Vy[i][0] >= amp, pulse = Vy[i][1] >= amp, electric = Vy[i][2] >= amp;
			boolean chemical = (Vy[i][3] >= amp);
			boolean OutFocus = (Vy[i][8] >= amp);
			boolean Rising = (Vy[i][6] >= amp);
			for (int j = 0; j < nClasses; j++)
			{
				fusion = fusion && Vy[i][0] >= Vy[i][j];
				pulse = pulse && Vy[i][1] >= Vy[i][j];
				electric = electric && Vy[i][2] >= Vy[i][j];
				chemical = chemical && Vy[i][3] >= Vy[i][j];
				OutFocus = OutFocus && Vy[i][8] >= Vy[i][j];
				Rising = Rising && Vy[i][6] >= Vy[i][j];
			}
			fusion = fusionCtrl[0] && fusion;
			pulse = fusionCtrl[1] && pulse;
			chemical = fusionCtrl[2] && chemical;
			OutFocus = fusionCtrl[3] && OutFocus;
			Rising = fusionCtrl[4] && Rising; // && eMap.getStimulationID() > 0
			if (fusion || pulse || electric || chemical || OutFocus || Rising)
			{
				Vp.add(EventsPatchData[i]);
				if (fusion)
				{
					eMap.setFusionTypeStatus("", 0);
				} else if (pulse)
				{
					eMap.setFusionTypeStatus("short event", 1);
				} else if (Rising)
				{
					eMap.setFusionTypeStatus("slow event", 2);
				}
				eMap.setFlagPrint(true);
			} else
			{
				eMap.setFlagPrint(false);
			}
		}
		return Vp;
	}

	public ArrayList<double[]> applyPredictionNeuronsV2(Map<Integer, EventTracking> eTrackMap, float[][] Vy, float[][] Vy_ex,
			double[][] EventsPatchData, double[][] EventsPatchDataEx, boolean[] fusionCtrl, int nClasses,
			double amp)
	{
		ArrayList<double[]> Vp = new ArrayList<double[]>();
		for (int i = 0; i < Vy.length; i++)
		{
			EventTracking eMap = eTrackMap.get(i);
			boolean fusion = Vy[i][0] >= amp, pulse = Vy[i][1] >= amp, electric = Vy[i][2] >= amp;
			boolean chemical = Vy[i][3] >= amp;
			boolean OutFocus = Vy[i][8] >= amp;
			boolean Rising = Vy_ex[i][6] >= amp;

			boolean[] fusionEvents = new boolean[4];
			boolean accept = false;
			int ki = i;
			IntStream.range(0, fusionEvents.length).parallel().forEach(k ->
			{
				fusionEvents[k] = Vy_ex[ki][k] >= amp;
			});
			for (int j = 0; j < nClasses; j++)
			{
				fusion = fusion && (Vy[i][0] >= Vy[i][j]);
				pulse = pulse && Vy[i][1] >= Vy[i][j];
				electric = electric && Vy[i][2] >= Vy[i][j];
				chemical = chemical && (Vy[i][3] >= Vy[i][j]);
				OutFocus = OutFocus && Vy[i][8] >= Vy[i][j];
				for (int j2 = 0; j2 < fusionEvents.length; j2++)
				{
					fusionEvents[j2] = fusionEvents[j2] && Vy_ex[i][j2] >= Vy_ex[i][j];
					accept = fusionEvents[j2] ? fusionEvents[j2] : accept;
				}

				Rising = Rising && (Vy_ex[i][6] >= Vy_ex[i][j]);
			}
			fusion = fusionCtrl[0] && fusion;
			pulse = fusionCtrl[1] && pulse;
			chemical = fusionCtrl[2] && chemical;
			OutFocus = fusionCtrl[3] && OutFocus;
			Rising = (fusionCtrl[4] && Rising) && eMap.getStimulationID() > 0 || accept; //
			if (fusion || pulse || electric || chemical || OutFocus || Rising)
			{
				if (Rising)
				{
					Vp.add(EventsPatchDataEx[i]);
				} else
				{
					Vp.add(EventsPatchData[i]);
				}
				if (fusion)
				{
					eMap.setFusionTypeStatus("", 0);
				} else if (pulse)
				{
					eMap.setFusionTypeStatus("short event", 1);
				} else if (Rising)
				{
					eMap.setFusionTypeStatus("slow event", 2);
				}
				eMap.setFlagPrint(true);
			} else
			{
				eMap.setFlagPrint(false);
			}
		}
		return Vp;
	}

	public Map<Integer, EventTracking> RearrangMap(Map<Integer, EventTracking> eTrackMap, ArrayList<int[]> iStim,
			int[] frameSkip, int[][] SegmentedMatrix, boolean takeAll)
	{
		Map<Integer, EventTracking> FinalMap = new HashMap<Integer, EventTracking>();
		int count = 0;
		for (int i = 0; i < eTrackMap.size(); i++)
		{
			EventTracking eMap = eTrackMap.get(i);
			if (eMap == null || !eMap.getFlagPrint())
			{
				continue;
			}
//			EventTracking fMap = eMap;
			eMap.setID(count);
			int StimID = getStimID(eMap.getFirstFrame(), iStim);
			if (StimID > 0 && eMap.getFirstFrame() > frameSkip[0] && !takeAll)
			{
				continue;
			}
			double[] Cxy = eMap.getCenter(0);
			eMap.setCenterLayerPosition(SegmentedMatrix[(int) Cxy[1]][(int) Cxy[0]]);
			eMap.setStimulationID(StimID);
			FinalMap.put(count, eMap);
			count++;
		}
		return FinalMap;
	}

	int getStimID(int frame, ArrayList<int[]> iStim)
	{
		int StimID = 0;
		int er = 20; // 20 frames LSTM measurements
		for (int i = 0; i < iStim.size(); i++)
		{
			if (frame >= iStim.get(i)[0] - er && frame <= iStim.get(i)[1]
					&& iStim.get(i)[0] != 0 && iStim.get(i)[1] != 0)
			{
				StimID = i + 1;
				break;
			}
		}
		return StimID;
	}

	public double[][] convertToFloat(ArrayList<double[]> Vy)
	{
		int L_ = Vy.get(0).length;
		double[][] Vp = new double[Vy.size()][L_];
		IntStream.range(0, Vy.size()).parallel().forEach(i ->
		{
			Vp[i] = Vy.get(i);
		});
		return Vp;
	}

	public void GetFusionIDv2(double[] coordinates, Map<Integer, EventTracking> eTrackMap, Roi roi, double areaMu, int SearchRadius,
			int frame,
			int continuity, int deltaFrame, double segma, boolean InverseEvent)
	{
//		long startTime = System.currentTimeMillis();
		double SR = IVEAsetup.tinyFusion ? 2 : 3;
		int FrameX = InverseEvent ? frame - (deltaFrame) : frame;
		FrameX = FrameX == 0 ? 1 : FrameX;
		final int FrameY = FrameX;
		int SpotID = 0;
		double[] Center = { coordinates[4], coordinates[5] };
		if (eTrackMap.size() == 0)
		{
			EventTracking eMap = new EventTracking();
			eMap.setID(0);
			eMap.AddRoi(roi, FrameX);
			eMap.AddCenter(Center[0], Center[1]);
			eMap.setFlag(-10); // special marker to scan previous frames.
			eMap.setSegma(segma);
			eMap.setAreaIntensityRecorded(areaMu);
			if (InverseEvent)
			{
				eMap.setFirstFrame(0, FrameY);
				eMap.setInversDetected(true);
				eMap.setFusionStatus(true);
			}
			eTrackMap.put(0, eMap);
		} else
		{
			int length = eTrackMap.size();
			double[] Vx = new double[length];
			OptionalInt minIndex = IntStream.range(0, Vx.length).parallel().map(i ->
			{
				EventTracking eMap = eTrackMap.get(i);
				double spawnTime = eMap.getFirstFrame() + continuity;
				double[] point = eMap.getCenter(0);
				double distance = Math.sqrt(Math.pow(Center[0] - point[0], 2) + Math.pow(Center[1] - point[1], 2));
				if (distance <= SR && FrameY <= spawnTime)
				{
					Vx[i] = distance;
				} else
				{
					Vx[i] = -1;
				}
				return i;
			}).filter(j -> Vx[j] != -1).min();
			if (minIndex.isPresent())
			{
				int index = minIndex.getAsInt();
				EventTracking eMap = eTrackMap.get(index);
				double[] point = eMap.getCenter(0);
				if (FrameY >= 30 && FrameY <= 32)
				{
					System.out.println(
							"==> [" + FrameY + "]Cx,Cy(" + Center[0] + ", " + Center[1] + "), "
									+ " Px, Py(" + point[0] + ", " + point[1] + "), | "
									+ "cMu,pMu = (" + df.format(areaMu) + ","
									+ df.format(eMap.getAreaIntensityRecorded()) + ",["
									+ eMap.getID() + "," + (areaMu > eMap.getAreaIntensityRecorded()) + "])");
				}
				if (areaMu > eMap.getAreaIntensityRecorded())
				{
					eMap.setFirstFrame(FrameY);
					eMap.setAreaIntensityRecorded(areaMu);
					eMap.replaceCenter((int) Center[0], (int) Center[1], 0);
				}
				if (segma > eMap.getSegma())
				{
					eMap.setSegma(segma);
				}
			} else
			{
				SpotID = eTrackMap.size();
				EventTracking eMap = new EventTracking();
				eMap.setID(SpotID);
				eMap.AddRoi(roi, FrameX);
				eMap.AddCenter(Center[0], Center[1]);
				eMap.setFlag(-10);
				eMap.setSegma(segma);
				eMap.setAreaIntensityRecorded(areaMu);
//				String statu = "";
				if (InverseEvent)
				{
//					statu = "Inv";
					eMap.setFirstFrame(0, FrameY);
					eMap.setInversDetected(true);
					eMap.setFusionStatus(true);
				}
				eTrackMap.put(SpotID, eMap);
			}
		}
	}

	public int GetFusionIDv3(double[] coordinates, Map<Integer, EventTracking> eTrackMap, Roi roi,
			double areaMu, int SearchRadius, int frame,
			int deltaFrame, double segma, boolean InverseEvent)
	{
//		long startTime = System.currentTimeMillis();
		double SR = IVEAsetup.tinyFusion ? 2 : SearchRadius - 1;
		int FrameX = InverseEvent ? frame - deltaFrame : frame;
//		int FrameX = frame;
		FrameX = FrameX <= 0 ? 1 : FrameX;
//		final int FrameY = FrameX;
		int SpotID = 0;
		double[] Center = { coordinates[4], coordinates[5] };
		boolean add_New_event = true;
		if (eTrackMap.size() == 0)
		{
			EventTracking eMap = new EventTracking();
			eMap.setID(0);
			eMap.AddRoi(roi, FrameX);
			eMap.AddCenter(Center[0], Center[1]);
			eMap.setFlag(-10); // special marker to scan previous frames.
			eMap.setSegma(segma);
			eMap.setAreaIntensityRecorded(areaMu);
			eMap.setFirstFrame(0, FrameX);
			eMap.setFirstFrame(FrameX);
			eMap.setInversDetected(InverseEvent);

			eTrackMap.put(0, eMap);
		} else
		{
			for (int k = 0; k < eTrackMap.size(); k++)
			{
				EventTracking eMap = eTrackMap.get(k);
				double eFrame = eMap.getFirstFrame();
				double[] point = eMap.getCenter(0);
				double distance = Math.sqrt(Math.pow(Center[0] - point[0], 2) + Math.pow(Center[1] - point[1], 2));
				double dt = Math.abs(eFrame - FrameX);
				if (distance <= SR && dt <= deltaFrame)
				{
					add_New_event = false;

					if (areaMu >= eMap.getAreaIntensityRecorded())
					{
						eMap.setFirstFrame(FrameX);
						eMap.setAreaIntensityRecorded(areaMu);
						eMap.replaceCenter((int) Center[0], (int) Center[1], 0);
						eMap.setSegma(segma);
						eMap.setInversDetected(InverseEvent);
					}
					SpotID = k;
					break;
				}
			}
			if (add_New_event)
			{
				SpotID = eTrackMap.size();
				EventTracking eMap = new EventTracking();
				eMap.setID(SpotID);
				eMap.AddRoi(roi, FrameX);
				eMap.AddCenter(Center[0], Center[1]);
				eMap.setFlag(-10);
				eMap.setSegma(segma);
				eMap.setAreaIntensityRecorded(areaMu);
				eMap.setFirstFrame(0, FrameX);
				eMap.setFirstFrame(FrameX);
				eMap.setInversDetected(InverseEvent);
				eTrackMap.put(SpotID, eMap);
			}
		}
		return SpotID;
//		long endTime = System.currentTimeMillis();
//		long elapsedTime = endTime - startTime;
//		System.out.println("Search ID Time elapsed: " + elapsedTime);
	}
	public static double[][] flipColumns(double[][] array)
	{
		double[][] flippedArray = new double[array.length][array[0].length];
		// column
		IntStream.range(0, array[0].length).parallel().forEach(j ->
		{
			// row
			IntStream.range(0, array.length).map(i -> array.length - i - 1)
					.forEach(i -> flippedArray[i][j] = array[array.length - i - 1][j]);
		});
		return flippedArray;
	}

	public double[][] flipBlocks(double[][] input, int nFeatures)
	{
		int nEvents = input.length;
		int L_ = input[0].length;
		int nBlocks = L_ / nFeatures;

		double[][] flipped = new double[nEvents][L_];
		IntStream.range(0, nEvents).parallel().forEach(e ->
		{
			flipped[e] = flipVectors(input[e], nFeatures, nBlocks);
		});
		return flipped;
	}

	public double[] flipVectors(double[] Vy, int nRows, int nCols)
	{
		double[] result = new double[nRows * nCols];
		IntStream.range(0, nCols).parallel().forEach(t ->
		{
			IntStream.range(0, nRows).parallel().forEach(f ->
			{
				result[t * nRows + f] = Vy[(nCols - t - 1) * nRows + f];
			});
		});
		return result;
	}

	public double[][] fillFeatures(double[][] input, int nFeatures, int from)
	{
		int nEvents = input.length;
		int L_ = input[0].length;
		int nBlocks = L_ / nFeatures;

		double[][] flipped = new double[nEvents][L_];
		IntStream.range(0, nEvents).parallel().forEach(e ->
		{
			flipped[e] = fillVector(input[e], nFeatures, nBlocks, from);
		});
		return flipped;
	}

	public double[] fillVector(double[] Vy, int nRows, int nCols, int from)
	{
		double[] result = new double[nRows * nCols];
		IntStream.range(0, nCols).parallel().forEach(t ->
		{
			IntStream.range(0, nRows).parallel().forEach(f ->
			{
				int shift = 0;
				double b = 0;
				if (f > from)
				{
					Random random = new Random();
					b = 0.1 + (0.2 - 0.1) * random.nextDouble();
					shift = -4;
				}
				result[t * nRows + f] = Vy[t * nRows + f + shift] + b;
			});
		});
		return result;
	}

	public static double[][] getPatchMatrix(ImageProcessor ip, double[] Cxy, int R, int dim, int H_, int W_)
	{
		double[][] mtrx = new double[dim][dim];
		int x0 = (int) Cxy[0], y0 = (int) Cxy[1];
		IntStream.range(y0 - R, y0 + R + 1).parallel().forEach(i ->
		{
			IntStream.range(x0 - R, x0 + R + 1).parallel().forEach(j ->
			{
				int y = i - (y0 - R);
				int x = j - (x0 - R);
				if (i > H_ || j > W_ || i <= 0 || j <= 0)
				{
					mtrx[y][x] = 0;
				} else
				{
					mtrx[y][x] = ip.getPixel(j, i);
				}
			});
		});
		return mtrx;
	}

	private double cropAreaAndGetMean(ImageProcessor ip, double[][] tempMatrix, int cropXStart, int cropXEnd,
			int cropYStart, int cropYEnd, int imXStart, int imYStart, int count)
	{
		double sum = IntStream.range(cropYStart, cropYEnd)
				.mapToDouble(y -> IntStream.range(cropXStart, cropXEnd)
						.mapToDouble(x ->
						{
							double pixelValue = ip.getPixelValue(x + imXStart, y + imYStart);
							tempMatrix[y - cropYStart][x - cropXStart] = pixelValue;
							return pixelValue;
						})
						.sum())
				.sum();

		return sum / count;
	}

	public void applyPredictionNonFixed(Map<Integer, EventTracking> eTrackMap, float[][] Vy,
			double amp, boolean[] fusionCtrl, int fusion_numbers, boolean exportTraining)
	{
		int num_artificial = Vy[0].length - fusion_numbers;
		double NoiseMu = 0;
		int Nt = 0;
		int fusion_length = Math.min(fusion_numbers, fusionCtrl.length);
		for (int i = 0; i < Vy.length; i++)
		{
			int ki = i;
			EventTracking eMap = eTrackMap.get(i);
			// pH_sens[0], ph_insens[1], tiny[2], x_fusion[3]
			boolean[] fusionEvents = new boolean[fusion_numbers];
			boolean[] randEvents = new boolean[num_artificial];
			IntStream.range(0, fusionEvents.length).parallel().forEach(k ->
			{
				fusionEvents[k] = Vy[ki][k] >= amp;
			});
			// randEvents[0] High noise, randEvents[1] Noise for average noise level
			IntStream.range(0, randEvents.length).parallel().forEach(k ->
			{
				randEvents[k] = Vy[ki][k + fusion_numbers] >= amp;
			});

			for (int j = 0; j < Vy[0].length; j++)
			{
				int kj = j;
				IntStream.range(0, fusionEvents.length).parallel().forEach(k ->
				{
					fusionEvents[k] = fusionEvents[k] && Vy[ki][k] >= Vy[ki][kj];
				});
				IntStream.range(0, randEvents.length).parallel().forEach(k ->
				{
					randEvents[k] = randEvents[k] && Vy[ki][k + fusion_numbers] >= Vy[ki][kj];
				});
			}
			for (int j = 0; j < fusion_length; j++)
			{
				fusionEvents[j] = fusionCtrl[j] && fusionEvents[j];
			}

			boolean accept = false;
			for (int k = 0; k < fusionEvents.length; k++)
			{
				accept = fusionEvents[k] ? fusionEvents[k] : accept;
				if (fusionEvents[k])
				{
					eMap.setFusionTypeStatus("_class_", k);
					break;
				}
			}
			if (accept) // || randEvents[6] // intensity fall event
			{
				if (eMap.getFlag() <= 0)
				{
					eMap.setFlag(1);
					eMap.setFlagPrint(true);
					if (eMap.getDualID() > 0)
					{
						EventTracking eMapx = eTrackMap.get(eMap.getDualID());
						eMapx.setFlagPrint(true);
						eMapx.setFlag(2);
						eMap.setFlag(2);
					}
				}
			} else
			{
				if (exportTraining)
				{
					boolean entered = false;
					for (int k = 0; k < randEvents.length; k++)
					{
						if (randEvents[k])
						{
							entered = true;
							eMap.setFusionTypeStatus("_class_", -(k + 1));
						}
						if (k == randEvents.length - 1 && !entered)
						{
							eMap.setFusionTypeStatus("_class_", -(99));
						}
					}
				}
				if (randEvents[1])
				{
					NoiseMu += eMap.getAreaIntensityRecorded();
					Nt++;
				}
				eMap.setFlagPrint(false);
			}
		}
		NoiseMu /= Nt;
		NoiseMean = NoiseMu;
	}

	private float[][][] normalizeTimeSeries(double[][][] matrix3D)
	{
		double[] flatArray = Arrays.stream(matrix3D)
				.flatMap(Arrays::stream)
				.flatMapToDouble(Arrays::stream)
				.toArray();

		double min = Arrays.stream(flatArray).min().orElse(0.0);
		double max = Arrays.stream(flatArray).max().orElse(1.0);
		float[][][] Norm_matrix3D = new float[matrix3D.length][matrix3D[0].length][matrix3D[0][0].length];
		IntStream.range(0, matrix3D.length).parallel().forEach(t ->
		{
			IntStream.range(0, matrix3D[0].length).parallel().forEach(x ->
			{
				IntStream.range(0, matrix3D[0][0].length).parallel().forEach(y ->
				{
					Norm_matrix3D[t][x][y] = (float) ((matrix3D[t][x][y] - min) / (max - min));
				});
			});
		});
		return Norm_matrix3D;
	}

	private void normalizeTimeSeries5D(float[][][][][] matrix5D, double[][][] matrix3D, int eID)
	{
		double[] flatArray = Arrays.stream(matrix3D)
				.flatMap(Arrays::stream)
				.flatMapToDouble(Arrays::stream)
				.toArray();

		double min = Arrays.stream(flatArray).min().orElse(0.0);
		double max = Arrays.stream(flatArray).max().orElse(1.0);
		IntStream.range(0, matrix3D.length).parallel().forEach(t ->
		{
			IntStream.range(0, matrix3D[0].length).parallel().forEach(x ->
			{
				IntStream.range(0, matrix3D[0][0].length).parallel().forEach(y ->
				{
					matrix5D[eID][t][x][y][0] = (float) ((matrix3D[t][x][y] - min) / (max - min));
				});
			});
		});
	}

	public float[][][][][] CollectTimeSeriesData5D(
			ImagePlus imStack,
			Map<Integer, EventTracking> eTrackMap,
			int rad,
			int timeseries,
			int FixedRad,
			int add_frames,
			boolean centered)
	{
		int center_value = centered ? 1 : 0;
		boolean scaleData = rad != FixedRad;
		int kernel = rad * 2 + center_value;
		int fixedKernel = FixedRad * 2 + center_value;
		int lowerF = timeseries;
		int upperF = timeseries + add_frames;
		int height = imStack.getHeight();
		int width = imStack.getWidth();
		int nSlices = imStack.getStackSize();
		LocalMath LM = new LocalMath();
		int cropArea = kernel * kernel;
		int totalFrames = lowerF + upperF;

		float[][][][][] matrix5D = new float[eTrackMap.size()][totalFrames][fixedKernel][fixedKernel][1];
		int index = 0;

		for (Map.Entry<Integer, EventTracking> entry : eTrackMap.entrySet())
		{
			EventTracking eMap = entry.getValue();

			double[] center = eMap.getCenter(0);
			int cx = (int) center[0];
			int cy = (int) center[1];
			int frame = eMap.getFirstFrame();

			if (frame < lowerF)
			{
				frame = lowerF;
			} else if (frame >= nSlices - upperF)
			{
				frame = nSlices - upperF;
			}

			int syncFrame = (frame - lowerF == 0) ? 1 : 0;
			final int lr = frame - lowerF + syncFrame;
			final int ur = frame + upperF + syncFrame;

			int imXStart = Math.max(0, cx - rad);
			int imXEnd = Math.min(width, cx + rad + center_value);
			int imYStart = Math.max(0, cy - rad);
			int imYEnd = Math.min(height, cy + rad + center_value);

			int cropXStart = Math.max(0, rad - cx);
			int cropXEnd = cropXStart + (imXEnd - imXStart);
			int cropYStart = Math.max(0, rad - cy);
			int cropYEnd = cropYStart + (imYEnd - imYStart);

			double[] mean = new double[totalFrames];
			double[][][] matrix3D = new double[totalFrames][fixedKernel][fixedKernel];

			IntStream.range(lr, ur).parallel().forEach(i ->
			{
				int ndx = i - lr;
				double[][] tempMatrix = new double[kernel][kernel];
				ImageProcessor ip = imStack.getStack().getProcessor(i);

				mean[ndx] = cropAreaAndGetMean(ip,
						tempMatrix,
						cropXStart, cropXEnd,
						cropYStart, cropYEnd,
						imXStart, imYStart,
						cropArea);

				if (scaleData)
				{
					matrix3D[ndx] = LM.Bilinear_interpolate(tempMatrix, fixedKernel, fixedKernel);
				} else
				{
					matrix3D[ndx] = tempMatrix;
				}
			});
			normalizeTimeSeries5D(matrix5D, matrix3D, index);

			Map.Entry<Integer, Double> maxEntry = IntStream.range(0, mean.length)
					.mapToObj(i -> new AbstractMap.SimpleEntry<>(i, mean[i]))
					.reduce((a, b) -> a.getValue() > b.getValue() ? a : b)
					.orElse(new AbstractMap.SimpleEntry<>(-1, Double.NEGATIVE_INFINITY));

			int maxIndex = maxEntry.getKey();
			double maxValue = maxEntry.getValue();

			int frame_shift = eMap.getInversDetected() ? frame : (lr + maxIndex);
			eMap.setTimeShiftedFrame(frame_shift);
			eMap.setMaxMean(maxValue);
			index++;
		}

		return matrix5D;
	}

	public float[][][][][] CollectTimeSeriesData5D_zeropad(ImagePlus imStack, Map<Integer, EventTracking> eTrackMap,
			int rad, int timeseries, int FixedRad, int add_frames, boolean centered)
	{
		int center_value = centered ? 1 : 0;
		boolean scaleData = (rad != FixedRad);
		int kernel = rad * 2 + center_value;
		int FixedKernel = FixedRad * 2 + center_value;

		int lowerF = timeseries;
		int upperF = timeseries + add_frames;
		int height = imStack.getHeight();
		int width = imStack.getWidth();
		int nSlices = imStack.getStackSize();

		LocalMath LM = new LocalMath();
		int cropArea = kernel * kernel;
		int totalFrames = lowerF + upperF;

		float[][][][][] matrix5D = new float[eTrackMap.size()][totalFrames][FixedKernel][FixedKernel][1];

		for (int id = 0; id < eTrackMap.size(); id++)
		{
			EventTracking eMap = eTrackMap.get(id);
			double[] center = eMap.getCenter(0);
			int cx = (int) center[0];
			int cy = (int) center[1];
			int frame = eMap.getFirstFrame();

			int imXStart = Math.max(0, cx - rad);
			int imXEnd = Math.min(width, cx + rad + center_value);
			int imYStart = Math.max(0, cy - rad);
			int imYEnd = Math.min(height, cy + rad + center_value);

			int cropXStart = Math.max(0, rad - cx);
			int cropXEnd = cropXStart + (imXEnd - imXStart);
			int cropYStart = Math.max(0, rad - cy);
			int cropYEnd = cropYStart + (imYEnd - imYStart);

			double[] mean = new double[totalFrames];
			double[][][] matrix3D = new double[totalFrames][FixedKernel][FixedKernel];

			int startFrame = frame - lowerF; 

			IntStream.range(0, totalFrames).parallel().forEach(ndx ->
			{
				int i = startFrame + ndx; // Actual frame index in 0-based

				double[][] tempMatrix = new double[kernel][kernel];

				if (i >= 0 && i < nSlices)
				{
					ImageProcessor ip = imStack.getStack().getProcessor(i + 1);
					mean[ndx] = cropAreaAndGetMean(ip, tempMatrix, cropXStart, cropXEnd,
							cropYStart, cropYEnd, imXStart, imYStart, cropArea);
				} else
				{
					mean[ndx] = 0.0;
				}

				if (scaleData)
				{
					matrix3D[ndx] = LM.Bilinear_interpolate(tempMatrix, FixedKernel, FixedKernel);
				} else
				{
					matrix3D[ndx] = tempMatrix;
				}
			});

			normalizeTimeSeries5D(matrix5D, matrix3D, id);

			int max_Mu_ndx = IntStream.range(0, mean.length)
					.reduce((ii, jj) -> mean[ii] > mean[jj] ? ii : jj)
					.orElse(-1);

			int frame_shift = eMap.getInversDetected() ? frame : (startFrame + max_Mu_ndx);
			eMap.setTimeShiftedFrame(frame_shift);
		}

		return matrix5D;
	}
	public void saveDoubleArrayAsImageStack(double[][][] mtrx3D, String fileName)
	{
		int timeFrames = mtrx3D.length;
		int height = mtrx3D[0].length;
		int width = mtrx3D[0][0].length;
		ImageStack stack = new ImageStack(width, height);

		for (int t = 0; t < timeFrames; t++)
		{
			FloatProcessor processor = new FloatProcessor(width, height);
			int tk = t;
			IntStream.range(0, width).parallel().forEach(x ->
			{
				for (int y = 0; y < height; y++)
				{
					processor.putPixelValue(x, y, mtrx3D[tk][y][x]); // Note the order of indices
				}
			});
			stack.addSlice(processor);
		}
		ImagePlus imageStack = new ImagePlus("Image Stack", stack);
		IJ.save(imageStack, "E:\\ASAP Analysis\\T-Cells\\zztest\\" + fileName);
		imageStack.close();
	}

	public static void writeEventsInfoToCSV(String folderPath, String imageName, Map<Integer, EventTracking> eMap, double[][] eventKinetics)
	{
		String csvFilePath = folderPath + File.separator + imageName + "_Events Info.csv";

		try (FileWriter fwriter = new FileWriter(csvFilePath))
		{
			fwriter.append("EventID,Peak Frame,X,Y, max intensity,Baseline,Amplitude,RiseTime,DecayTime\n");
			for (int eventID = 0; eventID < eMap.size(); eventID++)
			{
				EventTracking event = eMap.get(eventID);
				if (event != null)
				{
					int firstFrame = event.getFirstFrame();
					double maxMean = event.getMaxMean();
					double[] center = event.getCenter(0);
					double centerX = center[0];
					double centerY = center[1];
					double baseline = eventKinetics[eventID][0];
					double amplitude = eventKinetics[eventID][1];
					double riseTime = eventKinetics[eventID][2];
					double decayTime = eventKinetics[eventID][3];
					
					fwriter.append(eventID + "," + firstFrame + "," + centerX + "," + centerY + "," + maxMean + "," +
							baseline + "," + amplitude + "," + riseTime + "," + decayTime + "\n");
				}
			}
		} catch (IOException e)
		{
			System.err.println("Error writing CSV file: " + e.getMessage());
		}
	}
}
