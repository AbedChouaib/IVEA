package com.uniSaarland_CIPMM.ivea.gui;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

public class ParameterLoader
{

	public static Map<String, Object> loadParametersFromJson(String filepath) throws IOException
	{
		ObjectMapper mapper = new ObjectMapper();
		return mapper.readValue(new File(filepath), new TypeReference<Map<String, Object>>()
		{
		});
	}
}
