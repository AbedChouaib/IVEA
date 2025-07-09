package com.uniSaarland_CIPMM.ivea;

import java.awt.Polygon;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

import ij.gui.Roi;

public class EventTracking
{
	private Map<Integer, Roi> Rois = new HashMap<Integer, Roi>();
	private Map<Integer, Integer> Linked = new HashMap<Integer, Integer>();
	private ArrayList<double[]> Centers = new ArrayList<double[]>();
	private ArrayList<double[]> Measurements = new ArrayList<double[]>();
	private ArrayList<Integer> frames = new ArrayList<Integer>();
	private ArrayList<int[]> Continuousframes = new ArrayList<int[]>();
	private Polygon PolyCenter = new Polygon();
	private Roi LargestRoi;
	private double MaxArea = 0;
	private int eID;
	private int dualID = -1;
	private int flag = 0; // special marker.
	private boolean lockPrint = false;
	private int FirstFrame = 0;
	private boolean once = true;
	private boolean flagPrint = true;
	private int DetectionCount = 0;
	private int ContinuousDetection = 0;
	private int TrackMaxPoint = 0;
	private boolean AdjustedCenter = false;
	private double AvgMean = 0;
	private double pMean = 0;
	private double deltamaxMean = 0;
	private double maxMean = 0;
	private double segma = 0;
	private boolean FusionStatus = false;
	private boolean backPropagation = true;
	private boolean LockGaussianFit = false;
	private boolean InversDetected = false;
	private int MaxPointTimeShift = 0;
	private int ShiftedFirstFrame;
	private double AreaIntensityRecordered = 0;
	private int StimulationID = 0;
	private double Mean = 0, StdDev = 0;
	private int indexSim0 = 0;
	private String FusionTypeStatus = "";
	private int FusionType = -1;
	private int CenterLayerPos = -1;
	private double NearestDistanceRecorded = Integer.MAX_VALUE;

	public void setID(int ID)
	{
		eID = ID;
	}

	public int getID()
	{
		return eID;
	}

	public boolean getLockPrintState()
	{
		return lockPrint;
	}

	public void setLockPrint(boolean bool)
	{
		lockPrint = bool;
	}

	public void setFlag(int x)
	{
		flag = x;
	}

	public int getFlag()
	{
		return flag;
	}

	public void setFlagPrint(boolean bool)
	{
		flagPrint = bool;
	}

	public boolean getFlagPrint()
	{
		return flagPrint;
	}

	public void IncrementTrackMaxPoint(int value)
	{
		TrackMaxPoint += value;
	}

	public int getTrackMaxPoint()
	{
		return TrackMaxPoint;
	}

	public int getContinuousCount()
	{
		return ContinuousDetection;
	}

	public void IncrementContinuousDetection(int value)
	{
		ContinuousDetection += value;
	}

	public void setCenterStatus(boolean value)
	{
		AdjustedCenter = value;
	}

	public boolean getCenterStatus()
	{
		return AdjustedCenter;
	}

	/**
	 * Appends the specified element to the end of this list.
	 * 
	 * @param roi   ImageJ region of interest (roi).
	 * @param frame where the region of interest was recorded.
	 * 
	 */
	public void AddRoi(Roi roi, int frame)
	{
		Rois.put(frame, roi);
		Linked.put(frame, Rois.size() - 1);
		double[] Vx = { 0, 0, 0 };
		Measurements.add(Vx);
		if (once)
		{
			frames.add(frame);
			LargestRoi = roi;
			once = false;
			DetectionCount++;
			ContinuousDetection++;
		} else
		{
			if (frame > frames.get(frames.size() - 1) + 3) // if discontinuity occurred
			{
				DetectionCount++;
				frames.add(frame);
			}
		}
	}

	// @return {@code true}
	// ======================== ========================
	// ======================== #Region Arraylist Centers ========================
	/**
	 * Appends the specified element to the end of this list.
	 * 
	 * @param x Center coordinates.
	 * @param y Center coordinates.
	 */
	public void AddCenter(double x, double y)
	{
		double[] xy = { x, y };
		Centers.add(xy);
	}

	/**
	 * Get center coordinates at selected index.
	 * 
	 * @param n if n = -1 returns last center position coordinates.
	 * 
	 */
	public double[] getCenter(int n)
	{
		n = n == -1 ? Centers.size() - 1 : n;
		double[] xy = Centers.get(n);
		return xy;
	}

	public ArrayList<double[]> GetAllCenters()
	{
		return Centers;
	}

	private void RemoveCenter(int n)
	{
		Centers.remove(n);
	}

	public int getDetectionCount()
	{
		return DetectionCount;
	}

