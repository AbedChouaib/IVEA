package com.uniSaarland_CIPMM.ivea.gui;

import java.awt.Checkbox;
import java.awt.Choice;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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
import java.util.ArrayList;
import java.util.Map;

import javax.swing.ImageIcon;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import ij.IJ;
import ij.ImagePlus;
import ij.gui.GenericDialog;
import ij.plugin.FolderOpener;

public class IVEAsetup
{
	final static String alertColor = "#ff5555";
	public static double adaptiveThresh;// Controls region maximum extraction.
	public static double detectionSensitivity = 0.02;
	public static double BrightnessAdjust; // This filter controls the brightness auto tuning strength.
	public static int noiseFilterRadius; // Filter radius, increase noise cancellation for higher values.
	public static int thresholdLimit16bits; // This value is to override auto-threshold.
	public static String noiseFilterKind = "Mean";
	public static int Klayers = 10; // k-means segmentation.
	public static int SelectionEnlarge; // Increase mask selection on original image.
	public static double NoiseFilterValue; // Global threshold control.
	public static int FrameToLearnFrom = 2; // default frames are 1 and 2.
	public static int DopamineFrameInterval;
	public static int SearchRadius; // Search radius around the spot center.
	public static int StartFrame, EndFrame;
	public static boolean MLframeNosieLearner = true, MLnoiseLearner = true; // auto-threshold controller.
	public static String OutPutDirectory = "";
	public static int FPS = 1;
	public static int NumberOfStacks;
	public static boolean isEmulator = false;
	public static boolean CleanBG;
	public static boolean learnBG;
	public static boolean SaveInSameDir = false;
	public static String Selected_model_ran_path = "";
	public static String Model_Synapse_Path = "";
	// ------------------ Non-Fixed FBEs Parameters ------------------
	public static int TCVFprom;
	public static int TCVFinterval;
//	public static int TCVFDisCon = 3;
	public static int nonfixedRadius;
	public static int nFixedNetwork_Radius;
	public static String MeasurementInterval;
	public static double TCVFsens;
	public static String InitialSaveName;
	public static double ConfidenceTcell;
	public static int TCVFspreadRadius;
	public static boolean RBE_disableLogFile = false;
//	public static int neuralNetworkRadius;
	// ------------------ end ------------------
	// ------------------ Fixed FBEs Parameters ------------------
	public static int SynapseProminence;
	public static int SynapseVarInt;
	public static int SynapseSearchRadius;
	public static int SynapseErode;
	public static double SynapseSens;
	public static double PredictionAccuracyNeuron;
	public static boolean SBE_disableLogFile = false;
	// ------------------ end ------------------
//	private static String InitialTCVF = "0_4_0_6_1_20-100_0";
//	private static String InitialSynapse = "0_4_5_0_3";
	public static String SP = "_";

	public static int[][] NeuronStim1;
//	public static int[] NeuronStim2;
	public static boolean NeuronStimDetection;
	public static int ImportTypeCheckbox;
	public static boolean WriteSummary, FusionFrameWindow, SubtractBG, NormalizeOutput;
	public static boolean SecretionCtrl, tinyFusion, xFusion;
	public static int[] FrameWinBoundaries;
	public static int[] NormalizeRange;
	public static String NeuronStimulations;
	public static boolean TCVFBlurImage;
	public static ArrayList<String> SmartNaming = new ArrayList<String>();
	public static int extendWindow = 0;
	public static boolean adjustForBleach;
	// ------------------ Custom Model Non-Fixed ------------------
	public static String ModelDirectory;
	public static int FirstNclasses;
	public static boolean UseCustomModel;
	public static boolean ExportTrainingData;

	public static final String[] RBE_available_models = { "GranuVision3", "GranuVision2", "GranuLSTM" };
	public static final String[] RBE_modelsNames = { "eViT_nFixed_tf2.10.1-v_8", "etrans_nFixed_tf2.9.1-v_35",
				"lstmModel_TCell_tf2.9.1-v1.3Tc" };
	public static final String[] SBE_available_models = { "NeuroLSTM", "NeuroVision1", "GranuVision3" };
	public static final String[] SBE_modelsNames = { "lstmModel_Neurons_v5.6Fc", "eViT_stationary_tf2.10.1-v_2",
				"eViT_nFixed_tf2.10.1-v_8" };
	public static String moppdelConfig = "model_config.json";
	// { "lstmModel_TCell_tf2.9.1-v1.3Tc",
	// "lstmModel_TCell_tf2.9.1-vX2.5Tc","lstmModel_TCell_tf2.9.1-vX2.1Fc" };
	public static String nFixed_modelName = "";
	public static int RBEmodel_ID = 0;
	public static int SBEmodel_ID = 0;
	public static boolean TimeSeriesModel;
	public static boolean RBE_latentFusion = true;
	public static int SBE_MaxPooling = 1;
	public static int RBE_MaxPooling = 1;
//	private static final String adjustForBleachLabel = "adjustBleach";
	// ------------------ end ------------------
	public static int timeseries = 10; // 13
	public static int patchRadius = 16;
	public static int num_fusions = 3;
	public static int add_frames = 10;
	public static int nClasses = 11;

