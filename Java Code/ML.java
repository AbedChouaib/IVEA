package com.uniSaarland_CIPMM.ivea;

import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.IntStream;

import ij.IJ;
import ij.ImagePlus;
import ij.measure.Measurements;
import ij.measure.ResultsTable;
import ij.plugin.ImageCalculator;
import ij.plugin.filter.Analyzer;
import ij.process.ImageProcessor;

public class ML
{
	public static boolean cancel = false;
	static int MedianRadius;
	public static int[] SegmentedImg;
	public static int[][] SegmentedMatrix;
	static float Gmean;
	private int MinClusterID;

	// ---------------- Sorting and pulling Mapped Data ----------------
	// =========================== Image Segmentation ===========================
	public double[][] GetClusteredStackMean(ImagePlus imp, int length, int Klayers, String folderPath, int FrameToLearnFrom)
	{
		int _W;
		int _H;
		int total;
		int Knum = Klayers / 2;
		AtomicInteger progress = new AtomicInteger(0);
		// --------------------------- clustering ---------------------------
		Kmeans KM = new Kmeans();
		ImagePlus temp = new ImagePlus("Slice_" + Integer.toString(FrameToLearnFrom), imp.getStack().getProcessor(FrameToLearnFrom))
				.duplicate();
		ImageProcessor tempIP = temp.getProcessor();
		_W = tempIP.getWidth();
		_H = tempIP.getHeight();
		total = _H * _W;
		SegmentedImg = KM.calculate(temp, Klayers, tempIP.getBitDepth(), 1, folderPath);
		SegmentedMatrix = convertVectorToMatrix(SegmentedImg, _H, _W);
		MinClusterID = KM.GetMinClusterID();
		temp.changes = false;
		temp.close();
//		IJ.showStatus("Calculating Stack Mean...");
		// --------------------------- end ---------------------------
		double[][] FinalValues = new double[length][Knum];
		IntStream.range(0, length).parallel().forEach(i ->
		{
			ImageProcessor ip = imp.getStack().getProcessor(i + 1);
			short[] PixelsValuesTemp = (short[]) ip.getPixels();
			IntStream.range(0, Knum).parallel().forEach(j ->
			{
				double avgClusterMean = 0.0;
				double[] result = IntStream.range(0, total)
						.parallel()
						.filter(k -> SegmentedImg[k] == j)
						.mapToDouble(k -> PixelsValuesTemp[k] & 0xffff)
						.collect(() -> new double[] { 0.0, 0.0 }, (acc, value) ->
						{
							acc[0] += value;
							acc[1] += 1.0;
						}, (acc1, acc2) ->
						{
							acc1[0] += acc2[0];
							acc1[1] += acc2[1];
						});

				avgClusterMean = result[0] / result[1];
				FinalValues[i][j] = avgClusterMean;
			});
			progress.incrementAndGet();
			IJ.showStatus("Calculating Stack Mean, " + progress + " <--> " + length);
		});
		return FinalValues;
	}

	// =========================== end ===========================
	public Double[] GetStackMean(ImagePlus imp, int length)
	{
		cancel = false;
		Double[] FinalValues = new Double[length];
		IntStream.range(0, length).parallel().forEach(i ->
		{
			ResultsTable rtTemp = new ResultsTable();
			ImagePlus impTemp = new ImagePlus("Slice_" + Integer.toString(i + 1), imp.getStack().getProcessor(i + 1));
			int measurements = Measurements.MEAN;
			Analyzer analyzerTemp = new Analyzer(impTemp, measurements, rtTemp);
			analyzerTemp.measure();
			FinalValues[i] = rtTemp.getValue("Mean", 0);
			impTemp.changes = false;
			impTemp.close();
		});
		return FinalValues;
	}

	public void TuneBrightness(ImageProcessor ip, short[] PixelsValues, double BiasValue, int cluster)
	{
		int _W = ip.getWidth();
		int _H = ip.getHeight();
		IntStream.range(0, _H).parallel().forEach(j ->
		{
			IntStream.range(0, _W).parallel().forEach(k ->
			{
				if (SegmentedMatrix[j][k] == cluster) // k + _W * j
				{
					int value = PixelsValues[k + _W * j] & 0xffff;
					double temp = value * BiasValue;
					if (temp > 65535)
					{
						ip.putPixel(k, j, 65535);
					} else
					{
						value = (int) temp;
						ip.putPixel(k, j, value);
					}
				}
			});
		});
	}

