package com.uniSaarland_CIPMM.ivea;

import java.awt.Polygon;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.IntStream;

import ij.ImagePlus;
import ij.gui.OvalRoi;
import ij.gui.Roi;
import ij.plugin.filter.MaximumFinder;
import ij.process.ImageProcessor;
import ij.process.ImageStatistics;

public class FusionHandler
{
	public static final DecimalFormat df = new DecimalFormat("0.00");
	public static final int MaxProm = 3;

	public void AdjustFusionCenter(ImagePlus imp, Map<Integer, EventTracking> eTrackMap, int Rx, int fPlus)
	{
		int dim = Rx * 2;
		int nSlices = imp.getStackSize();
		IntStream.range(0, eTrackMap.size()).parallel().forEach(i ->
		{
			EventTracking eMap = eTrackMap.get(i);
			if (eMap.getFlagPrint())
			{
				int AdjustedFrame = eMap.getTimeShiftedFrame() + fPlus;
				AdjustedFrame = AdjustedFrame > nSlices ? nSlices : AdjustedFrame;
				AdjustedFrame = AdjustedFrame < 1 ? 1 : AdjustedFrame;
				ImageProcessor ip = imp.getStack().getProcessor(AdjustedFrame);
				double[] Center = eMap.getCenter(0);
				int Cx;
				int Cy;
				int X = (int) Center[0];
				int Y = (int) Center[1];
				X = X - Rx;
				Y = Y - Rx;
				Roi roi = new OvalRoi(X, Y, dim, dim);
				ip.setRoi(roi);
				MaximumFinder FM = new MaximumFinder();
				Polygon points = FM.getMaxima(ip, MaxProm, false);
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
		});
	}

	public void AdjustFusionCenter(ImagePlus[] imp, ImagePlus[] InvImp, Map<Integer, EventTracking> eTrackMap, int Rx, int deltaFrame)
	{
		int dim = Rx * 2;
		int nSlices = imp.length;
		IntStream.range(0, eTrackMap.size()).parallel().forEach(i ->
		{
			EventTracking eMap = eTrackMap.get(i);
			if (eMap.getFlagPrint())
			{
				int AdjustedFrame = eMap.getTimeShiftedFrame();
				AdjustedFrame = AdjustedFrame > nSlices ? nSlices : AdjustedFrame;

				int AdjustedFrame2 = eMap.getTimeShiftedFrame() - deltaFrame;
				AdjustedFrame2 = AdjustedFrame2 > nSlices ? nSlices : AdjustedFrame2;

				double[] Center = eMap.getCenter(0);
				int Cx;
				int Cy;
				int X = (int) Center[0];
				int Y = (int) Center[1];
				X = X - Rx;
				X = X < 1 ? 1 : X;
				Y = Y - Rx;
				Y = Y < 1 ? 1 : Y;
				Roi roi = new OvalRoi(X, Y, dim, dim);
				MaximumFinder FM = new MaximumFinder();

				ImageProcessor ip = imp[AdjustedFrame].getProcessor();
				ip.setRoi(roi);
				ImageStatistics imStat = ip.getStatistics();

				ImageProcessor ip2 = InvImp[AdjustedFrame2].getProcessor();
				ip2.setRoi(roi);
				ImageStatistics imStat2 = ip2.getStatistics();

				if (imStat.mean > imStat2.mean)
				{
					Polygon points = FM.getMaxima(ip, MaxProm, false);
					int numPoints = points.npoints;
					if (numPoints == 0)
					{

						Cx = (int) imStat.xCenterOfMass; // xCenterOfMass
						Cy = (int) imStat.yCenterOfMass;
					} else
					{
						Cx = points.xpoints[0];
						Cy = points.ypoints[0];
					}
				} else
				{
					Polygon points = FM.getMaxima(ip2, 10, false);
					int numPoints = points.npoints;
					if (numPoints == 0)
					{
						Cx = (int) imStat2.xCenterOfMass; // xCenterOfMass
						Cy = (int) imStat2.yCenterOfMass;
					} else
					{
						Cx = points.xpoints[0];
						Cy = points.ypoints[0];
					}
				}

				eMap.replaceCenter(Cx, Cy, 0);
				eMap.setCenterStatus(true);
			}
		});
	}

	public Map<Integer, EventTracking> RecreateIDv3exp(Map<Integer, EventTracking> eTrackMap,
			int SpreadRadius, double NoiseMean, boolean loop, boolean tinyFusion)
	{
		boolean backwardSearch = true;
		Map<Integer, EventTracking> FusionMap = new HashMap<Integer, EventTracking>();
		Map<Integer, EventTracking> FinalMap = new HashMap<Integer, EventTracking>();
		for (int z = 0; z < eTrackMap.size(); z++)
		{
			EventTracking eMap = eTrackMap.get(z);
			if (eMap == null || !eMap.getFlagPrint())
			{
				continue;
			}
			double nextSigma = eMap.getSegma();
			int nextFrame = eMap.getTimeShiftedFrame(); // getFirstFrame
			int SpotID;
			double[] nCenter = eMap.getCenter(0);
			double nextMu = eMap.getAreaIntensityRecorded();
			Roi roi = eMap.getLargesRoi();
			if (FusionMap.size() == 0)
			{
				EventTracking fMap = new EventTracking();
				SpotID = 0;
				fMap.setID(SpotID);
				fMap.AddRoi(roi, nextFrame);
				fMap.setFirstFrame(nextFrame);
				fMap.AddCenter(nCenter[0], nCenter[1]);
				fMap.setSegma(nextSigma);
				fMap.setAreaIntensityRecorded(nextMu);
				fMap.setTimeShiftedFrame(nextFrame);
				fMap.setFusionTypeStatus(eMap.getFusionTypeStatus(), eMap.getFusionType());
				FusionMap.put(0, fMap);
			} else
			{
				int length = FusionMap.size();
				SpotID = length;
				boolean addnew = true;
				for (int k = 0; k < length; k++)
				{
					EventTracking fMap = FusionMap.get(k);
					double pFrame = fMap.getTimeShiftedFrame();
					double[] point = fMap.getCenter(0);
					double pMu = fMap.getAreaIntensityRecorded();
					double pSigma = fMap.getSegma();
					double distance2 = Math.pow(nCenter[0] - point[0], 2) + Math.pow(nCenter[1] - point[1], 2);
					int dt = (int) (nextFrame - pFrame);
					double IntesitySpread = getGaussianOverTime(pMu, distance2, dt, pSigma, SpreadRadius, 10);
					boolean sameFusion = distance2 <= 4 && (Math.abs(pFrame - nextFrame)) <= 3;
					if (IntesitySpread >= nextMu || sameFusion)
					{
						if (nextMu > pMu)
						{
							fMap.setFirstFrame(nextFrame);
							fMap.setTimeShiftedFrame(nextFrame);
							fMap.setAreaIntensityRecorded(nextMu);
							fMap.replaceCenter((int) nCenter[0], (int) nCenter[1], 0);
							fMap.setSegma(nextSigma);
							fMap.setFusionTypeStatus(eMap.getFusionTypeStatus(), eMap.getFusionType());
						}
						addnew = false;
						break;
					} else
					{
						if (backwardSearch)
						{
							double bIspread = getGaussianOverTime(nextMu, distance2, dt, nextSigma, SpreadRadius, 10);
//							bIspread = bIspread + pMu * 0.01; // calculation error
							if (pMu <= bIspread || sameFusion)
							{
								fMap.setFirstFrame(nextFrame);
//								fMap.setTimeShiftedFrame(nextFrame);
								fMap.setSegma(nextSigma);
								fMap.setAreaIntensityRecorded(nextMu);
								fMap.replaceCenter((int) nCenter[0], (int) nCenter[1], 0);
								fMap.setFusionTypeStatus(eMap.getFusionTypeStatus(), eMap.getFusionType());
								addnew = false;
							}
						}
					}
				}
				if (addnew)
				{
					EventTracking fMap = new EventTracking();
					fMap.setID(SpotID);
					fMap.AddRoi(roi, nextFrame);
					fMap.setFirstFrame(nextFrame);
					fMap.AddCenter(nCenter[0], nCenter[1]);
					fMap.setSegma(nextSigma);
					fMap.setAreaIntensityRecorded(nextMu);
					fMap.setTimeShiftedFrame(nextFrame);
					fMap.setFusionTypeStatus(eMap.getFusionTypeStatus(), eMap.getFusionType());
					FusionMap.put(SpotID, fMap);
				}
			}
		} // end loop
		if (!tinyFusion)
		{
			for (int i = 0; i < FusionMap.size(); i++)
			{
				EventTracking eMap = FusionMap.get(i);
				if (eMap.getFlagPrint())
				{
					if (eMap.getAreaIntensityRecorded() < NoiseMean * 1.15)
					{
						eMap.setFlagPrint(false);
					}
				}
			}
		}
		FinalMap = SortMap(FusionMap, SpreadRadius, NoiseMean);
		return FinalMap;
	}

	double getGaussianOverTime(double Mu, double dist, int dt, double sigma, int sR, int timeInt)
	{
		double Ix = Mu * Math.exp(-dist / (2 * Math.pow(sigma + sR, 2))) // 3 and 10 are numbers related to the fps
				* Math.exp(-Math.pow(dt, 2) / (2 * Math.pow(timeInt, 2))); // (2 * Math.pow(sigma*4, 2)
		return Ix;
	}

	public Map<Integer, EventTracking> SortMap(Map<Integer, EventTracking> eTrackMap, int SpreadRadius, double NoiseMean)
	{
		Map<Integer, EventTracking> FusionMap = new HashMap<Integer, EventTracking>();
		for (int z = 0; z < eTrackMap.size(); z++)
		{
			EventTracking eMap = eTrackMap.get(z);
			if (eMap == null || !eMap.getFlagPrint())
			{
				continue;
			}
			int nextFrame = eMap.getFirstFrame();
			int SpotID;
			double[] nCenter = eMap.getCenter(0);
			if (FusionMap.size() == 0)
			{
				FusionMap.put(0, eMap);
			} else
			{
				int length = FusionMap.size();
				SpotID = length;
				boolean addnew = true;
				for (int k = 0; k < length; k++)
				{
					EventTracking fMap = FusionMap.get(k);
					double pFrame = fMap.getFirstFrame();
					double[] point = fMap.getCenter(0);
					double distance2 = Math.pow(nCenter[0] - point[0], 2) + Math.pow(nCenter[1] - point[1], 2);
					if (distance2 <= 1 && pFrame == nextFrame)
					{
						addnew = false;
						break;
					}
				}
				if (addnew)
				{
					eMap.setID(SpotID);
					FusionMap.put(SpotID, eMap);
				}
			}
		}
		return FusionMap;
	}

	public void AdjustFusionCenterV2(ImagePlus imp, Map<Integer, EventTracking> eTrackMap, int Rx)
	{
		int dim = Rx * 2;
		int nSlices = imp.getStackSize();
		IntStream.range(0, eTrackMap.size()).parallel().forEach(i ->
		{
			EventTracking eMap = eTrackMap.get(i);
			if (eMap.getFlagPrint())
			{
				int Cx = 1;
				int Cy = 1;
				double Mu = 0;
				for (int j = -1; j < 2; j++)
				{
					int AdjustedFrame = eMap.getTimeShiftedFrame() + j; // getFirstFrame()
					AdjustedFrame = AdjustedFrame > nSlices ? nSlices : AdjustedFrame;
					AdjustedFrame = AdjustedFrame < 1 ? 1 : AdjustedFrame;
					ImageProcessor ip = imp.getStack().getProcessor(AdjustedFrame);
					double[] Center = eMap.getCenter(0);
					int X = (int) Center[0];
					int Y = (int) Center[1];
					X = X - Rx;
					Y = Y - Rx;
					Roi roi = new OvalRoi(X, Y, dim, dim);
					ip.setRoi(roi);
					ImageStatistics imStat = ip.getStatistics();
					MaximumFinder FM = new MaximumFinder();
					Polygon points = FM.getMaxima(ip, MaxProm, false);
					int numPoints = points.npoints;
					if (Mu < imStat.mean)
					{
						Mu = imStat.mean;
						eMap.setTimeShiftedFrame(AdjustedFrame);
						eMap.setFirstFrame(AdjustedFrame);
						if (numPoints == 0)
						{
							Cx = (int) imStat.xCenterOfMass; // xCenterOfMass
							Cy = (int) imStat.yCenterOfMass;
						} else
						{
							Cx = points.xpoints[0];
							Cy = points.ypoints[0];
						}
					}
				}
				eMap.replaceCenter(Cx, Cy, 0);
				eMap.setCenterStatus(true);
			}
		});
	}

	public static void DebugEventTracking(Map<Integer, EventTracking> eTrackMap, int frame, String Message)
	{
		System.out.println("-" + Message + ":");
		for (int i = 0; i < eTrackMap.size(); i++)
		{
			EventTracking eMap = eTrackMap.get(i);
			if (eMap.getFlagPrint())
			{
				if (frame > 10)
				{
					if (eMap.getFirstFrame() > frame && eMap.getFirstFrame() < frame + 50)
					{
						System.out.println(
								"*** depug ID[" + eMap.getID() + "]==> Mu,Su,Sf,f(" + df.format(eMap.getAreaIntensityRecorded()) + "||"
										+ df.format(eMap.getSegma()) +
										"|Mu(" + df.format(eMap.getTimeShiftedFrame()) + ")|" + df.format(eMap.getFirstFrame()) + ") ***");
					}
				} else
				{
					System.out.println(
							"*** depug ID[" + eMap.getID() + "]==> Mu,Su,Sf,f(" + df.format(eMap.getAreaIntensityRecorded()) + "||"
									+ df.format(eMap.getSegma()) +
									"|Mu(" + df.format(eMap.getTimeShiftedFrame()) + ")|" + df.format(eMap.getFirstFrame()) + ") ***");
				}
			}
		}
		System.out.println("=============================================");
	}

	public static void AdjustFusionCenterNom(ImagePlus imp, Map<Integer, EventTracking> eTrackMap, int Rx, int frame)
	{
		int dim = Rx * 2;
		IntStream.range(0, eTrackMap.size()).parallel().forEach(i ->
		{
			EventTracking eMap = eTrackMap.get(i);
			if (eMap.getStimulationID() == 0)
			{
				eMap.setStimulationID(-1);
				int Cx = 1;
				int Cy = 1;
				double Mu = 0;
				for (int j = -1; j < 2; j++)
				{
					ImageProcessor ip = imp.getProcessor();
					double[] Center = eMap.getCenter(0);
					int X = (int) Center[0];
					int Y = (int) Center[1];
					X = X - Rx;
					Y = Y - Rx;
					Roi roi = new OvalRoi(X, Y, dim, dim);
					ip.setRoi(roi);
					ImageStatistics imStat = ip.getStatistics();
					MaximumFinder FM = new MaximumFinder();
					Polygon points = FM.getMaxima(ip, 2, false);
					int numPoints = points.npoints;
					if (Mu < imStat.mean)
					{
						Mu = imStat.mean;
						eMap.setTimeShiftedFrame(frame);
						eMap.setFirstFrame(frame);
						if (numPoints == 0)
						{
							Cx = (int) imStat.xCenterOfMass; // xCenterOfMass
							Cy = (int) imStat.yCenterOfMass;
						} else
						{
							Cx = points.xpoints[0];
							Cy = points.ypoints[0];
						}
					}
				}
				eMap.replaceCenter(Cx, Cy, 0);
				eMap.setCenterStatus(true);
			}
		});
	}

	public Map<Integer, EventTracking> NonMaximumSuppression(Map<Integer, EventTracking> eTrackMap, int SpreadRadius,
			int timeInt, double NoiseMean, int radius, boolean tinyFusion)
	{
		Map<Integer, EventTracking> trueEventsMap = new HashMap<Integer, EventTracking>();
		int counter = 0;
		boolean smallRadius = radius <= 3;
		int tempRadius = (int) (!smallRadius && radius <= 7 ? Math.round(radius * 3.5) : 0);
		SpreadRadius = SpreadRadius + tempRadius; 
		for (int i = 0; i <= eTrackMap.size(); i++)
		{
			boolean isRedundant = false;
			EventTracking currentEvent = eTrackMap.get(i);
			if (currentEvent == null || !currentEvent.getFlagPrint())
			{
				continue;
			}
			int cFrame = currentEvent.getTimeShiftedFrame();
			double[] cCenter = currentEvent.getCenter(0);
			double cMu = currentEvent.getAreaIntensityRecorded();

			for (int j = 0; j <= eTrackMap.size(); j++)
			{
				if (i != j)
				{
					EventTracking nextEvent = eTrackMap.get(j);
					if (nextEvent == null || !nextEvent.getFlagPrint())
					{
						continue;
					}
					int nFrame = nextEvent.getTimeShiftedFrame();
					double[] nCenter = nextEvent.getCenter(0);
					double nMu = nextEvent.getAreaIntensityRecorded();
					double nSigma = nextEvent.getSegma();
					double distance = Math.pow(cCenter[0] - nCenter[0], 2) + Math.pow(cCenter[1] - nCenter[1], 2);
					int dt = (int) (cFrame - nFrame);
					double IntensitySpread = getGaussianOverTime(nMu, distance, dt, nSigma, SpreadRadius, timeInt);

					if (cMu < IntensitySpread)
					{
						isRedundant = true;
						break;
					}
					boolean sameEvent = distance < 3 && Math.abs(dt) < timeInt;
					if (sameEvent)
					{
						if (trueEventsMap.size() > 0)
						{
							for (int k = 0; k < trueEventsMap.size(); k++)
							{
								EventTracking trueEvents = trueEventsMap.get(k);
								int tFrame = trueEvents.getTimeShiftedFrame();
								double[] tCenter = trueEvents.getCenter(0);
								double distance2 = Math.pow(cCenter[0] - tCenter[0], 2)
										+ Math.pow(cCenter[1] - tCenter[1], 2);
								int dt2 = (int) (cFrame - tFrame);
								boolean eExist = distance2 < 2 && Math.abs(dt2) < timeInt;
								if (eExist)
								{
									isRedundant = true;
									break;
								}
							}
						}
					}
				}
			}
			if (cMu < NoiseMean * 1.14 && !smallRadius) // && !smallRadius
			{
				isRedundant = true;
			}
			if (!isRedundant)
			{
				trueEventsMap.put(counter, currentEvent);
				counter++;
			}
		}
		return trueEventsMap;
	}

	public void AdjustTemporalCoordinates(Map<Integer, EventTracking> fusionMap, int maxPooling)
	{
		IntStream.range(0, fusionMap.size()).forEach(i ->
		{
			EventTracking fMap = fusionMap.get(i);
			if (fMap != null)
			{
				fMap.setFirstFrame(fMap.getFirstFrame() * maxPooling);
				fMap.setTimeShiftedFrame(fMap.getTimeShiftedFrame() * maxPooling);
			}
		});
	}
}
