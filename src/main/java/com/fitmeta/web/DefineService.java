package com.fitmeta.web;

import com.fitmeta.util.Log;

public class DefineService {
	
	public static Log log = null;
	
	/*
	 * AjaxFitMetaController.java 에 정의된 내용과 일치시킨다.
	 */
	public enum Service
	{
		pt_info_reg,
		pt_info,
		conts_info_reg,
		plan_info_reg,
		user_login,
		pt_plan_info,
		pt_contents_info,
		pt_class_info,
		class_info_reg,
		pt_service_info,
		service_info_reg,
		pt_news_info,
		news_info_reg,
		pt_news_single,
		main_page_info,
		pt_all_info,
		review_info_reg,
		review_info,
		user_info_reg,
		class_list_info,
		class_info,
		chat_user_list,
		chat_user_info,
		msg_info_reg,
		new_apply_class_info,
		delete_new_apply_class_info,
		new_apply_class_single_info,
		class_event_reg
	}
	 
	// 한 페이지 당 출력될 개수
	public static int RE_LIST_CNT=1;

}
