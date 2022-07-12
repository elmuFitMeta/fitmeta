package com.fitmeta.member.service.impl;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.fitmeta.util.Log;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("fitmeta_userDAO")
public class FitMetaMemberDAO extends EgovAbstractDAO{
	
	private static final Logger LOGGER = LoggerFactory.getLogger(FitMetaMemberDAO.class);
	
	@SuppressWarnings("unchecked")
	public HashMap<String, Object> selectUser_by_p_login_id(HashMap<String, Object> vo) throws Exception {
		return (HashMap<String, Object>) select("fitmeta_userDAO.selectUser_by_g_user_id", vo);
	}
	
	public int insertUserInfo(HashMap<String, Object> vo) throws Exception {
		int newUserId = (int) insert("fitmeta_userDAO.user_reg", vo);
		return newUserId;
	}
	
	
	public List<?> selectChatUserList(HashMap<String, Object> jsonMap) {
		return list("fitmeta_userDAO.select_chat_user_list", jsonMap);
	}
	
	@SuppressWarnings("unchecked")
	public HashMap<String, Object> selectChatUserInfo(HashMap<String, Object> jsonMap) throws Exception {
		return (HashMap<String, Object>) select("fitmeta_userDAO.select_chat_user_info", jsonMap);
	}
	
	public void insertMsgInfo(HashMap<String, Object> msg) throws Exception {
		insert("fitmeta_userDAO.insert_msg", msg);
	}
	
	
	public List<?> selectMsgList(HashMap<String, Object> jsonMap) {
		return list("fitmeta_userDAO.select_msg_list", jsonMap);
	}
	
	
	public void updateMsgSeen(HashMap<String, Object> jsonMap) throws Exception {
		update("fitmeta_userDAO.update_msg_seen", jsonMap);
	}

}