	// ------------------ Global Values ------------------
	public static String AnalysisName = "IVEA";
	public static int StackLength = 0;
	public static boolean OneVideo;
	public static boolean MultiImageDetected = false;
	public static boolean ImagePresent = false;
	public static Choice CropMaskListGUI = new Choice();
	public static ArrayList<String> SubFolderNameList = new ArrayList<>();
	public static ArrayList<int[]> CropMaskListValues = new ArrayList<>();
	public static boolean TheInputIsVideos;
//	static String OutPutDirectory;
	public static String username;
	// Eclipse variables are for the editor only!
	public static String EclipseColor = "black";
	public static int EclipseColorValue = 255;
	public static String InputPath = "";
	public static String fixedCurrentTime;
	public static int BlockSize = 1400;
	private static boolean readConfigOnce = true;
//	private static boolean lockOutSave = true;
//	private static String SBE_model_ID_tag = "SBEmodelID";

	// ============ Metadata ============
	public static double[] Resolution = { 0, 0, 0 };
	public static int nChannels = 1;
//		private int zSlices;
	public static int nFrames;
	public double tempResolution;
	public static boolean IsLSTM_RBE = false;
	public static boolean IsLSTM_SBE = false;
	public static String IVEA_src_dir = "C:\\Users\\Abed\\Programs\\Fiji.app\\plugins\\IVEA Resources";
	// ============ end ============
	// ------------------ Global Values ------------------

	public enum AnalysisType
	{
		Synapse, T_Cell
	}

	public enum ImportType
	{
		Vi, MVi, ImgS
	}

	public static boolean showDialog_Dopamine()
	{
		GenericDialog GD = new GenericDialog("HAE Advance Settings");

		ClassLoader cl = IVEAsetup.class.getClassLoader();
		ImageIcon mainWindowIcon = new ImageIcon(cl.getResource("IVEA_logo_x128.png"));
		GD.setIconImage(mainWindowIcon.getImage());

		GD.addNumericField("Variation time window", DopamineFrameInterval, 0);
		GD.addMessage(" 		-- Auto Threhold --		");
		GD.addCheckbox("Exclude events in the background", CleanBG);
		GD.addCheckbox("Learn background noise (slower)", learnBG);
		GD.addNumericField("Frames to learn from, first", FrameToLearnFrom, 0);
		GD.addSlider("K-means (default, 5)", 1, 5, Klayers / 2);
		GD.addSlider("Adaptive Threshold (0-off)", 0.00f, 1.50f, adaptiveThresh);
		GD.addSlider("Global Threshold (0-auto)", 0.00f, 2.50f, NoiseFilterValue);
		GD.addMessage(" 		-- Fixed Threshold --		");
		GD.addNumericField("Override global threshold (0-auto)", thresholdLimit16bits, 0);
		GD.showDialog();
		if (GD.wasCanceled())
		{
			return false;
		}
		DopamineFrameInterval = (int) GD.getNextNumber();
		CleanBG = GD.getNextBoolean();
		learnBG = GD.getNextBoolean();
		FrameToLearnFrom = (int) GD.getNextNumber();
		Klayers = (int) GD.getNextNumber() * 2;
		adaptiveThresh = GD.getNextNumber();
		NoiseFilterValue = GD.getNextNumber();
		thresholdLimit16bits = (int) GD.getNextNumber();
		try
		{
			saveConfig(IVEA_src_dir);
		} catch (JSONException e)
		{
			e.printStackTrace();
		}
		return true;
	}

