/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.fitmeta.web;

import java.util.HashMap;
import java.util.List;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springmodules.validation.commons.DefaultBeanValidator;

/**
 * @Class Name : EgovSampleController.java
 * @Description : EgovSample Controller Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 
 * @version 1.0
 * @see
 *
 *  Copyright (C) by DREAMHANKS All right reserved.
 */


@Controller
public class PageFitMetaController {

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;


	// ---------------------------------- MAIN PAGE CONTROLLER ----------------------------------------
	
	@RequestMapping(value = "/index.do")
	public String index(ModelMap model) throws Exception {
		return "index";
	}
	
	
	@RequestMapping(value = "/main/about.do")
	public String mainAbout(ModelMap model) throws Exception {
		return "main/about";
	}
	
	
	@RequestMapping(value = "/main/service.do")
	public String mainService(ModelMap model) throws Exception {
		return "main/service";
	}
	
	
	@RequestMapping(value = "/main/team.do")
	public String mainTeam(ModelMap model) throws Exception {
		return "main/team";
	}
	
	
	@RequestMapping(value = "/main/news.do")
	public String mainNews(ModelMap model) throws Exception {
		return "main/news";
	}
	
	
	@RequestMapping(value = "/main/single.do")
	public String mainSingle(ModelMap model) throws Exception {
		return "main/single";
	}
	
	
	@RequestMapping(value = "/main/contact.do")
	public String mainContact(ModelMap model) throws Exception {
		return "main/contact";
	}
	
	
	@RequestMapping(value = "/main/class-list.do")
	public String mainClassList(ModelMap model) throws Exception {
		return "main/class-list";
	}
	
	
	@RequestMapping(value = "/main/class-single.do")
	public String mainSingleClass(Model model, SessionStatus status, HttpSession session) throws Exception {
		
		String page = null;
		if (session != null && session.getAttribute("user_id") != null)
			page = "main/class-single";
		else
			page = "redirect:/index.do";
		
		return page;
	}
	
	
	@RequestMapping(value = "/main/user-chatting.do")
	public String mainUserChatting(Model model, SessionStatus status, HttpSession session) throws Exception {

		String page = null;
		if (session != null && session.getAttribute("user_id") != null)
			page = "main/user-chatting";
		else
			page = "redirect:/index.do";
		
		return page;
	}
	
	
	@RequestMapping(value = "/main/chatting.do")
	public String mainChatting(Model model, SessionStatus status, HttpSession session) throws Exception {

		String page = null;
		if (session != null && session.getAttribute("user_id") != null)
			page = "main/chatting";
		else
			page = "redirect:/index.do";
		
		return page;
	}
	
	
	
	// ----------------------------------- LAYER PAGE CONTROLLER --------------------------------------
	
	@RequestMapping(value = "/layer/login.do")
	public String loginWithGoogle(ModelMap model) throws Exception {
		return "layer/login";
	}
	
	
	@RequestMapping(value = "/layer/pTreg.do")
	public String signUpTr(ModelMap model) throws Exception {
		return "layer/pTreg";
	}
	
	
	@RequestMapping(value = "/layer/userReg.do")
	public String signUpUser(ModelMap model) throws Exception {
		return "layer/user-reg";
	}
	
	
	
