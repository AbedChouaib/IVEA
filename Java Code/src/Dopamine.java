package com.uniSaarland_CIPMM.ivea;

import java.awt.EventQueue;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.IntStream;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JProgressBar;

import com.uniSaarland_CIPMM.ivea.gui.GUI_hotspotArea;
import com.uniSaarland_CIPMM.ivea.gui.IVEAsetup;
import com.uniSaarland_CIPMM.ivea.gui.InputData;

import ij.IJ;
import ij.ImagePlus;
import ij.Prefs;
import ij.gui.Roi;
import ij.measure.Measurements;
import ij.measure.ResultsTable;
import ij.plugin.FolderOpener;
import ij.plugin.ImageCalculator;
import ij.plugin.filter.Analyzer;
import ij.plugin.frame.RoiManager;
import ij.process.ByteProcessor;
import ij.process.ImageProcessor;
import ij.process.ImageStatistics;
import loci.formats.FormatException;
import loci.plugins.BF;

public class Dopamine
{
	// ======================= #Region Declaration =======================
	private int width;
	private int height;
	private int slices = IVEAsetup.StackLength;
	private double thresholdLimit;
	private int SelectionEnlarge = IVEAsetup.SelectionEnlarge;
	private int Klayers = IVEAsetup.Klayers;
	private int MeanBrightnessTolerance = 1;
	public double value;
	private double detectionSensitivity = IVEAsetup.detectionSensitivity;
	public String name;
	private int PreviousFrameCtrl, FoundImageCount;
	private int noiseFilterRadius = IVEAsetup.noiseFilterRadius;
	private int SearchRadius = IVEAsetup.SearchRadius;
	private double GlobalThrehsold = IVEAsetup.thresholdLimit16bits;
	double BrightDarkFilter = IVEAsetup.BrightnessAdjust;
	double NoiseFilterValue = IVEAsetup.NoiseFilterValue;
	public int[] MaskCropValues = { 0, 0, 0, 0 };
	private int FrameToLearnFrom = IVEAsetup.FrameToLearnFrom;
	public static double[][] ClusteredStackMean;
	private boolean DoOnceSliceLoop;
	boolean AIframeNosieLearner = IVEAsetup.MLframeNosieLearner;
	boolean AInoiseLearner = IVEAsetup.MLnoiseLearner;
	private String roiMaskPath, ImagesSpotsPath, CSVfilesPath, SegImagePath;
	private String noiseFilterKind = IVEAsetup.noiseFilterKind;
	private int MinClusterID;
	private int AreaSize = 50;
	public Map<Integer, EventTracking> eTrackMap = new HashMap<Integer, EventTracking>();
	public int StartFrame = IVEAsetup.StartFrame, EndFrame = IVEAsetup.EndFrame;
	private ImagePlus ImpOriginal = new ImagePlus();
	public boolean Cancel = false;
	private int NumberOfStacks = IVEAsetup.NumberOfStacks;
	private ArrayList<String> StackDirectories = new ArrayList<String>();
	private String OutPutDirectory = IVEAsetup.OutPutDirectory;
	private int StackLoopNum = 0;
	private ArrayList<int[]> CropMaskListValues = IVEAsetup.CropMaskListValues;
	private ArrayList<String> LogFile = new ArrayList<String>();
	private ArrayList<String> SubFolderNameList = IVEAsetup.SubFolderNameList;
	private Double[][] GraphData;
	private boolean TheInputIsVideos = IVEAsetup.TheInputIsVideos;
	private boolean ImagePresent = IVEAsetup.ImagePresent;
	private boolean CleanBG = IVEAsetup.CleanBG;
	private boolean trunOffCropping = false;
	private boolean LearnBG = IVEAsetup.learnBG;
	private double meshAmplitude = IVEAsetup.adaptiveThresh;
	private int FrameDifference = IVEAsetup.DopamineFrameInterval;
	private boolean SaveInSameDir = IVEAsetup.SaveInSameDir;
	private String InputPath = IVEAsetup.InputPath;
	private boolean OneVideo = IVEAsetup.OneVideo;
	private boolean OneStackToProcess;
	private boolean AutoG;
	private int FeedbackFrameNumber = 6;