	public static boolean showDialog_Neuron()
	{
		GenericDialog GD = new GenericDialog("SBE Advance Settings");

		ClassLoader cl = IVEAsetup.class.getClassLoader();
		ImageIcon mainWindowIcon = new ImageIcon(cl.getResource("IVEA_logo_x128.png"));
		GD.setIconImage(mainWindowIcon.getImage());

		GD.addNumericField("Erosion (pixels)", SynapseErode, 0);
		GD.addNumericField("Varaition time window", SynapseVarInt, 0);
		GD.addNumericField("Prominence (0-auto)", SynapseProminence, 0);
		GD.addNumericField("add frames +", extendWindow, 0);
		GD.addMessage(" 		-- Neural Network Confidence--		");
		GD.addSlider("Confidence (0.6, default)", 0.0f, 0.99, PredictionAccuracyNeuron);
		GD.addMessage(" 		-- Event Nomination Sensistivity --		");
		GD.addSlider("Sensistivity (0-auto)", 0.1f, 15.0f, SynapseSens);
		GD.addCheckbox("Gaussian Blur", TCVFBlurImage);
		GD.addCheckbox("Disable Log info prompt", SBE_disableLogFile);
		GD.showDialog();
		if (GD.wasCanceled())
		{
			return false;
		}
		SynapseErode = (int) GD.getNextNumber();
		SynapseVarInt = (int) GD.getNextNumber();
		SynapseProminence = (int) GD.getNextNumber();
		extendWindow = (int) GD.getNextNumber();
		PredictionAccuracyNeuron = GD.getNextNumber();
		SynapseSens = GD.getNextNumber();
		TCVFBlurImage = GD.getNextBoolean();
		SBE_disableLogFile = GD.getNextBoolean();
		try
		{
			saveConfig(IVEA_src_dir);
		} catch (JSONException e)
		{
			e.printStackTrace();
		}
		return true;
	}

	public static boolean showDialog_NeuronMeasurements()
	{
		boolean[] NeuronMeasureoptions = { WriteSummary, FusionFrameWindow, SubtractBG, NormalizeOutput };
		String[] labels = { "Summary", "Measurement time window", "Subtract BG", "Normalize Output" };
		GenericDialog GD = new GenericDialog("SBE Measurement Settings");

		ClassLoader cl = IVEAsetup.class.getClassLoader();
		ImageIcon mainWindowIcon = new ImageIcon(cl.getResource("IVEA_logo_x128.png"));
		GD.setIconImage(mainWindowIcon.getImage());

		GD.addCheckboxGroup(2, 2, labels, NeuronMeasureoptions);
		GD.addStringField("Measurement time window (0,default)", FrameWinBoundaries[0] + "-" + FrameWinBoundaries[1]);
		GD.addStringField("Normalize time window (0,default)", NormalizeRange[0] + "-" + NormalizeRange[1]);
		GD.showDialog();
		if (GD.wasCanceled())
		{
			return false;
		}
		for (int i = 0; i < NeuronMeasureoptions.length; i++)
		{
			NeuronMeasureoptions[i] = GD.getNextBoolean();
		}
		WriteSummary = NeuronMeasureoptions[0];
		FusionFrameWindow = NeuronMeasureoptions[1];
		SubtractBG = NeuronMeasureoptions[2];
		NormalizeOutput = NeuronMeasureoptions[3];
		FrameWinBoundaries = getIntervals(GD.getNextString());
		NormalizeRange = getNormIntervals(GD.getNextString());
		try
		{
			saveConfig(IVEA_src_dir);
		} catch (JSONException e)
		{
			e.printStackTrace();
		}
		return true;
	}

	public static boolean showDialog_RBE()
	{
		GenericDialog GD = new GenericDialog("RBE Advance Settings"); // Variation

		ClassLoader cl = IVEAsetup.class.getClassLoader();
		ImageIcon mainWindowIcon = new ImageIcon(cl.getResource("IVEA_logo_x128.png"));
		GD.setIconImage(mainWindowIcon.getImage());

		GD.addNumericField("prominence (0-auto)", TCVFprom, 0);
		GD.addNumericField("Variation time window", TCVFinterval, 0);
		GD.addNumericField("Event spread", TCVFspreadRadius, 0);
		GD.addMessage(" 		-- Neural Network Confidence--		");
		GD.addSlider("Confidence (0.9, default)", 0.0f, 0.99, ConfidenceTcell);
		GD.addMessage(" 		-- Event Nomination Sensistivity --		");
		GD.addSlider("Sensitivity (0-auto)", 0.01f, 15.0f, TCVFsens);
		GD.addCheckbox("Gaussian blur", TCVFBlurImage);
		GD.addCheckbox("Adjust for bleach (experimental!)", adjustForBleach);
		GD.addCheckbox("Disable Log info prompt", RBE_disableLogFile);
		GD.addMessage(" -- Computer Memopry Capacity (load data to RAM) -- ");
		GD.addNumericField("Block size (default, 2000)", BlockSize, 0);
		GD.showDialog();

		if (GD.wasCanceled())
		{
			return false;
		}
		TCVFprom = (int) GD.getNextNumber();
		TCVFinterval = (int) GD.getNextNumber();
		TCVFspreadRadius = (int) GD.getNextNumber();
		ConfidenceTcell = GD.getNextNumber();
		TCVFsens = GD.getNextNumber();
		TCVFBlurImage = GD.getNextBoolean();
		adjustForBleach = GD.getNextBoolean();
		RBE_disableLogFile = GD.getNextBoolean();
		BlockSize = (int) GD.getNextNumber();
		try
		{
			saveConfig(IVEA_src_dir);
		} catch (JSONException e)
		{
			e.printStackTrace();
		}
		return true;
	}

