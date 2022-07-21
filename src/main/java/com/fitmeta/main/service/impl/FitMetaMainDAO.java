package com.fitmeta.main.service.impl;


import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Repository;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;



@Repository("mainDAO")
public class FitMetaMainDAO extends EgovAbstractDAO {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(FitMetaMainDAO.class);
	
	public List<?> selectClassList(HashMap<String, Object> jsonMap) {
		return list("mainDAO.select_class_list", jsonMap);
	}
	
	public List<?> selectClassListForMain(HashMap<String, Object> jsonMap) {
		return list("mainDAO.select_class_list_main", jsonMap);
	}
	
	public int selectMsgCnt(HashMap<String, Object> jsonMap) {
		return (int)select("mainDAO.select_msg_cnt", jsonMap);
	}
	
	
	public void insertNewApplyClassInfo(HashMap<String, Object> jsonMap) {
		insert("mainDAO.insert_newApplyClass_info", jsonMap);
	}
	
	
	/**
	 *  getting info of class
	 */
	@SuppressWarnings("unchecked")
	public HashMap<String, Object> selectClassInfo(HashMap<String, Object> jsonMap) {
		// TODO Auto-generated method stub
		return (HashMap<String, Object>) select("mainDAO.select_class_info", jsonMap);
	}
	
	
	/**
	 *  getting pu info
	 */
	@SuppressWarnings("unchecked")
	public HashMap<String, Object> selectPuInfo(HashMap<String, Object> jsonMap) {
		// TODO Auto-generated method stub
		return (HashMap<String, Object>) select("mainDAO.select_pu_info", jsonMap);
	}

}
