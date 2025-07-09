package com.uniSaarland_CIPMM.ivea.gui;

import java.awt.Button;
import java.awt.FlowLayout;
import java.awt.Label;
import java.awt.Panel;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;

import ij.IJ;
import ij.gui.GenericDialog;

public class CustomModelDialog
{

	private String ModelDirectory;
	private int FirstNclasses;
	private boolean UseCustomModel;
	private boolean exportTrainingData;

	public boolean showDialog(String Mdir, int FNC, boolean UCM, boolean ETC)
	{
		GenericDialog gd = new GenericDialog("Custom Model");

		ClassLoader cl = CustomModelDialog.class.getClassLoader();
		ImageIcon mainWindowIcon = new ImageIcon(cl.getResource("IVEA_logo_x128.png"));
		gd.setIconImage(mainWindowIcon.getImage());

		gd.addNumericField("Predict first n classes:", FNC, 0);
		gd.addCheckbox("Use custom model", UCM);
		gd.addCheckbox("Export training data", ETC);
		Panel panel = new Panel(new FlowLayout(FlowLayout.LEFT));

		Label label = new Label("Import Model: " + Mdir);
		panel.add(label);

		Button browseButton = new Button(" Browse ");
		browseButton.addActionListener(new ActionListener()
		{
			@Override
			public void actionPerformed(ActionEvent e)
			{
				String directory = IJ.getDirectory("Select Model Folder...");
				if (directory != null)
				{
					ModelDirectory = directory;
					label.setText(ModelDirectory);
				}
			}
		});
		panel.add(browseButton);
		gd.addPanel(panel);
		gd.showDialog();
		if (gd.wasCanceled())
		{
			return false;
		}
		FirstNclasses = (int) gd.getNextNumber();
		UseCustomModel = gd.getNextBoolean();
		exportTrainingData = gd.getNextBoolean();
		return true;
	}

	public String getModelDirectory()
	{
		return ModelDirectory;
	}

	public int getNumericValue()
	{
		return FirstNclasses;
	}

	public boolean isUseCustomModel()
	{
		return UseCustomModel;
	}

	public boolean isExportTrainingData()
	{
		return exportTrainingData;
	}
}