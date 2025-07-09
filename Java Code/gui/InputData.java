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

package com.uniSaarland_CIPMM.ivea.gui;

import java.awt.Image;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.SwingUtilities;

import ij.ImagePlus;
import ij.measure.Measurements;
import ij.measure.ResultsTable;
import ij.plugin.filter.Analyzer;
import loci.formats.FormatException;
import loci.formats.ImageReader;
import loci.formats.MetadataTools;
import loci.formats.meta.IMetadata;
import ome.units.quantity.Length;
import ome.units.quantity.Time;

public class InputData
{

	boolean Cancel = false;
	JFrame frame = new JFrame();
	JButton CancelButton;
	JLabel progressStatusLabel = new JLabel();
	JLabel loaderImg = new JLabel("");
	private ArrayList<String> FilePath;
	private double ResolutionX;
	private double ResolutionY;
	private double ResolutionZ;
	private int nChannels;
	private int zSlices;
	private int nFrames;
	private String Unit;
	private double time;

	public InputData()
	{

	}

	public InputData(String path, IVEAsetup.ImportType DataType) throws Exception
	{
		switch (DataType)
		{
		case Vi:
			FilePath = CheckVideo(path);
			break;
		case MVi:
			FilePath = CheckForVideos(path);
			break;
		default:
			break;
		}
	}

	public ArrayList<String> GetListofFiles()
	{
		return FilePath;
	}

	public double[] GetResolutionsXYZ()
	{
		double[] args = { ResolutionX, ResolutionY, ResolutionZ };
		return args;
	}

	public int GetnChannels()
	{
		return nChannels;
	}

	public int GetzSlices()
	{
		return zSlices;
	}

	public int GetnFrames()
	{
		return nFrames;
	}

	public String GetUnit()
	{
		return Unit;
	}

	public double GetTime()
	{
		return time;
	}

	public ArrayList<String> CheckVideo(String Path) throws Exception
	{
		ArrayList<String> FilePath = new ArrayList<String>();
		initialiseReader IR = new initialiseReader(Path);
		ImageReader reader = IR.getReader();
		IMetadata omeMeta = IR.getIMetadata();

		int width = reader.getSizeX();
		int height = reader.getSizeY();
		int temp = reader.getImageCount();

		if (temp >= 3)
		{
			GetImportantValues(omeMeta);
			int[] Values = { 0, 0, (int) Math.floor(width), (int) Math.floor(height / 12), 0 };
			IVEAsetup.CropMaskListValues.add(Values);
			FilePath.add(Path);
			IVEAsetup.StackLength = temp;
			IVEAsetup.CropMaskListGUI.add(Values[0] + "," + Values[1] + "," + Values[2] + "," + Values[3]);
			IVEAsetup.UpdateCropMaskListGUI();
		}
		return FilePath;
	}

	public ArrayList<String> CheckForVideos(String Path) throws Exception
	{
		ArrayList<String> FilesPath = new ArrayList<String>();
		ArrayList<File> files = new ArrayList<File>();
		GetFiles(Path, files);
		int count = 0;
		SwingUtilities.invokeLater(new Runnable()
		{
			public void run()
			{
				ShowProgressBarWindow();
			}
		});
		for (int i = 0; i < files.size(); i++)
		{
			if (Cancel)
			{
				FilesPath.clear();
				break;
			}
			boolean isImage = files.get(i).getPath().endsWith(".tiff") || files.get(i).getPath().endsWith(".tif")
					|| files.get(i).getPath().endsWith(".czi") || files.get(i).getPath().endsWith(".lsm")
					|| files.get(i).getPath().endsWith(".lif") || files.get(i).getPath().endsWith(".stk")
					|| files.get(i).getPath().endsWith(".tf2") || files.get(i).getPath().endsWith(".msr")
					|| files.get(i).getPath().endsWith(".ndr");

			if (files.get(i).length() > 100000 && isImage)
			{
				// FilesPath.add(files.get(i).getPath());
				initialiseReader IR = new initialiseReader(files.get(i).getPath());
				ImageReader reader = null;
				try
				{
					reader = IR.getReader();
				} catch (Exception e)
				{

				}
//				IMetadata omeMeta = IR.getIMetadata();
				int width = reader.getSizeX();
				int height = reader.getSizeY();
				int temp = reader.getImageCount();
				if (temp >= 3)
				{
					if (count == 0)
					{
						IMetadata omeMeta = IR.getIMetadata();
						zSlices = reader.getSizeZ();
						nChannels = reader.getSizeC();
						GetImportantValues(omeMeta);
					}
					int[] Values = { 0, 0, (int) Math.floor(width), (int) Math.floor(height / 12), 0 };
					if (IVEAsetup.CropMaskListValues.size() == 1 && count == 0)
					{
						IVEAsetup.CropMaskListValues.set(count, Values);
					} else
					{
						IVEAsetup.CropMaskListValues.add(Values);
					}
					FilesPath.add(files.get(i).getPath());
					if (count == 0)
					{
						IVEAsetup.StackLength = temp;
					}
					IVEAsetup.CropMaskListGUI.add(Values[0] + "," + Values[1] + "," + Values[2] + "," + Values[3]);
					IVEAsetup.UpdateCropMaskListGUI();
					count++;
				}
			}
			if (files.size() > 1 && i == files.size() - 1)
			{
				progressStatusLabel.setText("Done!");
				loaderImg.setVisible(false);
				CancelButton.setText("Close");
			}
		}
		Thread.sleep(200);
		frame.dispose();
		return FilesPath;
	}