	JFrame frame = new JFrame();
	JProgressBar progressBar = new JProgressBar();
	JLabel progressStatusLabel = new JLabel();

	public Dopamine(ImagePlus GetImpOriginal)
	{
		ImpOriginal = GetImpOriginal;// ImagePlus stack.
		OneStackToProcess = true;
	}

	public Dopamine(ArrayList<String> GetImpOriginalDir, int GetnumberofStacks)
	{
		StackDirectories = GetImpOriginalDir;// array of image path.
		StackLoopNum = GetnumberofStacks;
		OneStackToProcess = StackDirectories.size() > 1 ? false : true;
	}

	// ======================= #Region Declaration =======================

	// ======================= #Region Active Loop =======================
	public void run(String arg)
	{
		// make sure that ImageJ has black background.
		IJ.run("Colors...", "foreground=white background=black selection=yellow");
		Prefs.blackBackground = true;

		if (!ImagePresent)
		{
			if (TheInputIsVideos)
			{
				if (StackDirectories.get(StackLoopNum).endsWith(".tf2"))
				{
					ImagePlus[] imps;
					try
					{
						imps = BF.openImagePlus(StackDirectories.get(StackLoopNum));
						ImpOriginal = imps[0];
					} catch (FormatException | IOException e)
					{
						e.printStackTrace();
					}
				} else
				{
					ImpOriginal = IJ.openImage(StackDirectories.get(StackLoopNum));
				}
			} else
			{
				ImpOriginal = FolderOpener.open(StackDirectories.get(StackLoopNum), "virtual");
			}
			ImpOriginal.show();
		}
		if (!trunOffCropping)
		{
			MaskCropValues = CropMaskListValues.get(StackLoopNum);
		} else
		{
			MaskCropValues = new int[4];
			LearnBG = true;
		}
		// ================= Create Mask Selection if 0 =================
		if (MaskCropValues[4] == 0)
		{
			InputData indata = new InputData();
			int[] Values = indata.GetCropMaskPosition(ImpOriginal, 0);
			MaskCropValues = Values;
		}

		// ================= End =================
		if (IVEAsetup.MultiImageDetected)
		{
			slices = ImpOriginal.getStackSize();
			EndFrame = slices;
		}
		if (SubFolderNameList.get(0) == "Null")
		{
			String temp = ImpOriginal.getTitle();
			if (temp.endsWith("tf2"))
			{
				temp = temp.replace(".tf2", "");
			} else
			{
				temp = temp.replace(".tif", "");
			}

			SubFolderNameList.set(0, temp);
		}
		String TempOutPath = CreateDir(OutPutDirectory + "-" + SubFolderNameList.get(StackLoopNum));
		EventQueue.invokeLater(new Runnable()
		{
			public void run()
			{
				try
				{
					ImpOriginal.show();
					ShowProgressBarWindow();
					SetPrograssBarMax(EndFrame - StartFrame);
					UpdateProgressBar(0);
				} catch (Exception e)
				{
					e.printStackTrace();
				}
			}
		});
		AdjustSettings();
		LogFile.add("Parameters used:");
		int kl = Math.round(Klayers / 2);
		LogFile.add("K-Layers=" + kl + " Adaptive_Threshold=" + meshAmplitude + " Brightness_Adjustment=" + BrightDarkFilter
				+ " Noise Filter R=" + noiseFilterRadius);
		LogFile.add("----------------------------------------------------------------");
		RoiManager roiManager = RoiManager.getInstance();
		if (roiManager != null)
		{
			roiManager.close();
		}
		Runnable RunProgram = () ->
		{
			IJ.run(ImpOriginal, "Set Scale...", "distance=0 known=0 pixel=1 unit=micron");
			int L_imBuff = 5;
			ImagePlus[] BufferedImage = new ImagePlus[L_imBuff];
			DoOnceSliceLoop = true;
			RegionLabeling.ThreshValue = 255; // for development mode.
			ML ml = new ML();
			ML.MedianRadius = 1; // testing <<<<<<<<<<<<<
			ClusteredStackMean = ml.GetClusteredStackMean(ImpOriginal, slices, Klayers, SegImagePath, FrameToLearnFrom);
			MinClusterID = ml.GetMinClusterID();

			if (AInoiseLearner)
			{
				GlobalThrehsold = ml.AutoPixelThreshold(ImpOriginal, FrameToLearnFrom, noiseFilterKind, noiseFilterRadius, false);
				LogFile.add("1st auto decision for threshold value was [" + GlobalThrehsold + "]");
			} else
			{
				AIframeNosieLearner = false;
				LogFile.add("Iterative threshold isn't active, user threshold was [" + GlobalThrehsold + "]");
			}
			width = ImpOriginal.getWidth();
			height = ImpOriginal.getHeight();
			int StartFrom = StartFrame;
			if (StartFrom <= FrameDifference)
			{
				StartFrom = FrameDifference + 1;
			}
			// ---------------- Save ----------------
			for (int i = StartFrom; i <= EndFrame; i++)
			{
				if (DoOnceSliceLoop)
				{
					PreviousFrameCtrl = i - FrameDifference;
					progressStatusLabel.setText("Processing data please wait... (" + (StackLoopNum + 1) + "/" + NumberOfStacks + ")");
					DoOnceSliceLoop = false;
				}
				PreviousFrameCtrl = i - FrameDifference;
				if (Cancel)
				{
					break;
				}
				// ---------------- First detection ----------------
				ImagePlus imp1 = new ImagePlus("Slice_" + Integer.toString(PreviousFrameCtrl),
						ImpOriginal.getStack().getProcessor(PreviousFrameCtrl)).duplicate();
				ImagePlus imp2 = new ImagePlus("Slice_" + Integer.toString(i), ImpOriginal.getStack().getProcessor(i)).duplicate();
				// ---------------- end ----------------

				// ---------------- Second detection ----------------
				ImageCalculator ic = new ImageCalculator();
				// ---------------- end ----------------

				// ---------------- Checking Two Consecutive Frames Brightness ----------------
				boolean jump = CheckBrightnessK(i, PreviousFrameCtrl, imp2, ml, Klayers / 2);
				if (jump)
					continue;
				// ---------------- Checking Two Consecutive Frames Brightness ----------------

				ImagePlus impSub = ic.run("Subtract create", imp2, imp1);
				ImagePlus imp3Dublicate = impSub.duplicate();

				if (imp3Dublicate.getBitDepth() != 8)
				{
					IJ.run(imp3Dublicate, "8-bit", "");
				}
				IJ.run(imp3Dublicate, "Fire", "");
				WriteFirstImages(imp3Dublicate, i, StartFrom);
				IJ.save(imp3Dublicate, ImagesSpotsPath + "Frame-" + i + ".tif");
//				imp3.show(); // <<<<<<<<<<Debugging>>>>>>>>>>
//				showMessage("Check Subtracted image");// <<<<<<<<<<Debugging>>>>>>>>>>
				double TempNFR = noiseFilterRadius; //
				IJ.run(imp3Dublicate, noiseFilterKind + "...", "radius=" + TempNFR); // noiseFilterKind
				ImagePlus imp3Dublicate2 = imp3Dublicate.duplicate();
				if (AInoiseLearner)
				{
					thresholdLimit = GetAutoThreshold(imp3Dublicate, noiseFilterKind, TempNFR, i, LearnBG, true);
				}
				ImagePlus imp3 = imp3Dublicate2.duplicate();

				ImageProcessor ip = imp3.getProcessor();

				adaptiveThresh8(imp3, ip, (int) thresholdLimit, meshAmplitude);
				ClearBoundries(ip, 4);

				ImageStatistics ImStat = imp3.getStatistics();
				double Mu = ImStat.mean;
				if (i < StartFrom + FeedbackFrameNumber && Mu > 0 && AIframeNosieLearner && AutoG)
				{
					thresholdLimit = CorrectAutoThreshold(imp3Dublicate2, Mu, thresholdLimit);
					continue; // jump over first frames.
				}
				if (i == StartFrom + FeedbackFrameNumber - 1)
				{
					LogFile.add("Auto Global sensitivity is [" + NoiseFilterValue + "]");
					System.out.println("New Threshold is " + NoiseFilterValue);
				}
				imp3Dublicate2.changes = false;
				imp3Dublicate2.close();

				IJ.run(imp3, "Median...", "radius=" + noiseFilterRadius);
//				imp3.show(); // <<<<<<<<<<Debugging>>>>>>>>>>
//				showMessage("Check Foreground Image thresh = " + thresholdLimit);// <<<<<<<<<<Debugging>>>>>>>>>>
				ImStat = imp3.getStatistics();
				Mu = ImStat.mean;

				if (Mu > detectionSensitivity)
				{
					if (Cancel)
					{
						break;
					}
					if (CleanBG)
					{
						ml.clearBackground(ip);
					}
					// -------------------- Analyzing Spots --------------------
					RegionLabeling labeling = new RegionLabeling();
					// Activate PixelWaveSpread() method, return mapped data.
					Map<Integer, int[]> TempMap = labeling.LabelRegions(ip, false);
					int LabelCount = labeling.LabelCount; // Get number of spots
					DataProcess _DP = new DataProcess(); // Sorting and pulling Mapped Data
					// Storing signals for the whole stack and map them to the frame name.
					int[][][] SpotsCoordinates = new int[LabelCount][][];
					// Get coordinates of the pixels for each spots.
					SpotsCoordinates = _DP.ProcessData(TempMap, LabelCount);
					// Process coordinates to get spots boundaries.
					double[][] MaskValues = _DP.GetBoundaries(SpotsCoordinates, LabelCount);
					RoiManager MaskROI = new RoiManager(); // Create RoiManager to store selections.
					// Call AnalyzeSpots() method to store selections.
//					_DP.AnalyzeSpots(imp3, MaskValues, MaskROI, LabelCount, Klayers, SelectionEnlarge);
					_DP.AnalyzeSpots(imp3, SpotsCoordinates, MaskROI, LabelCount, SelectionEnlarge, i);
					// StartMeasurement() measure area and mean, save measurements.
					StartMeasurement(ImpOriginal, MaskROI, i, MaskValues, BufferedImage);
					imp3.restoreRoi();
					LogFile.add("Frame [" + (i - 1) + "] -- number of event/s found [" + LabelCount + "]");
					MaskROI.close();
					// --------------------end --------------------
					FoundImageCount++;
				}
				if (eTrackMap.size() > 0)
				{
					LocalMeasurement Lm = new LocalMeasurement();
					Lm.TemporalIntensityVariation(ImpOriginal, i, eTrackMap);
				}

				CloseImages(imp1, imp2, imp3, impSub); // Experimental.
				UpdateProgressBar(i - StartFrame);
			} // Looping through stack, ends here.
			if (!Cancel)
			{
				progressStatusLabel.setText("Collecting Data...");
				LogFile.add("Number of frames in which events were detected [" + FoundImageCount + "]");
				DataProcess DP = new DataProcess();
//				SpotIDMax = eTrackMap.size();
				try
				{
					DP.PrintLogFile(TempOutPath, LogFile);
				} catch (IOException e)
				{
					e.printStackTrace();
				}
				if (FoundImageCount > 0) // if no events found, write nothing.
				{
					GraphData = DP.EventMeanOverTime(ImpOriginal, eTrackMap, ClusteredStackMean, EndFrame, roiMaskPath, MinClusterID,
							OneStackToProcess);
					if (GraphData != null)
					{
//						dataSummary = DP.GetDataSummary(DataFull, SpotIDMax);
						DP.PrintDataCSV(GraphData, eTrackMap, CSVfilesPath, ImpOriginal.getTitle(), true);
					}
				}
				frame.dispose();
				ImpOriginal.changes = false;
				if (!OneStackToProcess)
				{
					ImpOriginal.close();
				}
				StackLoopNum++;
				if (StackLoopNum == NumberOfStacks)
				{
					GUI_hotspotArea.getInstance().dispose();
					showMessage("Analysis is Complete!");
				}
				if (NumberOfStacks > 1 && StackLoopNum < NumberOfStacks)
				{
					Dopamine cl = new Dopamine(StackDirectories, StackLoopNum);
					cl.run(null);
				}
			} else
			{
				frame.dispose();
				ImpOriginal.changes = false;
				ImpOriginal.close();
				GUI_hotspotArea.getInstance().dispose();
				showMessage("Analysis Aborted!");
			}
		};
		try
		{
			Thread ProgramThread = new Thread(null, RunProgram, "Program", 8000000);
			ProgramThread.start();
		} catch (Exception e)
		{

		}
	}
	// ======================= #End Region =======================
	// ======================= =======================

