package com.uniSaarland_CIPMM.ivea;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URISyntaxException;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

import com.uniSaarland_CIPMM.ivea.gui.GUI_nonFixedFBEs;

/**
 * @author www.codejava.net
 *
 */
public class ReadWriteManager
{
	private static String ivea_folder = "IVEA Resources";
	private static final int BUFFER_SIZE = 4096;
	public String getIVEAresourcesDir()
	{
		try
		{
			String outputPath = new File(this.getClass().getProtectionDomain().getCodeSource().getLocation().toURI()).getPath();

			if (outputPath.endsWith(".jar"))
			{
				outputPath = new File(this.getClass().getProtectionDomain().getCodeSource().getLocation().toURI()).getParent()
						+ File.separator + ivea_folder;
				File outDir = new File(outputPath);
				if (!outDir.exists())
				{
					outDir.mkdir();
				}
			}
			return outputPath;
		} catch (Exception e)
		{
			return "";
		}
	}

	public String[] getModelPaths(String... modelNames)
	{
		if (modelNames == null || modelNames.length == 0)
		{
			return new String[0];
		}
		String[] modePaths = new String[modelNames.length];
		try
		{
			String jarFilePath = getResourcesFolder(GUI_nonFixedFBEs.class, modelNames[0] + ".zip");
			String outputPath = new File(this.getClass().getProtectionDomain().getCodeSource().getLocation().toURI()).getPath();
			if (outputPath.endsWith(".jar"))
			{
				outputPath = new File(this.getClass().getProtectionDomain().getCodeSource().getLocation().toURI()).getParent()
						+ File.separator + ivea_folder;
				File outDir = new File(outputPath);
				if (!outDir.exists())
				{
					outDir.mkdir();
				}
			}

			for (int i = 0; i < modelNames.length; i++)
			{
				modePaths[i] = outputPath + File.separator + modelNames[i];
				if (Files.notExists(Paths.get(modePaths[i])))
				{
					unzipJarFile(Paths.get(jarFilePath), Paths.get(outputPath), modelNames[i]);
					unzipModel(modePaths[i] + ".zip", outputPath);
				}
			}
		} catch (URISyntaxException e)
		{
			e.printStackTrace();
		} catch (IOException e)
		{
			e.printStackTrace();
		}
		return modePaths;
	}

	/**
	 * @param zipFilePath
	 * @param destDirectory
	 * @throws IOException
	 */
	public void unzipJarFile(Path source, Path destDirectory, String ModelName) throws IOException
	{
		try (ZipInputStream zis = new ZipInputStream(new FileInputStream(source.toFile())))
		{
			ZipEntry zipEntry = zis.getNextEntry();
			while (zipEntry != null)
			{
				if (zipEntry.getName().contains(ModelName))
				{
					Path newPath = Paths.get(destDirectory + File.separator + zipEntry.getName());
					System.out.println("zipEntry.getName(): " + zipEntry.getName());
					Files.copy(zis, newPath, StandardCopyOption.REPLACE_EXISTING);
				}
				zipEntry = zis.getNextEntry();
			}
			zis.closeEntry();
		}
	}

	public static Path zipSlipProtect(ZipEntry zipEntry, Path targetDir)
			throws IOException
	{
		Path targetDirResolved = targetDir.resolve(zipEntry.getName());
		Path normalizePath = targetDirResolved.normalize();
		if (!normalizePath.startsWith(targetDir))
		{
			throw new IOException("Bad zip entry: " + zipEntry.getName());
		}
		return normalizePath;
	}

	String getResourcesFolder(Class<?> clazz, String ModelNameTCell)
	{
		ClassLoader cl = clazz.getClassLoader();
		URL classResource = cl.getResource(ModelNameTCell);
		if (classResource == null)
		{
			throw new RuntimeException("class resource is null");
		}
		String url = classResource.toString();
		if (url.startsWith("jar:file:"))
		{
			// extract 'file:......jarName.jar' part from the url string
			String path = url.replaceAll("^jar:(file:.*[.]jar)!/.*", "$1");
			try
			{
				return Paths.get(new URL(path).toURI()).toString();
			} catch (Exception e)
			{
				throw new RuntimeException("Invalid Jar File URL String");
			}
		}
		throw new RuntimeException("Invalid Jar File URL String");
	}

	public void unzipModel(String zipFilePath, String destDirectory) throws IOException
	{
		File destDir = new File(destDirectory);
		if (!destDir.exists())
		{
			destDir.mkdir();
		}
		ZipInputStream zipIn = new ZipInputStream(new FileInputStream(zipFilePath));
		ZipEntry entry = zipIn.getNextEntry();
		while (entry != null)
		{
			String filePath = destDirectory + File.separator + entry.getName();
			if (!entry.isDirectory())
			{
				extractFile(zipIn, filePath);
			} else
			{
				File dir = new File(filePath);
				dir.mkdirs();
			}
			zipIn.closeEntry();
			entry = zipIn.getNextEntry();
		}
		zipIn.close();
	}

	/**
	 * 
	 * @param zipIn
	 * @param filePath
	 * @throws IOException
	 */
	private void extractFile(ZipInputStream zipIn, String filePath) throws IOException
	{
		BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(filePath));
		byte[] bytesIn = new byte[BUFFER_SIZE];
		int read = 0;
		while ((read = zipIn.read(bytesIn)) != -1)
		{
			bos.write(bytesIn, 0, read);
		}
		bos.close();
	}

	String byGetResource(Class<?> clazz, String ModelNameTCell)
	{
		ClassLoader cl = clazz.getClassLoader();
		URL classResource = cl.getResource(ModelNameTCell);
		if (classResource == null)
		{
			throw new RuntimeException("class resource is null");
		}
		String url = classResource.toString();
		if (url.startsWith("jar:file:"))
		{
			String path = url.replaceAll("^jar:(file:.*[.]jar)!/.*", "$1");
			try
			{
				return Paths.get(new URL(path).toURI()).toString();
			} catch (Exception e)
			{
				throw new RuntimeException("Invalid Jar File URL String");
			}
		}
		return null;
	}
}