	// ======================= Get Metadata =======================
	private void GetImportantValues(IMetadata omeMeta)
	{
		Length dpiX = omeMeta.getPixelsPhysicalSizeX(0);
		Length dpiY = omeMeta.getPixelsPhysicalSizeY(0);
		Length dpiZ = omeMeta.getPixelsPhysicalSizeZ(0);
		Time tempx = null;
		nChannels = omeMeta.getChannelCount(0);
		try
		{
			tempx = omeMeta.getPlaneDeltaT(0, nChannels);
			if ((double) tempx.value() == 0)
			{
				tempx = omeMeta.getPlaneDeltaT(0, nChannels + 1);
			}
		} catch (Exception e)
		{
			System.out.println("no timestamp detected!");
		}
		ResolutionX = dpiX == null ? 1 : (double) dpiX.value();
		ResolutionY = dpiY == null ? 1 : (double) dpiY.value();
		ResolutionZ = dpiZ == null ? 1 : (double) dpiZ.value();
		time = tempx == null ? 1 : (double) tempx.value();
		time = time == 0 ? 1 : time;
	}

	// ======================= end =======================
	// ======================= Crop Mask Creation =======================
	public int[] GetCropMaskPosition(ImagePlus imp, int userIn)
	{
		int width = imp.getWidth();
		int height = imp.getHeight();
		int[] Results = new int[5];
		int y = height - (int) Math.floor(height / 12);
		int x = 0;
		int[] Values1 = { x, y, (int) Math.floor(width), (int) Math.floor(height / 12), userIn };
		int[] Values2 = { x, 0, (int) Math.floor(width), (int) Math.floor(height / 12), userIn };
		Double Mean1 = GetStackMean(imp, Values1, 1);
		Double Mean2 = GetStackMean(imp, Values2, 1);
		if (Mean1 < Mean2)
		{
			Results = Values1;
		} else
		{
			Results = Values2;
		}
		return Results;
	}

	public Double GetStackMean(ImagePlus imp, int[] Mask, int frame)
	{
		Double FinalValues = 0.0;
		ResultsTable rtTemp = new ResultsTable();
		ImagePlus impTemp = new ImagePlus("Slice_" + Integer.toString(frame), imp.getStack().getProcessor(frame));
		impTemp.setRoi(Mask[0], Mask[1], Mask[2], Mask[3]);
		impTemp.updateAndDraw();
		int measurements = Measurements.MEAN;
		Analyzer analyzerTemp = new Analyzer(impTemp, measurements, rtTemp);
		analyzerTemp.measure();
		FinalValues = rtTemp.getValue("Mean", 0);
		impTemp.changes = false;
		impTemp.close();
		return FinalValues;
	}
	// ======================= Crop Mask Creation =======================