	public static void printLine(String[] data)
	{
		for (int i = 0; i < data.length; i++)
		{
			System.out.println(data[i]);
		}
	}

	static int[] getIntervals(String args)
	{
		String[] tempSplit = args.split("-");
		int lower = 20;
		int upper = 100;
		if (tempSplit.length == 1)
		{
			lower = (int) (Integer.parseInt(tempSplit[0]) / 2);
			upper = lower;
		} else if (tempSplit.length == 2)
		{
			lower = (int) (Integer.parseInt(tempSplit[0]));
			upper = (int) (Integer.parseInt(tempSplit[1]));
		}
		lower = lower <= 0 ? 20 : lower;
		upper = upper <= 0 ? 100 : upper;
		int[] result = { lower, upper };
		return result;
	}

	static int[] getNormIntervals(String args)
	{
		String[] tempSplit = args.split("-");
		int lower = 0;
		int upper = 0;
		if (tempSplit.length == 1)
		{
			lower = (int) (Integer.parseInt(tempSplit[0]));
		} else if (tempSplit.length == 2)
		{
			lower = (int) (Integer.parseInt(tempSplit[0]));
			upper = (int) (Integer.parseInt(tempSplit[1]));
		}
		int[] result = { lower, upper };
		return result;
	}

	static int[][] getIntervalsv2(String args, String SP)
	{
		String[] StimSplit = args.split(SP);
		int[][] result = new int[StimSplit.length][2];
		for (int i = 0; i < StimSplit.length; i++)
		{
			String[] tempSplit = StimSplit[i].split("-");
			int lower = 0;
			int upper = 0;

			if (tempSplit.length == 1)
			{
				lower = (int) (Integer.parseInt(tempSplit[0].replace(" ", "")));
			} else if (tempSplit.length == 2)
			{
				lower = (int) (Integer.parseInt(tempSplit[0].replace(" ", "")));
				upper = (int) (Integer.parseInt(tempSplit[1].replace(" ", "")));
			}

			result[i][0] = lower;
			result[i][1] = upper;
		}

		return result;
	}

	static String getNeuronStimString(int[][] NeuronStim)
	{
		String StimString = "";
		for (int i = 0; i < NeuronStim.length; i++)
		{
			if (i == 0)
			{
				StimString = NeuronStim[i][0] + "-" + NeuronStim[i][1];
			} else
			{
				StimString = StimString + SP + NeuronStim[i][0] + "-" + NeuronStim[i][1];
			}
		}
		return StimString;
	}

	public static boolean getModelType(String input)
	{
		if (input.length() >= 2)
		{
			String lastTwoCharacters = input.substring(input.length() - 2);
			lastTwoCharacters = lastTwoCharacters.toLowerCase();
			switch (lastTwoCharacters)
			{
			case "tc":
				return true;
			case "fc":
				return false;
			default:
				return true;
			}
		}
		return true;
	}

	public static void UpdateCropMaskListGUI()
	{
		CropMaskListGUI.removeAll();
		for (int i = 0; i < CropMaskListValues.size(); i++)
		{
			int[] Values = CropMaskListValues.get(i);
			CropMaskListGUI.add(Values[0] + "," + Values[1] + "," + Values[2] + "," + Values[3]);
		}
	}

	public static ImportType getDataType(Checkbox Vi, Checkbox Mvi, Checkbox ImgS)
	{
		ImportType DataType;
		switch (ImportTypeCheckbox)
		{
		case 0:
			DataType = ImportType.Vi;
			Vi.setState(true);
			OneVideo = true;
			TheInputIsVideos = true;
			break;
		case 1:
			DataType = ImportType.MVi;
			Mvi.setState(true);
			OneVideo = false;
			TheInputIsVideos = true;
			break;
		case 2:
			DataType = ImportType.ImgS;
			ImgS.setState(true);
			OneVideo = false;
			TheInputIsVideos = false;
			break;
		default:
			DataType = ImportType.Vi;
			OneVideo = true;
			TheInputIsVideos = true;
			break;
		}
		return DataType;
	}

