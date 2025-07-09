package com.uniSaarland_CIPMM.ivea;

import java.awt.Rectangle;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Map;
import java.util.Random;
import java.util.stream.IntStream;

import com.uniSaarland_CIPMM.ivea.gui.IVEAsetup;

import ij.gui.Roi;
import ij.plugin.frame.RoiManager;

public class LocalMath
{
	static int ToleranceDis = IVEAsetup.SearchRadius * 2;

	public void sortbyColumn(double arr[][], int col, boolean ascending)
	{
		// Using built-in sort function Arrays.sort
		Arrays.sort(arr, new Comparator<double[]>()
		{
			// Compare values according to columns
			public int compare(final double[] entry1, final double[] entry2)
			{
				// To sort in descending order revert
				// the '>' Operator
				if (ascending)
				{
					if (entry1[col] > entry2[col])
						return 1;
					else
						return -1;
				} else
				{
					if (entry1[col] < entry2[col])
						return 1;
					else
						return -1;
				}
			}
		});
	}

	protected double[] GetIOU(int[] A, int[] B)
	{
		double[] result = { 0, 0 };
		int A_W = A[2], A_H = A[3];
		int B_W = B[2], B_H = B[3];

		int[] A1 = { A[0], A[1] };
		int[] A2 = { A[0] + A_W, A[1] + A_H };
		int[] B1 = { B[0], B[1] };
		int[] B2 = { B[0] + B_W, B[1] + B_H };

		int[] AnB1 = { Math.max(A1[0], B1[0]), Math.max(A1[1], B1[1]) }; // max of min
		int[] AnB2 = { Math.min(A2[0], B2[0]), Math.min(A2[1], B2[1]) }; // min of max

		int dx = AnB2[0] - AnB1[0];
		int dy = AnB2[1] - AnB1[1];
		int areaA = A_W * A_H;
		int areaB = B_W * B_H;

		boolean outside = dx < 0 || dy < 0;
		dx = Math.abs(dx);
		dy = Math.abs(dy);
		double area_AnB = dx * dy;

		if (area_AnB > 0 && !outside)
		{
			boolean AA = area_AnB == areaA;
			boolean BB = area_AnB == areaB;
			if (AA && BB)
			{
				result[0] = -1; // "==> {A = B}"
			} else if (BB)
			{
				result[0] = -2; // "==> {B c A}"
			} else if (AA)
			{
				result[0] = -3; // "==> {A c B}"
			} else
			{
				double area_AuB = (A_W * A_H + B_W * B_H) - area_AnB;
				double iou = area_AnB / area_AuB;
				result[0] = iou;
				result[1] = areaA > areaB ? 1 : 0;
				result[1] = areaA == areaB ? -1 : result[1];
			}
		}
		return result;
	}

