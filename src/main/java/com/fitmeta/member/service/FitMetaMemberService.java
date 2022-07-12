package com.fitmeta.member.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public interface FitMetaMemberService {

	
	public Map<String, Object> userLogin(HashMap<String, Object> jsonMap, HttpServletRequest request, HttpServletResponse response)  throws Exception;
	
	public Map<String, Object> userInfoReg(HashMap<String, Object> jsonMap) throws Exception;
	
	public Map<String, Object> chatUserList(HashMap<String, Object> jsonMap) throws Exception;
	
	public Map<String, Object> chatUserInfo(HashMap<String, Object> jsonMap) throws Exception;
	
	public Map<String, Object> msgInfoReg(HashMap<String, Object> jsonMap) throws Exception;
	
}