	public static ArrayList<String> CheckDirectory(String Path, ImportType DataType, ImagePlus OriginalImp)
	{
		ArrayList<String> ImgDirectories = new ArrayList<String>();
		SubFolderNameList.clear();
		switch (DataType)
		{
		case Vi:
			try
			{
				InputData IData = new InputData(Path, ImportType.Vi);
				ImgDirectories = IData.GetListofFiles();
				ReadMetaData(IData);
			} catch (Exception e1)
			{
				e1.printStackTrace();
			}
			break;

		case MVi:
			try
			{
				InputData IData = new InputData(Path, ImportType.MVi);
				ImgDirectories = IData.GetListofFiles();
				ReadMetaData(IData);
			} catch (Exception e)
			{
				e.printStackTrace();
			}
			if (ImgDirectories != null)
			{
				for (int i = 0; i < ImgDirectories.size(); i++)
				{
					File file = new File(ImgDirectories.get(i));
					SubFolderNameList.add(file.getName());
				}
			}
			break;

		case ImgS:
			boolean MultiStack = false;
			File newDir = new File(Path);
			InputData ImgSeqDat = new InputData();
			if (newDir.isDirectory())
			{
				String[] files = newDir.list();
				for (String file : files)
				{
					File TempFile = new File(Path + File.separator + file);
					if (TempFile.isDirectory())
					{
						OriginalImp = FolderOpener.open(TempFile.getPath(), "virtual");
						StackLength = OriginalImp.getStackSize();
						if (StackLength >= 3)
						{
							ImgDirectories.add(TempFile.getPath());
							SubFolderNameList.add(TempFile.getName());
							MultiStack = true;
						}
					}
				}
				if (!MultiStack)
				{
					OriginalImp = FolderOpener.open(newDir.getPath(), "virtual");
					StackLength = OriginalImp.getStackSize();
					if (StackLength >= 3)
					{
						ImgDirectories.add(newDir.getPath());
						SubFolderNameList.add(newDir.getName());
						ImagePlus Img = new ImagePlus("Slice_" + Integer.toString(1), OriginalImp.getStack().getProcessor(1)).duplicate();
						ImgSeqDat.CheckImage(Img);
						Img.changes = false;
						Img.close();
					}
				}
			}
			break;
		default:
			break;
		}
		return ImgDirectories;
	}

	static void ReadMetaData(InputData IData)
	{
		Resolution = IData.GetResolutionsXYZ();
		nChannels = IData.GetnChannels();
		nFrames = IData.GetnFrames();
		FPS = (int) Math.round(1 / IData.GetTime());
//		txtF_FPS.setText("" + IVEAsetup.FPS);
//		Unit = IData.GetUnit();
	}

	public static void getConfigUpdate(String modelPath, boolean neurons, boolean printInfo)
	{
		try
		{
			Map<String, Object> params;
			String configPath = modelPath + File.separator + moppdelConfig;
			params = ParameterLoader.loadParametersFromJson(configPath);
			num_fusions = ((Number) params.get("num_fusion")).intValue();
//			int numClasses = ((Number) params.get("num_classes")).intValue();
			timeseries = (int) (((Number) params.get("timeseries")).intValue() / 2);
			add_frames = ((Number) params.get("more_frames")).intValue();
			patchRadius = ((Number) params.get("patch_radius")).intValue();
			if (printInfo)
			{
				if (neurons)
				{
					String status = "(experimental) Vision Transformer";
					String inputLayer = "encoder";
					String networkInfo = "";
					if (SBEmodel_ID == 0)
					{
						status = "(paper version for stationary) lstm";
						inputLayer = "input layer";
					}
					IJ.log("The selected " + status + " model classifies " + num_fusions + " types of exocytosis, " + inputLayer
							+ " dimensions ("
							+ (timeseries * 2 + add_frames) + ", " + patchRadius * 2 + ", " + patchRadius * 2 + ", 1)" + networkInfo);
				} else
				{
					if (!UseCustomModel)
					{
						String status = "Vision Transformer";
						String inputLayer = "encoder";
						String networkInfo = "";
						if (RBEmodel_ID == 2)
						{
							status = "(deprecated) lstm";
							inputLayer = "input layer";
							networkInfo = "\nnote:the latent vesicle fusion event for the LSTM model is experimental. "
									+ "Please enable this feature only if the vesicles are not visible. (CD63, CD9, CD81, VAMP2 etc...)";
						}
						IJ.log("The selected " + status + " model classifies " + num_fusions + " types of exocytosis, " + inputLayer
								+ " dimensions ("
								+ (timeseries * 2 + add_frames) + ", " + patchRadius * 2 + ", " + patchRadius * 2 + ", 1)" + networkInfo);
					} else
					{
						Path path = Paths.get(Selected_model_ran_path);
						String modelName = path.getFileName().toString();
						IJ.log("You are using custom model: " + modelName + ", it classifies " + num_fusions + " types of exocytosis, "
								+ " dimensions ("
								+ (timeseries * 2 + add_frames) + ", " + patchRadius * 2 + ", " + patchRadius * 2 + ", 1)");
					}
				}
			}
		} catch (IOException e)
		{
			IJ.log("Error reading model path. Please check if IVEA has a correct model path!");
			e.printStackTrace();
		}
	}

