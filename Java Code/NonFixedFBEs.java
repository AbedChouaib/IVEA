package com.uniSaarland_CIPMM.ivea;

/*<IVEA is an ImageJ plugIn developed to detect and analyze bright events in videos>
Copyright (C) <2024>  <Abed H. Chouaib>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License v3 as published by
the Free Software Foundation.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License v3 for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/
import java.awt.EventQueue;
import java.awt.Polygon;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.IntStream;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JProgressBar;
import javax.swing.SwingUtilities;

import com.opencsv.CSVWriter;
import com.uniSaarland_CIPMM.ivea.FusionEventMetrics.MeasurementConfig;
import com.uniSaarland_CIPMM.ivea.gui.GUI_nonFixedFBEs;
import com.uniSaarland_CIPMM.ivea.gui.IVEAsetup;

import ij.IJ;
import ij.ImagePlus;
import ij.Macro;
import ij.gui.OvalRoi;
import ij.measure.Measurements;
import ij.measure.ResultsTable;
import ij.plugin.FolderOpener;
import ij.plugin.ImageCalculator;
import ij.plugin.filter.Analyzer;
import ij.plugin.filter.MaximumFinder;
import ij.plugin.frame.RoiManager;
import ij.process.ImageProcessor;
import ij.process.ImageStatistics;
import loci.formats.FormatException;
import loci.plugins.BF;

public class NonFixedFBEs
{
	// ======================= #Region Declaration =======================
	private int width;
	private int height;
	private int nSlices = IVEAsetup.StackLength;
	public String name;
	private String roiMaskPath, CSVfilesPath;
	boolean StopPlugin = false;
	public int StartFrame = IVEAsetup.StartFrame, EndFrame = IVEAsetup.EndFrame;
	private ImagePlus ImpOriginal = new ImagePlus();
	public boolean Cancel = false;
	private int NumberOfStacks = IVEAsetup.NumberOfStacks;
	private ArrayList<String> StackDirectories = new ArrayList<String>();
	private String OutPutDirectory = IVEAsetup.OutPutDirectory;
	private int StackLoopNum = 1;
	private Map<Integer, EventTracking> eTrackMap = new HashMap<Integer, EventTracking>();
	private Map<Integer, EventTracking> FusionMap = new HashMap<Integer, EventTracking>();
	private ArrayList<String> LogFile = new ArrayList<String>();
	private ArrayList<String> SubFolderNameList = IVEAsetup.SubFolderNameList;
	private boolean TheInputIsVideos = IVEAsetup.TheInputIsVideos;
	private boolean ImagePresent = IVEAsetup.ImagePresent;
	public static Map<Integer, Double[]> EventsIDmap; // {ID, frame, Cx, Cy, x1, y1, x2, y2, state, flag}
	private boolean SaveInSameDir = IVEAsetup.SaveInSameDir;
	private String InputPath = IVEAsetup.InputPath;
	private boolean OneVideo = IVEAsetup.OneVideo;
	private int deltaFrame = IVEAsetup.TCVFinterval;
	private int SpreadRadius = IVEAsetup.TCVFspreadRadius;
	double[] CtrlArgs = new double[6];
	boolean OnceCtrlArgs = true;
	int StartStep;
	private int search_radius = IVEAsetup.nonfixedRadius;
	private double sensUser = IVEAsetup.TCVFsens;
	private double sens;
	private int prominence = IVEAsetup.TCVFprom;
	String MeasurementInterval = IVEAsetup.MeasurementInterval;
	JFrame prograssWindow = new JFrame();
	JProgressBar progressBar = new JProgressBar();
	JLabel progressStatusLabel = new JLabel();
	int FrameCounter = 0;
	private int network_radius = IVEAsetup.nFixedNetwork_Radius;
	private double confidence = IVEAsetup.ConfidenceTcell;
	private boolean addDirName = true, SecretionCtrl = IVEAsetup.SecretionCtrl,
			tinyFusion = IVEAsetup.tinyFusion; // xFusion = true; // = IVEAsetup.xFusion
	private String currentTime = "IVEA-" + IVEAsetup.fixedCurrentTime;
	private int countlearnSteps = 0;
	private ImagePlus[] BufImage = null;
	private boolean BlurImage = IVEAsetup.TCVFBlurImage;
	private double GaussianSigma = 1;
	private static final DecimalFormat df = new DecimalFormat("0.00");
	private boolean exportTrainingData = IVEAsetup.ExportTrainingData;
	private boolean adjustForBleach = IVEAsetup.adjustForBleach;
	private int MaxPooling = IVEAsetup.RBE_MaxPooling;
	private boolean maxpool = MaxPooling > 1 ? true : false;
	private ImagePlus MIP_Image = new ImagePlus();
	// ------------------ LSTM ------------------
	private boolean isLSTM = IVEAsetup.IsLSTM_RBE && !IVEAsetup.UseCustomModel;
	private int nFeatures = 13, extendentFrames = 0;
	private boolean extendWindow = false;
	private boolean latentFusion = IVEAsetup.RBE_latentFusion;
	// ------------------ end ------------------
	int chunkSize = IVEAsetup.BlockSize;
	int timeseries = IVEAsetup.timeseries; // 13
	int patchRadius = IVEAsetup.patchRadius;
	int num_fusions = IVEAsetup.num_fusions;
	int add_frames = IVEAsetup.add_frames;
	int nClasses = IVEAsetup.nClasses;

	public NonFixedFBEs(ImagePlus GetImpOriginal)
	{
		ImpOriginal = GetImpOriginal;// ImagePlus stack.
	}

	public NonFixedFBEs(ArrayList<String> GetImpOriginalDir, int GetnumberofStacks)
	{
		StackDirectories = GetImpOriginalDir;// array of image path.
		StackLoopNum = GetnumberofStacks;
	}

	// ======================= #Region Declaration =======================
//	private static final DecimalFormat df = new DecimalFormat("0.00");
	// ======================= #Region Active Loop =======================
	public void run(String arg)
	{
//		IJ.run("Colors...", "foreground=white background=black selection=yellow");
		if (!ImagePresent)
		{
			if (TheInputIsVideos)
			{
				try
				{
					ImpOriginal = BF.openImagePlus(StackDirectories.get(StackLoopNum))[0];
				} catch (FormatException | IOException e)
				{
					e.printStackTrace();
				}
			} else
			{
				ImpOriginal = FolderOpener.open(StackDirectories.get(StackLoopNum), "virtual");
			}
			ImpOriginal.show();
		}

		if (IVEAsetup.MultiImageDetected)
		{
			nSlices = ImpOriginal.getStackSize();
			EndFrame = nSlices;
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

		EventsIDmap = new HashMap<Integer, Double[]>();

		LogFile.add("Vesicle Fusion Report");
		LogFile.add("----------------------------------------------------------------");

		// ---------------- initializing variables ----------------
		width = ImpOriginal.getWidth();
		height = ImpOriginal.getHeight();
		CtrlArgs[2] = 10; // lowest prominence is 10;
		BufImage = new ImagePlus[deltaFrame];
		int search_dim = search_radius * 2;
		int BigImage = 1;
		extendWindow = extendentFrames == 0 ? false : true;
		// ---------------- end ----------------

		try
		{
			RoiManager roiManager = RoiManager.getInstance();
			if (roiManager != null)
			{
				roiManager.close();
			}
		} catch (Exception e)
		{

		}

		if (maxpool)
		{
			MIP_Image = MovingIP.ReduceStackbyBlocks(ImpOriginal, MaxPooling, "max");
			IJ.run(MIP_Image, "Set Scale...", "distance=0 known=0 pixel=1 unit=micron");
			EndFrame = MIP_Image.getStackSize();
		} else
		{
			MIP_Image = ImpOriginal;
		}

		EventQueue.invokeLater(new Runnable()
		{
			public void run()
			{
				try
				{
					ImpOriginal.show();
					ShowProgressBarWindow(prograssWindow);
					SetPrograssBarMax(EndFrame - StartFrame);
					UpdateProgressBar(0);
				} catch (Exception e)
				{
					e.printStackTrace();
				}
			}
		});
		Runnable RunProgram = () ->
		{
			IJ.run(ImpOriginal, "Set Scale...", "distance=0 known=0 pixel=1 unit=micron");
			if (!Cancel)
			{
				int Start = StartFrame <= deltaFrame ? StartFrame + deltaFrame : StartFrame;
				// take more samples for large images
				int sizeTolerance = 512;
				StartStep = width > sizeTolerance && height > sizeTolerance ? Start + 4 : Start + 2;
				int fLearn = (StartStep - Start) + 1;
				int ScanPoints = width > sizeTolerance && height > sizeTolerance ? 16 : 4;
				updateGUI(progressStatusLabel, StackLoopNum, NumberOfStacks, "Processing images please wait");
				for (int i = Start; i < EndFrame; i++)
				{
					if (Cancel)
						break;
					boolean once = i == Start ? true : false;
					ProcessImage(MIP_Image, deltaFrame, i, prominence, ScanPoints, fLearn, search_radius, BigImage, once);
					UpdateProgressBar(i - StartFrame);
				}

				if (eTrackMap.size() > 0) // if no events found, write nothing.
				{
					String ImgName = SubFolderNameList.get(StackLoopNum);
					EventManager eM = new EventManager();

					// ================== AI LSTM Recurrent Neural Network ==================

					boolean centered = false;

					int totalEvents = eTrackMap.size();
					int nBlocks = (int) Math.ceil((totalEvents + 0.0) / chunkSize);
					System.out.println("====> number of selected regions is: " + totalEvents);
					List<Integer> allKeys = new ArrayList<>(eTrackMap.keySet());
					float[][] Vy = new float[totalEvents][nClasses];
					double[][] exFeatruresData = null;
					if (!isLSTM)
					{
						EViTModel eViTmodel = new EViTModel(IVEAsetup.Selected_model_ran_path);
						int startIndex = 0;
						while (startIndex < totalEvents)
						{
							updateGUI(progressStatusLabel, StackLoopNum, NumberOfStacks, "Collecting data");

							int endIndex = Math.min(startIndex + chunkSize, totalEvents);
							Map<Integer, EventTracking> chunkMap = new LinkedHashMap<>();
							for (int i = startIndex; i < endIndex; i++)
							{
								Integer key = allKeys.get(i);
								chunkMap.put(key, eTrackMap.get(key));
							}

							// Collect your 5D data for current chunk
							float[][][][][] TimeSeriesDataChunk = eM.CollectTimeSeriesData5D(
									MIP_Image,
									chunkMap,
									network_radius,
									timeseries,
									patchRadius,
									add_frames,
									centered);

							// Model prediction
							int block_num = (int) Math.ceil((startIndex + 0.0) / chunkSize) + 1;
							String status = "Classifying events, Block(" + block_num + "/" + nBlocks + ")";
							updateGUI(progressStatusLabel, StackLoopNum, NumberOfStacks, status);

							float[][] chunkPredictions = eViTmodel.predict(TimeSeriesDataChunk);

							// Copy chunk predictions back into the global Vy
							for (int i = startIndex; i < endIndex; i++)
							{
								int localIdx = i - startIndex;
								Vy[i] = chunkPredictions[localIdx];
							}

							startIndex += chunkSize;
						}
					} else
					{
						add_frames = 1;
						timeseries = 20;
						network_radius = 6;
						int matrixType = 3;
						int extendFrames = extendWindow ? extendentFrames : 0;
						boolean RangeNorm = true;
						exFeatruresData = eM.StartFeatureExtraction_lstm(MIP_Image, eTrackMap, timeseries - 1, network_radius,
								matrixType, extendFrames, nFeatures, RangeNorm, false);
						if (exFeatruresData.length > 0)
						{
							if (extendWindow)
							{
								LocalMath LM = new LocalMath();
								double[][][] Dataset = LM.reshapeArray(exFeatruresData, 21, 13);
//								EventsPatchData = Dataset[0];
								exFeatruresData = Dataset[1];
							}
						}
					}

					if (isLSTM)
					{
						models model = new models();
						models.PredictionResult results = model.get_LSTM_prediction(1, exFeatruresData,
								nFeatures,
								timeseries + 1, true);
						Vy = results.predictions;
//						LSTM_Classes = results.numClasses;
						num_fusions = 8;
					}
					// ================== end ==================

					RoiManager AllRois = new RoiManager();
					boolean dualID = false;
					if (!Cancel)
					{
						// ---------------- data management ----------------
						String OutPath = "";

						// ---------------- Applying Prediction ----------------
						boolean[] fusionCtrl;
						if (!isLSTM)
						{
							fusionCtrl = new boolean[] { true, SecretionCtrl, latentFusion };
						} else
						{
							fusionCtrl = new boolean[] { true, SecretionCtrl, true, true, false, false, false, latentFusion };
						}
						eM.applyPredictionNonFixed(eTrackMap, Vy, confidence, fusionCtrl, num_fusions, exportTrainingData);

						Double NoiseMean = eM.getNoiseMean();
						FusionHandler FH = new FusionHandler();

						FusionMap = FH.NonMaximumSuppression(eTrackMap, SpreadRadius, deltaFrame, NoiseMean, search_radius, tinyFusion);
//						FusionMap = eTrackMap; // skip Gaussian non-maximum suppression
						boolean isEvent = EventsExist(FusionMap); // check if Fusion Map is valid
						if (exportTrainingData)
						{
							OutPath = CreateDir(OutPutDirectory, StackDirectories.get(StackLoopNum), ImgName, currentTime);
							eM.addROIs_For_Training(MIP_Image, eTrackMap, FusionMap, AllRois, dualID, search_dim, 0);
							AllRois.runCommand("Save", roiMaskPath + File.separator + ImgName + "_training_rois.zip");
							AllRois.reset();
						}
						if (maxpool)
						{
							FH.AdjustTemporalCoordinates(FusionMap, MaxPooling);
						}
						if (isEvent)
						{
							if (!exportTrainingData)
							{
								OutPath = CreateDir(OutPutDirectory, StackDirectories.get(StackLoopNum), ImgName, currentTime);
							}
							eM.addROIs(ImpOriginal, FusionMap, AllRois, dualID, search_dim, 0, false);

							AllRois.runCommand("Save", roiMaskPath + File.separator + ImgName + ".zip");

							try
							{
								runIntervalMeasurements(ImpOriginal, FusionMap, MeasurementInterval, search_radius, CSVfilesPath, ImgName);
							} catch (IOException e)
							{
								// TODO Auto-generated catch block
								e.printStackTrace();
							}

							LogFile.add(
									"Confidence[" + confidence + "], Sensitivity[" + df.format(sens) + "], nEvents[" + FusionMap.size()
											+ "]");
							LogFile.add("Network radius " + network_radius + " Without cloud[" + SecretionCtrl + "], latent vesicle fusion["
									+ latentFusion + "], small/weak event["
									+ tinyFusion + "], Variation Interval["
									+ deltaFrame + "]");
							LogFile.add(ImpOriginal.getTitle() + "delta mean, sigma, prominence = (" + df.format(CtrlArgs[0])
									+ ", " + df.format(CtrlArgs[3]) + ", " + CtrlArgs[2] + ")");
							try
							{
								DataProcess DP = new DataProcess();
								DP.PrintLogFile(OutPath, LogFile);
							} catch (IOException e)
							{
								e.printStackTrace();
							}
						}

						// ---------------- end ----------------
						if (NumberOfStacks > 1)
						{
							AllRois.reset();
							AllRois.close();
						}
					}
				}
//					// ---------------- end data management ----------------
				StackLoopNum++;
				prograssWindow.dispose();
				if (!Cancel)
				{
					ImpOriginal.changes = false;
					if (NumberOfStacks != 1)
					{
						ImpOriginal.close();
						ImpOriginal = null;
					} else
					{
						IJ.run(ImpOriginal, "Fire", "");
					}
					if (StackLoopNum == NumberOfStacks)
					{
						GUI_nonFixedFBEs.getInstance().dispose();
						IJ.showMessage("Analysis is Complete!");
					} else if (NumberOfStacks > 1 && StackLoopNum < NumberOfStacks)
					{
						NonFixedFBEs cl = new NonFixedFBEs(StackDirectories, StackLoopNum);
						cl.run(null);
					}
				}
			} else
			{
				prograssWindow.dispose();
				ImpOriginal.changes = false;
				ImpOriginal.close();
				ImpOriginal = null;
				GUI_nonFixedFBEs.getInstance().dispose();
				IJ.showMessage("Analysis Aborted!");
			}

		};
		try
		{
			Thread ProgramThread = new Thread(null, RunProgram, "Program", 80000);
			ProgramThread.start();
		} catch (Exception e)
		{
			System.out.println("Thread didn't start properly");
		}
	}

	// ======================= #Region Active Loop =======================

	private void ProcessImage(ImagePlus imp, int interval, int frame, int prominence, int ScanPoints,
			int fLearn, int s_radius, int bigImage, boolean once)
	{
		String Pname = "Slice_" + Integer.toString(frame - interval);
		String Cname = "Slice_" + Integer.toString(frame);
		ImagePlus imp1 = null;
		if (BlurImage)
		{
			if (BufImage[0] == null)
			{
				imp1 = new ImagePlus(Pname, imp.getStack().getProcessor(frame - interval)).duplicate();
				IJ.run(imp1, "Gaussian Blur...", "sigma=" + GaussianSigma);
			} else
			{
				imp1 = BufImage[0];
			}
		} else
		{
			imp1 = new ImagePlus(Pname, imp.getStack().getProcessor(frame - interval)).duplicate();
		}
		ImagePlus imp2 = new ImagePlus(Cname, imp.getStack().getProcessor(frame)).duplicate();// .duplicate();
		if (BlurImage)
		{
			IJ.run(imp2, "Gaussian Blur...", "sigma=" + GaussianSigma);
		}

		ImageCalculator ic = new ImageCalculator();
		ImagePlus impforward = ic.run("Subtract create", imp2, imp1); // 32-bit
		ImagePlus impbackward = ic.run("Subtract create", imp1, imp2); // 32-bit
		SearchForEvents(imp2, impforward, impbackward, eTrackMap, frame,
				prominence, s_radius, ScanPoints, fLearn, bigImage); // TODO:
		imp1.changes = false;
		imp1.close();
		if (BlurImage)
		{
			BufImage = storeImages(BufImage, imp2);
		} else
		{
			imp2.changes = false;
			imp2.close();
		}
	}

	private void SearchForEvents(ImagePlus OImg, ImagePlus DImg, ImagePlus ImgInv, Map<Integer, EventTracking> eTracking,
			int frame, int prominence, int R, int ScanPoints, int fLearn, int bigImage)
	{
		// =================== get image stat ===================
		double imMean = 1;
		if (adjustForBleach)
		{
			ImageStatistics imStat = DImg.getStatistics(); // circle.getStatistics();
			imMean = imStat.mean;
			ImageStatistics imStat2 = ImgInv.getStatistics(); // circle.getStatistics();
			double imMean2 = imStat2.mean;
			imMean = Math.max(imMean, imMean2);
		}
		// =================== end ===================
		boolean BackwardSearch = true;
		int dim_length = R * 2;
		ImageProcessor ip = DImg.getProcessor();
		if (frame > StartStep + 1)
		{
			prominence = prominence == 0 ? (int) CtrlArgs[2] / bigImage : prominence;
		}
		MaximumFinder FM = new MaximumFinder();
		Polygon points = FM.getMaxima(ip, prominence, false);
		int numPoints = points.npoints;
		if (frame <= StartStep + 1)
		{
			FrameCounter++;
			double[] tempArgs = new double[6];
			if (numPoints == 0)
			{
				tempArgs = RandomMeasurement(DImg, R, width, height);
			} else
			{
				int ScanPoints2 = frame <= StartStep ? ScanPoints : 2;
				LocalMeasurement lm = new LocalMeasurement();
				tempArgs = lm.ApproximateParameters(DImg, ip, points, R, dim_length, ScanPoints2, imMean, false);// false not synapse
																													// analysis
			}

			if (frame <= StartStep)
			{
				for (int i = 0; i < CtrlArgs.length; i++)
				{
					CtrlArgs[i] += Math.abs(tempArgs[i]);
				}
				countlearnSteps++;
			} else
			{
				double temp = ((tempArgs[4]) / (CtrlArgs[0] / countlearnSteps));
				temp = temp < 1 ? 1 : temp;
				boolean userInput = sensUser <= 0.01;
				sens = userInput ? temp : sensUser;
			}
		} else
		{
			if (OnceCtrlArgs)
			{
				for (int i = 0; i < CtrlArgs.length; i++)
				{
					// CtrlArgs[0] Mu, CtrlArgs[1] SPmean, CtrlArgs[2] prom, CtrlArgs[3] sigma;
					CtrlArgs[i] = CtrlArgs[i] / (countlearnSteps);
				}
				double rad = tinyFusion ? 1 : 2;
				CtrlArgs[3] = CtrlArgs[3] < rad ? rad : CtrlArgs[3];
				CtrlArgs[1] = CtrlArgs[1] * 1.2; // mean weight excluded
				CtrlArgs[0] = CtrlArgs[0] * sens;
				if (!IVEAsetup.RBE_disableLogFile)
				{
					IJ.log(ImpOriginal.getTitle() + " ==> delta mean, sensitivity, sigma, prominence = (" + df.format(CtrlArgs[0])
							+ ", "
							+ df.format(sens) + ", " + df.format(CtrlArgs[3]) + ", " + CtrlArgs[2] + ")");
				}
				OnceCtrlArgs = false;
			}
			double bleachSens = 1;
			if (adjustForBleach)
			{
				bleachSens = imMean / CtrlArgs[5];
			}
			for (int j = 0; j < numPoints; j++)
			{
				int X = points.xpoints[j];
				int Y = points.ypoints[j];
				int[] Center = { X, Y };
				X = X - R;
				Y = Y - R;
				OvalRoi circle = new OvalRoi(X, Y, dim_length, dim_length);
				DImg.setRoi(circle);
				ImageStatistics roiStat = circle.getStatistics(); // circle.getStatistics();
				double Mu = roiStat.mean;
				EstimatePSF ePSF = new EstimatePSF();
				double sigma = ePSF.CalculateFWHM(DImg, Center);
				double sigmaThresh = CtrlArgs[3];
				if (Mu > CtrlArgs[0] * bleachSens && sigma > sigmaThresh) // && stdDev > 1
				{
					double[] MaskValues = { X, Y, R, R, Center[0], Center[1] };
					EventManager eM = new EventManager();
					eM.GetFusionIDv3(MaskValues, eTracking, circle, Mu, R, frame, deltaFrame, sigma, false);
				}
				DImg.resetRoi();
			}
			DImg.changes = false;
			DImg.close();
			// ======================= inverse search =======================
			if (BackwardSearch)
			{
				ImageProcessor ipInv = ImgInv.getProcessor();
				MaximumFinder FMinv = new MaximumFinder();
				Polygon pointsInv = FMinv.getMaxima(ipInv, prominence, false);
				int nPoints = pointsInv.npoints;
				for (int j = 0; j < nPoints; j++)
				{
					int X = pointsInv.xpoints[j];
					int Y = pointsInv.ypoints[j];
					int[] Center = { X, Y };
					X = X - R;
					Y = Y - R;
					OvalRoi circle = new OvalRoi(X, Y, dim_length, dim_length);
					ImgInv.setRoi(circle);
					ImageStatistics roiStat = circle.getStatistics(); // circle.getStatistics();
					double Mu = roiStat.mean;
					EstimatePSF ePSF = new EstimatePSF();
					double sigma = ePSF.CalculateFWHM(ImgInv, Center);
					double sigmaThresh = CtrlArgs[3];
					sigmaThresh = tinyFusion ? 1 : sigmaThresh;
					if (Mu > CtrlArgs[0] * bleachSens && sigma > sigmaThresh) // && sigma > sigmaThresh && stdDev > 1
					{
						double[] MaskValues = { X, Y, R, R, Center[0], Center[1] };
						EventManager eM = new EventManager();
						eM.GetFusionIDv3(MaskValues, eTracking, circle, Mu, R, frame, deltaFrame, sigma, true);
					}
					ImgInv.resetRoi();
				}
				ImgInv.changes = false;
				ImgInv.close();
			}
			// ======================= inverse search =======================
		}
	}

	double[] RandomMeasurement(ImagePlus imp, int R, int width, int height)
	{
		double[] result = { 0, 0, 0 };
		int X = (int) ((width / 2) + R);
		int Y = (int) ((height / 2) + R);
		int VarXY = -R;
		for (int i = 0; i < 3; i++)
		{
			X = X + VarXY;
			Y = Y + VarXY;
			OvalRoi circle = new OvalRoi(X, Y, R * 2, R * 2);
			imp.setRoi(circle);
			ImageStatistics ImStat = imp.getStatistics();
			double Mu = ImStat.mean;
			double stdDev = ImStat.stdDev;
			result[0] = result[0] > Mu ? result[0] : Mu;
			result[1] = result[1] > stdDev ? result[0] : stdDev;
			VarXY = VarXY + 10;
			imp.deleteRoi();
		}
		return result;
	}

	private void runIntervalMeasurements(ImagePlus imp, Map<Integer, EventTracking> eMap, String frameWindow,
			int radius, String FolderPath, String ImgName)
			throws IOException
	{
		int dim = radius * 2;
		String[] split = frameWindow.split("-");
		int FTNlower = split.length == 1 ? Integer.parseInt(split[0]) / 2 : Integer.parseInt(split[0]);
		int FTNupper = split.length == 1 ? FTNlower : Integer.parseInt(split[1]);
		int signalLength = FTNlower + FTNupper;

		MeasurementConfig config = new MeasurementConfig();
		int stackLength = imp.getStackSize();

		List<FusionEventMetrics.EventInput> inputs = new ArrayList<>();
		List<Integer> eventIDs = new ArrayList<>();
		List<double[]> coordinates = new ArrayList<>();
		List<Integer> peakFrames = new ArrayList<>();

		Double[][] graphData = fillDouble(eMap.size(), signalLength);

		for (int i = 0; i < eMap.size(); i++)
		{
			EventTracking eT = eMap.get(i);
			if (eT == null)
			{
				graphData[i] = null;
				continue;
			}

			int peakFrame = eT.getFirstFrame();
			double[] center = eT.getCenter(0);
			int start = Math.max(1, peakFrame - FTNlower);
			int end = Math.min(stackLength, peakFrame + FTNupper);
			OvalRoi roi = new OvalRoi(center[0] - radius, center[1] - radius, dim, dim);
			ResultsTable rtTemp = new ResultsTable();
			int signalIdx = 0;
			double[] signal = new double[signalLength];

			for (int j = start; j < end && signalIdx < signalLength; j++)
			{
				imp.setSlice(j);
				imp.setRoi(roi);
				Analyzer analyzer = new Analyzer(imp, Measurements.MEAN, rtTemp);
				analyzer.measure();
				double mean = rtTemp.getValue("Mean", signalIdx);
				signal[signalIdx] = mean;
				graphData[i][signalIdx] = mean;
				signalIdx++;
			}

			inputs.add(new FusionEventMetrics.EventInput(signal, peakFrame, center[0], center[1], FTNlower - 1, i));
			eventIDs.add(i);
			coordinates.add(center);
			peakFrames.add(peakFrame);
		}

		if (inputs.isEmpty())
		{
			return;
		}
		String fusionMetrics_csv = FolderPath + File.separator + ImgName + "_Fusion Metrics.csv";
		FusionEventMetrics.MeasurementResult[] results = FusionEventMetrics.analyseBatch(imp,
				inputs.toArray(new FusionEventMetrics.EventInput[0]), config, false);

		try (FileWriter fw = new FileWriter(fusionMetrics_csv))
		{
			fw.write("EventID,X,Y,PeakFrame,RiseTime,DecayTau,T-FWHM,SigmaXY\n");
			for (int i = 0; i < results.length; i++)
			{
				FusionEventMetrics.MeasurementResult r = results[i];
				double[] coord = coordinates.get(i);
				int eventID = eventIDs.get(i);
				int frame = peakFrames.get(i);

				StringBuilder sb = new StringBuilder();
				sb.append(eventID).append(",");
				sb.append(coord[0]).append(",");
				sb.append(coord[1]).append(",");
				sb.append(frame).append(",");
				sb.append(String.format("%.4f", r.riseTime != null ? r.riseTime : Double.NaN)).append(",");
				sb.append(String.format("%.4f", r.decayTau != null ? r.decayTau : Double.NaN)).append(",");
				sb.append(String.format("%.4f", r.tfwhm != null ? r.tfwhm : Double.NaN)).append(",");
				sb.append(String.format("%.4f", r.sigmaXY != null ? r.sigmaXY : Double.NaN)).append("\n");

				fw.write(sb.toString());
			}
		}
		WriteGraphData(graphData, FolderPath, ImgName);
	}

	private void WriteGraphData(Double[][] GraphData, String FolderPath, String ImageName)
	{
		String GraphDataPath = FolderPath + File.separator + ImageName + "_Profile Intensity.csv";
		File GraphDataFile = new File(GraphDataPath);
		int length = GraphData.length;
		int nFrames = GraphData[0].length;
		try
		{
			FileWriter outputfile = new FileWriter(GraphDataFile);
			CSVWriter writer = new CSVWriter(outputfile);
			String[] header = new String[length];
			for (int i = 0; i < length; i++)
			{
				header[i] = "Event " + i;
			}
			writer.writeNext(header);
			for (int i = 0; i < nFrames; i++)
			{
				String[] rowData = new String[length];
				for (int j = 0; j < length; j++)
				{
					Double temp = GraphData[j][i];
					rowData[j] = temp == 0.0 ? "" : Double.toString(temp);
				}
				writer.writeNext(rowData);
			}
			writer.close();
		} catch (IOException e)
		{
			e.printStackTrace();
		}
	}

	public void WriteEventsPatchData(float[][] ePatchData, String FolderPath, String ImageName)
	{
		System.out.println("Vy shape(" + ePatchData.length + "," + ePatchData[0].length + ")");
		String GraphDataPath = FolderPath + File.separator + ImageName + "_Events Patch Data.csv";
		File GraphDataFile = new File(GraphDataPath);
		int length = ePatchData.length;
		int nFrames = ePatchData[0].length;
		try
		{
			FileWriter outputfile = new FileWriter(GraphDataFile);
			CSVWriter writer = new CSVWriter(outputfile);
			String[] header = new String[length];
			for (int i = 0; i < length; i++)
			{
				header[i] = "Event " + i;
			}
			writer.writeNext(header);
			for (int i = 0; i < nFrames; i++)
			{
				String[] rowData = new String[length];
				for (int j = 0; j < length; j++)
				{
					Double temp = (double) ePatchData[j][i];
					rowData[j] = temp == 0.0 ? "" : Double.toString(temp);
				}
				writer.writeNext(rowData);
			}
			writer.close();
		} catch (IOException e)
		{
			e.printStackTrace();
		}
	}

	Double[][] fillDouble(int l1, int l2)
	{
		Double[][] result = new Double[l1][l2];
		IntStream.range(0, l1).parallel().forEach(i ->
		{
			IntStream.range(0, l2).parallel().forEach(j ->
			{
				result[i][j] = 0.0;
			});
		});
		return result;
	}

	// ======================= #Region Methods =======================
	// ---------------- End ----------------
	// ---------------- Creating Directories ----------------
	public String CreateDir(String OutPutDirectory, String fullPath, String ImageName, String Ctime)
	{
		String result;
		String parentName = "";
		if (addDirName)
		{
			File F = new File(fullPath); 
			String pName = F.getParent();
			File F2 = new File(pName);
			parentName = F2.getName() + "_";
		}
		OutPutDirectory = OutPutDirectory + "-" + ImageName;
		if (SaveInSameDir)
		{
			File F = new File(OutPutDirectory); 
			String temp = F.getName();

			File F2 = new File(InputPath);
			String Parent = F2.getParent();
			if (Parent != null)
			{
				if (Parent.endsWith("/"))
				{
					Parent.replace("/", "");
				}
			}
			OutPutDirectory = OneVideo ? InputPath + temp : Parent + File.separator + Ctime + " " + parentName + ImageName;
			if (OutPutDirectory.endsWith("/"))
			{
				OutPutDirectory.replace("/", "");
			}
		}
		OutPutDirectory = OutPutDirectory.replace(".tif", "");
		while (OutPutDirectory.endsWith(" "))
		{
			OutPutDirectory = OutPutDirectory.substring(0, OutPutDirectory.length() - 1);
		}
		result = OutPutDirectory + File.separator;
		File OutLocation = new File(OutPutDirectory);
		if (!OutLocation.exists())
		{
			OutLocation.mkdir();
		}
		roiMaskPath = OutPutDirectory + File.separator + "ROIs" + File.separator;
		CSVfilesPath = OutPutDirectory + File.separator + "Measurements" + File.separator;
		File roiMaskDirectory = new File(roiMaskPath);
		File CSVfilesDirectory = new File(CSVfilesPath);
		if (!roiMaskDirectory.exists())
		{
			roiMaskDirectory.mkdir();
		}
		if (!CSVfilesDirectory.exists())
		{
			CSVfilesDirectory.mkdir();
		}
		return result;
	}

	// ---------------- Creating Directories ----------------
	// ======================= #Region Progress Bar Window =======================
	// JLabel progressStatusLabel, int loopNum, int totalNum
	public void updateGUI(JLabel progressStatusLabel, int loopNum, int totalNum, String mesg)
	{
		if (!SwingUtilities.isEventDispatchThread())
		{
			SwingUtilities.invokeLater(new Runnable()
			{
				@Override
				public void run()
				{
					progressStatusLabel.setText(mesg + "... (" + (loopNum + 1) + "/" + totalNum + ")");
				}
			});
			return;
		}
	}

	private void ShowProgressBarWindow(JFrame pWindow)
	{
		pWindow.setVisible(true);
		pWindow.setResizable(false);
		progressStatusLabel.setText("Analyzing data please wait...");
		pWindow.setBounds(100, 100, 320, 160);
		pWindow.getContentPane().setLayout(null);
		pWindow.setTitle("Progress Window");

		ClassLoader cl = this.getClass().getClassLoader();
		ImageIcon mainWindowIcon = new ImageIcon(cl.getResource("IVEA_logo_x128.png"));
		pWindow.setIconImage(mainWindowIcon.getImage());

		progressBar.setStringPainted(true);
		progressBar.setBounds(10, 50, 294, 25);
		pWindow.getContentPane().add(progressBar);

		JButton CancelButton = new JButton("Cancel");
		CancelButton.setBounds(110, 97, 89, 23);
		pWindow.getContentPane().add(CancelButton);
		progressStatusLabel.setBounds(10, 30, 251, 14);
		pWindow.getContentPane().add(progressStatusLabel);
		CancelButton.addMouseListener(new MouseAdapter()
		{
			@Override
			public void mouseClicked(MouseEvent arg0)
			{
				progressStatusLabel.setText("Canceling in progress...");
				Cancel = true;
				pWindow.dispose();
				throw new RuntimeException(Macro.MACRO_CANCELED);
			}
		});
		pWindow.setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
		pWindow.addWindowListener(new WindowAdapter()
		{
			public void windowClosing(WindowEvent e)
			{
				progressStatusLabel.setText("Canceling in progress...");
				Cancel = true;
				pWindow.dispose();
				throw new RuntimeException(Macro.MACRO_CANCELED);
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

	ImagePlus[] storeImages(ImagePlus[] bufImage, ImagePlus newImage)
	{
		ImagePlus[] Imgx = new ImagePlus[bufImage.length];
		int ndx = bufImage.length - 1;
		IntStream.range(0, ndx).parallel().forEach(i ->
		{
			Imgx[i] = bufImage[i + 1];
		});
		Imgx[ndx] = newImage;
		return Imgx;
	}

	public static boolean EventsExist(Map<Integer, EventTracking> eTrackMap)
	{
		boolean events = false;
		for (int i = 0; i < eTrackMap.size(); i++)
		{
			EventTracking eMap = eTrackMap.get(i);
			if (eMap == null || !eMap.getFlagPrint())
			{
				continue;
			}
			events = true;
		}
		return events;
	}

	public void printMatrix(float[][] Vy)
	{
		int rows = Vy.length;
		int cols = Vy[0].length; 

		for (int i = 0; i < rows; i++)
		{
			for (int j = 0; j < cols; j++)
			{
				System.out.printf("%.2f ", Vy[i][j]); 
			}
			System.out.println(); 
		}
	}

	void printArrayRange(float[][] Vy, int a, int b)
	{
		if (Vy == null || Vy.length == 0)
		{
			System.out.println("The array is empty or null.");
			return;
		}
		if (a < 0 || b >= Vy.length || a > b)
		{
			System.out.println("Invalid range. Check the array");
			return;
		}

		// Print the rows from a to b
		for (int i = a; i <= b; i++)
		{
			System.out.print("Row " + i + ": ");
			for (float value : Vy[i])
			{
				System.out.print(value + " ");
			}
			System.out.println();
		}
	}
	// ======================= #Region Progress Bar Window =======================
	// ======================= #Region Methods =======================
}
