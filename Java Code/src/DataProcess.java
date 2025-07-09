package com.uniSaarland_CIPMM.ivea;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Map;
import java.util.OptionalInt;
import java.util.stream.IntStream;

import com.opencsv.CSVWriter;
import com.uniSaarland_CIPMM.ivea.gui.IVEAsetup;

import ij.IJ;
import ij.ImagePlus;
import ij.Prefs;
import ij.gui.Roi;
import ij.measure.Measurements;
import ij.measure.ResultsTable;
import ij.plugin.filter.Analyzer;
import ij.plugin.filter.ThresholdToSelection;
import ij.plugin.frame.RoiManager;
import ij.process.ImageProcessor;

public class DataProcess
{
//	public static int ExoFrame;
	// ---------------- Sorting and pulling Mapped Data ----------------
	public int[][][] ProcessData(Map<Integer, int[]> map, int SpotCount)
	{
		int[] PixelsInSpot = new int[SpotCount];
		for (int[] entries : map.values())
		{
			for (int k = 0; k < SpotCount; k++)
			{
				if (entries[2] == k)
				{
					PixelsInSpot[k]++;
					break;
				}
			}
		}
		// SpotsCoordinates: Spot Number, Pixel Number, Pixel Coordinates (X, Y).
		int[][][] SpotsCoordinates = new int[SpotCount][][];

		IntStream.range(0, SpotCount).parallel().forEach(k ->
		{
			int[][] PixelsCount = new int[PixelsInSpot[k]][2];
			int loopNum = 0;
			for (int[] entries : map.values())
			{
				if (entries[2] == k)
				{
					PixelsCount[loopNum][0] = entries[0];
					PixelsCount[loopNum][1] = entries[1];
					loopNum++;
				}
			}
			SpotsCoordinates[k] = PixelsCount;
		});
		return SpotsCoordinates;
	}

	public double[][] GetBoundaries(int[][][] SpotsCoordinates, int Spots)
	{
		double[][] Result = new double[Spots][];
		IntStream.range(0, Spots).parallel().forEach(t ->
		{
			double iMin = 0, iMax = 0, jMin = 0, jMax = 0;

			for (int k = 0; k < SpotsCoordinates[t].length; k++)
			{
				int[] TempArray = SpotsCoordinates[t][k];
				if (k == 0)
				{
					iMin = TempArray[0];
					iMax = TempArray[0];
					jMin = TempArray[1];
					jMax = TempArray[1];
				} else
				{
					if (iMin > TempArray[0])
					{
						iMin = TempArray[0];
					}
					if (iMax < TempArray[0])
					{
						iMax = TempArray[0];
					}
					if (jMin > TempArray[1])
					{
						jMin = TempArray[1];
					}
					if (jMax < TempArray[1])
					{
						jMax = TempArray[1];
					}
				}
			}
			double centerX = (jMax + jMin) / 2;
			double centerY = (iMax + iMin) / 2;
			double[] Coordinates = { jMin, iMin, jMax - jMin, iMax - iMin, centerX, centerY };
			Result[t] = Coordinates;
		});
		return Result;
	}

	public void AnalyzeSpots(ImagePlus imp, int[][][] SpotsCoordinates, RoiManager MaskROI, int SpotsNum, int SelectionEnlarge, int frame)
	{
		int w = imp.getWidth();
		int h = imp.getHeight();
		final int value = IVEAsetup.EclipseColorValue;
		final String ImgColor = IVEAsetup.EclipseColor;
		Roi[] tempMaskROI = new Roi[SpotsNum];

		if (SpotsNum > 0)
		{
			IntStream.range(0, SpotsNum).parallel().forEach(t ->
			{
				ImagePlus BW = IJ.createImage("BW", "8-bit " + ImgColor, w, h, 1); // black for ImageJ white for eclipse
				ImageProcessor ip = BW.getProcessor();
				int i = t;
				int L_ = SpotsCoordinates[i].length;
				IntStream.range(0, L_).parallel().forEach(k ->
				{
					int[] TempArray = SpotsCoordinates[i][k];
					ip.putPixel(TempArray[1], TempArray[0], value); // 0 for eclipse
				});
				Prefs.blackBackground = true;
				IJ.run(BW, "Convert to Mask", "");
				Roi roi = ThresholdToSelection.run(BW);
				BW.setRoi(roi);
				IJ.run(BW, "Enlarge...", "enlarge=" + (SelectionEnlarge));
				tempMaskROI[t] = BW.getRoi();
				BW.changes = false;
				BW.close();
			});

			imp.setSlice(frame);
			for (int t = 0; t < SpotsNum; t++)
			{
				MaskROI.add(imp, tempMaskROI[t], t);
				imp.setRoi(tempMaskROI[t]);
				MaskROI.select(t);
				MaskROI.runCommand(imp, "Update");
				IJ.run(imp, "Select None", "");
			}
		}

	}