	public RoiManager ProcessOverLappingRois(RoiManager rm, Map<Integer, EventTracking> eMap)
	{
		int roiCount = rm.getCount();
		double[][] RoiData = new double[roiCount][7];
		Roi[] roi = rm.getRoisAsArray();
		// -------------- collect data form ROIs --------------
		IntStream.range(0, roiCount).parallel().forEach(i ->
		{
			Random rand = new Random();
			Rectangle bound = roi[i].getBounds();
			double x = bound.getX();
			double y = bound.getY();
			double W_ = bound.getWidth();
			double H_ = bound.getHeight();
			double Cx = bound.getCenterX();
			double Cy = bound.getCenterY();
			double area = (W_ * H_) + rand.nextInt(100);
//			System.out.println("event " + i + "  area = " + area);
			double[] temp = { x, y, W_, H_, Cx, Cy, area, i, 1 };
			RoiData[i] = temp;
		});
		// -------------- end --------------
		// -------------- sort array with respect to [][6] --------------
		double[][] SortedRoi = RoiData;
//		sortbyColumn(SortedRoi, 6, false); // Delete bigger regions.
		sortbyColumn(SortedRoi, 6, true); // Delete smaller regions.
		// -------------- end --------------

		for (int i = 0; i < roiCount - 1; i++)
		{
			double[] RoiState = { 0, 0, 0 };
			int[] A = { (int) SortedRoi[i][0], (int) SortedRoi[i][1], (int) SortedRoi[i][2], (int) SortedRoi[i][3] };
			double[] Center = { SortedRoi[i][4], SortedRoi[i][5] };
			ArrayList<double[]> Neighbors = new ArrayList<double[]>();
			for (int j = i + 1; j < roiCount; j++)
			{
				double Cx = SortedRoi[j][4];
				double Cy = SortedRoi[j][5];
				double distance = Math.sqrt(Math.pow(Center[0] - Cx, 2) + Math.pow(Center[1] - Cy, 2));
				if (distance < ToleranceDis)
				{
					double[] temp = { j, SortedRoi[j][0], SortedRoi[j][1], SortedRoi[j][2], SortedRoi[j][3], distance };
					Neighbors.add(temp);
				}
			}
			for (int j = 0; j < Neighbors.size(); j++)
			{
				double[] Vx = Neighbors.get(j);
				int[] B = { (int) Vx[1], (int) Vx[2], (int) Vx[3], (int) Vx[4] };
				double[] iou = GetIOU(A, B);
				RoiState[0] = iou[0];
				RoiState[1] = iou[1];
				if (iou[0] == -1 || Math.abs(iou[0]) > 0.4)
				{
					SortedRoi[i][8] = 0;
					break;
				} else if (iou[0] == -2)
				{
					RoiState[2] = RoiState[2] + 1;
				}
			}
			if (RoiState[2] > 1) // delete duplicates.
			{
				SortedRoi[i][8] = 0;
			}
		}
		sortbyColumn(SortedRoi, 7, true);
		rm.reset();
		for (int j = 0; j < SortedRoi.length; j++)
		{
			double[] Vx = SortedRoi[j];
			if (Vx[8] == 1)
			{
				EventTracking Ei = eMap.get(j);
				Ei.setFlagPrint(true);
				eMap.replace(j, Ei);
				rm.addRoi(roi[j]);
			}
		}
		return rm;
	}

	public double[][][] reshapeArray(double[][] inData, int nFrames, int nFeatures)
	{
		double[][] eventsData0 = new double[inData.length][nFeatures * nFrames];
		double[][] eventsData1 = new double[inData.length][nFeatures * nFrames];
		IntStream.range(0, inData.length).parallel().forEach(i ->
		{
			double[][] newShape = getNewShape(inData[i], nFrames, 13);
			eventsData0[i] = newShape[0];
			eventsData1[i] = newShape[1];
		});
		return new double[][][] { eventsData0, eventsData1 };
	}

	public double[][] getNewShape(double[] Vy, int nFrames, int nFeatures)
	{
		int dim = nFeatures * nFrames;
		double[] newShape0 = new double[dim];
		double[] newShape1 = new double[dim];
		int currentFramesNum = Vy.length / nFeatures;

		// Find min and max values in newShape1 using IntStream
		double[] minMax = IntStream.range(0, nFeatures)
				.parallel()
				.mapToObj(f ->
				{
					double[] Vf = new double[currentFramesNum];
					Arrays.parallelSetAll(Vf, j -> Vy[j * nFeatures + f]);
					double[] Vf_new = squeezeSignal(Vf, nFrames);
					double minVal = Arrays.stream(Vf_new).min().orElse(Double.MAX_VALUE);
					double maxVal = Arrays.stream(Vf_new).max().orElse(Double.MIN_VALUE);
					return new double[] { minVal, maxVal };
				})
				.flatMapToDouble(Arrays::stream)
				.toArray();

		double minVal = Arrays.stream(minMax).min().orElse(Double.MAX_VALUE);
		double maxVal = Arrays.stream(minMax).max().orElse(Double.MIN_VALUE);

		// Process newShape0 and newShape1
		IntStream.range(0, nFeatures).parallel().forEach(f ->
		{
			double[] Vf = new double[currentFramesNum];
			Arrays.parallelSetAll(Vf, j -> Vy[j * nFeatures + f]);
			double[] Vf_new = squeezeSignal(Vf, nFrames);
			double[] Vf_trim = Arrays.copyOf(Vf, nFrames);
			IntStream.range(0, nFrames).parallel().forEach(j ->
			{
				newShape0[j * nFeatures + f] = Vf_trim[j];
				newShape1[j * nFeatures + f] = Vf_new[j];
			});
		});

		// Apply min-max normalization to newShape1
		double range = maxVal - minVal;
		IntStream.range(0, newShape1.length).parallel().forEach(i ->
		{
			newShape1[i] = (newShape1[i] - minVal) / range;
		});

		return new double[][] { newShape0, newShape1 };
	}