	public static void ShowCustomModelTcell()
	{
		CustomModelDialog dialog = new CustomModelDialog();

		boolean okPressed = dialog
				.showDialog(ModelDirectory,
						FirstNclasses,
						UseCustomModel,
						ExportTrainingData);
		if (okPressed)
		{
			if (dialog.getModelDirectory() != null)
			{
				ModelDirectory = dialog.getModelDirectory();
			}
			FirstNclasses = dialog.getNumericValue();
			UseCustomModel = dialog.isUseCustomModel();
			ExportTrainingData = dialog.isExportTrainingData();
			boolean neurons = false;
			if (UseCustomModel)
			{
				Selected_model_ran_path = ModelDirectory;
				getConfigUpdate(Selected_model_ran_path, neurons, !IVEAsetup.RBE_disableLogFile); // get JSON config file neural network
																									// params
			}
			try
			{
				saveConfig(IVEA_src_dir);
			} catch (JSONException e)
			{
				e.printStackTrace();
			}
		}
	}

	public static void saveConfig(String folderPath) throws JSONException
	{
		File configFile = new File(folderPath, "IVEA_config.json");
		try
		{
			// Ensure directory exists
			configFile.getParentFile().mkdirs();

			// Build JSON object
			JSONObject json = new JSONObject();

			// --- Dopamine params ---
			json.put("CleanBG", CleanBG);
			json.put("adaptiveThresh", adaptiveThresh);
			json.put("BrightnessAdjust", BrightnessAdjust);
			json.put("noiseFilterRadius", noiseFilterRadius);
			json.put("DopamineFrameInterval", DopamineFrameInterval);
			json.put("NoiseFilterValue", NoiseFilterValue);
			json.put("SearchRadius", SearchRadius);
			json.put("OutPutDirectory", OutPutDirectory);
			json.put("MLframeNosieLearner", MLframeNosieLearner);

			// --- Non-fixed FBEs ---
			json.put("TCVFprom", TCVFprom);
			json.put("TCVFinterval", TCVFinterval);
			json.put("TCVFspreadRadius", TCVFspreadRadius);
			json.put("nonfixedRadius", nonfixedRadius);
			json.put("MeasurementInterval", MeasurementInterval);
			json.put("SecretionCtrl", SecretionCtrl);
			json.put("RBElatentFusion", RBE_latentFusion);
			json.put("tinyFusion", tinyFusion);
			json.put("xFusion", xFusion);
			json.put("TCVFsens", TCVFsens);
			json.put("ConfidenceTcell", ConfidenceTcell);
			json.put("TCVFBlurImage", TCVFBlurImage);
			json.put("RBEmodel_ID", RBEmodel_ID);
			json.put("nFixedNetwork_Radius", nFixedNetwork_Radius);
			json.put("extendWindow", extendWindow);
			json.put("adjustForBleach", adjustForBleach);
			json.put("RBE_MaxPooling", RBE_MaxPooling);
			json.put("RBE_disableLogFile", RBE_disableLogFile);

			// --- Fixed/Stationary FBEs ---
			json.put("SynapseProminence", SynapseProminence);
			json.put("SynapseVarInt", SynapseVarInt);
			json.put("SynapseSearchRadius", SynapseSearchRadius);
			json.put("SynapseErode", SynapseErode);
			json.put("SynapseSens", SynapseSens);
			json.put("PredictionAccuracyNeuron", PredictionAccuracyNeuron);
			json.put("NeuronStimDetection", NeuronStimDetection);
			json.put("SBEmodel_ID", SBEmodel_ID);
			json.put("SBE_MaxPooling", SBE_MaxPooling);
			json.put("SBE_disableLogFile", SBE_disableLogFile);
			// --- Intervals & Ranges ---
			json.put("FrameWinBoundaries", toJSONArray(FrameWinBoundaries));
			json.put("NormalizeRange", toJSONArray(NormalizeRange));
			json.put("NeuronStim1", to2DJSONArray(NeuronStim1));
			json.put("NeuronStimulations", "");

			// --- General settings ---
			json.put("ImportTypeCheckbox", ImportTypeCheckbox);
			json.put("WriteSummary", WriteSummary);
			json.put("FusionFrameWindow", FusionFrameWindow);
			json.put("SubtractBG", SubtractBG);
			json.put("NormalizeOutput", NormalizeOutput);

			// --- Model settings ---
			json.put("ModelDirectory", ModelDirectory);
			json.put("FirstNclasses", FirstNclasses);
			json.put("UseCustomModel", UseCustomModel);
			json.put("ExportTrainingData", ExportTrainingData);
			json.put("BlockSize", BlockSize);
			// Write JSON to file (pretty-printed with indent=4)
			try (FileWriter writer = new FileWriter(configFile))
			{
				writer.write(json.toString(4));
			}

		} catch (IOException e)
		{
			e.printStackTrace();
		}
	}

