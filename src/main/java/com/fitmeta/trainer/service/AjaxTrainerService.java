package com.fitmeta.trainer.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;



import org.springframework.web.multipart.MultipartFile;

public interface AjaxTrainerService {
	
	public Map<String, Object> ptInfoReg(HashMap<String, Object> jsonMap) throws Exception;
	
	public Map<String, Object> contentInfoReg(HashMap<String, Object> jsonMap, List<MultipartFile> aMultipartFile) throws Exception;
	
	public Map<String, Object> planInfoReg(HashMap<String, Object> jsonMap, List<MultipartFile> aMultipartFile) throws Exception;
	
	public Map<String, Object> classInfoReg(HashMap<String, Object> jsonMap, List<MultipartFile> aMultipartFile) throws Exception;
	
	public Map<String, Object> serviceInfoReg(HashMap<String, Object> jsonMap, List<MultipartFile> aMultipartFile) throws Exception;
	
	public Map<String, Object> newsInfoReg(HashMap<String, Object> jsonMap, List<MultipartFile> aMultipartFile) throws Exception;
	
	public Map<String, Object> ptInfoRegU(HashMap<String, Object> jsonMap, List<MultipartFile> aMultipartFile) throws Exception;
	
	public Map<String, Object> ptInfo(HashMap<String, Object> jsonMap) throws Exception;
	
	public Map<String, Object> ptPlanInfo(HashMap<String, Object> jsonMap) throws Exception;
	
	public Map<String, Object> ptContentsInfo(HashMap<String, Object> jsonMap) throws Exception;
	
	public Map<String, Object> ptClassInfo(HashMap<String, Object> jsonMap) throws Exception;
	
	public Map<String, Object> ptServiceInfo(HashMap<String, Object> jsonMap) throws Exception;
	
	public Map<String, Object> ptNewsInfo(HashMap<String, Object> jsonMap) throws Exception;
	
	public Map<String, Object> ptNewsSingle(HashMap<String, Object> jsonMap) throws Exception;
	
	public Map<String, Object> ptAllInfo(HashMap<String, Object> jsonMap) throws Exception;
	
	public Map<String, Object> newApplyClassListInfo(HashMap<String, Object> jsonMap) throws Exception;
	
	public Map<String, Object> deleteNewApplyClassInfo(HashMap<String, Object> jsonMap) throws Exception;
	
	public Map<String, Object> newApplyClassSingleInfo(HashMap<String, Object> jsonMap) throws Exception;
	
	public Map<String, Object> classEventReg(HashMap<String, Object> jsonMap) throws Exception;
	
	public Map<String, Object> reviewInfoReg(HashMap<String, Object> jsonMap) throws Exception;
	
	public Map<String, Object> reviewInfo(HashMap<String, Object> jsonMap) throws Exception;


}






