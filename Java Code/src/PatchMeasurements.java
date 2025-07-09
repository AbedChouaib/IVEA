package com.uniSaarland_CIPMM.ivea;

import java.util.stream.IntStream;

import ij.process.ImageProcessor;

public class PatchMeasurements
{
	public static int[][] FixedLabeledMap;

	PatchMeasurements(boolean Initialize, int Radius, int type)
	{
		if (Initialize)
		{
			switch (type)
			{
			case 1:
				FixedLabeledMap = preLabeledMatrix(); // random
				break;

			case 2:
				FixedLabeledMap = preLabeledMatrix_v2(); // T-Cell R7 13R
				break;

			case 3:
				FixedLabeledMap = preLabeledMatrix_v3(); // synapse small matrix
				break;
			case 9:
				FixedLabeledMap = preLabeledMatrix_9R(); // synapse small matrix
				break;
			case 5:
				FixedLabeledMap = preLabeledMatrix_5R(); // synapse small matrix
				break;
			case 813:
				FixedLabeledMap = preLaeledMatrixR8_13R(); // T-Cell R8 13R
			case -8:
				FixedLabeledMap = preLabeledRings_v1(Radius);
				break;
			case -13:
				FixedLabeledMap = createSquareMatrix((Radius * 2) + 1);
				break;
			default:
				break;
			}
		}
	}

	// =========================== Collecting Data ===========================

	public double[] CalculateFixedEventData(double[][][] mtrx3D, int ID, int nRegions, boolean RangeNorm)
	{
		int nframes = mtrx3D.length;
		int VectorLength = nframes * nRegions;
		double[] eData = new double[VectorLength];
		double[][] eTemp = new double[nframes][nRegions];
		Normalize3D(mtrx3D, RangeNorm); 
		IntStream.range(0, nframes).parallel().forEach(i ->
		{
			double[][] mtrx = mtrx3D[i];
			eTemp[i] = getFixedPatchMeasurements(mtrx, FixedLabeledMap, nRegions);
			// --------------------------- Vectorize Data ---------------------------
			IntStream.range(0, nRegions).parallel().forEach(j ->
			{
				eData[j + nRegions * i] = eTemp[i][j]; // <= 0.0 ? 0.01 : eTemp[i][j]
			});
			// --------------------------- ---------------------------
		});
		return eData;
	}

	// =========================== End ===========================

	// =========================== Normalizing in 3D ===========================
	public void Normalize3D(double[][][] mtrx3D, boolean rangeNorm)
	{
		int nframes = mtrx3D.length;
		int dim = mtrx3D[0].length;
		double max = 0;
		double min = 65535;
		for (int i = 0; i < nframes; i++)
		{
			for (int j = 0; j < dim; j++)
			{
				for (int k = 0; k < dim; k++)
				{
					double value = mtrx3D[i][j][k];
					max = value > max ? value : max;
					min = value < min ? value : min;
				}
			}
		}
		final double mn = min;
		final double mx = max;

		IntStream.range(0, nframes).parallel().forEach(i ->
		{
			IntStream.range(0, dim).parallel().forEach(j ->
			{
				IntStream.range(0, dim).parallel().forEach(k ->
				{
					if (rangeNorm)
					{
						mtrx3D[i][j][k] = (mtrx3D[i][j][k] - mn) / (mx - mn);
					} else
					{
						mtrx3D[i][j][k] = (mtrx3D[i][j][k]) / (mx);
					}
				});
			});
		});
	}

	public void NormalizeVector(double[] Vx, boolean rangeNorm)
	{
		int[] range = { 0, Vx.length };
		double[] MinMax = getMinMax(Vx, range);
		IntStream.range(0, Vx.length).parallel().forEach(j ->
		{
			if (Double.isNaN(Vx[j]) || Vx[j] < 0.01)
			{
				Vx[j] = 0.01;
			} else
			{
				if (rangeNorm)
				{
					Vx[j] = (Vx[j] - MinMax[0]) / (MinMax[1] - MinMax[0]);
				} else
				{
					Vx[j] = (Vx[j]) / (MinMax[1]);
				}

			}
		});
	}

	public double[] getMinMax(double[] Vx, int[] range)
	{
		double max = 0;
		double min = 65535;
		for (int i = range[0]; i < range[1]; i++)
		{
			max = Vx[i] > max ? Vx[i] : max;
			min = Vx[i] < min ? Vx[i] : min;
		}
		double[] result = { min, max };
		return result;
	}
	// =========================== End ===========================

