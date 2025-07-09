package com.uniSaarland_CIPMM.ivea;

import java.util.List;

import org.nd4j.shade.protobuf.InvalidProtocolBufferException;
import org.tensorflow.SavedModelBundle;
import org.tensorflow.Session;
import org.tensorflow.Tensor;
import org.tensorflow.TensorFlowException;
import org.tensorflow.framework.MetaGraphDef;
import org.tensorflow.framework.SignatureDef;
import org.tensorflow.framework.TensorInfo;
import org.tensorflow.framework.TensorShapeProto;

public class EViTModel
{
	private Session modelSession;
	private String inputTensorName;
	private String outputTensorName;
	private int numClasses;

	// Constructor loads the SavedModel once
	public EViTModel(String modelPath)
	{
		SavedModelBundle net_model = null;
		net_model = SavedModelBundle.loader(modelPath).withTags("serve").load();
		MetaGraphDef metaGraphDef;
		this.modelSession = net_model.session();
		metaGraphDef = extractMetaGraphDefinition(net_model);
		SignatureDef signatureDef = metaGraphDef.getSignatureDefMap().get("serving_default");

		// Input / Output Tensors
		final TensorInfo inputTensorInfo = signatureDef.getInputsMap().values().stream().findFirst().orElseThrow(null);
		final TensorInfo outputTensorInfo = signatureDef.getOutputsMap().values().stream().findFirst().orElseThrow(null);

		this.inputTensorName = inputTensorInfo.getName();
		this.outputTensorName = outputTensorInfo.getName();

		// Read the shape to get n classes this was replaced with the IVEA configuration
		// file
		TensorShapeProto outputTensorShape = outputTensorInfo.getTensorShape();
		int numDimensions = outputTensorShape.getDimCount();
		this.numClasses = (int) outputTensorShape.getDim(numDimensions - 1).getSize();
	}

	@SuppressWarnings("unchecked")
	public float[][] predict(float[][][][][] inputData)
	{
		try (Tensor<Float> inputTensor = (Tensor<Float>) Tensor.create(inputData))
		{

			// Run inference and get output
			List<Tensor<?>> outputs = modelSession.runner()
					.feed(this.inputTensorName, inputTensor)
					.fetch(this.outputTensorName)
					.run();

			try (Tensor<Float> outputTensor = (Tensor<Float>) outputs.get(0))
			{
				float[][] result = outputTensor.copyTo(new float[inputData.length][this.numClasses]);
				return result;
			} finally
			{
				// Close all additional output tensors (safety)
				for (int i = 1; i < outputs.size(); i++)
				{
					outputs.get(i).close();
				}
			}

		} catch (Exception e)
		{
			System.err.println("Prediction error: " + e.getMessage());
			e.printStackTrace();
			return new float[0][this.numClasses]; // return safe empty result if needed
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

	public int getNumClasses()
	{
		return this.numClasses;
	}
}
