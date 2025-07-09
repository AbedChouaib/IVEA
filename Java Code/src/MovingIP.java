package com.uniSaarland_CIPMM.ivea;

import java.io.File;
import java.util.Arrays;
import java.util.stream.IntStream;

import ij.ImagePlus;
import ij.ImageStack;
import ij.process.ByteProcessor;
import ij.process.FloatProcessor;
import ij.process.ImageProcessor;
import ij.process.ShortProcessor;

public class MovingIP
{

	/**
	 * Groups frames in blocks of 'blockSize' and computes the chosen operation
	 * ('max' or 'mean') for each block to form a new ImagePlus stack.
	 *
	 * @param imp       Input ImagePlus.
	 * @param blockSize Number of frames to group together.
	 * @param mode      Statistic to compute for each block: "max" or "mean".
	 * @return A new ImagePlus whose stack size = floor(numFrames / blockSize).
	 */
	public static ImagePlus ReduceStackbyBlocks(ImagePlus imp, int blockSize, String mode)
	{
		int numFrames = imp.getStackSize();
		int width = imp.getWidth();
		int height = imp.getHeight();
		int bitDepth = imp.getBitDepth(); // Get the original bit depth

		int numBlocks = numFrames / blockSize;

		ImageProcessor[] resultProcessors = new ImageProcessor[numBlocks];

		IntStream.range(0, numBlocks).parallel().forEach(b ->
		{
			int startSlice = b * blockSize + 1; // 1-based for ImageJ
			int endSlice = startSlice + blockSize - 1;

			ImageProcessor resultProcessor;
			if (bitDepth == 8)
			{
				resultProcessor = new ByteProcessor(width, height);
			} else if (bitDepth == 16)
			{
				resultProcessor = new ShortProcessor(width, height);
			} else
			{
				resultProcessor = new FloatProcessor(width, height);
			}

			if (mode.equalsIgnoreCase("max"))
			{
				if (bitDepth == 8)
				{
					byte[] pixels = (byte[]) resultProcessor.getPixels();
					Arrays.fill(pixels, (byte) 0);
				} else if (bitDepth == 16)
				{
					short[] pixels = (short[]) resultProcessor.getPixels();
					Arrays.fill(pixels, (short) 0);
				} else
				{
					float[] pixels = (float[]) resultProcessor.getPixels();
					Arrays.fill(pixels, Float.NEGATIVE_INFINITY);
				}
			} else if (mode.equalsIgnoreCase("mean"))
			{
				// convert back to original format at the end
			} else
			{
				throw new IllegalArgumentException("Unsupported mode: " + mode + ". Use 'max' or 'mean'.");
			}

			float[] meanAccumulator = null;
			if (mode.equalsIgnoreCase("mean"))
			{
				meanAccumulator = new float[width * height];
			}

			for (int slice = startSlice; slice <= endSlice; slice++)
			{
				ImageProcessor ip = imp.getStack().getProcessor(slice);

				if (mode.equalsIgnoreCase("max"))
				{
					if (bitDepth == 8)
					{
						byte[] resultPixels = (byte[]) resultProcessor.getPixels();
						byte[] slicePixels = (byte[]) ip.getPixels();
						for (int i = 0; i < resultPixels.length; i++)
						{
							resultPixels[i] = (byte) Math.max((resultPixels[i] & 0xff), (slicePixels[i] & 0xff));
						}
					} else if (bitDepth == 16)
					{
						short[] resultPixels = (short[]) resultProcessor.getPixels();
						short[] slicePixels = (short[]) ip.getPixels();
						for (int i = 0; i < resultPixels.length; i++)
						{
							resultPixels[i] = (short) Math.max((resultPixels[i] & 0xffff), (slicePixels[i] & 0xffff));
						}
					} else
					{
						float[] resultPixels = (float[]) resultProcessor.getPixels();
						float[] slicePixels = (float[]) ip.getPixels();
						for (int i = 0; i < resultPixels.length; i++)
						{
							resultPixels[i] = Math.max(resultPixels[i], slicePixels[i]);
						}
					}
				} else
				{ 
					Object slicePixelsObj = ip.getPixels();
					if (bitDepth == 8)
					{
						byte[] slicePixels = (byte[]) slicePixelsObj;
						for (int i = 0; i < meanAccumulator.length; i++)
						{
							meanAccumulator[i] += (slicePixels[i] & 0xff);
						}
					} else if (bitDepth == 16)
					{
						short[] slicePixels = (short[]) slicePixelsObj;
						for (int i = 0; i < meanAccumulator.length; i++)
						{
							meanAccumulator[i] += (slicePixels[i] & 0xffff);
						}
					} else
					{
						float[] slicePixels = (float[]) slicePixelsObj;
						for (int i = 0; i < meanAccumulator.length; i++)
						{
							meanAccumulator[i] += slicePixels[i];
						}
					}
				}
			}

			if (mode.equalsIgnoreCase("mean"))
			{
				for (int i = 0; i < meanAccumulator.length; i++)
				{
					meanAccumulator[i] /= blockSize;
				}
				if (bitDepth == 8)
				{
					byte[] resultPixels = (byte[]) resultProcessor.getPixels();
					for (int i = 0; i < resultPixels.length; i++)
					{
						resultPixels[i] = (byte) Math.round(meanAccumulator[i]);
					}
				} else if (bitDepth == 16)
				{
					short[] resultPixels = (short[]) resultProcessor.getPixels();
					for (int i = 0; i < resultPixels.length; i++)
					{
						resultPixels[i] = (short) Math.round(meanAccumulator[i]);
					}
				} else
				{
					float[] resultPixels = (float[]) resultProcessor.getPixels();
					System.arraycopy(meanAccumulator, 0, resultPixels, 0, resultPixels.length);
				}
			}

			resultProcessors[b] = resultProcessor;
		});
		ImageStack resultStack = new ImageStack(width, height, numBlocks);
		for (int b = 0; b < numBlocks; b++)
		{
			resultStack.setProcessor(resultProcessors[b], b + 1);
		}

		return new ImagePlus("Block_" + mode, resultStack);
	}

	/**
	 *
	 * @param inputPath    The path to the original file.
	 * @param outputFolder The folder where output should be saved.
	 * @param mode         The block statistic mode used: 'max' or 'mean'.
	 * @return A constructed filename for output.
	 */
	public static String generateOutputFilename(String inputPath, String outputFolder, String mode)
	{
		File inputFile = new File(inputPath);
		String imageName = inputFile.getName();

		// Remove extension if present
		int dotIndex = imageName.lastIndexOf('.');
		if (dotIndex > 0)
		{
			imageName = imageName.substring(0, dotIndex);
		}
		// Create new filename
		String outputFilename = imageName + "_block_" + mode + ".tif";
		File outputFile = new File(outputFolder, outputFilename);
		return outputFile.getAbsolutePath();
	}
}