	public double[] squeezeSignal(double[] Vf, int nFrames)
	{
		int frameSize = Math.round((float) Vf.length / nFrames);

		double[] features = IntStream.range(0, nFrames)
				.parallel()
				.mapToDouble(i ->
				{
					int startIdx = i * frameSize;
					int endIdx = (i + 1) * frameSize;

					double[] frame = Arrays.copyOfRange(Vf, startIdx, endIdx);
					double sum = Arrays.stream(frame).sum();
					return sum / frame.length;
				})
				.toArray();
		return features;
	}

	public double[][] Bilinear_interpolate(double[][] image, double newWidth, double newHeight)
	{
		int originalWidth = image.length;
		int originalHeight = image[0].length;

		double scaleX = (double) originalWidth / newWidth;
		double scaleY = (double) originalHeight / newHeight;

		double[][] interpolatedImage = new double[(int) newHeight][(int) newWidth];

		IntStream.range(0, (int) newHeight).parallel().forEach(y ->
		{
			for (int x = 0; x < newWidth; x++)
			{
				double xOrigin = x * scaleX;
				double yOrigin = y * scaleY;

				int x0 = (int) Math.max(0, Math.floor(xOrigin));
				int x1 = (int) Math.min(originalWidth - 1, Math.ceil(xOrigin));
				int y0 = (int) Math.max(0, Math.floor(yOrigin));
				int y1 = (int) Math.min(originalHeight - 1, Math.ceil(yOrigin));

				// fractional coordinates weights
				double dx = xOrigin - x0;
				double dy = yOrigin - y0;

				// bilinear interpolation
				double value = (1 - dx) * (1 - dy) * image[y0][x0]
						+ dx * (1 - dy) * image[y0][x1]
						+ (1 - dx) * dy * image[y1][x0]
						+ dx * dy * image[y1][x1];
				interpolatedImage[y][x] = value;
			}
		});
		return interpolatedImage;
	}

	public float[][] Bilinear_interpolate(float[][] image, float newWidth, float newHeight)
	{
		int originalWidth = image.length;
		int originalHeight = image[0].length;

		float scaleX = (float) originalWidth / newWidth;
		float scaleY = (float) originalHeight / newHeight;

		float[][] interpolatedImage = new float[(int) newHeight][(int) newWidth];

		IntStream.range(0, (int) newHeight).parallel().forEach(y ->
		{
			for (int x = 0; x < newWidth; x++)
			{
				float xOrigin = x * scaleX;
				float yOrigin = y * scaleY;

				int x0 = (int) Math.max(0, Math.floor(xOrigin));
				int x1 = (int) Math.min(originalWidth - 1, Math.ceil(xOrigin));
				int y0 = (int) Math.max(0, Math.floor(yOrigin));
				int y1 = (int) Math.min(originalHeight - 1, Math.ceil(yOrigin));

				// fractional coordinates weights
				float dx = xOrigin - x0;
				float dy = yOrigin - y0;

				// bilinear interpolation
				float value = (1 - dx) * (1 - dy) * image[y0][x0]
						+ dx * (1 - dy) * image[y0][x1]
						+ (1 - dx) * dy * image[y1][x0]
						+ dx * dy * image[y1][x1];
				interpolatedImage[y][x] = value;
			}
		});
		return interpolatedImage;
	}
}