	// ======================= =======================
	// ======================= #Region Methods =======================
	// Measuring the spot area.
	public void StartMeasurement(ImagePlus imp, RoiManager MaskROI, int frame, double[][] MaskValues, ImagePlus[] imBuff)
	{
		int RoiCount = MaskROI.getCount();
		if (RoiCount > 0)
		{
			ResultsTable rtTemp = new ResultsTable();
			rtTemp.reset();
			DataProcess dataProcess = new DataProcess();
			double[] Center = { 0.0, 0.0 };
			imp.setSlice(frame);
			for (int k = 0; k < RoiCount; k++)
			{
				int measurements = Measurements.AREA + Measurements.MEAN + Measurements.MIN_MAX;
				Roi[] selection = MaskROI.getSelectedRoisAsArray();
				imp.setRoi(selection[k]);
//				impSub.setRoi(selection[k]);
				Analyzer analyzer = new Analyzer(imp, measurements, rtTemp);
				analyzer.measure();
				// Double Mean = (double) Math.round(rtTemp.getValue("Mean", k) - BGMean);
				double Mean = rtTemp.getValue("Mean", k);
				double Area = rtTemp.getValue("Area", k);
				double Max = rtTemp.getValue("Max", k);
				Center[0] = MaskValues[k][4] + 0.0;
				Center[1] = MaskValues[k][5] + 0.0;
				if (Area < AreaSize)
				{
					continue;
				}
				int SpotID = dataProcess.getEventIDdop(Center, eTrackMap, selection[k], SearchRadius, frame);

				EventTracking eMap = eTrackMap.get(SpotID);
				double[] MeasurementValues = { Mean, Area, Max };
				eMap.SetMeasurments(MeasurementValues, frame);
				// -------------------- measure previous frame --------------------
				if (eMap.getpMean() == 0)
				{
					ImagePlus pImg = new ImagePlus("Slice_" + Integer.toString(frame - 1), ImpOriginal.getStack().getProcessor(frame - 1))
							.duplicate();
					Roi roi = eMap.getRoi(-1);
					pImg.setRoi(roi);
					ImageStatistics pStat = pImg.getStatistics();
					eMap.setpMean(pStat.mean);
				}
				// -------------------- end--------------------
				// -------------------- measure previous frames --------------------
				if (!eMap.getLockPrintState())
				{
//					boolean flagTrue = CheckPreviousMeasurements(imBuff, selection[k]);
					boolean flagTrue = true;
					eMap.setLockPrint(flagTrue);
					eMap.setFlagPrint(flagTrue);
				}
				// -------------------- end --------------------
				eTrackMap.replace(SpotID, eMap);
//				DataFull.add(dataProcess.GetValuableData(frame, SpotID, Center, Area, Mean, BGMean, Max));
			}
//			MaskROI.runCommand("Save", roiMaskPath + "Frame-" + frame + ".zip");
		}
	}