	/**
	 * Replace Centers List element.
	 * 
	 * @param x Center coordinates.
	 * @param y Center coordinates.
	 * @param n is the array index.
	 */
	public void replaceCenter(int x, int y, int n)
	{
		double[] xy = { x, y };
		Centers.set(n, xy);
	}

	public void setFusionTypeStatus(String type, int value)
	{
		FusionTypeStatus = type;
		FusionType = value;
	}

	public String getFusionTypeStatus()
	{
		return FusionTypeStatus;
	}

	public int getFusionType()
	{
		return FusionType;
	}

	public void setCenterLayerPosition(int value)
	{
		CenterLayerPos = value;
	}

	public int getCenterLayerPosition()
	{
		return CenterLayerPos;
	}
	// ======================== #Region End ========================
	// ======================== ========================

	/**
	 * @return return the size of the total ROIs stored in this class.
	 */
	public int getlength()
	{
		return Rois.size();
	}

	public boolean containsFrame(int frame)
	{
		return Rois.containsKey(frame);
	}

	/**
	 * Get ROI at frame n.
	 * 
	 * @param frame.
	 */
	public Roi getRoi(int frame)
	{
		frame = frame == -1 ? frames.get(0) : frame;
		return Rois.get(frame);
	}

	/**
	 * Replace ROI List element.
	 * 
	 * @param roi Center coordinates.
	 * @param n   is the selected index to be changed.
	 */
	public void replaceRoi(Roi roi, int frame)
	{
		Rois.replace(frame, roi);
	}

	public Map<Integer, Roi> GetAllRois()
	{
		return Rois;
	}

	public void removeEntrie(int n)
	{
		Rois.remove(n);
		RemoveCenter(n);
	}

	public int getFirstFrame()
	{
		return FirstFrame == 0 ? frames.get(0) : FirstFrame;
	}

	public void setFirstFrame(int n, int frame)
	{
		if (frames.size() > 0)
		{
			frames.set(n, frame);
		} else
		{
			frames.add(frame);
		}
	}

	public int getLastFrame()
	{
		return frames.get(frames.size() - 1);
	}

	public void setSegma(double value)
	{
		segma = value;
	}

	public double getSegma()
	{
		return segma;
	}

	public void setFusionStatus(boolean bool)
	{
		FusionStatus = bool;
	}

	public boolean getFusionStatus()
	{
		return FusionStatus;
	}

	// ======================== ========================
	// ======================== #Region Measurements ========================
	public double GetMean(int frame)
	{
		int n = frame == -1 ? 0 : Linked.get(frame);
		double[] temp = Measurements.get(n);
		return temp[0];
	}

	public double GetArea(int frame)
	{
		int n = Linked.get(frame);
		double[] temp = Measurements.get(n);
		return temp[1];
	}

	public double GetMax(int frame)
	{
		int n = Linked.get(frame);
		double[] temp = Measurements.get(n);
		return temp[2];
	}

	public Roi getLargesRoi()
	{
		return LargestRoi;
	}

	public double getMaxArea()
	{
		return MaxArea;
	}

	public void SetMean(double mean, int frame)
	{
		int n = Linked.get(frame);
		double[] temp = Measurements.get(n);
		temp[0] = mean;
		Measurements.set(n, temp);
	}

	public void SetArea(double area, int frame)
	{
		int n = Linked.get(frame);
		double[] temp = Measurements.get(n);
		temp[1] = area;
		Measurements.set(n, temp);
		SetMaximumArea(area, getRoi(frame));
	}

	public void SetMax(double max, int frame)
	{
		int n = Linked.get(frame);
		double[] temp = Measurements.get(n);
		temp[2] = max;
		Measurements.set(n, temp);
	}

	public void SetMeasurments(double[] values, int frame)
	{
		int n = Linked.get(frame);
		Measurements.set(n, values);
		SetMaximumArea(values[1], getRoi(frame));
	}

	private void SetMaximumArea(double area, Roi roi)
	{
		if (MaxArea < area)
		{
			MaxArea = area;
			LargestRoi = roi;
		}
	}

	public void setAvgMean(double value)
	{
		AvgMean = value;
	}

	public double getAvgMean()
	{
		return AvgMean;
	}

	public void setpMean(double value)
	{
		pMean = value;
	}

	public double getpMean()
	{
		return pMean;
	}

	public void setDeltaMaxMean(double value)
	{
		deltamaxMean = value;
	}

	public double getDeltaMaxMean()
	{
		return deltamaxMean;
	}

	public void setMaxMean(double value)
	{
		maxMean = value;
	}

	public double getMaxMean()
	{
		return maxMean;
	}

