package com.fitmeta.main.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fitmeta.main.service.FitMetaMainService;
import com.fitmeta.trainer.service.impl.AjaxTrainerDAO;
import com.fitmeta.util.Log;



@Service("fitMetaMainService")
public class FitMetaMainServiceImpl implements FitMetaMainService {

	private String PROP_FILE = "/property/3dbank.properties";
	private static final Logger LOGGER = LoggerFactory.getLogger(FitMetaMainServiceImpl.class);
		
	@Autowired
	private AjaxTrainerDAO ajaxTrainerDAO;
	
	
	@Autowired
	private FitMetaMainDAO fitMetaMainDAO;
	
	@Override
	public Map<String, Object> mainPageInfo(HashMap<String, Object> jsonMap) throws Exception {

		HashMap<String, Object> retMap = new HashMap<String, Object>();
		
		// Select PTs Info 
		List<?> ptList = ajaxTrainerDAO.selectTrainerList(jsonMap);
		
		if (ptList == null) {
			retMap.put("retcode", "999");
			retMap.put("retmsg", "조건에 맞는 데이타가 없습니다.");
			return retMap;
		}	
		retMap.put("ptList", ptList);
		
		
		//select classes info list
		List<?> classList = fitMetaMainDAO.selectClassListForMain(jsonMap);
		retMap.put("classList", classList);
		
		
		//select msg cnt info
		if(!jsonMap.get("user_id").equals("-1")) {
			int msgCnt = fitMetaMainDAO.selectMsgCnt(jsonMap);
			retMap.put("msgCnt", msgCnt);
		} else {
			retMap.put("msgCnt", 0);
		}

		
		retMap.put("retcode", "000");
		retMap.put("retmsg", "정상적으로 조회되었습니다.");
		
		return retMap;
	}
	
	
	@Override
	public Map<String, Object> classInfo(HashMap<String, Object> jsonMap) throws Exception {

		HashMap<String, Object> retMap = new HashMap<String, Object>();
		
		// Select PT Info
		HashMap<String, Object> classInfo = fitMetaMainDAO.selectClassInfo(jsonMap);
		
		if (classInfo == null) {
			retMap.put("retcode", "999");
			retMap.put("retmsg", "조건에 맞는 데이타가 없습니다.");
			return retMap;
		}
		
		retMap.put("classInfo", classInfo);
		
		jsonMap.put("pt_id", classInfo.get("pt_id"));
		
		// Select Class Events List
		List<?> classEvents = ajaxTrainerDAO.selectClassEventsList(jsonMap);
		retMap.put("classEvents", classEvents);

		retMap.put("retcode", "000");
		retMap.put("retmsg", "정상적으로 조회되었습니다.");
		
		return retMap;
	}
	
	
	@Override
	public Map<String, Object> classListInfo(HashMap<String, Object> jsonMap) throws Exception {

		HashMap<String, Object> retMap = new HashMap<String, Object>();
		
		//select class list info list
		List<?> classList = fitMetaMainDAO.selectClassList(jsonMap);
		retMap.put("classList", classList);

		
		retMap.put("retcode", "000");
		retMap.put("retmsg", "정상적으로 조회되었습니다.");
		
		return retMap;
	}


	@Override
	public Map<String, Object> puInfoReg(HashMap<String, Object> jsonMap) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Object> jsonRetMap = new HashMap<String, Object>();
		
		if("r".equals(jsonMap.get("crud_tp"))) {
			jsonRetMap = puInfoReg_r(jsonMap);
		}
		
		return jsonRetMap;
	}


	private HashMap<String, Object> puInfoReg_r(HashMap<String, Object> jsonMap) {
		// TODO Auto-generated method stub
		HashMap<String, Object> retMap = new HashMap<String, Object>();
		
		// Select PU Info
		HashMap<String, Object> puInfo = fitMetaMainDAO.selectPuInfo(jsonMap);
		
		if (puInfo == null) {
			retMap.put("retcode", "999");
			retMap.put("retmsg", "조건에 맞는 데이타가 없습니다.");
			return retMap;
		}
		
		retMap.put("puInfo", puInfo);

		retMap.put("retcode", "000");
		retMap.put("retmsg", "정상적으로 조회되었습니다.");
		
		return retMap;
	}

}