	public void InvertImage(ImageProcessor ip)
	{
		int width = ip.getWidth();
		int height = ip.getHeight();
		byte[] PixelsValues = (byte[]) ip.getPixels();
		IntStream.range(0, height).parallel().forEach(j ->
		{
			IntStream.range(0, width).parallel().forEach(k ->
			{
				int value = PixelsValues[k + width * j] & 0xff;
				if (value == 255)
				{
					ip.putPixel(k, j, 0);
				} else
				{
					ip.putPixel(k, j, 255);
				}
			});
		});
	}

	public Double[] GetValuableData(int frame, int SpotID, double[] Center, double Area, double Mean, double BGMean, double Max)
	{
		// ValuableData: frame, spotID, x, y, area, mean, BGmean, Max
		Double[] ValuableData = new Double[9];
		ValuableData[0] = frame + 0.0;
		ValuableData[1] = SpotID + 0.0;
		ValuableData[2] = Center[0];
		ValuableData[3] = Center[1];
		ValuableData[4] = Area;
		ValuableData[5] = Mean;
		ValuableData[6] = BGMean;
		ValuableData[7] = Max + 0.0;
		return ValuableData;
	}

	// ======================== ========================
	// ======================== #Region Tracking Events ========================
	public int getEventIDdop(double[] Center, Map<Integer, EventTracking> eTrackMap, Roi roi, int SearchRadius, int frame)
	{
		int SpotID = 0;
		if (eTrackMap.size() == 0)
		{
			EventTracking eMap = new EventTracking();
			eMap.setID(0);
			eMap.AddRoi(roi, frame);
			eMap.AddCenter(Center[0], Center[1]);
			eMap.setFlag(-10);
			eTrackMap.put(0, eMap);
		} else
		{
			int length = eTrackMap.size();
			double[] AllDistances = new double[length];
			IntStream.range(0, length).parallel().forEach(i ->
			{
				EventTracking eMap = eTrackMap.get(i);
				double[] point = eMap.getCenter(-1);
				double distance = Math.sqrt(Math.pow(Center[0] - point[0], 2) + Math.pow(Center[1] - point[1], 2));
				if (distance <= SearchRadius)
				{
					AllDistances[i] = distance;
				} else
				{
					AllDistances[i] = -1;
				}
			});
			int counter = 0; // get the nearest distance first.
			int Xmin = (int) GetIndex(length, AllDistances, counter)[0];
			boolean addnew = true;
			while (Xmin != -1) // loop through detected distances.
			{
				SpotID = Xmin; // Xmin is the ID of the current distance.
				EventTracking eMap = eTrackMap.get(SpotID);
				if (!eMap.containsFrame(frame)) // if exist continue looping.
				{
					eMap.AddRoi(roi, frame);
					eMap.AddCenter(Center[0], Center[1]);
					eMap.setFlag(-10);
//					eTrackMap.put(SpotID, eMap);
					addnew = false;
					Xmin = -1;
				} else
				{
					counter++; // increment index
					Xmin = (int) GetIndex(length, AllDistances, counter)[0];
				}
			}
			if (addnew)
			{
				SpotID = eTrackMap.size();
				EventTracking eMap = new EventTracking();
				eMap.setID(SpotID);
				eMap.AddRoi(roi, frame);
				eMap.AddCenter(Center[0], Center[1]);
				eMap.setFlag(-10);
				eTrackMap.put(SpotID, eMap);
			}
		}
		return SpotID;
	}