	// ---------------- Check Brightness ----------------
	// TODO: Simple Ratio
	void SimpleRatio(ImagePlus imp1, ImagePlus imp2)
	{
		ImageProcessor ip1 = imp1.getProcessor();
		ImageProcessor ip2 = imp2.getProcessor();
		ImageStatistics ImStat1 = ip1.getStatistics();
		ImageStatistics ImStat2 = ip2.getStatistics();
		double value = ImStat2.mean / ImStat1.mean;
		IJ.run(imp2, "Multiply...", "value=" + value);
	}

	boolean CheckBrightnessK(int i, int ipre, ImagePlus imp, ML ml, int cluster)
	{
		boolean result = false;
		byte[] PixelsValuesTemp8 = new byte[1];
		short[] PixelsValuesTemp = new short[1];
		ImageProcessor ip1 = imp.getProcessor();
		int bitDepth = ip1.getBitDepth();
		if (bitDepth == 8)
		{
			PixelsValuesTemp8 = (byte[]) ip1.getPixels();
		} else
		{
			PixelsValuesTemp = (short[]) ip1.getPixels();
		}
		for (int k = 0; k < cluster; k++) // i-1 since frame starts from 1 to 3000 ClusteredStackMean[i - 1].length;
		{
			if (ClusteredStackMean[i - 1][k] > ClusteredStackMean[ipre - 1][k] + MeanBrightnessTolerance)
			{
				double BDFmax = ClusteredStackMean[ipre - 1][k] / ClusteredStackMean[i - 1][k]; // TODO: ipre -1 or i-2?
				double BiasValue = (((BDFmax - 1) * (BrightDarkFilter)) + 1);
				if (BiasValue == 0)
				{
					BiasValue = 1;
				}
				if (bitDepth == 8)
				{
					if (ClusteredStackMean[i - 1][k] > ClusteredStackMean[ipre - 1][k] * 1.1)
					{
						ipre = i - 1;
						result = true;
					}
					ml.TuneBrightness(ip1, PixelsValuesTemp8, BiasValue, k);
				} else
				{
					if (ClusteredStackMean[i - 1][k] > ClusteredStackMean[ipre - 1][k] * 1.1)
					{
						ipre = i - 1;
						result = true;
					}
					ml.TuneBrightness(ip1, PixelsValuesTemp, BiasValue, k);
				}
				LogFile.add("Image brightness adjustment at " + "frame[" + (i - 1) + "] mean intensity["
						+ Math.ceil(ClusteredStackMean[i - 1][k]) + "] -- previous farme[" + ipre + "] mean intensity["
						+ Math.ceil(ClusteredStackMean[ipre - 1][k]) + "] -- simple ratio[" + BiasValue + "] -- Layer (" + k + ")");
			}
		}
		return result;
	}

