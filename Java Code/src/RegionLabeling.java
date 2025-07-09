package com.uniSaarland_CIPMM.ivea;

import java.util.HashMap;
import java.util.Map;

import ij.IJ;
import ij.process.ImageProcessor;

public class RegionLabeling
{
	public enum Directions
	{
		E, SE, S, SW, W, NW, N, NE
	}

	public static int ThreshValue;
	public int LabelCount;

	/**
	 * Count and label events inside an image.
	 * <p>
	 * LabelRegions returns an Integer HashMap with possible events as array of
	 * integers {x,y,label}.
	 * </p>
	 * 
	 * @param ip          ImageProcessor of an ImagePluse.
	 * @param ShowMessage boolean, show debug message if true otherwise hide.
	 */
	public Map<Integer, int[]> LabelRegions(ImageProcessor ip, boolean ShowMessage)
	{
		int _W = ip.getWidth();
		int _H = ip.getHeight();
		byte[] PixelsValues = (byte[]) ip.getPixels();
		int Label = 0;
		// RegionLabels: Pixel ID, y, x, Number of Spots.
		Map<Integer, int[]> RegionLabels = new HashMap<Integer, int[]>();
		for (int i = 0; i < _H; i++)
		{
			for (int j = 0; j < _W; j++)
			{
				int value = PixelsValues[j + _W * i] & 0xff;
				if (value >= ThreshValue)
				{
					if (!RegionLabels.containsKey(j + _W * i))
					{
						int[] PixelInfo = { i, j, Label };
						RegionLabels.put(j + _W * i, PixelInfo);
						if (j + 1 < _W)
						{
							if (!RegionLabels.containsKey(j + 1 + _W * i))
							{
								PixelWaveSpread(PixelsValues, RegionLabels, i, j, _W, _H, Label, Directions.E);
							}
						}
						if (i + 1 < _H)
						{
							if (!RegionLabels.containsKey(j + _W * (i + 1)))
							{
								PixelWaveSpread(PixelsValues, RegionLabels, i, j, _W, _H, Label, Directions.S);
							}
							if (j + 1 < _W)
							{
								if (!RegionLabels.containsKey(j + 1 + _W * (i + 1)))
								{
									PixelWaveSpread(PixelsValues, RegionLabels, i, j, _W, _H, Label, Directions.SE);
								}
							}
							if (j - 1 >= 0)
							{
								if (!RegionLabels.containsKey(j - 1 + _W * (i + 1)))
								{
									PixelWaveSpread(PixelsValues, RegionLabels, i, j, _W, _H, Label, Directions.SW);
								}
							}
						}
						Label++;
					}
				}
			}
		}
		LabelCount = Label;
		if (ShowMessage)
		{
			showMessage("Number of Spots =" + LabelCount + "\nNumber of pixels = [" + RegionLabels.size() + "]");
		}
		return RegionLabels;
	}

