package com.uniSaarland_CIPMM.ivea;

import java.util.Arrays;
import java.util.Map;
import java.util.stream.IntStream;

import ij.ImagePlus;
import ij.gui.Roi;
import ij.process.ImageProcessor;
import ij.process.ImageStatistics;

public class DataManagement
{
	public void DoMeasurement(ImagePlus imp, Map<Integer, EventTracking> eMap, double[][] AllData,
			double[][] GraphData_1, double[][] GraphData_1_0, int[] FramesToMeasure, int dim)
	{
		int nFrames = imp.getStackSize();
		int nEvents = eMap.size();
		int radius = dim / 2;
		IntStream.range(0, nFrames).parallel().forEach(i ->
		{
			int ki = i + 1;
			IntStream.range(0, nEvents).parallel().forEach(j ->
			{
				ImageProcessor ip = imp.getStack().getProcessor(ki);
				EventTracking eT = eMap.get(j);
				double[] Co = eT.getCenter(0);
				int X = (int) Co[0];
				int Y = (int) Co[1];
				X = X - radius;
				Y = Y - radius;
				Roi roi = new Roi(X, Y, dim, dim);
				ip.setRoi(roi);
				ImageStatistics imStat = ip.getStatistics();

				if (eT.getDualID() == -1)
				{
					GraphData_1[eT.getID()][i] = imStat.mean;
					if (eT.getStimulationID() == 0)
					{
						GraphData_1_0[eT.getIndexSim0()][i] = imStat.mean;
					}
				}
				AllData[j][i] = imStat.mean;
				if (eT.getFirstFrame() == ki)
				{
					eT.setMean(imStat.mean);
					eT.setStdDev(imStat.stdDev);
				}
			});
		});
	}

	public double[][] DoMeasurementInterval(double[][] AllData, Map<Integer, EventTracking> eMap)
	{
		int FTNlower = 20;
		int FTNupper = 150;
		int length = AllData[0].length;
		int nEvents = eMap.size();

		double[][] GraphData = new double[nEvents][FTNlower + FTNupper];
		for (int i = 0; i < nEvents; i++)
		{
			EventTracking eT = eMap.get(i);
			int frame = eT.getFirstFrame();
			int Lower = frame - FTNlower;
			int upper = frame + FTNupper;
			int start = Lower <= 0 ? 1 : frame - FTNlower;
			int end = upper < length ? frame + FTNupper : length;
			int index = 0;
			for (int j = start; j < end; j++)
			{
				GraphData[i][index] = AllData[i][j];
				index++;
			}
		}
		return GraphData;
	}

	private double[] getMedian(double[][] GraphData, Map<Integer, EventTracking> eMap)
	{
		double[] Vmed = new double[GraphData.length];
//		System.out.println("Vmed.length = [" + GraphData.length + "]");
		IntStream.range(0, eMap.size()).parallel().forEach(i ->
		{
			EventTracking eT = eMap.get(i);
			if (eT.getFlagPrint())
			{
				if (eT.getDualID() == -1)
				{
					double[] TempSort = GraphData[eT.getID()].clone();
					Arrays.sort(TempSort);
					double median = TempSort[(int) (TempSort.length / 2)];
					Vmed[eT.getID()] = median;
				}
			}
		});
		return Vmed;
	}

	public double[][] getFullData(Map<Integer, EventTracking> eMap, int nMeasure, double[][] GraphData_1)
	{
//		{ID, Cx, Cy, Frame, Peak Intensity, StdDev, Median}
		double[][] FullData = new double[eMap.size()][nMeasure];
		int ndx = 0;
		double[] median = getMedian(GraphData_1, eMap);
		for (int i = 0; i < eMap.size() - 1; i++)
		{
			int ki = i + 1;
			for (int j = i + 1; j < eMap.size(); j++)
			{
				EventTracking eT = eMap.get(j);
				if (eT.getFlagPrint())
				{
					int ID = eT.getDualID() == -1 ? eT.getID() : eT.getDualID();
					if (ID == ki)
					{
						fillArray2D(FullData, ndx, ki, eT, median[ID]);
						ndx++;
					}
				}
			}
		}
		return FullData;
	}

	private void fillArray2D(double[][] Vx, int ndx, int ID, EventTracking eT, double med)
	{
		Vx[ndx][0] = ID;
		Vx[ndx][1] = eT.getCenter(-1)[0];
		Vx[ndx][2] = eT.getCenter(-1)[1];
		Vx[ndx][3] = eT.getFirstFrame();
		Vx[ndx][4] = eT.getMean();
		Vx[ndx][5] = eT.getStdDev();
		Vx[ndx][6] = med;
	}

	public double[][] getNormData(double[][] Vx, int[] range, double[][] ClusteredMean, int MinCluster, boolean subBG)
	{
		double[][] normData = Vx.clone();
		IntStream.range(0, normData.length).parallel().forEach(i ->
		{
			double[] MinMax = getMinMax(normData[i], range, ClusteredMean, MinCluster, subBG);
			IntStream.range(0, normData[i].length).parallel().forEach(j ->
			{
				normData[i][j] = normData[i][j] / MinMax[1];
			});
		});
		return normData;
	}

	public double[] getMinMax(double[] Vx, int[] range, double[][] ClusteredMean, int MinCluster, boolean subBG)
	{
		double max = 0;
		double min = 65535;
		if (subBG)
		{
			IntStream.range(0, Vx.length).parallel().forEach(i ->
			{
				Vx[i] = Vx[i] - ClusteredMean[i][MinCluster];
			});
		}
		for (int i = range[0]; i < range[1]; i++)
		{
			max = Vx[i] > max ? Vx[i] : max;
			min = Vx[i] < min ? Vx[i] : min;
		}
		double[] result = { min, max };
		return result;
	}
}