	double CorrectAutoThreshold(ImagePlus imp3Dublicate2, double Mu, double FramethresholdLimit)
	{
		double thresholdLimit = 1;
		while (Mu > 0)
		{
			ImagePlus temp = imp3Dublicate2.duplicate();
			ImageProcessor iptemp = temp.getProcessor();
			NoiseFilterValue += 0.1;
			thresholdLimit = FramethresholdLimit * NoiseFilterValue;
			temp = adaptiveThresh8(temp, iptemp, (int) thresholdLimit, meshAmplitude);
			ImageStatistics tempStat = temp.getStatistics();
			Mu = tempStat.mean;
			temp.close();
		}
		return thresholdLimit;
	}

	void NormalizeToMean(ImagePlus imp)
	{
		ImageStatistics imStat = imp.getStatistics();
		double Mu = imStat.mean;
		IJ.run(imp, "Subtract...", "value=" + Mu);
	}
	// ---------------- End ----------------

	// ---------------- Thresholding Image ----------------
	ImagePlus adaptiveThresh8(ImagePlus imp, ImageProcessor ip, int thresholdLimit, double meshAmplitude)
	{ // TODO: update adaptive threshold
		int sigma = 5;
		byte[] PixelsValues = (byte[]) ip.getPixels();
		ImagePlus meshImg = imp.duplicate();
		if (meshAmplitude > 0)
		{
			IJ.run(meshImg, "Maximum...", "radius=3");
			IJ.run(meshImg, "Multiply...", "value=" + meshAmplitude);
			IJ.run(meshImg, "Gaussian Blur...", "sigma=" + sigma);
		} else
		{
			IJ.run(meshImg, "Multiply...", "value=" + meshAmplitude);
		}
		ImageProcessor meshIP = meshImg.getProcessor();
		byte[] MeshPixelsValues = (byte[]) meshIP.getPixels();
		IntStream.range(0, height).parallel().forEach(j ->
		{
			IntStream.range(0, width).parallel().forEach(k ->
			{
				int value = PixelsValues[k + width * j] & 0xff;
				int Meshvalue = MeshPixelsValues[k + width * j] & 0xff;
				if (value > Meshvalue && value > thresholdLimit)
				{
					ip.putPixel(k, j, 255);
				} else
				{
					ip.putPixel(k, j, 0);
				}
			});
		});
		meshImg.changes = false;
		meshImg.close();
		return imp;
	}