	// =========================== Measurements ===========================
	public double[] getFixedPatchMeasurements(double[][] mtrx, int[][] flMap, int nRegion)
	{
		double[] Means = new double[nRegion];
		int[] counter = new int[nRegion];
		int dim = mtrx.length;
		IntStream.range(0, dim).parallel().forEach(i ->
		{
			IntStream.range(0, dim).parallel().forEach(j ->
			{
				int Label = flMap[i][j];
				double value = mtrx[i][j];
				for (int k = 0; k < nRegion; k++)
				{
					if (Label == k + 1)
					{
						Means[k] += value;
						counter[k]++;
						break;
					}
				}
			});
		});
		IntStream.range(0, nRegion).parallel().forEach(i ->
		{
			Means[i] /= counter[i];
		});
		return Means;
	}
	// =========================== End ===========================

	// =========================== ===========================
	// =========================== Matrix Labeling ===========================
	public static double[][] getPatchMatrix(ImageProcessor ip, double[] Cxy, int R, int H_, int W_)
	{
		int dim = R * 2 + 1;
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
//					System.out.print("(i,j)(" + i + "," + j + ") -- (x,y)(" + x + "," + y + ")");
					mtrx[y][x] = ip.getPixel(j, i);
				}
			});
		});
		return mtrx;
	}

	public static float[][] getPatchMatrixFloat(ImageProcessor ip, double[] Cxy, int R, int H_, int W_)
	{
		int dim = R * 2 + 1;
		float[][] mtrx = new float[dim][dim];
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
//					System.out.print("(i,j)(" + i + "," + j + ") -- (x,y)(" + x + "," + y + ")");
					mtrx[y][x] = ip.getPixel(j, i);
				}
			});
		});
		return mtrx;
	}
	// =========================== End ===========================

	// =========================== Matrix Labeling ===========================
	private int[][] preLabeledMatrix()
	{
		int[][] mtrx = {
					{ 10, 10, 10, 10, 10, 10, 10, -1, 11, 11, 11, 11, 11, 11, 11 },
					{ 10, 10, 10, 10, 10, 10, 6, -1, 7, 11, 11, 11, 11, 11, 11 },
					{ 10, 10, 10, 10, 6, 6, 6, -1, 7, 7, 7, 11, 11, 11, 11 },
					{ 10, 10, 10, 6, 6, 6, 2, -1, 3, 7, 7, 7, 11, 11, 11 },
					{ 10, 10, 6, 6, 6, 2, 2, -1, 3, 3, 7, 7, 7, 11, 11 },
					{ 10, 10, 6, 6, 2, 2, 2, -1, 3, 3, 3, 7, 7, 11, 11 },
					{ 10, 6, 6, 2, 2, 2, 2, 1, 3, 3, 3, 3, 7, 7, 11 },
					{ -1, -1, -1, -1, -1, -1, 1, 1, 1, -1, -1, -1, -1, -1, -1 },
					{ 13, 9, 9, 5, 5, 5, 5, 1, 4, 4, 4, 4, 8, 8, 12 },
					{ 13, 13, 9, 9, 5, 5, 5, -1, 4, 4, 4, 8, 8, 12, 12 },
					{ 13, 13, 9, 9, 9, 5, 5, -1, 4, 4, 8, 8, 8, 12, 12 },
					{ 13, 13, 13, 9, 9, 9, 5, -1, 4, 8, 8, 8, 12, 12, 12 },
					{ 13, 13, 13, 13, 9, 9, 9, -1, 8, 8, 8, 12, 12, 12, 12 },
					{ 13, 13, 13, 13, 13, 13, 9, -1, 8, 12, 12, 12, 12, 12, 12 },
					{ 13, 13, 13, 13, 13, 13, 13, -1, 12, 12, 12, 12, 12, 12, 12 } };

		return mtrx;
	}

	private int[][] preLabeledMatrix_v2()
	{
		int[][] mtrx = {
					{ 10, 10, 10, 10, 10, 10, 10, -1, 11, 11, 11, 11, 11, 11, 11 },
					{ 10, 10, 10, 10, 10, 10, 6, -1, 7, 11, 11, 11, 11, 11, 11 },
					{ 10, 10, 10, 10, 6, 6, 6, -1, 7, 7, 7, 11, 11, 11, 11 },
					{ 10, 10, 10, 6, 6, 6, 2, -1, 3, 7, 7, 7, 11, 11, 11 },
					{ 10, 10, 6, 6, 6, 2, 2, -1, 3, 3, 7, 7, 7, 11, 11 },
					{ 10, 10, 6, 6, 2, 2, 2, 1, 3, 3, 3, 7, 7, 11, 11 },
					{ 10, 6, 6, 2, 2, 2, 1, 1, 1, 3, 3, 3, 7, 7, 11 },
					{ -1, -1, -1, -1, -1, 1, 1, 1, 1, 1, -1, -1, -1, -1, -1 },
					{ 13, 9, 9, 5, 5, 5, 1, 1, 1, 4, 4, 4, 8, 8, 12 },
					{ 13, 13, 9, 9, 5, 5, 5, 1, 4, 4, 4, 8, 8, 12, 12 },
					{ 13, 13, 9, 9, 9, 5, 5, -1, 4, 4, 8, 8, 8, 12, 12 },
					{ 13, 13, 13, 9, 9, 9, 5, -1, 4, 8, 8, 8, 12, 12, 12 },
					{ 13, 13, 13, 13, 9, 9, 9, -1, 8, 8, 8, 12, 12, 12, 12 },
					{ 13, 13, 13, 13, 13, 13, 9, -1, 8, 12, 12, 12, 12, 12, 12 },
					{ 13, 13, 13, 13, 13, 13, 13, -1, 12, 12, 12, 12, 12, 12, 12 } };

		return mtrx;
	}

	private int[][] preLabeledMatrix_v3()
	{
		int[][] mtrx = {
					{ 10, 10, 10, 10, 10, 6, -1, 7, 11, 11, 11, 11, 11, },
					{ 10, 10, 10, 6, 6, 6, -1, 7, 7, 7, 11, 11, 11, },
					{ 10, 10, 6, 6, 6, 2, -1, 3, 7, 7, 7, 11, 11, },
					{ 10, 6, 6, 6, 2, 2, -1, 3, 3, 7, 7, 7, 11, },
					{ 10, 6, 6, 2, 2, 2, 1, 3, 3, 3, 7, 7, 11, },
					{ 6, 6, 2, 2, 2, 1, 1, 1, 3, 3, 3, 7, 7, },
					{ -1, -1, -1, -1, 1, 1, 1, 1, 1, -1, -1, -1, -1, },
					{ 9, 9, 5, 5, 5, 1, 1, 1, 4, 4, 4, 8, 8, },
					{ 13, 9, 9, 5, 5, 5, 1, 4, 4, 4, 8, 8, 12, },
					{ 13, 9, 9, 9, 5, 5, -1, 4, 4, 8, 8, 8, 12, },
					{ 13, 13, 9, 9, 9, 5, -1, 4, 8, 8, 8, 12, 12, },
					{ 13, 13, 13, 9, 9, 9, -1, 8, 8, 8, 12, 12, 12, },
					{ 13, 13, 13, 13, 13, 9, -1, 8, 12, 12, 12, 12, 12, } };

		return mtrx;
	}

	private int[][] preLabeledMatrix_9R()
	{
		int[][] mtrx = {
					{ 10, 10, 10, 10, -1, 11, 11, 11, 11, },
					{ 10, 6, 6, 6, -1, 7, 7, 7, 11, },
					{ 10, 6, 2, 2, -1, 3, 3, 7, 11, },
					{ 10, 6, 2, 2, 1, 3, 3, 7, 11, },
					{ -1, -1, -1, 1, 1, 1, -1, -1, -1, },
					{ 13, 9, 5, 5, 1, 4, 4, 8, 12, },
					{ 13, 9, 5, 5, -1, 4, 4, 8, 12, },
					{ 13, 9, 9, 9, -1, 8, 8, 8, 12, },
					{ 13, 13, 13, 13, -1, 12, 12, 12, 12, }, };

		return mtrx;
	}

	private int[][] preLabeledMatrix_5R()
	{
		int[][] mtrx = {
					{ 10, 10, 10, 10, 10, 6, -1, 7, 11, 11, 11, 11, 11, },
					{ 10, 10, 10, 6, 6, 6, -1, 7, 7, 7, 11, 11, 11, },
					{ 10, 10, 6, 6, 6, 2, -1, 3, 7, 7, 7, 11, 11, },
					{ 10, 6, 6, 6, 2, 2, -1, 3, 3, 7, 7, 7, 11, },
					{ 10, 6, 6, 2, 2, 2, 1, 3, 3, 3, 7, 7, 11, },
					{ 6, 6, 2, 2, 2, 1, 1, 1, 3, 3, 3, 7, 7, },
					{ -1, -1, -1, -1, 1, 1, 1, 1, 1, -1, -1, -1, -1, },
					{ 9, 9, 5, 5, 5, 1, 1, 1, 4, 4, 4, 8, 8, },
					{ 13, 9, 9, 5, 5, 5, 1, 4, 4, 4, 8, 8, 12, },
					{ 13, 9, 9, 9, 5, 5, -1, 4, 4, 8, 8, 8, 12, },
					{ 13, 13, 9, 9, 9, 5, -1, 4, 8, 8, 8, 12, 12, },
					{ 13, 13, 13, 9, 9, 9, -1, 8, 8, 8, 12, 12, 12, },
					{ 13, 13, 13, 13, 13, 9, -1, 8, 12, 12, 12, 12, 12, } };

		return mtrx;
	}

	private int[][] preLaeledMatrixR8_13R()
	{
		int[][] mtrx = {
					{ 10, 10, 10, 10, 10, 10, 10, 10, -1, 11, 11, 11, 11, 11, 11, 11, 11 },
					{ 10, 10, 10, 10, 10, 10, 6, 6, -1, 7, 7, 11, 11, 11, 11, 11, 11 },
					{ 10, 10, 10, 10, 6, 6, 6, 6, -1, 7, 7, 7, 7, 11, 11, 11, 11 },
					{ 10, 10, 10, 6, 6, 6, 6, 2, -1, 3, 7, 7, 7, 7, 11, 11, 11 },
					{ 10, 10, 6, 6, 6, 6, 2, 2, -1, 3, 3, 7, 7, 7, 7, 11, 11 },
					{ 10, 10, 6, 6, 6, 2, 2, 2, -1, 3, 3, 3, 7, 7, 7, 11, 11 },
					{ 10, 6, 6, 6, 2, 2, 2, 2, 1, 3, 3, 3, 3, 7, 7, 7, 11 },
					{ 10, 6, 6, 2, 2, 2, 2, 1, 1, 1, 3, 3, 3, 3, 7, 7, 11 },
					{ -1, -1, -1, -1, -1, -1, 1, 1, 1, 1, 1, -1, -1, -1, -1, -1, -1 },
					{ 13, 9, 9, 9, 5, 5, 5, 1, 1, 1, 4, 4, 4, 4, 8, 8, 12 },
					{ 13, 9, 9, 9, 9, 5, 5, 5, 1, 4, 4, 4, 4, 8, 8, 8, 12 },
					{ 13, 13, 9, 9, 9, 9, 5, 5, -1, 4, 4, 4, 8, 8, 8, 12, 12 },
					{ 13, 13, 9, 9, 9, 9, 9, 5, -1, 4, 4, 8, 8, 8, 8, 12, 12 },
					{ 13, 13, 13, 9, 9, 9, 9, 9, -1, 4, 8, 8, 8, 8, 12, 12, 12 },
					{ 13, 13, 13, 13, 9, 9, 9, 9, -1, 8, 8, 8, 8, 12, 12, 12, 12 },
					{ 13, 13, 13, 13, 13, 13, 9, 9, -1, 8, 8, 12, 12, 12, 12, 12, 12 },
					{ 13, 13, 13, 13, 13, 13, 13, 13, -1, 12, 12, 12, 12, 12, 12, 12, 12 } };
		return mtrx;
	}

	private int[][] preLabeledRings_v1(int nRegions)
	{
		int n = nRegions * 2 + 1;
		int[][] A = new int[n][n];

		for (int i = 0; i < n; i++)
		{
			for (int j = 0; j < n; j++)
			{
				// calculate the distance to the center
				int d = Math.min(Math.min(i, j), Math.min(n - 1 - i, n - 1 - j));
				A[i][j] = nRegions - d;
			}
		}
		A[nRegions][nRegions] = 1;
		return A;
	}

	public static int[][] createSquareMatrix(int dim)
	{
		int cxy = (dim + 1) / 2;
		int[][] mat = new int[dim][dim];
		int maxNum = 1;
		int steps = 0;
		int latch = 1;

		for (int r = 0; r < cxy; r++)
		{ // loop over the "radius" from the center
			int i = cxy - r - 1;
			int j = cxy - r - 1;
			for (int k = 1; k <= r * 2 + 1; k++)
			{ // fill in the values for the current "ring" around the center
				mat[i][j + k - 1] = maxNum + r - steps;
				mat[i + k - 1][j] = maxNum + r - steps;
				mat[i + r * 2][j + k - 1] = maxNum + r - steps;
				mat[i + k - 1][j + r * 2] = maxNum + r - steps;
			}
			if (latch == 1)
			{
				steps++;
				latch = -1;
			}
			latch++;
		}
		return mat;
	}
	// =========================== End ===========================

	// =========================== Print and Debug ===========================
	public void printLine(int[][] data)
	{
		for (int i = 0; i < data[0].length; i++)
		{
			int[] temp = data[i];
			System.out.print(java.util.Arrays.toString(temp));
			System.out.println("");
		}
	}

	public void printLine(double[] data)
	{
		for (int i = 0; i < data.length; i++)
		{
			double temp = data[i];
			System.out.println("" + temp);
		}
	}

	public static void print2DArray(int[][] array)
	{
		for (int i = 0; i < array.length; i++)
		{
			for (int j = 0; j < array[0].length; j++)
			{
				System.out.print(array[i][j] + " ");
			}
			System.out.println();
		}
	}

	public static void print2DArray(double[][] array)
	{
		for (int i = 0; i < array.length; i++)
		{
			for (int j = 0; j < array[0].length; j++)
			{
				System.out.print(array[i][j] + " ");
			}
			System.out.println();
		}
	}
	// =========================== End ===========================
}
