package com.kh.delivery.util;

import com.fasterxml.jackson.databind.ObjectMapper;

public class ConvertUtil_notUse {

	public static String makeJSON(Object object) throws Exception{
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(object);
		return json;
	}
	
}