	ByteProcessor convertShortToByte(ImageProcessor ip, boolean doScaling)
	{
		int size = width * height;
		short[] pixels16 = (short[]) ip.getPixels();
		byte[] pixels8 = new byte[size];
		if (doScaling)
		{
			int min = (int) ip.getMin(), max = (int) ip.getMax();
			double scale = 256.0 / (max - min + 1);
			IntStream.range(0, size).parallel().forEach(i ->
			{
				int value = (pixels16[i] & 0xffff) - min;
				if (value < 0)
					value = 0;
				value = (int) (value * scale + 0.5);
				if (value > 255)
					value = 255;
				pixels8[i] = (byte) value;
			});
			return new ByteProcessor(width, height, pixels8, ip.getCurrentColorModel());
		} else
		{
			IntStream.range(0, size).parallel().forEach(i ->
			{
				int value = pixels16[i] & 0xffff;
				if (value > 255)
					value = 255;
				pixels8[i] = (byte) value;
			});
			return new ByteProcessor(width, height, pixels8, ip.getColorModel());
		}
	}

	// ======================= #Methods Buffered Images =======================
	double GetAutoThreshold(ImagePlus imp3Dublicate, String noiseFilterKind, double TempNFR, int i, boolean LearnFromBG, boolean WriteLog)
	{
		ML ml = new ML();
		double FramethresholdLimit = 1;
		double tempThresh = GlobalThrehsold;
		if (LearnFromBG)
		{
			FramethresholdLimit = ml.FramePixelThreshold(imp3Dublicate, noiseFilterKind, TempNFR, MaskCropValues, tempThresh, true, false);
		} else
		{
			FramethresholdLimit = ml.FramePixelThreshold(imp3Dublicate, noiseFilterKind, TempNFR, MaskCropValues, tempThresh, false);
		}
//			thresholdLimit = (GlobalThrehsold + FramethresholdLimit * 2) * NoiseFilterValue / 3;
		FramethresholdLimit = FramethresholdLimit * NoiseFilterValue;
//			IJ.showMessage("Threshold = [" + FramethresholdLimit + "] --> " + thresholdLimit);
		FramethresholdLimit = FramethresholdLimit > 254 ? 254 : FramethresholdLimit;
		if (WriteLog)
		{
			LogFile.add("Frame [" + (i - FrameDifference) + "] -- 2nd auto decision [" + FramethresholdLimit
					+ "] -- final threshold value [" + FramethresholdLimit + "]");
		}
		imp3Dublicate.changes = false;
		imp3Dublicate.close();
		return FramethresholdLimit;
	}
	// ======================= End =======================