	// ---------------- Labeling Algorithm ----------------
	// ---------------- Spread Directions ----------------
	private void PixelWaveSpread(byte[] PixelsValues, Map<Integer, int[]> RegionLabels, int i, int j, int _W, int _H, int Label,
			Directions direction)
	{
		switch (direction)
		{
		case E:
			if (j + 1 < _W)
			{
				LabelRepeat(PixelsValues, RegionLabels, i, j + 1, _W, _H, Label, Directions.E);
				if (i - 1 >= 0)
				{
					LabelRepeat(PixelsValues, RegionLabels, i - 1, j + 1, _W, _H, Label, Directions.NE);
				}

				if (i + 1 < _H)
				{
					LabelRepeat(PixelsValues, RegionLabels, i + 1, j + 1, _W, _H, Label, Directions.SE);
				}
			}
			break;
		case SE:
			if (j + 1 < _W)
			{
				LabelRepeat(PixelsValues, RegionLabels, i, j + 1, _W, _H, Label, Directions.E);
				if (i - 1 >= 0)
				{
					LabelRepeat(PixelsValues, RegionLabels, i - 1, j + 1, _W, _H, Label, Directions.NE);
				}
			}
			if (i + 1 < _H)
			{
				LabelRepeat(PixelsValues, RegionLabels, i + 1, j, _W, _H, Label, Directions.S);
				if (j + 1 < _W)
				{
					LabelRepeat(PixelsValues, RegionLabels, i + 1, j + 1, _W, _H, Label, Directions.SE);
				}
				if (j - 1 >= 0)
				{
					LabelRepeat(PixelsValues, RegionLabels, i + 1, j - 1, _W, _H, Label, Directions.SW);
				}
			}
			break;
		case S:
			if (i + 1 < _H)
			{
				LabelRepeat(PixelsValues, RegionLabels, i + 1, j, _W, _H, Label, Directions.S);
				if (j + 1 < _W)
				{
					LabelRepeat(PixelsValues, RegionLabels, i + 1, j + 1, _W, _H, Label, Directions.SE);
				}
				if (j - 1 >= 0)
				{
					LabelRepeat(PixelsValues, RegionLabels, i + 1, j - 1, _W, _H, Label, Directions.SW);
				}
			}
			break;
		case SW:

			if (j - 1 >= 0)
			{
				LabelRepeat(PixelsValues, RegionLabels, i, j - 1, _W, _H, Label, Directions.W);
				if (i - 1 >= 0)
				{
					LabelRepeat(PixelsValues, RegionLabels, i - 1, j - 1, _W, _H, Label, Directions.NW);
				}
			}
			if (i + 1 < _H)
			{
				LabelRepeat(PixelsValues, RegionLabels, i + 1, j, _W, _H, Label, Directions.S);
				if (j + 1 < _W)
				{
					LabelRepeat(PixelsValues, RegionLabels, i + 1, j + 1, _W, _H, Label, Directions.SE);
				}
				if (j - 1 >= 0)
				{
					LabelRepeat(PixelsValues, RegionLabels, i + 1, j - 1, _W, _H, Label, Directions.SW);
				}
			}
			break;
		case W:
			if (j - 1 >= 0)
			{
				LabelRepeat(PixelsValues, RegionLabels, i, j - 1, _W, _H, Label, Directions.W);
				if (i + 1 < _H)
				{
					LabelRepeat(PixelsValues, RegionLabels, i + 1, j - 1, _W, _H, Label, Directions.SW);
				}
				if (i - 1 >= 0)
				{
					LabelRepeat(PixelsValues, RegionLabels, i - 1, j - 1, _W, _H, Label, Directions.NW);
				}
			}
			break;
		case NW:
			if (j - 1 >= 0)
			{
				LabelRepeat(PixelsValues, RegionLabels, i, j - 1, _W, _H, Label, Directions.W);
				if (i - 1 >= 0)
				{
					LabelRepeat(PixelsValues, RegionLabels, i - 1, j - 1, _W, _H, Label, Directions.NW);
				}
				if (i + 1 < _H)
				{
					LabelRepeat(PixelsValues, RegionLabels, i + 1, j - 1, _W, _H, Label, Directions.SW);
				}
			}
			if (i - 1 >= 0)
			{
				LabelRepeat(PixelsValues, RegionLabels, i - 1, j, _W, _H, Label, Directions.N);
				if (j + 1 < _W)
				{
					LabelRepeat(PixelsValues, RegionLabels, i - 1, j + 1, _W, _H, Label, Directions.NE);
				}
			}
			break;
		case N:
			if (i - 1 >= 0)
			{
				LabelRepeat(PixelsValues, RegionLabels, i - 1, j, _W, _H, Label, Directions.N);
				if (j + 1 < _W)
				{
					LabelRepeat(PixelsValues, RegionLabels, i - 1, j + 1, _W, _H, Label, Directions.NE);
				}
				if (j - 1 >= 0)
				{
					LabelRepeat(PixelsValues, RegionLabels, i - 1, j - 1, _W, _H, Label, Directions.NW);
				}
			}
			break;
		case NE:
			if (j + 1 < _W)
			{
				LabelRepeat(PixelsValues, RegionLabels, i, j + 1, _W, _H, Label, Directions.E);
				if (i - 1 >= 0)
				{
					LabelRepeat(PixelsValues, RegionLabels, i + 1, j + 1, _W, _H, Label, Directions.SE);
				}
			}
			if (i - 1 >= 0)
			{
				LabelRepeat(PixelsValues, RegionLabels, i - 1, j, _W, _H, Label, Directions.N);
				if (j + 1 < _W)
				{
					LabelRepeat(PixelsValues, RegionLabels, i - 1, j + 1, _W, _H, Label, Directions.NE);
				}
				if (j - 1 >= 0)
				{
					LabelRepeat(PixelsValues, RegionLabels, i - 1, j - 1, _W, _H, Label, Directions.NW);
				}
			}
			break;
		default:
			break;
		}
	}

	// ---------------- Spread Directions ----------------
	// ---------------- Search for Connected Pixel ----------------
	private void LabelRepeat(byte[] PixelsValues, Map<Integer, int[]> RegionLabels, int i, int j, int _W, int _H, int Label,
			Directions direction)
	{
		int value = PixelsValues[j + _W * i] & 0xff;
		if (value >= ThreshValue)
		{
			if (!RegionLabels.containsKey(j + _W * i))
			{
				int[] PixelInfo = { i, j, Label };
				RegionLabels.put(j + _W * i, PixelInfo);
				PixelWaveSpread(PixelsValues, RegionLabels, i, j, _W, _H, Label, direction);
			}
		}
	}

	// ---------------- Search for Connected Pixel ----------------
	public void showMessage(String message)
	{
		IJ.showMessage(message);
	}
}