	public int getEventIDNeurons(double[] Center, Map<Integer, EventTracking> eTrackMap, Roi roi, double areaMu, int SearchRadius,
			int frame,
			int deltaFrame, boolean StimLock, int StimCounter)
	{
		int length = eTrackMap.size();
		int SpotID = length;
		if (eTrackMap.size() == 0)
		{
			EventTracking eMap = new EventTracking();
			eMap.setID(0);
			eMap.AddRoi(roi, frame);
			eMap.setFirstFrame(frame);
			eMap.AddCenter(Center[0], Center[1]);
			eMap.setFlag(-10);
			eMap.setAreaIntensityRecorded(areaMu);
			if (StimLock)
			{
				eMap.setStimulationID(StimCounter);
			}
			eTrackMap.put(0, eMap);
		} else
		{
			double[] Vx = new double[length];
			OptionalInt minIndex = IntStream.range(0, Vx.length).parallel().map(i ->
			{
				EventTracking eMap = eTrackMap.get(i);
				double spawnTime = Math.abs(eMap.getFirstFrame() - frame);
				double[] point = eMap.getCenter(0);
				double distance = Math.sqrt(Math.pow(Center[0] - point[0], 2) + Math.pow(Center[1] - point[1], 2));
				if (distance <= SearchRadius && spawnTime <= (41)) // 31 is the LSTM measurement frames
				{
					Vx[i] = distance;
				} else
				{
					Vx[i] = -1;
				}
				return i;
			}).filter(j -> Vx[j] != -1).min();
			if (minIndex.isPresent())
			{
				int index = minIndex.getAsInt();
				EventTracking eMap = eTrackMap.get(index);
				if (areaMu > eMap.getAreaIntensityRecorded())
				{
					eMap.setAreaIntensityRecorded(areaMu);
					eMap.replaceCenter((int) Center[0], (int) Center[1], 0);
				}
			} else
			{
				EventTracking eMap = new EventTracking();
				eMap.setID(SpotID);
				eMap.AddRoi(roi, frame);
				eMap.setFirstFrame(frame);
				eMap.AddCenter(Center[0], Center[1]);
				eMap.setFlag(-10);
				if (StimLock)
				{
					eMap.setStimulationID(StimCounter);
				}
				eTrackMap.put(SpotID, eMap);
				eMap.setAreaIntensityRecorded(areaMu);
			}
		}
		return SpotID;
	}

	public int[] checkDualID(Map<Integer, EventTracking> eTrackMap, int SearchRadius)
	{
		int length = eTrackMap.size();
		int CountAllStim = 0;
		int countStim0 = 0;
		int[] args = new int[2];
		for (int i = 0; i < length; i++)
		{
			EventTracking eMap = eTrackMap.get(i);
			double[] CenterA = eMap.getCenter(0);
			if (eMap.getDualID() == -1 && eMap.getFlagPrint())
			{
				eMap.setID(CountAllStim);
				if (eMap.getStimulationID() == 0)
				{
					eMap.setIndexSim0(countStim0);
					countStim0++;
				}
				IntStream.range(i + 1, length).parallel().forEach(j ->
				{
					EventTracking eSubMap = eTrackMap.get(j);
					if (eSubMap.getDualID() == -1)
					{
						double[] CenterB = eSubMap.getCenter(0);
						double distance = Math.sqrt(Math.pow(CenterB[0] - CenterA[0], 2) + Math.pow(CenterB[1] - CenterA[1], 2));
						if (distance <= SearchRadius)
						{
							eSubMap.setDualID(eMap.getID());
						}
					}
				});
				CountAllStim++;
			}
		}
		args[0] = CountAllStim;
		args[1] = countStim0;
		return args;
	}

	// Priority for first detection.
	public double[] GetIndex(int length, double[] AllDistances, int index)
	{
		double Xmin = -1;
		double dist = 1000;
		ArrayList<Double[]> Vx = new ArrayList<>();
		for (int i = 0; i < length; i++)
		{
			if (AllDistances[i] != -1)
			{
				Double[] temp = { AllDistances[i], i + 0.0 };
				Vx.add(temp);
			}
		}
		if (Vx.size() != 0)
		{
			double[][] Vy = new double[Vx.size()][2];
			int L_ = Vy.length;
			for (int i = 0; i < L_; i++)
			{
				Vy[i][0] = (double) Vx.get(i)[0];
				Vy[i][1] = (double) Vx.get(i)[1];
			}
			if (L_ > 1)
			{
				LocalMath lm = new LocalMath();
				lm.sortbyColumn(Vy, 0, true);
			}
			if (index < L_)
			{
				Xmin = Vy[index][1];
				dist = Vy[index][0];
			}
		}
		double[] result = { Xmin, dist };
		return result;
	}
	// ======================== #Region End ========================
	// ======================== ========================

