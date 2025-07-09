package com.uniSaarland_CIPMM.ivea;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.file.FileSystem;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.stream.IntStream;

import org.nd4j.shade.protobuf.InvalidProtocolBufferException;
import org.tensorflow.SavedModelBundle;
import org.tensorflow.Session;
import org.tensorflow.Tensor;
import org.tensorflow.TensorFlowException;
import org.tensorflow.framework.MetaGraphDef;
import org.tensorflow.framework.SignatureDef;
import org.tensorflow.framework.TensorInfo;
import org.tensorflow.framework.TensorShapeProto;

import com.uniSaarland_CIPMM.ivea.gui.IVEAsetup;

public class models
{
	public PredictionResult get_LSTM_prediction(int Analysis_type, double[][] inData,
			int nFeatures, int timeSeries, boolean TimeSeriesModel)
	{
		String ModelPath = "";
		switch (Analysis_type)
		{
		case 0:
			ModelPath = IVEAsetup.Model_Synapse_Path;
			break;
		case 1:
			ModelPath = IVEAsetup.Selected_model_ran_path;
			break;
		default:
			break;
		}
		float[][][] Vx;
		if (TimeSeriesModel)
		{
			Vx = sortInputData3DTransposed(inData, nFeatures, timeSeries);
		} else
		{
			Vx = sortInputData3D(inData, nFeatures, timeSeries);
		}
		SavedModelBundle LSTMmodel = null;
		LSTMmodel = SavedModelBundle.loader(ModelPath).withTags("serve").load();
		MetaGraphDef metaGraphDef;
		Session session = LSTMmodel.session();
		metaGraphDef = extractMetaGraphDefinition(LSTMmodel);
		SignatureDef signatureDef = metaGraphDef.getSignatureDefMap().get("serving_default");

		final TensorInfo inputTensorInfo = signatureDef.getInputsMap()
				.values()
				.stream()
				.filter(Objects::nonNull)
				.findFirst()
				.orElseThrow(null);

		final TensorInfo outputTensorInfo = signatureDef.getOutputsMap()
				.values()
				.stream()
				.filter(Objects::nonNull)
				.findFirst()
				.orElseThrow(null);

		TensorShapeProto outputTensorShape = outputTensorInfo.getTensorShape();
		int numDimensions = outputTensorShape.getDimCount();
		int numClasses = (int) outputTensorShape.getDim(numDimensions - 1).getSize();

		try (@SuppressWarnings("unchecked")
		Tensor<Float> x = (Tensor<Float>) Tensor.create(Vx))
		{
			final List<Tensor<?>> run = session.runner()
					.feed(inputTensorInfo.getName(), x)
					.fetch(outputTensorInfo.getName())
					.run();

			final float[][] Vy = run.get(0).copyTo(new float[Vx.length][numClasses]);
			return new PredictionResult(Vy, numClasses);
		}
	}

	public PredictionResult get_eViT_prediction(float[][][][][] Vx, String ModelPath)
	{
		SavedModelBundle net_model = null;
		net_model = SavedModelBundle.loader(ModelPath).withTags("serve").load();
		MetaGraphDef metaGraphDef;
		Session model_session = net_model.session();
		metaGraphDef = extractMetaGraphDefinition(net_model);
		SignatureDef signatureDef = metaGraphDef.getSignatureDefMap().get("serving_default");

		final TensorInfo inputTensorInfo = signatureDef.getInputsMap()
				.values()
				.stream()
				.filter(Objects::nonNull)
				.findFirst()
				.orElseThrow(null);

		final TensorInfo outputTensorInfo = signatureDef.getOutputsMap()
				.values()
				.stream()
				.filter(Objects::nonNull)
				.findFirst()
				.orElseThrow(null);

		TensorShapeProto outputTensorShape = outputTensorInfo.getTensorShape();
		int numDimensions = outputTensorShape.getDimCount();
		int numClasses = (int) outputTensorShape.getDim(numDimensions - 1).getSize();

		try (@SuppressWarnings("unchecked")
		Tensor<Float> x = (Tensor<Float>) Tensor.create(Vx))
		{
			final List<Tensor<?>> run = model_session.runner()
					.feed(inputTensorInfo.getName(), x)
					.fetch(outputTensorInfo.getName())
					.run();

			final float[][] Vy = run.get(0).copyTo(new float[Vx.length][numClasses]);
			return new PredictionResult(Vy, numClasses);
		}
	}

	public PredictionResult getCNN_LSTMprediction(float[][][][] Vx)
	{
		String ModelPath = IVEAsetup.Selected_model_ran_path;
		SavedModelBundle LSTMmodel = null;
		LSTMmodel = SavedModelBundle.loader(ModelPath).withTags("serve").load();
		MetaGraphDef metaGraphDef;
		Session session = LSTMmodel.session();
		metaGraphDef = extractMetaGraphDefinition(LSTMmodel);
		SignatureDef signatureDef = metaGraphDef.getSignatureDefMap().get("serving_default");

		final TensorInfo inputTensorInfo = signatureDef.getInputsMap()
				.values()
				.stream()
				.filter(Objects::nonNull)
				.findFirst()
				.orElseThrow(null);

		final TensorInfo outputTensorInfo = signatureDef.getOutputsMap()
				.values()
				.stream()
				.filter(Objects::nonNull)
				.findFirst()
				.orElseThrow(null);

		TensorShapeProto outputTensorShape = outputTensorInfo.getTensorShape();
		int numDimensions = outputTensorShape.getDimCount();
		int numClasses = (int) outputTensorShape.getDim(numDimensions - 1).getSize();
		try (@SuppressWarnings("unchecked")
		Tensor<Float> x = (Tensor<Float>) Tensor.create(Vx))
		{
			final List<Tensor<?>> run = session.runner()
					.feed(inputTensorInfo.getName(), x)
					.fetch(outputTensorInfo.getName())
					.run();

			final float[][] Vy = run.get(0).copyTo(new float[Vx.length][numClasses]);
			return new PredictionResult(Vy, numClasses);

		}
	}

