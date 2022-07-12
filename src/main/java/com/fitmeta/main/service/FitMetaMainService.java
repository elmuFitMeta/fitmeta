package com.fitmeta.main.service;

import java.util.HashMap;
import java.util.Map;

public interface FitMetaMainService {
	
	public Map<String, Object> mainPageInfo(HashMap<String, Object> jsonMap) throws Exception;

	public Map<String, Object> classListInfo(HashMap<String, Object> jsonMap) throws Exception;
	
	public Map<String, Object> classInfo(HashMap<String, Object> jsonMap) throws Exception;
}
