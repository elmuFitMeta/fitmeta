package com.fitmeta.trainer.service.impl;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.fitmeta.util.Log;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("trainerDAO")
public class AjaxTrainerDAO extends EgovAbstractDAO {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(AjaxTrainerDAO.class);
		
	/**
	 * P-Trainer 정보 등록
	 */
	public int insertPtInfo(HashMap<String, Object> jsonMap) {
		int ptId = (int) insert("trainerDAO.insert_pt_info", jsonMap);
		return ptId;
	}
	
	
	/**
	 * content 정보 등록
	 */
	public int insertContentInfo(HashMap<String, Object> jsonMap) {
		int contsId = (int) insert("trainerDAO.insert_conts_info", jsonMap);
		return contsId;
	}
	
	
	public List<?> selectContentList(HashMap<String, Object> jsonMap) {
		return list("trainerDAO.select_content_list", jsonMap);
	}
	
	
	public List<?> selectPlanList(HashMap<String, Object> jsonMap) {
		return list("trainerDAO.select_plan_list", jsonMap);
	}
	
	
	public List<?> selectPlanClassList(HashMap<String, Object> jsonMap) {
		return list("trainerDAO.select_planClass_list", jsonMap);
	}
		
	
	/**
	 *  getting info of Trainer
	 */
	@SuppressWarnings("unchecked")
	public HashMap<String, Object> selectPtInfo(HashMap<String, Object> jsonMap) {
		// TODO Auto-generated method stub
		return (HashMap<String, Object>) select("trainerDAO.select_pt_info", jsonMap);
	}
	
	
	
	public int deleteContentInfo(HashMap<String, Object> jsonMap) {
		return delete("trainerDAO.delete_conts_info", jsonMap);
	}
	
	
	public int deletePlanInfo(HashMap<String, Object> jsonMap) {
		return delete("trainerDAO.delete_plan_info", jsonMap);
	}
	
	
	public void deletePlanClassInfo(HashMap<String, Object> jsonMap) {
		delete("trainerDAO.delete_planClass_info", jsonMap);
	}
	
	
	public int deleteClassInfo(HashMap<String, Object> jsonMap) {
		return delete("trainerDAO.delete_class_info", jsonMap);
	}
	
	
	/**
	 * plan 정보 등록
	 */
	public int insertPlanInfo(HashMap<String, Object> jsonMap) {
		int planId = (int) insert("trainerDAO.insert_plan_info", jsonMap);
		return planId;
	}
	
	
	/**
	 * class 정보 등록
	 */
	public int insertClassInfo(HashMap<String, Object> jsonMap) {
		int planId = (int) insert("trainerDAO.insert_class_info", jsonMap);
		return planId;
	}
	
	
	public List<?> selectClassList(HashMap<String, Object> jsonMap) {
		return list("trainerDAO.select_class_list", jsonMap);
	}
	
	
	/**
	 * service 정보 등록
	 */
	public int insertServiceInfo(HashMap<String, Object> jsonMap) {
		int servId = (int) insert("trainerDAO.insert_service_info", jsonMap);
		return servId;
	}
	
	
	public List<?> selectServiceList(HashMap<String, Object> jsonMap) {
		return list("trainerDAO.select_service_list", jsonMap);
	}
	
	
	public int deleteServiceInfo(HashMap<String, Object> jsonMap) {
		return delete("trainerDAO.delete_service_info", jsonMap);
	}
	
	
	/**
	 * news 정보 등록
	 */
	public int insertNewsInfo(HashMap<String, Object> jsonMap) {
		int planId = (int) insert("trainerDAO.insert_news_info", jsonMap);
		return planId;
	}
	
	
	public List<?> selectNewsList(HashMap<String, Object> jsonMap) {
		return list("trainerDAO.select_news_list", jsonMap);
	}
	
	
	
	public int deleteNewsInfo(HashMap<String, Object> jsonMap) {
		return delete("trainerDAO.delete_news_info", jsonMap);
	}
	
	
	
	/**
	 *  getting info of Trainer News Single Info
	 */
	@SuppressWarnings("unchecked")
	public HashMap<String, Object> selectPtNewsSingle(HashMap<String, Object> jsonMap) {
		// TODO Auto-generated method stub
		return (HashMap<String, Object>) select("trainerDAO.select_news_single", jsonMap);
	}
	
	
	public List<?> selectNewsListBy(HashMap<String, Object> jsonMap) {
		return list("trainerDAO.select_news_list_by", jsonMap);
	}
	
	
	public List<?> selectTrainerList(HashMap<String, Object> jsonMap) {
		return list("trainerDAO.select_trainer_list", jsonMap);
	}
	

	/**
	 *  getting PT All Info
	 */
	@SuppressWarnings("unchecked")
	public HashMap<String, Object> selectPtAllInfo(HashMap<String, Object> jsonMap) {
		// TODO Auto-generated method stub
		return (HashMap<String, Object>) select("trainerDAO.select_ptAll_info", jsonMap);
	}
	
	
	public void insertPlanClassInfo(HashMap<String, Object> jsonMap) {
		insert("trainerDAO.insert_planClass_info", jsonMap);
	}
	
	
	public int updateUserInfo(HashMap<String, Object> jsonMap) {  
		return update("trainerDAO.updateUserInfo", jsonMap);
	} 
	
	
	public int updatePtInfo(HashMap<String, Object> jsonMap) {  
		return update("trainerDAO.updatePtInfo", jsonMap);
	}
	
	
	public int updatePtImg(HashMap<String, Object> jsonMap) {  
		return update("trainerDAO.updatePtImg", jsonMap);
	}
	

	public void insertReviewInfo(HashMap<String, Object> jsonMap) {
		insert("trainerDAO.insert_review_info", jsonMap);
	}
	
	
	public List<?> selectReviewList(HashMap<String, Object> jsonMap) {
		return list("trainerDAO.select_review_list", jsonMap);
	}
	
	
	@SuppressWarnings("unchecked")
	public HashMap<String, Object> selectClassInfo(HashMap<String, Object> jsonMap) {
		// TODO Auto-generated method stub
		return (HashMap<String, Object>) select("trainerDAO.select_class_info", jsonMap);
	}
	
	
	public List<?> selectNewApplyClassList(HashMap<String, Object> jsonMap) {
		return list("trainerDAO.select_newApplyClassList_list", jsonMap);
	}
	
	
	public void deleteNewApplyClass(HashMap<String, Object> jsonMap) {
		delete("trainerDAO.delete_newApplyClass_info", jsonMap);
	}
	
	
	@SuppressWarnings("unchecked")
	public HashMap<String, Object> selectNewApplyClassSingleInfo(HashMap<String, Object> jsonMap) {
		// TODO Auto-generated method stub
		return (HashMap<String, Object>) select("trainerDAO.select_newApplyClassSingle_info", jsonMap);
	}
	
	public void insertClassEvents(HashMap<String, Object> jsonMap) {
		insert("trainerDAO.insert_class_events", jsonMap);
	}
	
	public List<?> selectClassEventsList(HashMap<String, Object> jsonMap) {
		return list("trainerDAO.select_classEvent_list", jsonMap);
	}
	
	
	public void deleteClassEventsInfo(HashMap<String, Object> jsonMap) {
		delete("trainerDAO.delete_classEvent_info", jsonMap);
	}
	
	
}