	// ======================== ========================
	public ArrayList<Double[]> GetDataSummary(ArrayList<Double[]> DataFull, int SpotMax, int FPS)
	{
		// DataReturn: SpotID, x, y, start frame, last frame, length, time, peak.
		ArrayList<Double[]> DataReturn = new ArrayList<Double[]>(); // Final Sorting.
		int ArraySize = 0;
		for (int i = 0; i < SpotMax; i++)
		{
			boolean Sequent = false;
			for (int j = 0; j < DataFull.size(); j++)
			{
				Double[] Nframe = DataFull.get(j);
				if (Nframe[1] == i)
				{
					if (!Sequent)
					{
						// (0|1)-(1|2)-(2|3)-(s3|0)-(e4|0)-(s-e)-(s-e*1000/15)-(7|7)
						BigDecimal EventTime = new BigDecimal(1000.0 / FPS).setScale(3, RoundingMode.HALF_UP);
						Double[] Trans = { DataFull.get(j)[1], DataFull.get(j)[2], DataFull.get(j)[3], DataFull.get(j)[0],
									DataFull.get(j)[0], 1.0, EventTime.doubleValue(), DataFull.get(j)[7], DataFull.get(j)[0] };
						DataReturn.add(Trans);
						Sequent = true;
						if (i > 0)
						{
							ArraySize++;
						}
					} else
					{
						Double[] Pframe = DataReturn.get(ArraySize);
						if (Pframe[4] + 1 == Nframe[0])
						{
							BigDecimal EventTime = new BigDecimal((DataFull.get(j)[0] - DataReturn.get(ArraySize)[3]) * 1000 / FPS)
									.setScale(3, RoundingMode.HALF_UP);
							Double Max = Pframe[7];
							Double FramePeak = Pframe[8];
							if (Max < DataFull.get(j)[7])
							{
								Max = DataFull.get(j)[7];
								FramePeak = DataFull.get(j)[0];
							}
							Double[] Trans = { DataReturn.get(ArraySize)[0], DataReturn.get(ArraySize)[1], DataReturn.get(ArraySize)[2],
										DataReturn.get(ArraySize)[3], DataFull.get(j)[0], DataFull.get(j)[0] - DataReturn.get(ArraySize)[3],
										EventTime.doubleValue(), Max, FramePeak };
							DataReturn.set(ArraySize, Trans);
						} else
						{
							BigDecimal EventTime = new BigDecimal(1000.0 / FPS).setScale(3, RoundingMode.HALF_UP);
							Double[] Trans = { DataFull.get(j)[1], DataFull.get(j)[2], DataFull.get(j)[3], DataFull.get(j)[0],
										DataFull.get(j)[0], 1.0, EventTime.doubleValue(), DataFull.get(j)[7], DataFull.get(j)[0] };
							DataReturn.add(Trans);
							ArraySize++;
						}
					}
				}
			}
		}
		return DataReturn;
	}

	// ======================== ========================
	// ======================== #Function Saving Rois ========================
	public Double[][] EventMeanOverTime(ImagePlus imp, Map<Integer, EventTracking> eMap, double[][] Cmean, int totalFrames,
			String roiMaskPath, int MinClusterID, boolean OneVideo)
	{
		int SpotIDMax = eMap.size();

		Double[][] GraphData = new Double[SpotIDMax + 1][totalFrames];
		ResultsTable rtTemp = new ResultsTable();
		RoiManager FinalRoi = new RoiManager();
		int count = 0;
		for (int j = 0; j < SpotIDMax; j++) // note must be dependent on entries not index!
		{
			EventTracking eT = eMap.get(j);
			if (eT.getFlagPrint())
			{
				Roi roi = eT.getLargesRoi();
				int fFrame = eT.getFirstFrame();
				imp.setSlice(fFrame);
				IJ.run(imp, "Select None", "");
				imp.setRoi(roi);
				roi.setName("event {" + count + "} | frame " + fFrame + " -- x" + eT.getDetectionCount());
				FinalRoi.add(imp, roi, count);
				imp.setRoi(roi);
				FinalRoi.select(count);
				FinalRoi.runCommand(imp, "Update");
				IJ.run(imp, "Select None", "");
				count++;
			}
		}
		// ---------- deleting overlapping ROIs ----------
		if (FinalRoi.getCount() > 0)
		{
			LocalMath LM = new LocalMath();
			FinalRoi = LM.ProcessOverLappingRois(FinalRoi, eMap);
			FinalRoi.runCommand("Save", roiMaskPath + File.separator + "0.All Max ROIs.zip");
			if (!OneVideo)
			{
				FinalRoi.reset();
				FinalRoi.close();
			}
			// ---------- end ----------

			for (int i = 0; i < totalFrames; i++)
			{
				imp.setSlice(i + 1);
				// ---------- Calculating BG Mean ----------
				double BGMean = Cmean[i][MinClusterID];
				// ---------- end ----------
				count = 0;
				for (int j = 0; j < SpotIDMax; j++)
				{
					EventTracking eT = eMap.get(j);
					if (eT.getFlagPrint())
					{
						imp.setRoi(eT.getLargesRoi());
						int measurements = Measurements.MEAN;
						Analyzer analyzer = new Analyzer(imp, measurements, rtTemp);
						analyzer.measure();
						Double Mean = rtTemp.getValue("Mean", count) - BGMean;
						GraphData[j][i] = Mean;
						imp.deleteRoi();
						count++;
					}
				}
				GraphData[SpotIDMax][i] = BGMean;
				rtTemp.reset();
			}
			return GraphData;
		} else
		{
			return null;
		}
	}
	// ======================== #End ========================
	// ======================== ========================