	//-------------------------- PT PAGE CONTROLLER ----------------------------------------------
	
	
	@RequestMapping(value = "/pt/index.do")
	public String ptIndex(@ModelAttribute HashMap<Object, Object> searchVO, BindingResult bindingResult, Model model, SessionStatus status, HttpSession session) {
		
		String page = null;
		if (session != null && session.getAttribute("user_id") != null && "2".equals(session.getAttribute("user_tp")))
			page = "pt/index";
		else
			page = "redirect:/index.do";
		
		return page;
	}
	
	
	@RequestMapping(value = "/pt/about.do")
	public String ptAbout(@ModelAttribute HashMap<Object, Object> searchVO, BindingResult bindingResult, Model model, SessionStatus status, HttpSession session) {

		String page = null;
		if (session != null && session.getAttribute("user_id") != null && "2".equals(session.getAttribute("user_tp")))
			page = "pt/about";
		else
			page = "redirect:/index.do";
		
		return page;
	}
	
	
	@RequestMapping(value = "/pt/class.do")
	public String ptClass(@ModelAttribute HashMap<Object, Object> searchVO, BindingResult bindingResult, Model model, SessionStatus status, HttpSession session) {
		
		String page = null;
		if (session != null && session.getAttribute("user_id") != null && "2".equals(session.getAttribute("user_tp")))
			page = "pt/class";
		else
			page = "redirect:/index.do";
		
		return page;
	}
	
	
	@RequestMapping(value = "/pt/register.do")
	public String ptRegister(@ModelAttribute HashMap<Object, Object> searchVO, BindingResult bindingResult, Model model, SessionStatus status, HttpSession session) {
		
		String page = null;
		if (session != null && session.getAttribute("user_id") != null && "2".equals(session.getAttribute("user_tp")))
			page = "pt/register";
		else
			page = "redirect:/index.do";
		
		return page;
	}
	
	
	@RequestMapping(value = "/pt/register-single.do")
	public String ptRegisterSingle(@ModelAttribute HashMap<Object, Object> searchVO, BindingResult bindingResult, Model model, SessionStatus status, HttpSession session) {
		
		String page = null;
		if (session != null && session.getAttribute("user_id") != null && "2".equals(session.getAttribute("user_tp")))
			page = "pt/register-single";
		else
			page = "redirect:/index.do";
		
		return page;
	}
	
	
	@RequestMapping(value = "/pt/contents.do")
	public String ptContents(@ModelAttribute HashMap<Object, Object> searchVO, BindingResult bindingResult, Model model, SessionStatus status, HttpSession session) {
		
		String page = null;
		if (session != null && session.getAttribute("user_id") != null && "2".equals(session.getAttribute("user_tp")))
			page = "pt/contents";
		else
			page = "redirect:/index.do";
		
		return page;
	}
	
	
	@RequestMapping(value = "/pt/news.do")
	public String ptNews(@ModelAttribute HashMap<Object, Object> searchVO, BindingResult bindingResult, Model model, SessionStatus status, HttpSession session) {
		
		String page = null;
		if (session != null && session.getAttribute("user_id") != null && "2".equals(session.getAttribute("user_tp")))
			page = "pt/news";
		else
			page = "redirect:/index.do";
		
		return page;
	}
	
	
	@RequestMapping(value = "/pt/price.do")
	public String ptPrice(@ModelAttribute HashMap<Object, Object> searchVO, BindingResult bindingResult, Model model, SessionStatus status, HttpSession session) {
		
		String page = null;
		if (session != null && session.getAttribute("user_id") != null && "2".equals(session.getAttribute("user_tp")))
			page = "pt/price";
		else
			page = "redirect:/index.do";
		
		return page;
	}
	
	
	@RequestMapping(value = "/pt/service.do")
	public String ptService(@ModelAttribute HashMap<Object, Object> searchVO, BindingResult bindingResult, Model model, SessionStatus status, HttpSession session) {
		
		String page = null;
		if (session != null && session.getAttribute("user_id") != null && "2".equals(session.getAttribute("user_tp")))
			page = "pt/service";
		else
			page = "redirect:/index.do";
		
		return page;
	}
	
	
	@RequestMapping(value = "/pt/single.do")
	public String ptSingle(@ModelAttribute HashMap<Object, Object> searchVO, BindingResult bindingResult, Model model, SessionStatus status, HttpSession session) {
		
		String page = null;
		if (session != null && session.getAttribute("user_id") != null && "2".equals(session.getAttribute("user_tp")))
			page = "pt/single";
		else
			page = "redirect:/index.do";
		
		return page;
	}
	
	
	
	//-------------------------- PT PAGE CONTROLLER TEST ----------------------------------------------
	