	public static void loadConfig(String folderPath) throws JSONException
	{
		File configFile = new File(folderPath, "IVEA_config.json");
		if (!configFile.exists())
		{
			resetParams(folderPath);
			if (readConfigOnce)
			{
				loadConfig(folderPath);
				readConfigOnce = false;
			}
			return;
		}

		try
		{
			String content = new String(Files.readAllBytes(configFile.toPath()));
			JSONObject json = new JSONObject(content);

			// --- Dopamine params ---
			CleanBG = json.optBoolean("CleanBG", false);
			adaptiveThresh = json.optDouble("adaptiveThresh", 0.0);
			BrightnessAdjust = json.optDouble("BrightnessAdjust", 1.0);
			noiseFilterRadius = json.optInt("noiseFilterRadius", 8);
			DopamineFrameInterval = json.optInt("DopamineFrameInterval", 3);
			NoiseFilterValue = json.optDouble("NoiseFilterValue", 0.0);
			SearchRadius = json.optInt("SearchRadius", 6);
			OutPutDirectory = json.optString("OutPutDirectory", "");
			MLframeNosieLearner = json.optBoolean("MLframeNosieLearner", false);

			// --- Non-fixed FBEs ---
			TCVFprom = json.optInt("TCVFprom", 0);
			TCVFinterval = json.optInt("TCVFinterval", 4);
			TCVFspreadRadius = json.optInt("TCVFspreadRadius", 0);
			nonfixedRadius = json.optInt("nonfixedRadius", 3);
			MeasurementInterval = json.optString("MeasurementInterval", "20-100"); // TODO:
			SecretionCtrl = json.optBoolean("SecretionCtrl", false);
			tinyFusion = json.optBoolean("tinyFusion", true);
			xFusion = json.optBoolean("xFusion", false);
			TCVFsens = json.optDouble("TCVFsens", 0.0);
			ConfidenceTcell = json.optDouble("ConfidenceTcell", 0.5);
			TCVFBlurImage = json.optBoolean("TCVFBlurImage", true);
			RBEmodel_ID = json.optInt("RBEmodel_ID", 0);
			nFixedNetwork_Radius = json.optInt("nFixedNetwork_Radius", 14);
			extendWindow = json.optInt("extendWindow", 0);
			adjustForBleach = json.optBoolean("adjustForBleach", true);
			RBE_latentFusion = json.optBoolean("RBElatentFusion", true);
			RBE_MaxPooling = json.optInt("RBE_MaxPooling", 1);
			RBE_disableLogFile = json.optBoolean("RBE_disableLogFile", false);
			// --- Fixed/Stationary FBEs ---
			SynapseProminence = json.optInt("SynapseProminence", 0);
			SynapseVarInt = json.optInt("SynapseVarInt", 4);
			SynapseSearchRadius = json.optInt("SynapseSearchRadius", 3);
			SynapseErode = json.optInt("SynapseErode", 0);
			SynapseSens = json.optDouble("SynapseSens", 0.0);
			PredictionAccuracyNeuron = json.optDouble("PredictionAccuracyNeuron", 0.7);
			NeuronStimDetection = json.optBoolean("NeuronStimDetection", true);
			SBEmodel_ID = json.optInt("SBEmodel_ID", 0);
			SBE_MaxPooling = json.optInt("SBE_MaxPooling", 1);
			SBE_disableLogFile = json.optBoolean("SBE_disableLogFile", false);
			// --- Intervals & Ranges ---
			FrameWinBoundaries = toIntArray(json.optJSONArray("FrameWinBoundaries"));
			NormalizeRange = toIntArray(json.optJSONArray("NormalizeRange"));
			NeuronStim1 = toInt2DArray(json.optJSONArray("NeuronStim1"));
			NeuronStimulations = getNeuronStimulationsString(NeuronStim1);
//			NeuronStimulations = json.optString("NeuronStimulations", "0-0"); // TODO:

			// --- General settings ---
			ImportTypeCheckbox = json.optInt("ImportTypeCheckbox", 0);
			WriteSummary = json.optBoolean("WriteSummary", true);
			FusionFrameWindow = json.optBoolean("FusionFrameWindow", true);
			SubtractBG = json.optBoolean("SubtractBG", true);
			NormalizeOutput = json.optBoolean("NormalizeOutput", true);
			BlockSize = json.optInt("BlockSize", 2000);
			// --- Model settings ---
			ModelDirectory = json.optString("ModelDirectory", "");
			FirstNclasses = json.optInt("FirstNclasses", 3);
			UseCustomModel = json.optBoolean("UseCustomModel", false);
			ExportTrainingData = json.optBoolean("ExportTrainingData", true);

		} catch (IOException e)
		{
			e.printStackTrace();
		}
	}