	void WriteFirstImages(ImagePlus imp3Dublicate, int i, int StartFrom)
	{
		if (i == StartFrom) // Write skipped images, Action:once.
		{
			for (int ki = 1; ki < StartFrom; ki++)
			{
				IJ.save(imp3Dublicate, ImagesSpotsPath + "Frame-" + ki + ".tif");
			}
		}
	}

	void CloseImages(ImagePlus imp1, ImagePlus imp2, ImagePlus imp3, ImagePlus impSub)
	{
		imp1.changes = false;
		imp2.changes = false;
		imp3.changes = false;
		imp1.close();
		imp2.close();
		imp3.close();
		impSub.changes = false;
		impSub.close();
	}

	// ======================= End =======================
	public void ClearBoundries(ImageProcessor ip, int boundry)
	{
		int value = 0;
		IntStream.range(0, height).parallel().forEach(j ->
		{
			IntStream.range(0, boundry).parallel().forEach(k ->
			{
				ip.putPixel(k, j, value);
			});
			IntStream.range(width - (boundry + 1), width).parallel().forEach(k ->
			{
				ip.putPixel(k, j, value);
			});
		});
		IntStream.range(0, boundry).parallel().forEach(j ->
		{
			IntStream.range(0, width).parallel().forEach(k ->
			{
				ip.putPixel(k, j, value);
			});
		});
		IntStream.range(height - (boundry + 1), height).parallel().forEach(j ->
		{
			IntStream.range(0, width).parallel().forEach(k ->
			{
				ip.putPixel(k, j, value);
			});
		});
	}

