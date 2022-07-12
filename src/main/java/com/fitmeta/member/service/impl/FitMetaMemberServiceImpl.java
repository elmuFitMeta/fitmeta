package com.fitmeta.member.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fitmeta.main.service.impl.FitMetaMainDAO;
import com.fitmeta.member.service.FitMetaMemberService;
import com.fitmeta.util.Log;
import com.fitmeta.util.PropertyUtil;



@Service("fitMetaMemberService")
public class FitMetaMemberServiceImpl implements FitMetaMemberService {
	
	private String PROP_FILE = "/property/3dbank.properties";
	
	private static final Logger LOGGER = LoggerFactory.getLogger(FitMetaMemberServiceImpl.class);

	@Autowired
	private FitMetaMemberDAO fitMetaMemberDAO;
	
	@Autowired
	private FitMetaMainDAO fitMetaMainDAO;
	
	
	/*
	 * 로그인
	 */
	@SuppressWarnings("unchecked")
	@Override
	public Map<String, Object> userLogin(HashMap<String, Object> jsonMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		PropertyUtil pl = new PropertyUtil(PROP_FILE);
		
		request.getSession().invalidate();
		
		HashMap<String, Object> map = fitMetaMemberDAO.selectUser_by_p_login_id(jsonMap);
		
		if (map == null) {
			jsonMap = new HashMap<String, Object>();
			jsonMap.put("retcode", "991");
			jsonMap.put("retmsg", "미등록된 로그인ID입니다.");
			return jsonMap;
		}
		
		Log.print(LOGGER, "ajaxMemberDAO.selectUser_by_gUser_id. map=" + map);
		
		jsonMap.put("retcode", "000");
		jsonMap.put("retmsg", "정상적으로 로그인되었습니다.");
		
		if ("000".equals(jsonMap.get("retcode"))) {
			if (map.get("gUser_id") != null) {
				request.getSession().setAttribute("user_id", String.valueOf(map.get("user_id")));
				request.getSession().setAttribute("gUser_id", String.valueOf(map.get("gUser_id")));
				request.getSession().setAttribute("user_tp", String.valueOf(map.get("user_tp")));
				request.getSession().setAttribute("user_name", String.valueOf(map.get("user_name")));
				request.getSession().setAttribute("user_mail", String.valueOf(map.get("user_mail")));
				request.getSession().setAttribute("user_mobile", String.valueOf(map.get("user_mobile")));
				
				UUID randomeUUID = UUID.randomUUID();
				String token_id = randomeUUID.toString().replaceAll("-", "");
				response.addCookie(new Cookie("token_id", token_id + "_" + map.get("user_id")));
				request.getSession().setAttribute("token_id", token_id + "_" + map.get("user_id"));
				
				// 로그인후 응답에 셋팅
				jsonMap.put("token_id", token_id + "_" + map.get("user_id"));
				jsonMap.put("user_tp", map.get("user_tp"));
			}
		}
		
		
		return jsonMap;
	}
	
	
	
	@Override
	public Map<String, Object> userInfoReg(HashMap<String, Object> jsonMap) throws Exception {
		// TODO Auto-generated method stub
		
		HashMap<String, Object> jsonRetMap = new HashMap<String, Object>();
		
		if("c".equals(jsonMap.get("crud_tp"))) {
			jsonRetMap = userInfoReg_c(jsonMap);
		}
		
		return jsonRetMap;
	}
	
	
	
	/*
	 * trainer 등록
	 */
	@SuppressWarnings("unchecked")
	public HashMap<String, Object> userInfoReg_c(HashMap<String, Object> jsonMap) {
		// making return map
		HashMap<String, Object> returnMap = new HashMap<String, Object>();
		
		// inserting user info and get user id
		int userId = 0;
		try {
			userId = fitMetaMemberDAO.insertUserInfo(jsonMap);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			jsonMap.put("retcode", 	"991");
			jsonMap.put("retmsg",	"Can't insert user info.");	
			return jsonMap;
		}
		
		
		returnMap.put("retcode", "000");
		returnMap.put("retmsg",	"정상적으로 등록되었습니다.");
		
		return returnMap;
	}
	
	
	@Override
	public Map<String, Object> chatUserList(HashMap<String, Object> jsonMap) throws Exception {

		HashMap<String, Object> retMap = new HashMap<String, Object>();
		
		// Select PTs Info 
		List<?> userList = fitMetaMemberDAO.selectChatUserList(jsonMap);
		
		if (userList == null) {
			retMap.put("retcode", "999");
			retMap.put("retmsg", "조건에 맞는 데이타가 없습니다.");
			return retMap;
		}	
		retMap.put("userList", userList);

		
		retMap.put("retcode", "000");
		retMap.put("retmsg", "정상적으로 조회되었습니다.");
		
		return retMap;
	}
	
	
	
	@Override
	public Map<String, Object> chatUserInfo(HashMap<String, Object> jsonMap) throws Exception {

		HashMap<String, Object> retMap = new HashMap<String, Object>();
		
		// Select User Info 
		HashMap<String, Object> userInfo = fitMetaMemberDAO.selectChatUserInfo(jsonMap);
		
		if (userInfo == null) {
			retMap.put("retcode", "999");
			retMap.put("retmsg", "조건에 맞는 데이타가 없습니다.");
			return retMap;
		}	
		retMap.put("userInfo", userInfo);
		
		List<?> msgList = fitMetaMemberDAO.selectMsgList(jsonMap);
		retMap.put("msgList", msgList);
		
		fitMetaMemberDAO.updateMsgSeen(jsonMap);

		
		retMap.put("retcode", "000");
		retMap.put("retmsg", "정상적으로 조회되었습니다.");
		
		return retMap;
	}
	
	
	
	@Override
	public Map<String, Object> msgInfoReg(HashMap<String, Object> jsonMap) throws Exception {
		// TODO Auto-generated method stub
		
		HashMap<String, Object> jsonRetMap = new HashMap<String, Object>();
		
		if("c".equals(jsonMap.get("crud_tp"))) {
			jsonRetMap = msgInfoReg_c(jsonMap);
		}
		
		return jsonRetMap;
	}
	
	
	/*
	 * trainer 등록
	 */
	@SuppressWarnings("unchecked")
	public HashMap<String, Object> msgInfoReg_c(HashMap<String, Object> jsonMap) {
		// making return map
		HashMap<String, Object> returnMap = new HashMap<String, Object>();
		
		// inserting msg info
		try {
			fitMetaMemberDAO.insertMsgInfo(jsonMap);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			jsonMap.put("retcode", 	"991");
			jsonMap.put("retmsg",	"Can't insert msg info.");	
			return jsonMap;
		}
		
		// Select msg Info 
		if(jsonMap.get("redirectPath") == null) {
			List<?> msgList = fitMetaMemberDAO.selectMsgList(jsonMap);
			returnMap.put("msgList", msgList);
		}
		
		if(jsonMap.get("redirectPath") != null) {
			fitMetaMainDAO.insertNewApplyClassInfo(jsonMap);
		}
		
		returnMap.put("retcode", "000");
		
		return returnMap;
	}

}