	public void TuneBrightness(ImageProcessor ip, byte[] PixelsValues, double BiasValue, int cluster)
	{
		int _W = ip.getWidth();
		int _H = ip.getHeight();
		IntStream.range(0, _H).parallel().forEach(j ->
		{
			IntStream.range(0, _W).parallel().forEach(k ->
			{
				if (SegmentedMatrix[j][k] == cluster) // SegmentedImg[k + _W * j]
				{
					int value = PixelsValues[k + _W * j] & 0xffff;
					double temp = value * BiasValue;
					if (temp > 255)
					{
						ip.putPixel(k, j, 255);
					} else
					{
						value = (int) temp;
						ip.putPixel(k, j, value);
					}
				}
			});
		});
	}

	public void TuneBrightnessAddition(ImageProcessor ip, short[] PixelsValues, int BiasValue, int cluster)
	{
		int _W = ip.getWidth();
		int _H = ip.getHeight();
		IntStream.range(0, _H).parallel().forEach(j ->
		{
			IntStream.range(0, _W).parallel().forEach(k ->
			{
				if (SegmentedMatrix[j][k] == cluster)
				{

					int value = PixelsValues[k + _W * j] & 0xffff;
					if (BiasValue > 0)
					{
						if (value > 0 && value < 65535 - BiasValue)
						{
							ip.putPixel(k, j, value + BiasValue);
						} else if (value > 65535 - BiasValue)
						{
							ip.putPixel(k, j, 65535);
						}
					} else if (BiasValue < 0)
					{
						if (value > 0 && value + BiasValue > 0)
						{
							ip.putPixel(k, j, value + BiasValue);
						} else if (value + BiasValue < 0)
						{
							ip.putPixel(k, j, 0);
						}
					}
				}
			});
		});
	}

	public void TuneBrightnessAddition(ImageProcessor ip, byte[] PixelsValues, int BiasValue)
	{
		int _W = ip.getWidth();
		int _H = ip.getHeight();
		IntStream.range(0, _H).parallel().forEach(j ->
		{
			IntStream.range(0, _W).parallel().forEach(k ->
			{
				int value = PixelsValues[k + _W * j] & 0xff;
				if (BiasValue > 0)
				{
					if (value > 0 && value < 255 - BiasValue)
					{
						ip.putPixel(k, j, value + BiasValue);
					} else if (value > 255 - BiasValue)
					{
						ip.putPixel(k, j, 255);
					}
				} else if (BiasValue < 0)
				{
					if (value > 0 && value + BiasValue > 0)
					{
						ip.putPixel(k, j, value + BiasValue);
					} else if (value + BiasValue < 0)
					{
						ip.putPixel(k, j, 0);
					}
				}
			});
		});
	}

	public void clearBackground(ImageProcessor ip)
	{
		int width = ip.getWidth();
		int height = ip.getHeight();
		IntStream.range(0, height).parallel().forEach(j ->
		{
			IntStream.range(0, width).parallel().forEach(k ->
			{
				if (SegmentedMatrix[j][k] == 0)
				{
					ip.putPixel(k, j, 0);
				}
			});
		});
	}

	// ======================= #Region Methods =======================
	int[][] convertVectorToMatrix(int[] Vx, int h, int w)
	{
		int[][] mtrx = new int[h][w];
		IntStream.range(0, h).parallel().forEach(i ->
		{
			IntStream.range(0, w).parallel().forEach(j ->
			{
				int ki = j + w * i;
				mtrx[i][j] = Vx[ki];
			});
		});
		return mtrx;
	}

