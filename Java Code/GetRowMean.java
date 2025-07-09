package com.uniSaarland_CIPMM.ivea;

import java.util.concurrent.Callable;
import java.util.stream.IntStream;

import ij.process.ImageProcessor;

public class GetRowMean implements Callable<Double[]>
{
	private ImageProcessor ip;
	private short[] PixelsValues;

	public GetRowMean(ImageProcessor Ip, short[] pixelsValues)
	{
		super();
		ip = Ip;
		PixelsValues = pixelsValues;
	}

	@Override
	public Double[] call() throws Exception
	{
		int _W = ip.getWidth();
		int _H = ip.getHeight();
		Double[] ResultMean = new Double[_H];
		IntStream.range(0, _H).parallel().forEach(j ->
		{
			Double imean = 0.0;
			for (int k = 0; k < _W; k++)
			{
				int value = PixelsValues[k + _W * j] & 0xffff;
				imean += value + 0.0;
			}
			imean = imean / _W;
			ResultMean[j] = imean;
		});
		return ResultMean;
	}
}
