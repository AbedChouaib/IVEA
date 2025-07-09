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

for credits: 
Some elements in this code was inspired by an external source written by Jussi. popscan blog
code reference "https://popscan.blogspot.com/2013/06/image-segmentation-with-k-means.html"
*/
import java.util.Arrays;
import java.util.Random;
import java.util.stream.IntStream;

import ij.IJ;
import ij.ImagePlus;
import ij.process.ImageProcessor;

public class Kmeans
{
//	private ImagePlus original;
	private Cluster[] clusters;
//	private Double BGMean;
	private int MinClusterID;
	private double[] Centroids;

	// ------------------------------------------------------------
	public int[] calculate(ImagePlus OImg, int k, int BitDepth, double sigma, String folderPath)
	{
		ImagePlus image = OImg.duplicate();
		int w = image.getWidth();
		int h = image.getHeight();
		IJ.run(image, "Gaussian Blur...", "sigma=" + sigma);
		clusters = createClusters(image, k);
		int[] sortTable = new int[w * h]; // create cluster temporary table
		Arrays.fill(sortTable, -1);
		boolean switchDataCluster = true; // 1st loop, all pixels change clusters
		int iterations = 0; // break when.
		while (switchDataCluster && iterations < 500)
		{
			switchDataCluster = false;
			for (int y = 0; y < h; y++)
			{
				for (int x = 0; x < w; x++)
				{
					int pixel = image.getPixel(x, y)[0];
					Cluster cluster = AdjustClusterLocation(pixel);
					if (sortTable[w * y + x] != cluster.getId())
					{
						if (sortTable[w * y + x] != -1)
						{
							clusters[sortTable[w * y + x]].removePixel(pixel);
						}
						cluster.addPixel(pixel);
						switchDataCluster = true;
						sortTable[w * y + x] = cluster.getId();
					}
				}
			}
			iterations++;
		}
		// ---------------- sorting cluster ----------------
		Centroids = GetCentroids(clusters, k);
		int[] Cn = (int[]) (sortClusters(Centroids, k));
		// ----------------------- -----------------------
		// <<<<<<<<<<<<<<<<<< Combining layers >>>>>>>>>>>>>>>>>>
		IntStream.range(0, sortTable.length).parallel().forEach(i ->
		{
			int clusterId = sortTable[i];
			int cID = clusters[clusterId].id;
			sortTable[i] = GetCombinedID(cID, Cn);
		});
		ImagePlus result2 = IJ.createImage("result", w, h, 1, 8);
		ImageProcessor ip2 = result2.getProcessor();
		IntStream.range(0, h).parallel().forEach(y ->
		{
			IntStream.range(0, w).parallel().forEach(x ->
			{
				int clusterId = sortTable[w * y + x];
				int value = colorImage(clusterId, 5);
				ip2.putPixel(x, y, value);
			});
		});
		if (folderPath != "")
		{
			IJ.save(result2, folderPath + "0-Segmented Image_2.tif");
		}
		result2.close();
		// <<<<<<<<<<<<<<<<<< Combining layers >>>>>>>>>>>>>>>>>>
		// ----------------------- -----------------------
		MinClusterID = 0;
		int[] ImageVector = new int[h * w];
		IntStream.range(0, ImageVector.length).parallel().forEach(i ->
		{
			int clusterId = sortTable[i] == -1 ? 0 : sortTable[i];
			int cID = clusters[clusterId].id;
			ImageVector[i] = cID;
		});
		return ImageVector;
	}
	// ------------------------------------------------------------
	// ------------------------------------------------------------

	int GetCombinedID(int ID, int[] Cn)
	{
		int newID = -1;
		for (int i = 1; i < Cn.length; i += 2)
		{
			if (ID == Cn[i] || ID == Cn[i - 1])
			{
				newID = (int) (i - 1) / 2;
			}
		}
		return newID;
	}
	// ------------------------------------------------------------

	int[] MapSortedArray(int[] Cn)
	{
		int[] MapCn = new int[Cn.length];
		for (int i = 0; i < Cn.length; i++)
		{
			MapCn[Cn[i]] = i;
		}
		return MapCn;
	}

	double[] GetCentroids(Cluster[] clusters, int k)
	{
		double[] centroids = new double[k];
		for (int i = 0; i < k; i++)
		{
			centroids[i] = clusters[i].getMu();
		}
		return centroids;
	}

	Cluster[] createClusters(ImagePlus image, int k)
	{
		Cluster[] result = new Cluster[k];
		Random rand = new Random();
		int H_ = image.getHeight();
		int W_ = image.getWidth();
		for (int i = 0; i < k; i++)
		{
			int x = rand.nextInt(W_);
			int y = rand.nextInt(H_);
			result[i] = new Cluster(i, image.getPixel(x, y)[0]); // image.getPixel(x, y)[0] grayscale value at 0.
		}
		return result;
	}

	public Cluster AdjustClusterLocation(int PixelValue)
	{
		Cluster cluster = null;
		double min = Integer.MAX_VALUE;
		for (int i = 0; i < clusters.length; i++)
		{
			double distance = clusters[i].distance(PixelValue);
			if (distance < min)
			{
				min = distance;
				cluster = clusters[i];
			}
		}
		return cluster;
	}

	private int colorImage(int input, int k)
	{
		int steps = Math.round(255 / k);
		int value = input == 0 ? 0 : steps * (input + 1);
		value = value > 255 ? 255 : value;
		return value;
	}

	// sort cluster by value.
	int[] sortClusters(double[] centroids, int k)
	{
		int[] result = new int[k];
		double[] SortCm = centroids.clone();
		Arrays.sort(SortCm);
		for (int i = 0; i < k; i++)
		{
			for (int j = 0; j < k; j++)
			{
				if (SortCm[i] == centroids[j])
				{
					result[i] = j;
				}
			}
		}
		return result;
	}

	// ======================= #Region OutPuts =======================
	public int GetMinClusterID()
	{
		return MinClusterID;
	}

	public void printLine(double[] data)
	{
		for (int i = 0; i < data.length; i++)
		{
			System.out.println(data[i]);

		}
	}

	public void printLine(int[] data)
	{
		for (int i = 0; i < data.length; i++)
		{
			System.out.println(data[i]);

		}
	}
	// ======================= #End =======================

	// ======================= #Class Cluster =======================
	class Cluster
	{
		int id;
		int TotalPixels;
		double Mu;
		double ColorLevel;
		double WeightedMu;

		public Cluster(int id, int PixelValue)
		{
			Mu = PixelValue;
			this.id = id;
			addPixel(PixelValue);
		}

		public void clear()
		{
			Mu = 0;
			ColorLevel = 0;
			TotalPixels = 0;
		}

		int getId()
		{
			return id;
		}

		double getMu()
		{
			double Value = ColorLevel / TotalPixels;
			return Value;
		}

		void addPixel(int PixelValue)
		{
			ColorLevel += PixelValue;
			TotalPixels++;
			Mu = ColorLevel / TotalPixels;
		}

		void removePixel(int PixelValue)
		{
			ColorLevel = ColorLevel - PixelValue;
			TotalPixels--;
			Mu = ColorLevel / TotalPixels;
		}

		double distance(int PixelValue)
		{
			double dist = Math.abs(Mu - PixelValue);
			return dist;
		}

		double getWeightedMu()
		{
			return WeightedMu;
		}
	}
	// ======================= #Class End =======================
}
