package com.uniSaarland_CIPMM.ivea;

/*<IVEA is an ImageJ plugIn developed to detect and analyze bright events in videos>
Copyright (C) <2024>  <Abed A. H. Chouaib>

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
import com.uniSaarland_CIPMM.ivea.gui.GUI_fixedFBEs;
import com.uniSaarland_CIPMM.ivea.gui.IVEAsetup;

import ij.IJ;
import ij.ImagePlus;
import ij.Macro;
import ij.gui.OvalRoi;
import ij.plugin.FolderOpener;
import ij.plugin.ImageCalculator;
import ij.plugin.filter.MaximumFinder;
import ij.plugin.frame.RoiManager;
import ij.process.ImageProcessor;
import ij.process.ImageStatistics;
import loci.formats.FormatException;
import loci.plugins.BF;

public class FixedFBEs
{
	// ======================= #Region Declaration =======================
	private int width;
	private int height;
	private int nSlices = IVEAsetup.StackLength;
	private int Klayers = IVEAsetup.Klayers;
	public double value;
	public String name;
	private int PreviousFrameCtrl;
	double BrightDarkFilter = IVEAsetup.BrightnessAdjust;
	public static double[][] ClusteredStackMean;
	private String roiMaskPath, CSVfilesPath, SegImagePath;
	boolean StopPlugin = false, IgnoreLoneSpots;
	public int StartFrame = IVEAsetup.StartFrame, EndFrame = IVEAsetup.EndFrame;
	private ImagePlus ImpOriginal = new ImagePlus();
	public boolean Cancel = false;
	private int NumberOfStacks = IVEAsetup.NumberOfStacks;
	private ArrayList<String> StackDirectories = new ArrayList<String>();
	private String OutPutDirectory = IVEAsetup.OutPutDirectory;
	private ArrayList<String> LogFile = new ArrayList<String>();
	private ArrayList<String> SubFolderNameList = IVEAsetup.SubFolderNameList;
	private int StackLoopNum = 1;
	private boolean TheInputIsVideos = IVEAsetup.TheInputIsVideos;
	private boolean ImagePresent = IVEAsetup.ImagePresent;
	private boolean SaveInSameDir = IVEAsetup.SaveInSameDir;
	private String InputPath = IVEAsetup.InputPath;
	private boolean OneVideo = IVEAsetup.OneVideo;

	private int nFeatures = 13, timeSeries = 41, matrixType = 3;
	private Map<Integer, EventTracking> eTrackMap = new HashMap<Integer, EventTracking>();
	private double[] CtrlArgs = new double[6];

	private int prominence = IVEAsetup.SynapseProminence;
	private int deltaFrame = IVEAsetup.SynapseVarInt;
	private int deltaFrameSearch = IVEAsetup.SynapseVarInt * 2;
	private int radius = IVEAsetup.SynapseSearchRadius;
	private double sensUser = IVEAsetup.SynapseSens;
	private double sens;
	private int[] FramesToMeasure = IVEAsetup.FrameWinBoundaries;
	private double SumDeltaMean = 0, AvgDeltaMu = 0, DeltaMeanMax = 0;
	private int FrameCounter = 1, StimulationCounter = 1;
	private double variableSensitivity;
	private boolean FlagStimulation = false, StimulationLock = false;
	private boolean BlurImage = IVEAsetup.TCVFBlurImage;
	private ImagePlus[] BufImage = null;
	private double GaussianSigma = 0.5;

	private ImagePlus BuffDeltaImage = new ImagePlus();
	private double DeltaMuFixed = 0;
	private int StimPeriodControl = 0;
	private boolean StimDetection = IVEAsetup.NeuronStimDetection;
	private int[][] StimBoundries = IVEAsetup.NeuronStim1;
	private int[][] StimBoundries0 = new int[1][2];
	private ArrayList<int[]> StimIntervals = new ArrayList<int[]>();
	private ArrayList<int[]> StimIntervalsFixed = new ArrayList<int[]>();
	private int StartStep;
	boolean OneStackToProcess;
	private double risePercent = 1.01;
	private int MinClusterID;
	private int[] NormRange = IVEAsetup.NormalizeRange;

	JFrame pWindow = new JFrame();
	JProgressBar progressBar = new JProgressBar();
	JLabel progressStatusLabel = new JLabel();
	private static final DecimalFormat df = new DecimalFormat("0.00");
	private boolean OnceCtrlArgs = true;
	private boolean WriteEventPeriod = IVEAsetup.FusionFrameWindow, WriteSummary = IVEAsetup.WriteSummary;
	private boolean NormalizeData = IVEAsetup.NormalizeOutput, subtractBG = IVEAsetup.SubtractBG;
	private boolean takePulse = true, takeOutFocus = false, takeChemical = true;
	private double confidence = IVEAsetup.PredictionAccuracyNeuron;
	private int countlearnSteps = 0;
	private boolean takeRise = true;
	private boolean TinyEvents = true;
	private boolean exportTrainingData = true;
	private boolean autoSimSens = true;
	private boolean extendWindow = false;
	private int extendentFrames = IVEAsetup.extendWindow;

	private boolean isLSTM = IVEAsetup.IsLSTM_SBE;
	private int MaxPooling = IVEAsetup.SBE_MaxPooling;
	private boolean maxpool = MaxPooling > 1 ? true : false;
	private ImagePlus MIP_Image = new ImagePlus();
	// ------------------ end ------------------
	int chunkSize = IVEAsetup.BlockSize;
	int timeseries = IVEAsetup.timeseries; // 13
	int patchRadius = IVEAsetup.patchRadius;
	int num_fusions = IVEAsetup.num_fusions;
	int add_frames = IVEAsetup.add_frames;
	int nClasses = IVEAsetup.nClasses;

	public FixedFBEs(ImagePlus GetImpOriginal)
	{
		ImpOriginal = GetImpOriginal;// ImagePlus stack.
		OneStackToProcess = true;
	}

	public FixedFBEs(ArrayList<String> GetImpOriginalDir, int GetnumberofStacks)
	{
		StackDirectories = GetImpOriginalDir;// array of image path.
		StackLoopNum = GetnumberofStacks;
		OneStackToProcess = StackDirectories.size() > 1 ? false : true;
	}

	// ======================= #Region Declaration =======================

	// ======================= #Region Active Loop =======================
	public void run(String arg)
	{
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
		// ================= Create Mask Selection if 0 =================
		// Avoid loading and reading videos when importing! from MainWindow class.
		extendWindow = extendentFrames == 0 ? false : true;
		// ================= End =================
		if (IVEAsetup.MultiImageDetected)
		{
			nSlices = ImpOriginal.getStackSize();
			EndFrame = EndFrame > (nSlices - 3) ? (nSlices) : EndFrame;
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
		// ---------------- initializing buffered images ----------------
		width = ImpOriginal.getWidth();
		height = ImpOriginal.getHeight();
		StimIntervals = getStimIntervals(StimBoundries0);
		StimIntervalsFixed = getStimIntervals(StimBoundries);
		BufImage = new ImagePlus[deltaFrame];
		if (NormalizeData)
		{
			validateNormInterval(NormRange, nSlices);
		}
		RoiManager roiManager = RoiManager.getInstance();
		if (roiManager != null)
		{
			roiManager.close();
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
					ShowProgressBarWindow();
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
			int[] stimTemp = { 0, 0 };
			StimBoundries0[0] = stimTemp;
			IJ.run(ImpOriginal, "Set Scale...", "distance=0 known=0 pixel=1 unit=micron");
			int Start = StartFrame + deltaFrame;
			StartStep = Start + 3; // learn from first three frames.
			CtrlArgs[2] = 10; // lowest prominence is 10;
			updateGUI(progressStatusLabel, StackLoopNum, NumberOfStacks);
			for (int i = Start; i <= EndFrame; i++)
			{
				PreviousFrameCtrl = i - deltaFrame;
				if (Cancel)
				{
					break;
				}
				String Pname = "Slice_" + Integer.toString(PreviousFrameCtrl);
				String Cname = "Slice_" + Integer.toString(i);
				ImagePlus imp1 = null;
				ImageProcessor OIP = MIP_Image.getStack().getProcessor(i);
				if (BlurImage)
				{
					if (BufImage[0] == null)
					{
						imp1 = new ImagePlus(Pname, MIP_Image.getStack().getProcessor(PreviousFrameCtrl)).duplicate();
						IJ.run(imp1, "Gaussian Blur...", "sigma=" + GaussianSigma);
					} else
					{
						imp1 = BufImage[0];
					}
				} else
				{
					imp1 = new ImagePlus(Pname, MIP_Image.getStack().getProcessor(PreviousFrameCtrl)).duplicate();
				}

				ImagePlus imp2 = new ImagePlus(Cname, OIP).duplicate();
				if (BlurImage)
				{
					IJ.run(imp2, "Gaussian Blur...", "sigma=" + GaussianSigma);
				}
				ImageCalculator ic = new ImageCalculator();
				ImagePlus impSub = ic.run("Subtract create", imp2, imp1);

				// ----------------- calculating delta mean variation -----------------
				if (StimDetection)
				{
					if (FlagStimulation)
					{
						ImagePlus FixedDeltaImage = ic.run("Subtract create", imp2, BuffDeltaImage);
						DeltaMuFixed = getFixedDeltaMean(FixedDeltaImage);
						MonitorDeltaMean(DeltaMuFixed, i);
					} else
					{
						BuffDeltaImage = imp1.duplicate();
						ImageStatistics frameStat = impSub.getStatistics();
						MonitorDeltaMean(frameStat.mean, i);
					}
				}
				// ----------------- end -----------------

				// ----------------- start searching -----------------
				int temp_rad = radius < 5 ? 5 : radius;
				SearchForEvents(impSub, null, eTrackMap, i, prominence, temp_rad);
				// ----------------- end -----------------

				UpdateProgressBar(i - StartFrame);
				impSub.changes = false;
				impSub.close();
			} // Looping through stack ends here.
			if (!Cancel && eTrackMap.size() > 0)
			{
				String ImgName = SubFolderNameList.get(StackLoopNum);
				ImgName = ImgName.substring(0, Math.min(ImgName.length(), 50));
				progressStatusLabel.setText("Collecting Data...");
				// ================== #LSTM data collection ==================
				int moreFrames = (timeSeries + add_frames - 1) / 2;
				int extendFrames = extendWindow ? moreFrames + extendentFrames : moreFrames;
				EventManager eM = new EventManager();
				DataProcess DP = new DataProcess();
				boolean RangeNorm = true;
				double[][] EventsPatchData = null;
				double[][] EventsPatchDataEx = null;
				int totalEvents = eTrackMap.size();
				int nBlocks = (int) Math.ceil((totalEvents + 0.0) / chunkSize);
				// ================== #Region Prediction ==================
				System.out.println("====> number of selected regions is: " + totalEvents);
				List<Integer> allKeys = new ArrayList<>(eTrackMap.keySet());
				float[][] Vy = new float[totalEvents][nClasses];
				float[][] Vy_ex = null;

				if (!isLSTM)
				{
					EViTModel eViTmodel = new EViTModel(IVEAsetup.Model_Synapse_Path);
					int startIndex = 0;

					while (startIndex < totalEvents)
					{
						updateGUI(progressStatusLabel, StackLoopNum, NumberOfStacks, "Collecting data");

						int endIndex = Math.min(startIndex + chunkSize, totalEvents);

						// Create sub-map of the chunk from startIndex to endIndex
						Map<Integer, EventTracking> chunkMap = new LinkedHashMap<>();
						for (int i = startIndex; i < endIndex; i++)
						{
							Integer key = allKeys.get(i);
							chunkMap.put(key, eTrackMap.get(key));
						}

						// Collect 5D time-series data just for the chunk
						int network_radius = 8;
						boolean centered = false;

						float[][][][][] TimeSeriesDataChunk = eM.CollectTimeSeriesData5D(
								MIP_Image,
								chunkMap,
								network_radius,
								timeseries,
								patchRadius,
								add_frames,
								centered);

						// Predict with the loaded model (reuse session)
						int block_num = (int) Math.ceil((startIndex + 0.0) / chunkSize) + 1;
						String status = "Classifying events, Block(" + block_num + "/" + nBlocks + ")";
						updateGUI(progressStatusLabel, StackLoopNum, NumberOfStacks, status);

						float[][] chunkPredictions = eViTmodel.predict(TimeSeriesDataChunk);

						// Copy predictions into global Vy
						for (int i = startIndex; i < endIndex; i++)
						{
							int localIdx = i - startIndex;
							Vy[i] = chunkPredictions[localIdx];
						}

						startIndex += chunkSize;
					}
				} else
				{
					models model = new models();
					// ================== AI LSTM Recurrent Neural Network ==================
					int matrixRadius = 6;
					EventsPatchData = eM.StartFeatureExtraction_lstm(MIP_Image, eTrackMap, moreFrames - 1, matrixRadius,
							matrixType, extendFrames, nFeatures, RangeNorm, true); // 9,20,9 RangeNorm = true;
					// (ImpOriginal, eTrackMap, 19, 6, nSlices, 3, 20, 13)]
					if (EventsPatchData.length > 0)
					{
						if (extendWindow)
						{
							LocalMath LM = new LocalMath();
							double[][][] Dataset = LM.reshapeArray(EventsPatchData, 41, 13);
							EventsPatchData = Dataset[0];
							EventsPatchDataEx = Dataset[1];
						}
						if (exportTrainingData)
						{
							WriteEventsPatchData(EventsPatchData, CSVfilesPath, ImgName + "0.LSTM ALL Nominated");
						}
					}
					models.PredictionResult results = model.get_LSTM_prediction(
							0,
							EventsPatchData,
							nFeatures,
							41, false);

					Vy = results.predictions;
					nClasses = results.numClasses;

					if (extendWindow)
					{
						models.PredictionResult results2 = model.get_LSTM_prediction(
								0,
								EventsPatchDataEx,
								nFeatures,
								41, false);
						Vy_ex = results2.predictions;
					}
				}
				// ================== end ==================

				RoiManager AllRois = new RoiManager();
				int RoiSize = radius * 2 < 10 ? 10 : radius * 2;
				int FrameToSegment = updateStimulationInterval(StimIntervalsFixed, StimIntervals) - 30;
				FrameToSegment = FrameToSegment >= nSlices ? nSlices - 1 : FrameToSegment;
				FrameToSegment = FrameToSegment <= 0 ? 1 : FrameToSegment; // safety
				ML ml = new ML();
				ClusteredStackMean = ml.GetClusteredStackMean(ImpOriginal, nSlices, Klayers, SegImagePath, FrameToSegment);
				MinClusterID = ml.GetMinClusterID();
				ml.GetMinClusterID();
				// <<<<<<<<<<<<<<<<< write detected data >>>>>>>>>>>>>>>>>
				eM.addROIs(ImpOriginal, eTrackMap, AllRois, true, RoiSize, MinClusterID, true);
				if (AllRois.getCount() > 0)
				{
					AllRois.runCommand("Save", roiMaskPath + File.separator + ImgName + " All_ROIs_Nominated_ForPaper.zip");
				}
				AllRois.reset();
				// <<<<<<<<<<<<<<<<< write detected data >>>>>>>>>>>>>>>>>

				// <<<<<<<<<<<<<<<<< data training management >>>>>>>>>>>>>>>>>
				boolean[] fusionCtrl;
				if (!isLSTM)
				{
					fusionCtrl = new boolean[] { true, true, true };
				} else
				{
					fusionCtrl = new boolean[] { true, takePulse, takeChemical, takeOutFocus, takeRise };
				}
				if (!isLSTM)
				{
					eM.applyPredictionNonFixed(eTrackMap, Vy, confidence, fusionCtrl, num_fusions, exportTrainingData);
				} else
				{
					if (extendWindow)
					{
						eM.applyPredictionNeuronsV2(eTrackMap, Vy, Vy_ex, EventsPatchData,
								EventsPatchDataEx, fusionCtrl, nClasses, confidence);
					} else
					{
						eM.applyPredictionNonFixed(eTrackMap, Vy, confidence, fusionCtrl, num_fusions, exportTrainingData);
					}
				}
				// <<<<<<<<<<<<<<<<< applying prediction >>>>>>>>>>>>>>>>>
				boolean takeAll = true;
				int[] frameSkip = { FrameToSegment, nSlices };
				Map<Integer, EventTracking> FusionMap = eM.RearrangMap(eTrackMap, StimIntervalsFixed,
						frameSkip, ML.SegmentedMatrix, takeAll);

				if (AllRois.getCount() > 0)
				{
					AllRois.runCommand("Save", roiMaskPath + File.separator + ImgName + "eTrack predicted.zip");
				}
				// <<<<<<<<<<<<<<<<< end >>>>>>>>>>>>>>>>>
				// =============== Applying Prediction ===============
				boolean isEvent = NonFixedFBEs.EventsExist(FusionMap); // flag eliminated events
				if (isEvent) // && Vp.size() > 0
				{
					if (maxpool)
					{
						FusionHandler FH = new FusionHandler();
						FH.AdjustTemporalCoordinates(FusionMap, MaxPooling);
					}
					// ---------------- Data Management ----------------
					int[] EventCategoryCount = DP.checkDualID(FusionMap, (int) (RoiSize));
					double[][] AllData = new double[FusionMap.size()][nSlices];
					double[][] GraphData_1 = new double[EventCategoryCount[0]][nSlices];
					double[][] GraphData_1_0 = new double[EventCategoryCount[1]][nSlices];
					DataManagement DM = new DataManagement();
					DM.DoMeasurement(ImpOriginal, FusionMap, AllData, GraphData_1, GraphData_1_0, FramesToMeasure, radius);
					// ---------------- end ----------------
					// ---------------- Writing Data ----------------
					if (GraphData_1.length > 0)
					{
						WriteEventsPatchDataBG(GraphData_1, CSVfilesPath, ImgName + " Intensity Over Time", FusionMap, 1);
					}
					if (GraphData_1_0.length > 0)
					{
						WriteEventsPatchDataBG(GraphData_1_0, CSVfilesPath, ImgName + " Non Synchronize Fusion", FusionMap, 0);
					}
					if (WriteSummary)
					{
						double[][] FullDataTable = DM.getFullData(FusionMap, 7, GraphData_1);
						WriteEventsPatchData(FullDataTable, CSVfilesPath, ImgName + " Full Summary", getSumHeader());
					}
					if (WriteEventPeriod)
					{
						double[][] AllDataOut = DM.DoMeasurementInterval(AllData, FusionMap);
						WriteEventsPatchData(AllDataOut, CSVfilesPath, ImgName + " Interval (All Events)", FusionMap, 1);
					}
					if (NormalizeData)
					{
						double[][] NormData = DM.getNormData(GraphData_1, NormRange, ClusteredStackMean, MinClusterID, subtractBG);
						WriteEventsPatchData(NormData, CSVfilesPath, ImgName + " normalized data", FusionMap, 0);
					}
					// ---------------- end ----------------
					AllRois.reset();
					eM.addROIs(ImpOriginal, FusionMap, AllRois, true, RoiSize, MinClusterID, true);
					if (AllRois.getCount() > 0)
					{
						AllRois.runCommand("Save", roiMaskPath + File.separator + ImgName + " All_ROIs_PREDICTED.zip");
					}

					// <<<<<<<<<<<<<<<<< data ROIs First >>>>>>>>>>>>>>>>>
					if (StimDetection)
					{
						for (int k = 1; k <= StimulationCounter; k++)
						{
							AllRois.reset();
							eM.addROIsType(ImpOriginal, FusionMap, AllRois, RoiSize, k, MinClusterID);
							if (AllRois.getCount() > 0)
							{
								AllRois.runCommand("Save",
										roiMaskPath + File.separator + k + "." + ImgName + " ROIs_Stim " + k + ".zip");
							}
						}
					}
					// <<<<<<<<<<<<<<<<< end >>>>>>>>>>>>>>>>>
					AllRois.reset();
					eM.addROIsType(ImpOriginal, eTrackMap, AllRois, RoiSize, 0, MinClusterID);
					if (AllRois.getCount() > 0)
					{
						AllRois.runCommand("Save", roiMaskPath + File.separator + "0." + ImgName + " ROIs_NonSync Fusion.zip");
					}
					// <<<<<<<<<<<<<<<<< experimental >>>>>>>>>>>>>>>>>
					if (exportTrainingData)
					{
						eM.addROIs_For_Training(ImpOriginal, eTrackMap, FusionMap, AllRois, true, RoiSize, 0);
						AllRois.runCommand("Save", roiMaskPath + File.separator + ImgName + "_training_rois.zip");
						AllRois.reset();
					}
					// <<<<<<<<<<<<<<<<< end >>>>>>>>>>>>>>>>>

					AllRois.reset();
					eM.addROIs(ImpOriginal, FusionMap, AllRois, true, RoiSize, MinClusterID, true);

					prepareLogFile(LogFile, FusionMap.size(), StimIntervalsFixed);
					LogFile.add(
							"Confidence[" + confidence + "], Sensetivity[" + df.format(sens) + "], nEvents[" + FusionMap.size() + "]");
					LogFile.add("Stimulation count[" + StimulationCounter + "], Prominence[" + CtrlArgs[2] + "], Varaition Interval["
							+ deltaFrame + "]");
					try
					{
						DP.PrintLogFile(TempOutPath, LogFile);
					} catch (IOException e)
					{
						e.printStackTrace();
					}
				}
				// =============== end ===============
				if (NumberOfStacks > 1)
				{
					AllRois.reset();
					AllRois.close();
				}

				ImpOriginal.changes = false;
				if (NumberOfStacks > 1)
				{
					AllRois.close();
					ImpOriginal.close();
					ImpOriginal = null;
				} else
				{
					IJ.run(ImpOriginal, "Green Fire Blue", "");
				}
				pWindow.dispose();

				StackLoopNum++;
				if (NumberOfStacks > 1 && StackLoopNum < NumberOfStacks)
				{
					FixedFBEs cl = new FixedFBEs(StackDirectories, StackLoopNum);
					cl.run(null);
				}
				if (StackLoopNum == NumberOfStacks)
				{
					GUI_fixedFBEs.getInstance().dispose();
					IJ.showMessage("Analysis is Complete!");
				}
			} else
			{
				pWindow.dispose();
				ImpOriginal.changes = false;
				ImpOriginal.close();
				ImpOriginal = null;
				GUI_fixedFBEs.getInstance().dispose();
				IJ.showMessage("Analysis Aborted!");
			}
		};
		try

		{
			Thread ProgramThread = new Thread(null, RunProgram, "Program", 80000);
			ProgramThread.start();
		} catch (Exception e)
		{

		}
	}
	// ======================= #Region Active Loop =======================

	// ======================= #Region Methods =======================

	private void prepareLogFile(ArrayList<String> logFile2, int size, ArrayList<int[]> StimIntervalFixed)
	{
		logFile2.add("Total events found [" + size + "]");
		for (int i = 0; i < StimIntervalFixed.size(); i++)
		{
			int ki = i + 1;
			logFile2.add("Stimulation " + ki + " a,b(" + StimIntervalFixed.get(i)[0] + "," + StimIntervalFixed.get(i)[1] + ")");
		}
	}

	// ---------------- Thresholding Image ----------------
	private void SearchForEvents(ImagePlus DImg, ImagePlus ImgInv, Map<Integer, EventTracking> eMap, int frame, int prominence, int R)
	{
		ImageProcessor ip = DImg.getProcessor();
		if (frame > StartStep + 2)
		{
			prominence = prominence == 0 ? (int) CtrlArgs[2] : prominence;
		}
		// =================== get image stat ===================
		double imMu = 1;
		// =================== end ===================
		MaximumFinder FM = new MaximumFinder();
		Polygon points = FM.getMaxima(ip, prominence, false);
		int numPoints = points.npoints;
		if (frame <= StartStep + 1)
		{
			double[] tempArgs = new double[6];
			if (numPoints == 0)
			{
				tempArgs = RandomMeasurement(DImg, R, width, height);
			} else
			{
				LocalMeasurement lm = new LocalMeasurement(); // note R is the diameter in this case
				tempArgs = lm.ApproximateParameters(DImg, ip, points, R / 2, R, 8, imMu, false);// false not non-fixed analysis
			}
			if (frame <= StartStep)
			{
				for (int i = 0; i < CtrlArgs.length; i++)
				{
					CtrlArgs[i] = CtrlArgs[i] + Math.abs(tempArgs[i]);
				}
				countlearnSteps++;
			} else
			{
				boolean userInput = sensUser <= 0.01;
				double temp = (tempArgs[4] / (CtrlArgs[0] / countlearnSteps));
				sens = userInput ? temp : sensUser;
				double sLimit = TinyEvents ? 0.2 : 1;
				sens = sens < sLimit ? sLimit : sens;
			}
		} else
		{
			if (OnceCtrlArgs)
			{
				for (int i = 0; i < CtrlArgs.length; i++)
				{
					CtrlArgs[i] = CtrlArgs[i] / (countlearnSteps);
				}
				if (!IVEAsetup.SBE_disableLogFile)
				{
					IJ.log(ImpOriginal.getTitle() + " ==> delta mean, sensitivity, sigma, prominence = (" + df.format(CtrlArgs[0])
							+ ", "
							+ df.format(sens) + ", " + df.format(CtrlArgs[3]) + ", " + CtrlArgs[2] + ")");
				}
				OnceCtrlArgs = false;
			}
			for (int j = 0; j < numPoints; j++)
			{
				int X = points.xpoints[j];
				int Y = points.ypoints[j];
				int[] Center = { X, Y };
				X = X - R / 2;
				Y = Y - R / 2;
				OvalRoi circle = new OvalRoi(X, Y, R, R);
				DImg.setRoi(circle);
				ImageStatistics ImStat = circle.getStatistics();
				double Mu = ImStat.mean;
				double Cx = ImStat.xCenterOfMass;
				double Cy = ImStat.yCenterOfMass;

				if (frame <= StartStep)
				{
					break;
				} else
				{
					EstimatePSF ePSF = new EstimatePSF();
					double segma = ePSF.CalculateFWHM(DImg, Center);
					double sCtrl = TinyEvents ? 0.8 : 1.5;
					variableSensitivity = autoSimSens ? variableSensitivity : 1;
					if (Mu > CtrlArgs[0] * sens * variableSensitivity && segma >= sCtrl)
					{
						double[] Cmass = { Cx, Cy };
						DataProcess dp = new DataProcess();
						dp.getEventIDNeurons(Cmass, eMap, circle, Mu, 5, frame, deltaFrameSearch, StimulationLock, StimulationCounter);
						FusionHandler.AdjustFusionCenterNom(DImg, eMap, 4, frame);
					}
					DImg.deleteRoi();
				}
			}
			DImg.changes = false;
			DImg.close();
		}
		DImg.changes = false;
	} 

	double[] RandomMeasurement(ImagePlus imp, int R, int width, int height)
	{
		double[] result = { 0, 0 };
		int X = (int) ((width / 2) + R / 2);
		int Y = (int) ((height / 2) + R / 2);
		int VarXY = -10;
		for (int i = 0; i < 3; i++)
		{
			X = X + VarXY;
			Y = Y + VarXY;
			OvalRoi circle = new OvalRoi(X, Y, R, R);
			imp.setRoi(circle);
			ImageStatistics ImStat = imp.getStatistics();
			double Mu = ImStat.mean;
			double Std = ImStat.stdDev;
			result[0] = result[0] > Mu ? result[0] : Mu;
			result[1] = result[1] > Std ? result[0] : Std;
			VarXY = VarXY + 10;
			imp.deleteRoi();
		}
		return result;
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
		SegImagePath = OutPutDirectory + File.separator;
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

	private void WriteEventsPatchData(double[][] ePatchData, String FolderPath, String ImageName,
			Map<Integer, EventTracking> eTrackMap, int csvType)
	{
		String GraphDataPath = FolderPath + File.separator + ImageName + ".csv";
		File GraphDataFile = new File(GraphDataPath);
		int length = ePatchData.length;
		int nFrames = ePatchData[0].length;
		try
		{
			FileWriter outputfile = new FileWriter(GraphDataFile);
			CSVWriter writer = new CSVWriter(outputfile);
			String[] header = new String[length];
			if (csvType == 0)
			{
				int counter = 0;
				for (int i = 0; i < eTrackMap.size(); i++)
				{
					EventTracking eT = eTrackMap.get(i);
					if (eT.getDualID() == -1)
					{
						String status = "";
						if (eT.getFusionType() == 1)
						{
							status = "Short ";
						} else if (eT.getFusionType() == 2)
						{
							status = "Slow ";
						}
						boolean isBG = eT.getCenterLayerPosition() == 0 || eT.getCenterLayerPosition() == 1;
						String PosStatus = isBG ? "BG " : "";
						header[counter] = PosStatus + status + "e_" + counter + " S" + eT.getStimulationID();
						counter++;
					}
				}

			} else
			{
				IntStream.range(0, eTrackMap.size()).parallel().forEach(i ->
				{
					EventTracking eMap = eTrackMap.get(i);
					String status = "";
					if (eMap.getFusionType() == 1)
					{
						status = "Short ";
					} else if (eMap.getFusionType() == 2)
					{
						status = "Slow ";
					}
					header[i] = status + "e_" + i + " S" + eMap.getStimulationID();
				});
			}
			writer.writeNext(header);
			for (int i = 0; i < nFrames; i++)
			{
				String[] rowData = new String[length];
				for (int j = 0; j < length; j++)
				{
					Double temp = ePatchData[j][i];
					rowData[j] = Double.toString(temp);
				}
				writer.writeNext(rowData);
			}
			writer.close();
		} catch (IOException e)
		{
			e.printStackTrace();
		}
	}

	private void WriteEventsPatchData(double[][] ePatchData, String FolderPath, String ImageName, String[] header)
	{
		String GraphDataPath = FolderPath + File.separator + ImageName + "_Events Data.csv";
		File GraphDataFile = new File(GraphDataPath);
		int row = ePatchData.length;
		int col = ePatchData[0].length;
		try
		{
			boolean exit = false;
			FileWriter outputfile = new FileWriter(GraphDataFile);
			CSVWriter writer = new CSVWriter(outputfile);
			if (header == null)
			{
				header = new String[row];
				for (int i = 0; i < row; i++)
				{
					header[i] = "Event " + i;
				}
			}
			writer.writeNext(header);
			for (int i = 0; i < row; i++)
			{
				String[] rowData = new String[col];
				for (int j = 0; j < col; j++)
				{
					Double temp = ePatchData[i][j];
					if (ePatchData[i][1] == 0 && ePatchData[i][2] == 0)
					{
						exit = true;
						break;
					}
					rowData[j] = Double.toString(temp);
				}
				if (exit)
				{
					break;
				}
				writer.writeNext(rowData);
			}
			writer.close();
		} catch (IOException e)
		{
			e.printStackTrace();
		}
	}

	private void WriteEventsPatchData(double[][] ePatchData, String FolderPath, String ImageName)
	{
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
					Double temp = 0.0;
					try
					{
						temp = ePatchData[j][i];
					} catch (Exception e)
					{
//						System.out.println("failed to print array data at [ID,Frame](" + j + "," + i + ")");
					}
					rowData[j] = Double.toString(temp);
				}
				writer.writeNext(rowData);
			}
			writer.close();
		} catch (IOException e)
		{
			e.printStackTrace();
		}
	}

	private void WriteEventsPatchDataBG(double[][] ePatchData, String FolderPath, String ImageName,
			Map<Integer, EventTracking> eTrackMap, int csvType)
	{
		String GraphDataPath = FolderPath + File.separator + ImageName + ".csv";
		File GraphDataFile = new File(GraphDataPath);
		int length = ePatchData.length;
		int nFrames = ePatchData[0].length;
		try
		{
			FileWriter outputfile = new FileWriter(GraphDataFile);
			CSVWriter writer = new CSVWriter(outputfile);
			String[] header = new String[length + 1];

			int counter = 0;
			for (int i = 0; i < eTrackMap.size(); i++)
			{
				EventTracking eT = eTrackMap.get(i);
				if (eT.getDualID() == -1)
				{
					String status = "";
					if (eT.getFusionType() == 1)
					{
						status = "Short ";
					} else if (eT.getFusionType() == 2)
					{
						status = "Slow ";
					}
					boolean isBG = eT.getCenterLayerPosition() == 0 || eT.getCenterLayerPosition() == 1;
					String PosStatus = isBG ? "BG " : "";
					if (csvType == 1 || (eT.getStimulationID() == 0 && csvType == 0))
					{
						header[counter] = PosStatus + status + "e_" + counter + " S" + eT.getStimulationID();
						counter++;
					}
				}
			}
			header[length] = "BG mean";
			writer.writeNext(header);
			for (int i = 0; i < nFrames; i++)
			{
				String[] rowData = new String[length + 1];
				for (int j = 0; j < length; j++)
				{
					Double temp = ePatchData[j][i];
					rowData[j] = Double.toString(temp);
				}
				Double BGMean = ClusteredStackMean[i][MinClusterID];
				rowData[length] = Double.toString(BGMean);
				writer.writeNext(rowData);
			}
			writer.close();
		} catch (IOException e)
		{
			e.printStackTrace();
		}
	}

	// ---------------- Monitor Delta Mean ----------------
	private void MonitorDeltaMean(double CMu, int frame)
	{
		int StimError = 2;
		SumDeltaMean = SumDeltaMean + CMu;
		AvgDeltaMu = SumDeltaMean / FrameCounter;
		if (CMu > AvgDeltaMu * risePercent)
		{
			StimPeriodControl++;
			FlagStimulation = true;
			double temp = CMu / AvgDeltaMu;
			variableSensitivity = temp > 4 ? 4 : temp; // limit the detection
			variableSensitivity = StimulationCounter == 1 ? 1 : variableSensitivity; // skip electrical stimulation
			DeltaMeanMax = DeltaMeanMax < CMu ? CMu : DeltaMeanMax;
			if (!StimulationLock)
			{
				updateStimulation(StimulationCounter, frame, 0);
				StimulationLock = true;
			}
		} else
		{
			variableSensitivity = 1;
			if (StimPeriodControl <= StimError && StimulationLock)
			{
				StimPeriodControl = 0;
				StimulationCounter = StimulationCounter <= 1 ? 1 : StimulationCounter--;
				resetStimulation(StimulationCounter);
				StimulationLock = false;
			} else if (StimPeriodControl > StimError) // && StimDiscontinuity > StimPeriodControl + 3
			{
				updateStimulation(StimulationCounter, frame, 1);
				StimPeriodControl = 0;
				StimulationCounter++;
				StimulationLock = false;
			}
			DeltaMeanMax = 0;
			FlagStimulation = false;
			FrameCounter++;
		}
	}

	void updateStimulation(int StimID, int frame, int rank)
	{
		int ndx = StimID - 1;
		int[] temp = { 0, 0 };
		boolean exist = StimID <= StimIntervals.size();
		if (exist)
		{
			temp = StimIntervals.get(ndx);
		}
		temp[rank] = temp[rank] == 0 ? frame : temp[rank];
		if (exist)
		{
			StimIntervals.set(ndx, temp);
		} else
		{
			StimIntervals.add(temp);
		}
	}

	void resetStimulation(int StimID)
	{
		int ndx = StimID - 1;
		int[] temp = { 0, 0 };
		StimIntervals.set(ndx, temp);
	}

	private ArrayList<int[]> getStimIntervals(int[][] intervals)
	{
		ArrayList<int[]> StimInt = new ArrayList<>();
		for (int i = 0; i < intervals.length; i++)
		{
			int[] temp = { intervals[i][0], intervals[i][1] };
			StimInt.add(temp);
		}
		return StimInt;
	}

	private double getFixedDeltaMean(ImagePlus Img)
	{
		ImageStatistics imStat = Img.getStatistics();
		return imStat.mean;
	}

	private int updateStimulationInterval(ArrayList<int[]> FixedInterval, ArrayList<int[]> AutoFill)
	{
		int ndx = AutoFill.size();
		int count = 0;
		int FrameGap = 100; // 100 is the time between fixed and auto if 0.
		if (ndx != 0)
		{
			for (int i = 0; i < FixedInterval.size(); i++)
			{
				int[] temp = FixedInterval.get(i);
				boolean lock = true;
				if (temp[0] == 0 && temp[1] == 0)
				{
					if (count >= ndx)
					{
						break;
					}
					int[] FillTemp = AutoFill.get(count); // TODO: get the nearest values
					if (FixedInterval.size() == 1)
					{
						FixedInterval.clear();
						for (int j = 0; j < AutoFill.size(); j++)
						{
							FixedInterval.add(AutoFill.get(j));
						}
						break;
					}
					temp[0] = FillTemp[0];
					temp[1] = FillTemp[1];
					count++;
				} else if (temp[0] != 0 && temp[1] == 0)
				{
					int Min = Integer.MAX_VALUE;
					int iMin = 0;
					boolean registered = false;
					for (int j = 0; j < ndx; j++)
					{
						int[] Vx = AutoFill.get(j);
						int dx = Math.abs(Vx[0] - temp[0]);
						if (dx <= FrameGap)
						{
							if (Min > dx)
							{
								Min = dx;
								iMin = j;
								registered = true;
								lock = false;
							}
						}
					}
					int[] Vx = { temp[0] + FrameGap, temp[0] + FrameGap };
					if (registered)
					{
						Vx = AutoFill.get(iMin);
					} else if (ndx == FixedInterval.size())
					{
						Vx = AutoFill.get(i);
					}
					temp[1] = Vx[1];
				} else if (temp[0] == 0 && temp[1] != 0)
				{
					int Min = Integer.MAX_VALUE;
					int iMin = 0;
					boolean registered = false;
					for (int j = 0; j < ndx; j++)
					{
						int[] Vx = AutoFill.get(j);
						int dx = Math.abs(Vx[1] - temp[1]);
						if (dx <= FrameGap)
						{
							if (Min > dx)
							{
								Min = dx;
								iMin = j;
								registered = true;
								lock = false;
							}
						}
					}
					int[] Vx = { temp[1] - FrameGap, temp[1] - FrameGap };
					if (registered)
					{
						Vx = AutoFill.get(iMin);
					} else if (ndx == FixedInterval.size())
					{
						Vx = AutoFill.get(i);
					}
					temp[0] = Vx[0];
				} else if (temp[0] != 0 && temp[1] != 0)
				{
					count = Math.min(count, AutoFill.size() - 1);
					int[] Vx = AutoFill.get(count);
					if (temp[1] < Vx[0] || Vx[1] < temp[0])
					{
						if (temp[1] > Vx[1])
						{
							count++;
						}
					} else if (Math.max(temp[0], Vx[0]) <= Math.min(temp[1], Vx[1]))
					{
						count++;
					}
				}
				if (!lock)
				{
					count++;
				}
			}
		}
		int[] temp = FixedInterval.get(FixedInterval.size() - 1);
		return temp[0] + 4;
	}

	// ---------------- End ----------------
	// This function validates measurement interval bounded to image stack frames.
	private void validateNormInterval(int[] interval, int max)
	{
		int min = 0;
		interval[0] = interval[0] < min || interval[0] >= max ? min : interval[0];
		interval[1] = interval[1] <= min || interval[1] > max ? max : interval[1];
	}

	public void updateGUI(JLabel progressStatusLabel, int loopNum, int totalNum)
	{
		if (!SwingUtilities.isEventDispatchThread())
		{
			SwingUtilities.invokeLater(new Runnable()
			{
				@Override
				public void run()
				{
					progressStatusLabel.setText("Processing data please wait... (" + (loopNum + 1) + "/" + totalNum + ")");
				}
			});
			return;
		} else
		{
			progressStatusLabel.setText("Processing data please wait... (" + (loopNum + 1) + "/" + totalNum + ")");
		}
	}

	public void ShowProgressBarWindow()
	{
		pWindow.setVisible(true);
		pWindow.setResizable(false);
		progressStatusLabel = new JLabel();
		progressStatusLabel.setText("Analyzing stack please wait...");
		pWindow.setBounds(100, 100, 320, 160);
		pWindow.getContentPane().setLayout(null);
		pWindow.setTitle("Status Window");

		ClassLoader cl = this.getClass().getClassLoader();
		ImageIcon mainWindowIcon = new ImageIcon(cl.getResource("IVEA_logo_x128.png"));
		pWindow.setIconImage(mainWindowIcon.getImage());

		progressBar.setStringPainted(true);
		progressBar.setBounds(10, 50, 294, 25);
		pWindow.getContentPane().add(progressBar);

		JButton CancelButton = new JButton("Cancel");
		CancelButton.setBounds(110, 97, 89, 23);
		pWindow.getContentPane().add(CancelButton);
		// progressStatusLabel = new JLabel("Processing data please wait...");
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

	private String[] getSumHeader()
	{
		String[] header = new String[7];
		header[0] = "ID";
		header[1] = "Cx";
		header[2] = "Cy";
		header[3] = "Peak Frame";
		header[4] = "Peak Intensity";
		header[5] = "StdDev";
		header[6] = "Median";
		return header;
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