	// ---------------- End ----------------
	// ---------------- Creating Directories ----------------
	public String CreateDir(String OutPutDirectory)
	{
		String result;
		if (SaveInSameDir)
		{
			File F = new File(OutPutDirectory); // full name created in main window
			String temp = F.getName();

			File F2 = new File(InputPath);
			String Parent = F2.getParent();

			OutPutDirectory = OneVideo ? InputPath + temp : Parent + File.separator + temp;
		}
		result = OutPutDirectory;
		File OutLocation = new File(OutPutDirectory);
		if (!OutLocation.exists())
		{
			OutLocation.mkdir();
		}
		roiMaskPath = OutPutDirectory + File.separator + "ROIs" + File.separator;
		ImagesSpotsPath = OutPutDirectory + File.separator + "Processed Images" + File.separator;
		SegImagePath = OutPutDirectory + File.separator;
		CSVfilesPath = OutPutDirectory + File.separator + "Measurements" + File.separator;
		File roiMaskDirectory = new File(roiMaskPath);
		File imagesDirectoryFile = new File(ImagesSpotsPath);
		File CSVfilesDirectory = new File(CSVfilesPath);
		if (!roiMaskDirectory.exists())
		{
			roiMaskDirectory.mkdir();
		}
		if (!imagesDirectoryFile.exists())
		{
			imagesDirectoryFile.mkdir();
		}
		if (!CSVfilesDirectory.exists())
		{
			CSVfilesDirectory.mkdir();
		}
		return result;
	}

	// ---------------- End ----------------
	private void AdjustSettings()
	{
		GlobalThrehsold = GlobalThrehsold > 254 ? 254 : GlobalThrehsold;
		GlobalThrehsold = GlobalThrehsold < 0 ? 0 : GlobalThrehsold;
		AutoG = IVEAsetup.NoiseFilterValue == 0 ? true : false;
		NoiseFilterValue = AutoG ? 1 : IVEAsetup.NoiseFilterValue;
		AInoiseLearner = GlobalThrehsold == 0 ? true : false;
	}
	// ---------------- Creating Directories ----------------

	public void showMessage(String message)
	{
		IJ.showMessage(message);
	}

	public void printLine(String[] data)
	{
		for (int i = 0; i < data.length; i++)
		{
			System.out.println(data[i]);

		}
	}

	public void printLine(Double[] data)
	{
		for (int i = 0; i < data.length; i++)
		{
			System.out.println(data[i]);

		}
	}

	public void ShowProgressBarWindow()
	{
		frame.setVisible(true);
		frame.setResizable(false);
		progressStatusLabel = new JLabel();
		progressStatusLabel.setText("Analyzing stack please wait...");
		frame.setBounds(100, 100, 320, 160);
		frame.getContentPane().setLayout(null);
		frame.setTitle("Status Window");

		ClassLoader cl = this.getClass().getClassLoader();
		ImageIcon mainWindowIcon = new ImageIcon(cl.getResource("IVEA_logo_x128.png"));
		frame.setIconImage(mainWindowIcon.getImage());

		progressBar.setStringPainted(true);
		progressBar.setBounds(10, 50, 294, 25);
		frame.getContentPane().add(progressBar);

		JButton CancelButton = new JButton("Cancel");
		CancelButton.setBounds(110, 97, 89, 23);
		frame.getContentPane().add(CancelButton);
		progressStatusLabel.setBounds(10, 30, 251, 14);
		frame.getContentPane().add(progressStatusLabel);
		CancelButton.addMouseListener(new MouseAdapter()
		{
			@Override
			public void mouseClicked(MouseEvent arg0)
			{
				Cancel = true;
				progressStatusLabel.setText("Canceling in progress...");
				ML.cancel = true;
			}
		});
		frame.setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
		frame.addWindowListener(new WindowAdapter()
		{
			public void windowClosing(WindowEvent e)
			{
				Cancel = true;
				progressStatusLabel.setText("Canceling in progress...");
			}
		});
	}

	public void SetPrograssBarMax(int Max)
	{
		progressBar.setMaximum(Max);
	}

	public void UpdateProgressBar(int value)
	{
		progressBar.setValue(value);
	}
	// ======================= #Region Methods =======================
}