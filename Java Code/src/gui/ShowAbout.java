package com.uniSaarland_CIPMM.ivea.gui;

import ij.IJ;
import ij.ImagePlus;
import ij.plugin.PlugIn;

public class ShowAbout implements PlugIn
{
	protected ImagePlus image;

	public void run(String arg)
	{
		showAbout();
	}

	public void showAbout()
	{
		IJ.showMessage("IVEA",
				"IVEA is an open-source Fiji plugin that employs artificial intelligence to detect and analyze exocytosis. \n "
						+ "Author: Eng. Abed Chouaib, Supervisor: Dr. Ute Becherer | University of Saarlandn CIPMM\n"
						+ "                           Supervisor: Dr. Ali Shaib | University Medical Center Göttingen");
	}
	// =========================== End ===========================
}