	static void resetParams(String folderPath) throws JSONException
	{
		File configFile = new File(folderPath, "IVEA_config.json");
		try
		{
			// Ensure directory exists
			configFile.getParentFile().mkdirs();

			// Build JSON object
			JSONObject json = new JSONObject();

//			// --- Dopamine params ---
			json.put("CleanBG", false);
			json.put("adaptiveThresh", 0.0);
			json.put("BrightnessAdjust", 1.0);
			json.put("noiseFilterRadius", 8);
			json.put("DopamineFrameInterval", 3);
			json.put("NoiseFilterValue", 0.0);
			json.put("SearchRadius", 6);
			json.put("OutPutDirectory", "");
			json.put("MLframeNosieLearner", false);

			// --- Non-fixed FBEs ---
			json.put("TCVFprom", 0);
			json.put("TCVFinterval", 4);
			json.put("TCVFspreadRadius", 0);
			json.put("nonfixedRadius", 3);
			json.put("MeasurementInterval", "20-100");
			json.put("SecretionCtrl", false);
			json.put("tinyFusion", true);
			json.put("xFusion", false);
			json.put("TCVFsens", 0);
			json.put("ConfidenceTcell", 0.5);
			json.put("TCVFBlurImage", true);
			json.put("RBEmodel_ID", 0);
			json.put("nFixedNetwork_Radius", 14);
			json.put("extendWindow", 0);
			json.put("adjustForBleach", true);
			json.put("RBE_MaxPooling", 1);
			json.put("RBE_disableLogFile", false);
			// --- Fixed/Stationary FBEs ---
			json.put("SynapseProminence", 0);
			json.put("SynapseVarInt", 4);
			json.put("SynapseSearchRadius", 3);
			json.put("SynapseErode", 0);
			json.put("SynapseSens", 0);
			json.put("PredictionAccuracyNeuron", 0.7);
			json.put("NeuronStimDetection", true);
			json.put("SBEmodel_ID", 0);
			json.put("SBE_MaxPooling", 1);
			json.put("SBE_disableLogFile", false);
			// --- Intervals & Ranges ---
			json.put("FrameWinBoundaries", toJSONArray(new int[] { 50, 150 }));
			json.put("NormalizeRange", toJSONArray(new int[] { 0, 1 }));
			json.put("NeuronStim1", to2DJSONArray(new int[1][2]));
//			json.put("NeuronStimulations", "0-0");

			// --- General settings ---
			json.put("ImportTypeCheckbox", 0);
			json.put("WriteSummary", true);
			json.put("FusionFrameWindow", true);
			json.put("SubtractBG", true);
			json.put("NormalizeOutput", true);
			json.put("BlockSize", 2000);

			// --- Model settings ---
			json.put("ModelDirectory", "");
			json.put("FirstNclasses", 3);
			json.put("UseCustomModel", "");
			json.put("ExportTrainingData", true);

			// Write JSON to file (pretty-printed with indent=4)
			try (FileWriter writer = new FileWriter(configFile))
			{
				writer.write(json.toString(4));
			}

		} catch (IOException e)
		{
			e.printStackTrace();
		}
	}

	private static JSONArray toJSONArray(int[] arr)
	{
		if (arr == null)
			return new JSONArray();
		JSONArray jsonArr = new JSONArray();
		for (int val : arr)
		{
			jsonArr.put(val);
		}
		return jsonArr;
	}

	private static JSONArray to2DJSONArray(int[][] arr)
	{
		if (arr == null)
			return new JSONArray();
		JSONArray jsonArr = new JSONArray();
		for (int[] row : arr)
		{
			jsonArr.put(toJSONArray(row));
		}
		return jsonArr;
	}

	private static int[] toIntArray(JSONArray jsonArr)
	{
		if (jsonArr == null)
			return null;
		int[] arr = new int[jsonArr.length()];
		for (int i = 0; i < jsonArr.length(); i++)
		{
			arr[i] = jsonArr.optInt(i, 0);
		}
		return arr;
	}

	private static int[][] toInt2DArray(JSONArray jsonArr)
	{
		if (jsonArr == null)
			return null;
		int[][] arr = new int[jsonArr.length()][];
		for (int i = 0; i < jsonArr.length(); i++)
		{
			JSONArray row = jsonArr.optJSONArray(i);
			arr[i] = toIntArray(row);
		}
		return arr;
	}

	public static String getNeuronStimulationsString(int[][] neuronStim1)
	{
		if (neuronStim1 == null || neuronStim1.length == 0)
		{
			return "";
		}

		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < neuronStim1.length; i++)
		{
			int lower = neuronStim1[i][0];
			int upper = neuronStim1[i][1];
			sb.append(lower).append("-").append(upper);
			if (i < neuronStim1.length - 1)
			{
				sb.append("_");
			}
		}
		return sb.toString();
	}
}
