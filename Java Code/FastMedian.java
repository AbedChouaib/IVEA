package com.uniSaarland_CIPMM.ivea;

import java.util.Arrays;
import java.util.stream.IntStream;

import ij.IJ;
import ij.ImageJ;
import ij.ImagePlus;
import ij.process.ImageProcessor;

public class FastMedian
{
	// ---------------- Search for Connected Pixel ----------------
	public void MedianFilter(ImagePlus imp, int radius)
	{
		ImageProcessor ip = imp.getProcessor();
		int height = ip.getHeight();
		int width = ip.getWidth();
		int matrixSize = getMatrixSize(radius);
		int[][] ImgVector = new int[width][height];
		IntStream.range(0, height).parallel().forEach(i ->
		{
			IntStream.range(0, width).parallel().forEach(j ->
			{
				// --------- Building Matrix ---------
				int[] matrix = new int[matrixSize];
				int index = 0;
				for (int y = i - radius; y <= i + radius; y++)
				{
					if (y < 0 || y >= height) // zero padding
					{
						matrix[index] = 0;
						index++;
					} else
					{
						for (int x = j - radius; x <= j + radius; x++)
						{
							if (x < 0 || x >= width)
							{
								matrix[index] = 0; // zero padding
							} else
							{
								matrix[index] = ip.getPixel(x, y);
							}
							index++;
						}
					}
				}
				// --------- Building Matrix --------
				int myPixel = GetMedian(matrix);
				ImgVector[j][i] = myPixel;
			});
		});
		UpdateImage(ip, ImgVector);
	}

	private void UpdateImage(ImageProcessor ip, int[][] ImgVector)
	{
		int height = ip.getHeight();
		int width = ip.getWidth();
		IntStream.range(0, height).parallel().forEach(i ->
		{
			IntStream.range(0, width).parallel().forEach(j ->
			{
				ip.putPixel(j, i, ImgVector[j][i]);
			});
		});
	}

	private int GetMedian(int[] matrix)
	{
		int Result = 0;
		int medianIndex = ((matrix.length - 1) / 2) + 1;
		Arrays.sort(matrix);
		Result = matrix[medianIndex];
		return Result;
	}

	private int getMatrixSize(int radius)
	{
		int Result = 0;
		for (int i = 0; i <= radius; i++)
		{
			if (i == 0)
			{
				Result = 1;
			} else
			{
				Result = Result + 8 * i;
			}
		}
		return Result;
	}

	public void showMessage(String message)
	{
		IJ.showMessage(message);
	}

	public static void main(String[] args) throws Exception
	{
		Class<?> clazz = FastMedian.class;
		java.net.URL url = clazz.getProtectionDomain().getCodeSource().getLocation();
		java.io.File file = new java.io.File(url.toURI());
		System.setProperty("plugins.dir", file.getAbsolutePath());
		new ImageJ();
		IJ.runPlugIn(clazz.getName(), "");
	}
}