	public void GetFiles(String Path, ArrayList<File> files)
	{
		File directory = new File(Path);
		File[] fList = directory.listFiles();
		if (fList != null)
		{
			for (File file : fList)
			{
				if (file.isFile())
				{
					files.add(file);
				} else if (file.isDirectory())
				{
					GetFiles(file.getAbsolutePath(), files);
				}
			}
		}
	}

	public void printLine(ArrayList<String> data)
	{
		for (int i = 0; i < data.size(); i++)
		{
			System.out.println(data.get(i));
		}
	}

	private void ShowProgressBarWindow()
	{
		frame.setVisible(true);
		frame.setResizable(false);
		progressStatusLabel.setText("Importing videos please wait...");
		frame.setBounds(100, 100, 320, 120);
		frame.getContentPane().setLayout(null);
		frame.setTitle("Status Window");

		ClassLoader cl = this.getClass().getClassLoader();
		ImageIcon mainWindowIcon = new ImageIcon(cl.getResource("IVEA_logo_x128.png"));
		frame.setIconImage(mainWindowIcon.getImage());

		JLabel LoaderImg = new JLabel(" ");
		frame.getContentPane().add(LoaderImg);

		CancelButton = new JButton("Cancel");
		CancelButton.setBounds(107, 61, 89, 23);
		frame.getContentPane().add(CancelButton);
		// progressStatusLabel = new JLabel("Processing data please wait...");
		progressStatusLabel.setBounds(25, 36, 207, 14);
		frame.getContentPane().add(progressStatusLabel);

		Image img = new ImageIcon(cl.getResource("loading_32px.gif")).getImage();
		loaderImg.setIcon(new ImageIcon(img));
		loaderImg.setBounds(206, 22, 45, 45);
		frame.getContentPane().add(loaderImg);

		CancelButton.addMouseListener(new MouseAdapter()
		{
			@Override
			public void mouseClicked(MouseEvent arg0)
			{
				Cancel = true;
				frame.dispose();
			}
		});
		frame.setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
		frame.addWindowListener(new WindowAdapter()
		{
			public void windowClosing(WindowEvent e)
			{
				Cancel = true;
				// progressStatusLabel.setText("Canceling in progress...");
				frame.dispose();
			}
		});
	}

	public void CheckImage(ImagePlus Img)
	{
		int width = Img.getWidth();
		int height = Img.getHeight();
		int[] Values = { 0, 0, (int) Math.floor(width), (int) Math.floor(height / 12), 0 };
		IVEAsetup.CropMaskListValues.add(Values);
		IVEAsetup.CropMaskListGUI.add(Values[0] + "," + Values[1] + "," + Values[2] + "," + Values[3]);
		IVEAsetup.UpdateCropMaskListGUI();
	}

	void printArray(int[] data)
	{
		for (int i = 0; i < data.length; i++)
		{
			System.out.println(data[i]);
		}
	}

	// ======================= #Region Classes =======================
	final class initialiseReader
	{
		private final String fileName;
		private final ImageReader reader = new ImageReader();
		private IMetadata omeMeta;

		public initialiseReader(String Filename) throws FormatException, IOException
		{
			this.fileName = Filename;
			omeMeta = MetadataTools.createOMEXMLMetadata();
			reader.setMetadataStore(omeMeta);
			try
			{
				reader.setId(fileName);
			} catch (Exception e)
			{
				return;
//				IJ.log("Bio-Formats, reading parent file path error, please change file path");
			}
			reader.setSeries(0);
		}

		public ImageReader getReader()
		{
			return reader;
		}

		public IMetadata getIMetadata()
		{
			return omeMeta;
		}
	}

	public static String[] getLineInputFromFile(String filePath, int lineNumber)
	{
		List<String> lines = new ArrayList<>();

		try (BufferedReader reader = new BufferedReader(new FileReader(filePath)))
		{
			String line;
			while ((line = reader.readLine()) != null)
			{
				lines.add(line);
			}
		} catch (IOException e)
		{
			e.printStackTrace();
		}

		if (lineNumber < 1 || lineNumber > lines.size())
		{
			throw new IllegalArgumentException("Invalid line number: " + lineNumber);
		}
		String[] data = new String[lines.size()];
		for (int i = 0; i < lines.size(); i++)
		{
			data[i] = lines.get(i);
		}
		return data;
	}

}