	public void PrintDataCSV(Double[][] GraphData, Map<Integer, EventTracking> eMap, String FolderPath, String title, boolean printDuration)
	{
		int SpotMax = eMap.size();
		// ---------- Writing Detection Info ----------
		if (printDuration)
		{
			String ContinuityDataPath = FolderPath + File.separator + "0." + title + "- Durations Data.csv";
			File ContinuityDataFile = new File(ContinuityDataPath);
			try
			{
				FileWriter outputfile = new FileWriter(ContinuityDataFile);
				CSVWriter writer = new CSVWriter(outputfile);
				String[] header = new String[SpotMax];
				for (int i = 0; i < header.length; i++)
				{
					header[i] = "Event " + i;
				}
				writer.writeNext(header);

				int L_max = 0;
				for (int i = 0; i < SpotMax; i++)
				{
					EventTracking eT = eMap.get(i);
					int L_ = eT.getContinuousFrames().size();
					if (L_max < L_)
					{
						L_max = L_;
					}
				}
				String[][] ContinuityArray = new String[L_max][SpotMax];
				for (int j = 0; j < L_max; j++)
				{
					for (int i = 0; i < SpotMax; i++)
					{
						EventTracking eT = eMap.get(i);
						ArrayList<int[]> temp = eT.getContinuousFrames();
						ContinuityArray[j][i] = "";
						if (j < temp.size())
						{
							ContinuityArray[j][i] = "{" + temp.get(j)[0] + "}" + temp.get(j)[1];
						}
					}
				}
				for (int j = 0; j < L_max; j++)
				{
					writer.writeNext(ContinuityArray[j]);
				}
				writer.close();
			} catch (Exception e)
			{
				e.printStackTrace();
			}
		}
		// ---------- end ----------

		String GraphDataPath = FolderPath + File.separator + "0." + title + "-Graph Data.csv";
		File GraphDataFile = new File(GraphDataPath);
		try
		{
			FileWriter outputfile = new FileWriter(GraphDataFile);
			CSVWriter writer = new CSVWriter(outputfile);
			int headerLength = SpotMax + 2;
			String[] header = new String[headerLength];
			header[0] = "Frame";
			int EventCount = 0;
			for (int i = 1; i < header.length - 1; i++)
			{
				header[i] = "Event " + EventCount;
				EventCount++;
			}
			header[header.length - 1] = "BG Mean";
			writer.writeNext(header);
			for (int i = 0; i < GraphData[0].length; i++)
			{
				int count = 0;
				String[] rowData = new String[headerLength];
				rowData[0] = Double.toString(i + 1);
				for (int j = 0; j < SpotMax; j++)
				{
					EventTracking Ei = eMap.get(j);
					if (Ei.getFlagPrint()) // filter the excluded events.
					{
						rowData[count + 1] = Double.toString(GraphData[j][i]);
					}
					count++;
				}
				rowData[count + 1] = Double.toString(GraphData[SpotMax][i]); // Background mean intensity
				writer.writeNext(rowData);
			}
			writer.close();
		} catch (IOException e)
		{
			e.printStackTrace();
		}
	}

	public void ClearBoundries(ImageProcessor ip, int boundry, int width, int height)
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

	public void printLine(ArrayList<Double[]> data)
	{
		for (int i = 0; i < data.size(); i++)
		{
			Double[] temp = data.get(i);
			System.out.println(java.util.Arrays.toString(temp));
		}
	}

	public void PrintLogFile(String OutDir, ArrayList<String> LogFile) throws IOException
	{
		FileWriter LogF = new FileWriter(OutDir + File.separator + "Log file.txt");

		for (int i = 0; i < LogFile.size(); i++)
		{
			LogF.write(LogFile.get(i) + "\n");
		}
		LogF.close();
	}

	public void printLineString(String[] continuityArray)
	{
		for (int i = 0; i < continuityArray.length; i++)
		{
			System.out.print(continuityArray[i] + ",");
		}
		System.out.println("");
	}
}
