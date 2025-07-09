package com.uniSaarland_CIPMM.ivea;

import java.util.stream.IntStream;

import ij.ImagePlus;
import ij.process.ImageProcessor;

public class EstimatePSF
{
	double CalculateFWHM(ImagePlus Img, int[] Center)
	{
		ImageProcessor ip = Img.getProcessor();
		int width = ip.getWidth();
		int height = ip.getHeight();
		double Cm = ip.getPixel(Center[0], Center[1]);
		int sides = 4;
		double[] Rads = new double[sides];
		IntStream.range(0, sides).parallel().forEach(i ->
		{
			Rads[i] = getSegma(ip, Cm, Center, i, width - 1, height - 1);
		});
		double sigma = 0;
		for (int i = 0; i < sides; i++)
		{
			sigma += Rads[i];
		}
		sigma = sigma / sides;
		return sigma;
	}

	double getSegma(ImageProcessor ip, double Cm, int[] xy, int direction, int width, int height)
	{
		double Rad = 1;
		switch (direction)
		{
		case 0:
			Rad = searchUpDown(ip, Cm, xy, width, height);
			break;

		case 1:
			Rad = searchRightLeft(ip, Cm, xy, width, height);
			break;

		case 2:
			Rad = searchDiagonalPos(ip, Cm, xy, width, height);
			break;

		case 3:
			Rad = searchDiagonalNeg(ip, Cm, xy, width, height);
			break;
		}
		return Rad;
	}

	double searchUpDown(ImageProcessor ip, double Cm, int[] xy, int width, int height)
	{
		int count = 0;
		int i = xy[1];
		int j = xy[0];
		double Xm = Cm / 2;

		while (i > 0)
		{
			i--;
			int value = ip.getPixel(j, i);
			if (value < Xm)
			{
				break;
			}
			count++;
		}
		i = xy[1];

		while (i < height - 1)
		{
			i++;
			int value = ip.getPixel(j, i);
			if (value < Xm)
			{
				break;
			}
			count++;
		}
		return count;
	}

	double searchRightLeft(ImageProcessor ip, double Cm, int[] xy, int width, int height)
	{
		int count = 1;
		int i = xy[1];
		int j = xy[0];
		double Xm = Cm / 2;
		while (j > 0)
		{
			j--;
			int value = ip.getPixel(j, i);
			if (value < Xm)
			{
				break;
			}
			count++;
		}

		while (j < width)
		{
			j++;
			int value = ip.getPixel(j, i);
			if (value < Xm)
			{
				break;
			}
			count++;
		}
		return count;
	}

	double searchDiagonalPos(ImageProcessor ip, double Cm, int[] xy, int width, int height)
	{
		int count = 1;
		int i = xy[1];
		int j = xy[0];
		double Xm = Cm / 2;
		while (i > 0 && j < width)
		{
			j++;
			i--;
			int value = ip.getPixel(j, i);
			if (value < Xm)
			{
				break;
			}
			count++;
		}

		while (i < height && j > 0)
		{
			i++;
			j--;
			int value = ip.getPixel(j, i);
			if (value < Xm)
			{
				break;
			}
			count++;
		}
		return count;
	}

	double searchDiagonalNeg(ImageProcessor ip, double Cm, int[] xy, int width, int height)
	{
		int count = 1;
		int i = xy[1];
		int j = xy[0];
		double Xm = Cm / 2;
		while (i > 0 && j > 0)
		{
			j--;
			i--;
			int value = ip.getPixel(j, i);
			if (value < Xm)
			{
				break;
			}
			count++;
		}

		while (i < height && j < width)
		{
			i++;
			j++;
			int value = ip.getPixel(j, i);
			if (value < Xm)
			{
				break;
			}
			count++;
		}
		return count;
	}
}
