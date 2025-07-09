package com.uniSaarland_CIPMM.ivea;

import java.util.stream.IntStream;

import ij.IJ;
import ij.ImagePlus;
import ij.plugin.Zoom;
import ij.process.ImageProcessor;

public class BufferedImagePlus
{
	ImageProcessor[] ImgBuff;
	int length;
	double[] Vx; // x-axis fitting vector;

	public void initializeBufferedImagePlus(int Size)
	{
		length = Size;
		ImgBuff = new ImageProcessor[Size];
	}

	public void fillBuffer(ImagePlus Img)
	{
		IntStream.range(1, length).parallel().forEach(i ->
		{
			if (ImgBuff[i] != null)
			{
				ImgBuff[i - 1] = ImgBuff[i];
			}
		});
		ImgBuff[length - 1] = Img.getProcessor();
	}

	public ImageProcessor getBufferedImage(int i)
	{
		return ImgBuff[i];
	}

	public void initializeVectorX(int VxLength)
	{
		Vx = new double[VxLength];
		IntStream.range(0, Vx.length).parallel().forEach(i ->
		{
			Vx[i] = i;
		});
	}

	public double[] getVectorX()
	{
		return Vx;
	}


	void drawImage(ImagePlus mtrx)
	{
		mtrx.show();
		Zoom zoom = new Zoom();
		IJ.selectWindow("mtrx");
		for (int i = 0; i < 6; i++)
		{
			zoom.run("in");
		}
		IJ.run(mtrx, "Enhance Contrast", "saturated=" + 0.25);
		IJ.showMessage("check spot shape");
		mtrx.close();
	}
}