	public void addContinuousFrames(int frame)
	{
		int[] temp = { DetectionCount, frame };
		Continuousframes.add(temp);
	}

	public ArrayList<int[]> getContinuousFrames()
	{
		return Continuousframes;
	}

	public void setFirstFrame(int value)
	{
		FirstFrame = value;
	}

	public void setBackPropagation(boolean bool)
	{
		backPropagation = bool;
	}

	public boolean getBackPropagation()
	{
		return backPropagation;
	}

	public void setInversDetected(boolean bool)
	{
		InversDetected = bool;
	}

	public boolean getInversDetected()
	{
		return InversDetected;
	}

	public void setDualID(int id)
	{
		dualID = id;
	}

	public int getDualID()
	{
		return dualID;
	}

	public int getMaxPointTimeShift()
	{
		return MaxPointTimeShift;
	}

	public void setMaxPointTimeShift(int value)
	{
		MaxPointTimeShift = value;
	}

	public int getTimeShiftedFrame()
	{
		return ShiftedFirstFrame;
	}

	public void setTimeShiftedFrame(int value)
	{
		ShiftedFirstFrame = value;
	}

	public double getAreaIntensityRecorded()
	{
		return AreaIntensityRecordered;
	}

	public void setAreaIntensityRecorded(double value)
	{
		AreaIntensityRecordered = value;
	}

	public void setNearestDistance(double value)
	{
		NearestDistanceRecorded = value;
	}

	public double getNearstDistance()
	{
		return NearestDistanceRecorded;
	}
	// ======================== #Region End ========================
	// ======================== ========================

	// ======================== #Region Buffered Means ========================

	public void setStimulationID(int sID)
	{
		StimulationID = sID;
	}

	public int getStimulationID()
	{
		return StimulationID;
	}

	public void setMean(double value)
	{
		Mean = value;
	}

	public void setStdDev(double value)
	{
		StdDev = value;
	}

	public double getMean()
	{
		return Mean;
	}

	public double getStdDev()
	{
		return StdDev;
	}

	public void setIndexSim0(int index)
	{
		indexSim0 = index;
	}

	public int getIndexSim0()
	{
		return indexSim0;
	}
	public boolean getGaussianLock()
	{
		return LockGaussianFit;
	}
	// ======================== #Region End ========================
	// ======================== ========================

	// ======================== #Regions Polygons Centers ========================
	public void ReplacePolyCenter(int x, int y, int i)
	{
		int[] Vx = PolyCenter.xpoints;
		int[] Vy = PolyCenter.ypoints;
		int size = PolyCenter.npoints;
		Vx[i] = x;
		Vy[i] = y;
		Polygon NewCenter = new Polygon(Vx, Vy, size);
		PolyCenter.reset();
		PolyCenter = NewCenter;
	}

	public int[] GetPolyCenter(int n)
	{
		int[] x = PolyCenter.xpoints;
		int[] y = PolyCenter.ypoints;
		int[] point = { x[n], y[n] };
		return point;
	}

	public void AddPolyCenter(int x, int y)
	{
		PolyCenter.addPoint(x, y);
	}

	/**
	 * Remove point from Polygon.
	 * 
	 * @param n is the selected index to be removed.
	 */
	public void RemovePolyCenter(int n)
	{
		int[] Vx = PolyCenter.xpoints;
		int[] Vy = PolyCenter.ypoints;
		int size = PolyCenter.npoints;

		ArrayList<Integer> tempx = (ArrayList<Integer>) Arrays.stream(Vx).boxed().collect(Collectors.toList());
		tempx.remove(n);
		ArrayList<Integer> tempy = (ArrayList<Integer>) Arrays.stream(Vy).boxed().collect(Collectors.toList());
		tempy.remove(n);
		int[] NewVx = tempx.stream().filter(i -> i != null).mapToInt(i -> i).toArray();
		int[] NewVy = tempx.stream().filter(i -> i != null).mapToInt(i -> i).toArray();

		Polygon NewCenters = new Polygon(NewVx, NewVy, size);
		PolyCenter.reset();
		PolyCenter = NewCenters;
	}

	/**
	 * Constructs a Polygon from an array of coordinates.
	 * 
	 * @param Vx     is x-axis vector center coordinates.
	 * @param Vy     is y-axis vector center coordinates.
	 * @param length is the total number of points inside a Polygon.
	 */
	public void CreatePolyCenters(int[] Vx, int[] Vy, int length)
	{
		Polygon NewCenters = new Polygon(Vx, Vy, length);
		PolyCenter = NewCenters;
	}

	public Polygon GetAllPolyCenters()
	{
		return PolyCenter;
	}
}