	// ======================= #Region AI =======================
	// ======================= Threshold Auto Calculator =======================
	// USED
	public int AutoPixelThreshold(ImagePlus imp, int FrameNum, String noiseFilterRadiusKind, int noiseFilterRadius, boolean ShowMessage)
	{
		int FinalVlaue = 0;
		int AvarageThreshold = 0, NonZeroPixels = 0, TempCount = 0;
		boolean Loop = true;
		// ResultsTable rtTemp = new ResultsTable();
		ImagePlus imp1 = new ImagePlus("Slice_" + Integer.toString(1), imp.getStack().getProcessor(FrameNum - 1).duplicate());
		ImagePlus imp2 = new ImagePlus("Slice_" + Integer.toString(2), imp.getStack().getProcessor(FrameNum).duplicate());
		ImageCalculator icTemp = new ImageCalculator();
		ImagePlus impSub = icTemp.run("Subtract create", imp2, imp1);
		if (impSub.getBitDepth() != 8)
		{
			IJ.run(impSub, "8-bit", "");
		}
		IJ.run(impSub, noiseFilterRadiusKind + "...", "radius=" + (noiseFilterRadius));
		ImageProcessor ip = impSub.getProcessor();
		int width = ip.getWidth();
		int height = ip.getHeight();
		int L_ = width * height;

		byte[] PixelsValuesTemp = (byte[]) ip.getPixels();
		int[] PixelsVlauesInt = Byte2Int(L_, PixelsValuesTemp);
		for (int j = 0; j < height; j++)
		{
			for (int k = 0; k < width; k++)
			{
				int value = PixelsVlauesInt[k + width * j];
				if (value > 0)
				{
					NonZeroPixels++;
					AvarageThreshold += value;
				}
			}
		}
		if (NonZeroPixels != 0)
		{
			AvarageThreshold = (int) (AvarageThreshold / NonZeroPixels);
			FinalVlaue = AvarageThreshold;
		}
		FastMedian FM = new FastMedian();
		while (Loop && !cancel)
		{
			ImagePlus imp4 = impSub.duplicate();
			ImageProcessor ipTemp = imp4.getProcessor();
			byte[] PixelsValuesTemp2 = (byte[]) ipTemp.getPixels();
			int PixelValueLevel = FinalVlaue;
			IntStream.range(0, height).parallel().forEach(j ->
			{
				IntStream.range(0, width).parallel().forEach(k ->
				{
					int value = PixelsValuesTemp2[k + width * j] & 0xff;
					if (value > PixelValueLevel)
					{
						ipTemp.putPixel(k, j, 255);
					} else
					{
						ipTemp.putPixel(k, j, 0);
					}
				});
			});
			IJ.run(imp4, "Dilate", ""); // Dilate
//			IJ.run(imp4, "Minimum...", "radius=2");
			FM.MedianFilter(imp4, MedianRadius);
			// IJ.run(imp4, "Median...", "radius=" + 5);
			// ============================================
			Gmean = 0;
			byte[] PixelsValuesTemp3 = (byte[]) ipTemp.getPixels();
			IntStream.range(0, height).parallel().forEach(j ->
			{
				IntStream.range(0, width).parallel().forEach(k ->
				{
					int value = PixelsValuesTemp3[k + width * j] & 0xff;
					Gmean += value;
				});
			});
			Gmean = Gmean / L_;
			// ============================================
			if (Gmean == 0)
			{
				Loop = false;
			} else
			{
				FinalVlaue += 1;
			}
			TempCount++;
			imp4.changes = false;
			imp4.close();
		}
		imp1.changes = false;
		imp2.changes = false;
		impSub.changes = false;
		imp1.close();
		imp2.close();
		impSub.close();
		if (ShowMessage)
		{
			showMessage("Attempt [" + Integer.toString(TempCount) + "] \nFinalValue =" + FinalVlaue);// <<<<<<<<<<Debugging>>>>>>>>>>
		}
		return FinalVlaue;
	}

	// ======================= End =======================
	// ======================= Frame Threshold Auto Calculator
	// =======================
	public double FramePixelThreshold(ImagePlus imp, String noiseFilterRadiusKind, double noiseFilterRadius, int[] mask, double Pthresh,
			boolean ShowMessage)
	{
		int FinalVlaue = 0;
		int width = mask[2];
		int height = mask[3];
		int L_ = width * height;

		int TempCount = 0;
		boolean Loop = true;
		ImagePlus impSub = imp.duplicate();
		imp.setRoi(mask[0], mask[1], width, height);
		impSub = imp.crop();
		imp.deleteRoi();
		if (ShowMessage)
		{
			impSub.show();
			showMessage("Check Cropped Image");// <<<<<<<<<<Debugging>>>>>>>>>>
		}

		ImageProcessor ip = impSub.getProcessor();
		// Get Pixels values and convert them to integer.
		byte[] PixelsValuesTemp = (byte[]) ip.getPixels();
		int[] PixelsVlauesInt = Byte2Int(L_, PixelsValuesTemp);
		FinalVlaue = (int) Pthresh;
		FastMedian FM = new FastMedian();
		// ============ Getting PixelsValue Once ============
		// ============ End ============
		while (Loop && !cancel)
		{
			ImagePlus imp4 = impSub.duplicate();
			ImageProcessor ipTemp = imp4.getProcessor();
			int thresh = FinalVlaue;
			IntStream.range(0, height).parallel().forEach(j ->
			{
				IntStream.range(0, width).parallel().forEach(k ->
				{
					int value = PixelsVlauesInt[k + width * j];
					if (value > thresh)
					{
						ipTemp.putPixel(k, j, 255);
					} else
					{
						ipTemp.putPixel(k, j, 0);
					}
				});
			});
			FM.MedianFilter(imp4, MedianRadius);
			// ============================================
			Gmean = 0;
			byte[] PixelsValuesTemp3 = (byte[]) ipTemp.getPixels();
			IntStream.range(0, height).parallel().forEach(j ->
			{
				IntStream.range(0, width).parallel().forEach(k ->
				{
					int value = PixelsValuesTemp3[k + width * j] & 0xff;
					Gmean += value;
				});
			});
			Gmean = Gmean / L_;
			// ============================================
			if (Gmean == 0)
			{
				Loop = false;
			} else
			{
				FinalVlaue += 2;
			}
			TempCount++;
			imp4.changes = false;
			imp4.close();
		}
		impSub.changes = false;
		impSub.close();
		if (ShowMessage)
		{
			showMessage("Attempt [" + Integer.toString(TempCount) + "] \nFinalValue =" + FinalVlaue);// <<<<<<<<<<Debugging>>>>>>>>>>
		}
		return FinalVlaue;
	}