	private float[][][] sortInputData3D(double[][] inData, int nFeatures, int timeSeries)
	{
		int nEvents = inData.length;
		float[][][] Vx = new float[nEvents][nFeatures][timeSeries];

		IntStream.range(0, nEvents).parallel().forEach(i ->
		{
			for (int j = 0; j < nFeatures; j++)
			{
				for (int k = 0; k < timeSeries; k++)
				{
					Vx[i][j][k] = (float) (inData[i][j + k * nFeatures]);
//					System.out.print(Vx[i][j][k] + ",");
				}
//				System.out.println("");
			}
//			System.out.println("------------- -------------");
		});
		return Vx;
	}

	private float[][][] sortInputData3DTransposed(double[][] inData, int nFeatures, int timeSeries)
	{
		int nEvents = inData.length;
		float[][][] Vx = new float[nEvents][timeSeries][nFeatures];

		IntStream.range(0, nEvents).parallel().forEach(i ->
		{
			for (int j = 0; j < timeSeries; j++)
			{
				for (int k = 0; k < nFeatures; k++)
				{
					Vx[i][j][k] = (float) (inData[i][k + j * nFeatures]);
//					System.out.print(Vx[i][j][k] + ",");
				}
//				System.out.println("");
			}
//			System.out.println("------------- -------------");
		});
		return Vx;
	}

	// ====================================================================

	public Path getFolderPath(String Modelname) throws URISyntaxException, IOException
	{
		URI uri = getClass().getClassLoader().getResource(Modelname).toURI();

		if ("jar".equals(uri.getScheme()))
		{
			FileSystem fileSystem = FileSystems.newFileSystem(uri, Collections.emptyMap(), null);
			return fileSystem.getPath(Modelname);
		} else
		{
			return Paths.get(uri);
		}
	}

	public float[][][] getxData(int timeseries, String xDataPath)
	{
		List<String[]> rowList = new ArrayList<String[]>();
		try (BufferedReader br = new BufferedReader(new FileReader(xDataPath)))
		{
			String line;
			while ((line = br.readLine()) != null)
			{
				String[] lineItems = line.split(",");
				rowList.add(lineItems);
			}
			br.close();
		} catch (Exception e)
		{
			// Handle any I/O problems
		}
		String[][] matrix = new String[rowList.size()][];
		for (int i = 0; i < rowList.size(); i++)
		{
			String[] row = rowList.get(i);
			matrix[i] = row;
		}
		float[][][] xData = new float[rowList.size() / 13][13][timeseries];
		int ndx = 0;
		for (int i = 0; i < rowList.size(); i += 13)
		{
			for (int j = 0; j < 13; j++)
			{
				for (int k = 0; k < timeseries; k++)
				{
					xData[ndx][j][k] = (float) (Double.parseDouble(matrix[i + j][k]));
//					System.out.print(xData[ndx][j][k] + ",");
				}
//				System.out.println("");
			}
//			System.out.println("------------- -------------");
			ndx++;
		}
		return xData;
	}

	public float[][] getxData2D(int timeseries, String xDataPath)
	{
		List<String[]> rowList = new ArrayList<String[]>();
		try (BufferedReader br = new BufferedReader(new FileReader(xDataPath)))
		{
			String line;
			while ((line = br.readLine()) != null)
			{
				String[] lineItems = line.split(",");
				rowList.add(lineItems);
			}
			br.close();
		} catch (Exception e)
		{
			// Handle any I/O problems
		}
		String[][] matrix = new String[rowList.size()][];
		for (int i = 0; i < rowList.size(); i++)
		{
			String[] row = rowList.get(i);
			matrix[i] = row;
		}
		float[][] xData = new float[rowList.size()][41];
		for (int i = 0; i < rowList.size(); i++)
		{
			for (int j = 0; j < 41; j++)
			{
				xData[i][j] = (float) (Double.parseDouble(matrix[i][j]));
				System.out.print(xData[i][j] + ",");
			}
			System.out.println("");
			System.out.println("------------- -------------");
		}
		return xData;
	}

	void print3dArray(float[][][] data)
	{
		int L_ = data.length / 13;
		for (int i = 0; i < L_; i++)
		{
			System.out.println("[" + i + "]");
			for (int j = 0; j < data[i].length; j++)
			{
				for (int k = 0; k < data[i][j].length; k++)
				{
					System.out.print(data[i][j][k] + ",");
				}
				System.out.println("");
			}
			System.out.println("------------- -------------");
		}
	}

	void print3dArray(float[][] data)
	{
		int L_ = data.length;
		for (int i = 0; i < L_; i++)
		{
			System.out.println("[" + i + "]");
			for (int j = 0; j < data[i].length; j++)
			{
				System.out.print(data[i][j] + ",");
				System.out.println("");
			}
			System.out.println("------------- -------------");
		}
	}

	private static MetaGraphDef extractMetaGraphDefinition(final SavedModelBundle bundle)
			throws TensorFlowException
	{
		final MetaGraphDef metaGraphDef;
		try
		{
			metaGraphDef = MetaGraphDef.parseFrom(bundle.metaGraphDef());
			return metaGraphDef;
		} catch (InvalidProtocolBufferException e)
		{
			return null;
		}
	}

	public class PredictionResult
	{
		public float[][] predictions;
		public int numClasses;

		public PredictionResult(float[][] predictions, int numClasses)
		{
			this.predictions = predictions;
			this.numClasses = numClasses;
		}
	}
}