	@RequestMapping(value = "/ptraining/write.do")
	public String pTrainingWrite(@ModelAttribute HashMap<Object, Object> searchVO, BindingResult bindingResult, Model model, SessionStatus status, HttpSession session) {
		return "pTraining/write";
	}
	
	
	@RequestMapping(value = "/ptraining/index.do")
	public String pTrainingIndex(@ModelAttribute HashMap<Object, Object> searchVO, BindingResult bindingResult, Model model, SessionStatus status, HttpSession session) {
		return "pTraining/index";
	}
	
	
	@RequestMapping(value = "/ptraining/admin.do")
	public String pTrainingAdmin(@ModelAttribute HashMap<Object, Object> searchVO, BindingResult bindingResult, Model model, SessionStatus status, HttpSession session) {
		return "pTraining/admin";
	}
	
	
	@RequestMapping(value = "/ptraining/ptPage.do")
	public String pTrainingPage(@ModelAttribute HashMap<Object, Object> searchVO, BindingResult bindingResult, Model model, SessionStatus status, HttpSession session) {
		return "pTraining/ptPage";
	}
	
	
	
	//---------------------------- TOP TRAINING PAGE CONTROLLER ------------------------------------------------
	
	@RequestMapping(value = "/topTraining/index.do")
	public String topTrainingIndex(@ModelAttribute HashMap<Object, Object> searchVO, BindingResult bindingResult, Model model, SessionStatus status, HttpSession session) {
		return "topTraining/index";
	}
	
	@RequestMapping(value = "/topTraining/about.do")
	public String topTrainingAbout(@ModelAttribute HashMap<Object, Object> searchVO, BindingResult bindingResult, Model model, SessionStatus status, HttpSession session) {
		return "topTraining/about";
	}
	
	
	@RequestMapping(value = "/topTraining/service.do")
	public String topTrainingService(@ModelAttribute HashMap<Object, Object> searchVO, BindingResult bindingResult, Model model, SessionStatus status, HttpSession session) {
		return "topTraining/service";
	}
	
	
	@RequestMapping(value = "/topTraining/price.do")
	public String topTrainingPrice(@ModelAttribute HashMap<Object, Object> searchVO, BindingResult bindingResult, Model model, SessionStatus status, HttpSession session) {
		return "topTraining/price";
	}
	
	
	@RequestMapping(value = "/topTraining/class.do")
	public String topTrainingClass(@ModelAttribute HashMap<Object, Object> searchVO, BindingResult bindingResult, Model model, SessionStatus status, HttpSession session) {
		return "topTraining/class";
	}
	
	
	@RequestMapping(value = "/topTraining/contents.do")
	public String topTrainingContents(@ModelAttribute HashMap<Object, Object> searchVO, BindingResult bindingResult, Model model, SessionStatus status, HttpSession session) {
		return "topTraining/contents";
	}
	
	
	@RequestMapping(value = "/topTraining/news.do")
	public String topTrainingNews(@ModelAttribute HashMap<Object, Object> searchVO, BindingResult bindingResult, Model model, SessionStatus status, HttpSession session) {
		return "topTraining/news";
	}
	
	@RequestMapping(value = "/topTraining/single.do")
	public String topTrainingSingle(@ModelAttribute HashMap<Object, Object> searchVO, BindingResult bindingResult, Model model, SessionStatus status, HttpSession session) {
		return "topTraining/single";
	}
	
	@RequestMapping(value = "/topTraining/contact.do")
	public String topTrainingContact(@ModelAttribute HashMap<Object, Object> searchVO, BindingResult bindingResult, Model model, SessionStatus status, HttpSession session) {
		return "topTraining/contact";
	}
	
	@RequestMapping(value = "/topTraining/rating.do")
	public String topTrainingRating(@ModelAttribute HashMap<Object, Object> searchVO, BindingResult bindingResult, Model model, SessionStatus status, HttpSession session) {
		return "topTraining/rating";
	}
		
}