	public double FramePixelThreshold(ImagePlus imp, String noiseFilterRadiusKind, double noiseFilterRadius, int[] mask, double Pthresh,
			boolean DoMask, boolean ShowMessage)
	{
		int FinalVlaue = 0;
		int width = imp.getWidth();
		int height = imp.getHeight();
		int L_ = width * height;
		int TempCount = 0;
		boolean Loop = true;
		ImagePlus impSub = imp.duplicate();
		// ResultsTable rtTemp = new ResultsTable();
		impSub = GetBGLayer(imp, mask, DoMask);

		if (ShowMessage)
		{
			impSub.show();
			showMessage("Check Cropped Image");// <<<<<<<<<<Debugging>>>>>>>>>>
		}

		ImageProcessor ip = impSub.getProcessor();
		// Get Pixels values and convert them to integer.
		byte[] PixelsValuesTemp = (byte[]) ip.getPixels();
		int[] PixelsVlauesInt = Byte2Int(L_, PixelsValuesTemp);
		FinalVlaue = (int) Pthresh;
		FastMedian FM = new FastMedian();
		// ============ Getting PixelsValue Once ============
		// ============ End ============
		while (Loop && !cancel)
		{
			ImagePlus imp4 = impSub.duplicate();
			ImageProcessor ipTemp = imp4.getProcessor();
			int thresh = FinalVlaue;
			IntStream.range(0, height).parallel().forEach(j ->
			{
				IntStream.range(0, width).parallel().forEach(k ->
				{
					int value = PixelsVlauesInt[k + width * j];
					if (value > thresh)
					{
						ipTemp.putPixel(k, j, 255);
					} else
					{
						ipTemp.putPixel(k, j, 0);
					}
				});
			});
			IJ.run(imp4, "Dilate", ""); // Dilate
			FM.MedianFilter(imp4, MedianRadius);
			// ============================================
			Gmean = 0;
			byte[] PixelsValuesTemp3 = (byte[]) ipTemp.getPixels();
			IntStream.range(0, height).parallel().forEach(j ->
			{
				IntStream.range(0, width).parallel().forEach(k ->
				{
					int value = PixelsValuesTemp3[k + width * j] & 0xff;
					Gmean += value;
				});
			});
			Gmean = Gmean / L_;
			// ============================================
			if (Gmean == 0)
			{
				Loop = false;
			} else
			{
				FinalVlaue += 2;
			}
			TempCount++;
			imp4.changes = false;
			imp4.close();
		}
		impSub.changes = false;
		impSub.close();
		if (ShowMessage)
		{
			showMessage("Attempt [" + Integer.toString(TempCount) + "] \nFinalValue =" + FinalVlaue);// <<<<<<<<<<Debugging>>>>>>>>>>
		}
		return FinalVlaue + 1;
	}

	ImagePlus GetBGLayer(ImagePlus Oimp, int[] Mask, boolean DoMask)
	{
		ImageProcessor Oip = Oimp.getProcessor();
		byte[] PixelsValues = (byte[]) Oip.getPixels();

		ImagePlus imp = Oimp.duplicate();
		int x = Mask[0], y = Mask[1], wx = Mask[2], hy = Mask[3];
		int _W, _H;
		int layer = MinClusterID;
		ImageProcessor ip = imp.getProcessor();
		_W = ip.getWidth();
		_H = ip.getHeight();
		IntStream.range(0, _H).parallel().forEach(j ->
		{
			IntStream.range(0, _W).parallel().forEach(k ->
			{
				if (SegmentedMatrix[j][k] != layer)
				{
					ip.putPixel(k, j, 0);
				}
			});
		});
		if (DoMask)
		{
			IntStream.range(y, hy).parallel().forEach(j ->
			{
				IntStream.range(x, wx).parallel().forEach(k ->
				{
					int value = PixelsValues[k + _W * j] & 0xff;
					ip.putPixel(k, j, value);
				});
			});
		}
		return imp;
	}

	// ======================= #Region ML =======================
	// ======================= #Region OutPuts =======================
	public int GetMinClusterID()
	{
		return MinClusterID;
	}
	// ======================= #End =======================

	public void showMessage(String message)
	{
		IJ.showMessage(message);
	}

	private int[] Byte2Int(int L_, byte[] PixelsValues)
	{
		int[] StorageArray = new int[L_];
		IntStream.range(0, L_).parallel().forEach(i ->
		{
			StorageArray[i] = PixelsValues[i] & 0xff;
		});
		return StorageArray;
	}
}