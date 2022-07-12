package com.fitmeta.trainer.service.impl;

import java.io.File;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fitmeta.member.service.impl.FitMetaMemberDAO;
import com.fitmeta.trainer.service.AjaxTrainerService;
import com.fitmeta.util.FileUtil;
import com.fitmeta.util.Log;
import com.fitmeta.util.PropertyUtil;


@Service("ajaxTrainerService")
public class AjaxTrainerServiceImpl implements AjaxTrainerService {
	
	private String PROP_FILE = "/property/fitmeta.properties";
	
	private static final Logger LOGGER = LoggerFactory.getLogger(AjaxTrainerServiceImpl.class);
	
	@Autowired
	private AjaxTrainerDAO ajaxTrainerDAO;
	
	@Autowired
	private FitMetaMemberDAO fitMetaMemberDAO;
	

	@Override
	public Map<String, Object> ptInfoReg(HashMap<String, Object> jsonMap) throws Exception {
		// TODO Auto-generated method stub
		
		HashMap<String, Object> jsonRetMap = new HashMap<String, Object>();
		
		if("c".equals(jsonMap.get("crud_tp"))) {
			jsonRetMap = ptInfoReg_c(jsonMap);
		}
		
		return jsonRetMap;
	}
	
	
	/*
	 * trainer 등록
	 */
	@SuppressWarnings("unchecked")
	public HashMap<String, Object> ptInfoReg_c(HashMap<String, Object> jsonMap) {
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
			jsonMap.put("retmsg",	"can't insert user info.");	
			return jsonMap;
		}
		
		jsonMap.put("user_id", userId);
		
		// inserting gym info and get gym id
		int ptId = ajaxTrainerDAO.insertPtInfo(jsonMap);
		
		
		returnMap.put("retcode", "000");
		returnMap.put("retmsg",	"정상적으로 등록되었습니다.");
		
		return returnMap;
	}


	@Override
	public Map<String, Object> ptInfo(HashMap<String, Object> jsonMap) throws Exception {

		HashMap<String, Object> retMap = new HashMap<String, Object>();
		
		// Select PT Info
		HashMap<String, Object> ptInfo = ajaxTrainerDAO.selectPtInfo(jsonMap);
		
		if (ptInfo == null) {
			retMap.put("retcode", "999");
			retMap.put("retmsg", "조건에 맞는 데이타가 없습니다.");
			return retMap;
		}
		
		retMap.put("ptInfo", ptInfo);
		Log.print(LOGGER, "PT Information:  " + ptInfo);

		retMap.put("retcode", "000");
		retMap.put("retmsg", "정상적으로 조회되었습니다.");
		
		return retMap;
	}
	
	
	
	@Override
	public Map<String, Object> ptPlanInfo(HashMap<String, Object> jsonMap) throws Exception {

		HashMap<String, Object> retMap = new HashMap<String, Object>();
		
		
		if("pt".equals(jsonMap.get("user_tp"))) {
			
			// Select PT Info
			HashMap<String, Object> ptInfo = ajaxTrainerDAO.selectPtInfo(jsonMap);
			
			if (ptInfo == null) {
				retMap.put("retcode", "999");
				retMap.put("retmsg", "조건에 맞는 데이타가 없습니다.");
				return retMap;
			}
			
			jsonMap.put("pt_id", ptInfo.get("pt_id"));
			retMap.put("ptInfo", ptInfo);
			
			//select PT class info list
			List<?> classList = ajaxTrainerDAO.selectClassList(jsonMap);
			retMap.put("classList", classList);
			
		}
		
		// select PT plans info list
		List<?> planList = ajaxTrainerDAO.selectPlanList(jsonMap);
		for(int i=0; i < planList.size(); i++) { 
			HashMap<String, Object> planInfo = (HashMap<String, Object>) planList.get(i);
			jsonMap.put("plan_id", planInfo.get("plan_id"));
			List<?> planClassList = ajaxTrainerDAO.selectPlanClassList(jsonMap);
			planInfo.put("planClassList", planClassList);
		}
		
		
		retMap.put("planList", planList);
		retMap.put("retcode", "000");
		retMap.put("retmsg", "정상적으로 조회되었습니다.");
		
		return retMap;
	}
	
	
	
	@Override
	public Map<String, Object> ptContentsInfo(HashMap<String, Object> jsonMap) throws Exception {

		HashMap<String, Object> retMap = new HashMap<String, Object>();
		
		if("pt".equals(jsonMap.get("user_tp"))) {
			
			// Select PT Info
			HashMap<String, Object> ptInfo = ajaxTrainerDAO.selectPtInfo(jsonMap);
			
			if (ptInfo == null) {
				retMap.put("retcode", "999");
				retMap.put("retmsg", "조건에 맞는 데이타가 없습니다.");
				return retMap;
			}
			
			jsonMap.put("pt_id", ptInfo.get("pt_id"));
			retMap.put("ptInfo", ptInfo);
			Log.print(LOGGER, "PT Information:  " + ptInfo);
		}
		
		
		// select PT contents info list
		List<?> contentList = ajaxTrainerDAO.selectContentList(jsonMap);
		retMap.put("contentList", contentList);

		
		retMap.put("retcode", "000");
		retMap.put("retmsg", "정상적으로 조회되었습니다.");
		
		return retMap;
	}
	
	
	
	@Override
	public Map<String, Object> contentInfoReg(HashMap<String, Object> jsonMap, List<MultipartFile> aMultipartFile) throws Exception {
		// TODO Auto-generated method stub
		
		HashMap<String, Object> jsonRetMap = new HashMap<String, Object>();
		
		if("c".equals(jsonMap.get("crud_tp"))) {
			jsonRetMap = contentInfoReg_c(jsonMap);
		}
		
		if("d".equals(jsonMap.get("crud_tp"))) {
			jsonRetMap = contentInfoReg_d(jsonMap);
		}
		
		return jsonRetMap;
	}
	
	
	/*
	 * content 등록
	 */
	@SuppressWarnings("unchecked")
	public HashMap<String, Object> contentInfoReg_c(HashMap<String, Object> jsonMap) {
		// making return map
		HashMap<String, Object> returnMap = new HashMap<String, Object>();
				
		// insert content info
		int contsId = ajaxTrainerDAO.insertContentInfo(jsonMap);
				
		returnMap.put("retcode", "000");
		returnMap.put("retmsg",	"정상적으로 등록되었습니다.");
		
		return returnMap;
	}
	
	
	/*
	 * content delete
	 */
	@SuppressWarnings("unchecked")
	public HashMap<String, Object> contentInfoReg_d(HashMap<String, Object> jsonMap) {
		// making return map
		HashMap<String, Object> returnMap = new HashMap<String, Object>();
				
		// db에서 삭제
		int ret = ajaxTrainerDAO.deleteContentInfo(jsonMap);
				
		returnMap.put("retcode", "000");
		returnMap.put("retmsg",	"정상적으로 등록되었습니다.");
		
		return returnMap;
	}
	
	
	
	
	@Override
	public Map<String, Object> planInfoReg(HashMap<String, Object> jsonMap, List<MultipartFile> aMultipartFile) throws Exception {
		// TODO Auto-generated method stub
		
		HashMap<String, Object> jsonRetMap = new HashMap<String, Object>();
		
		if("c".equals(jsonMap.get("crud_tp"))) {
			jsonRetMap = planInfoReg_c(jsonMap);
		}
		
		if("d".equals(jsonMap.get("crud_tp"))) {
			jsonRetMap = planInfoReg_d(jsonMap);
		}
		
		return jsonRetMap;
	}
	
	
	
	/*
	 * plan 등록
	 */
	@SuppressWarnings("unchecked")
	public HashMap<String, Object> planInfoReg_c(HashMap<String, Object> jsonMap) {
		// making return map
		HashMap<String, Object> returnMap = new HashMap<String, Object>();
				
		// insert plan info
		int planId = ajaxTrainerDAO.insertPlanInfo(jsonMap);
		
		ArrayList classList = (ArrayList)jsonMap.get("arrClassInfo");
		if(classList == null) { classList = new ArrayList();  }
		
		for(int i=0; i < classList.size(); i++) { 
			HashMap<String, Object> classInfo = (HashMap<String, Object>) classList.get(i);
			classInfo.put("plan_id", planId);
			ajaxTrainerDAO.insertPlanClassInfo(classInfo);
		}
				
		returnMap.put("retcode", "000");
		returnMap.put("retmsg",	"정상적으로 등록되었습니다.");
		
		return returnMap;
	}
	
	
	/*
	 * delete the plan
	 */
	@SuppressWarnings("unchecked")
	public HashMap<String, Object> planInfoReg_d(HashMap<String, Object> jsonMap) {
		// making return map
		HashMap<String, Object> returnMap = new HashMap<String, Object>();
				
		// db에서 삭제
		int ret = ajaxTrainerDAO.deletePlanInfo(jsonMap);
		// delete classes of plan
		ajaxTrainerDAO.deletePlanClassInfo(jsonMap);
				
		returnMap.put("retcode", "000");
		returnMap.put("retmsg",	"정상적으로 등록되었습니다.");
		
		return returnMap;
	}
	
	
	
	
	@Override
	public Map<String, Object> classInfoReg(HashMap<String, Object> jsonMap, List<MultipartFile> aMultipartFile) throws Exception {
		// TODO Auto-generated method stub
		
		HashMap<String, Object> jsonRetMap = new HashMap<String, Object>();
		
		if("c".equals(jsonMap.get("crud_tp"))) {
			jsonRetMap = classInfoReg_c(jsonMap, aMultipartFile);
		}
		if("d".equals(jsonMap.get("crud_tp"))) {
			jsonRetMap = classInfoReg_d(jsonMap);
		}
		return jsonRetMap;
	}
	
	
	
	/*
	 * trainer class 등록
	 */
	@SuppressWarnings("unchecked")
	public HashMap<String, Object> classInfoReg_c(HashMap<String, Object> jsonMap, List<MultipartFile> aMultipartFile) {
		// making return map
		HashMap<String, Object> returnMap = new HashMap<String, Object>();
		
		// inserting user info and get user id
		int class_id = 0;
		try {
			class_id = ajaxTrainerDAO.insertClassInfo(jsonMap);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			jsonMap.put("retcode", 	"991");
			jsonMap.put("retmsg",	"can't insert pt class info.");	
			return jsonMap;
		}
		
		
		// making upload file path
		PropertyUtil pl = new PropertyUtil(PROP_FILE);
		String file_upload_path = pl.get("IMG_UPLOAD_TRAINER_PATH") + "pt_id_" + jsonMap.get("pt_id") + File.separator + "class_id_" + class_id + File.separator;
		

		// print out about file name
		for (int j = 0; j < aMultipartFile.size(); j++) {
			Log.print(LOGGER, "업로드할 파일[" + j + "]=[" + aMultipartFile.get(j).getOriginalFilename() + "]");
		}
		
		
		// upload files into folder
		String flName = null;		
		// 업로드된 파일명과 동일한지 체크
		if(aMultipartFile.size() > 0 && "file[]".equals(aMultipartFile.get(0).getName())) {
			FileUtil.makeDir(file_upload_path);

			try {
				flName = FileUtil.uploadFile(file_upload_path, aMultipartFile.get(0));
			} catch (Exception e) {
				jsonMap.put("retcode", 	"991");
				jsonMap.put("retmsg",	"파일를 UPLOAD 할 수 없습니다.");	
				return jsonMap;
			}
					
		}
		
		
		returnMap.put("retcode", "000");
		returnMap.put("retmsg",	"정상적으로 등록되었습니다.");
		
		return returnMap;
	}
	
	
	
	
	/*
	 * delete the class
	 */
	@SuppressWarnings("unchecked")
	public HashMap<String, Object> classInfoReg_d(HashMap<String, Object> jsonMap) {
		// making return map
		HashMap<String, Object> returnMap = new HashMap<String, Object>();
		
		
		PropertyUtil pl = new PropertyUtil(PROP_FILE);
		String folderPath = pl.get("IMG_UPLOAD_TRAINER_PATH") + "pt_id_" + jsonMap.get("pt_id") + File.separator + "class_id_" + jsonMap.get("class_id");
		String filePath = folderPath + File.separator + jsonMap.get("file_name");
		
		// delete file
		int iret = FileUtil.deleteFile(filePath);
		Log.print(LOGGER, "# deleteFile : [" + iret + "][" + filePath + "]");
		
		
		// delete folder
		FileUtil.deleteFolder(folderPath);
		Log.print(LOGGER, "# deleteFolder : [" + folderPath + "]");
		
				
		// db에서 삭제
		int ret = ajaxTrainerDAO.deleteClassInfo(jsonMap);
				
		returnMap.put("retcode", "000");
		returnMap.put("retmsg",	"정상적으로 등록되었습니다.");
		
		return returnMap;
	}
	
	
	
	
	@Override
	public Map<String, Object> ptClassInfo(HashMap<String, Object> jsonMap) throws Exception {

		HashMap<String, Object> retMap = new HashMap<String, Object>();
		
		if("pt".equals(jsonMap.get("user_tp"))) {
			
			// Select PT Info
			HashMap<String, Object> ptInfo = ajaxTrainerDAO.selectPtInfo(jsonMap);
			
			if (ptInfo == null) {
				retMap.put("retcode", "999");
				retMap.put("retmsg", "조건에 맞는 데이타가 없습니다.");
				return retMap;
			}
			
			jsonMap.put("pt_id", ptInfo.get("pt_id"));
			retMap.put("ptInfo", ptInfo);
			Log.print(LOGGER, "PT Information:  " + ptInfo);
		}
		
		
		//select PT contents info list
		List<?> classList = ajaxTrainerDAO.selectClassList(jsonMap);
		retMap.put("classList", classList);

		
		retMap.put("retcode", "000");
		retMap.put("retmsg", "정상적으로 조회되었습니다.");
		
		return retMap;
	}
	
	
	@Override
	public Map<String, Object> ptServiceInfo(HashMap<String, Object> jsonMap) throws Exception {

		HashMap<String, Object> retMap = new HashMap<String, Object>();
		
		if("pt".equals(jsonMap.get("user_tp"))) {
			// Select PT Info
			HashMap<String, Object> ptInfo = ajaxTrainerDAO.selectPtInfo(jsonMap);
			
			if (ptInfo == null) {
				retMap.put("retcode", "999");
				retMap.put("retmsg", "조건에 맞는 데이타가 없습니다.");
				return retMap;
			}
			
			jsonMap.put("pt_id", ptInfo.get("pt_id"));
			retMap.put("ptInfo", ptInfo);
			Log.print(LOGGER, "PT Information:  " + ptInfo);
		}
		
		
		
		// select PT services info list
		List<?> serviceList = ajaxTrainerDAO.selectServiceList(jsonMap);
		retMap.put("serviceList", serviceList);

		
		retMap.put("retcode", "000");
		retMap.put("retmsg", "정상적으로 조회되었습니다.");
		
		return retMap;
	}
	
	
	
	@Override
	public Map<String, Object> serviceInfoReg(HashMap<String, Object> jsonMap, List<MultipartFile> aMultipartFile) throws Exception {
		// TODO Auto-generated method stub
		
		HashMap<String, Object> jsonRetMap = new HashMap<String, Object>();
		
		if("c".equals(jsonMap.get("crud_tp"))) {
			jsonRetMap = serviceInfoReg_c(jsonMap);
		}
		if("d".equals(jsonMap.get("crud_tp"))) {
			jsonRetMap = serviceInfoReg_d(jsonMap);
		}
		return jsonRetMap;
	}
	
	
	
	/*
	 * trainer service 등록
	 */
	@SuppressWarnings("unchecked")
	public HashMap<String, Object> serviceInfoReg_c(HashMap<String, Object> jsonMap) {
		
		// making return map
		HashMap<String, Object> returnMap = new HashMap<String, Object>();

		
		// inserting user info and get user id
		int servId = 0;
		try {
			servId = ajaxTrainerDAO.insertServiceInfo(jsonMap);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			jsonMap.put("retcode", 	"991");
			jsonMap.put("retmsg",	"can not insert pt service info.");	
			return jsonMap;
		}
		
		
		returnMap.put("retcode", "000");
		returnMap.put("retmsg",	"정상적으로 등록되었습니다.");
		
		return returnMap;
	}
	
	
	
	/*
	 * delete the plan
	 */
	@SuppressWarnings("unchecked")
	public HashMap<String, Object> serviceInfoReg_d(HashMap<String, Object> jsonMap) {
		// making return map
		HashMap<String, Object> returnMap = new HashMap<String, Object>();
				
		// db에서 삭제
		int ret = ajaxTrainerDAO.deleteServiceInfo(jsonMap);
				
		returnMap.put("retcode", "000");
		returnMap.put("retmsg",	"정상적으로 등록되었습니다.");
		
		return returnMap;
	}
	
	
	
	@Override
	public Map<String, Object> ptNewsInfo(HashMap<String, Object> jsonMap) throws Exception {

		HashMap<String, Object> retMap = new HashMap<String, Object>();
		
		if("pt".equals(jsonMap.get("user_tp"))) {
			
			// Select PT Info
			HashMap<String, Object> ptInfo = ajaxTrainerDAO.selectPtInfo(jsonMap);
			
			if (ptInfo == null) {
				retMap.put("retcode", "999");
				retMap.put("retmsg", "조건에 맞는 데이타가 없습니다.");
				return retMap;
			}
			
			jsonMap.put("pt_id", ptInfo.get("pt_id"));
			retMap.put("ptInfo", ptInfo);
			Log.print(LOGGER, "PT Information:  " + ptInfo);
			
		}
		
		
		//select PT contents info list
		List<?> newsList = ajaxTrainerDAO.selectNewsList(jsonMap);
		retMap.put("newsList", newsList);

		
		retMap.put("retcode", "000");
		retMap.put("retmsg", "정상적으로 조회되었습니다.");
		
		return retMap;
	}
	
	
	@Override
	public Map<String, Object> newsInfoReg(HashMap<String, Object> jsonMap, List<MultipartFile> aMultipartFile) throws Exception {
		// TODO Auto-generated method stub
		
		HashMap<String, Object> jsonRetMap = new HashMap<String, Object>();
		
		if("c".equals(jsonMap.get("crud_tp"))) {
			jsonRetMap = newsInfoReg_c(jsonMap, aMultipartFile);
		}
		if("d".equals(jsonMap.get("crud_tp"))) {
			jsonRetMap = newsInfoReg_d(jsonMap);
		}
		return jsonRetMap;
	}
	
	
	
	/*
	 * trainer news 등록
	 */
	@SuppressWarnings("unchecked")
	public HashMap<String, Object> newsInfoReg_c(HashMap<String, Object> jsonMap, List<MultipartFile> aMultipartFile) {
		// making return map
		HashMap<String, Object> returnMap = new HashMap<String, Object>();
		
		// inserting news info and get news id
		int newsId = 0;
		try {
			newsId = ajaxTrainerDAO.insertNewsInfo(jsonMap);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			jsonMap.put("retcode", 	"991");
			jsonMap.put("retmsg",	"can't insert pt news info.");	
			return jsonMap;
		}
		
		
		// making upload file path
		PropertyUtil pl = new PropertyUtil(PROP_FILE);
		String file_upload_path = pl.get("IMG_UPLOAD_TRAINER_PATH") + "pt_id_" + jsonMap.get("pt_id") + File.separator + "news_id_" + newsId + File.separator;
		

		// print out about file name
		for (int j = 0; j < aMultipartFile.size(); j++) {
			Log.print(LOGGER, "업로드할 파일[" + j + "]=[" + aMultipartFile.get(j).getOriginalFilename() + "]");
		}
		
		
		// upload files into folder
		String flName = null;		
		// 업로드된 파일명과 동일한지 체크
		if("file[]".equals(aMultipartFile.get(0).getName())) {
			FileUtil.makeDir(file_upload_path);

			try {
				flName = FileUtil.uploadFile(file_upload_path, aMultipartFile.get(0));
			} catch (Exception e) {
				jsonMap.put("retcode", 	"991");
				jsonMap.put("retmsg",	"파일를 UPLOAD 할 수 없습니다.");	
				return jsonMap;
			}
					
		}
		
		
		returnMap.put("retcode", "000");
		returnMap.put("retmsg",	"정상적으로 등록되었습니다.");
		
		return returnMap;
	}
	
	
	
	
	/*
	 * delete the news
	 */
	@SuppressWarnings("unchecked")
	public HashMap<String, Object> newsInfoReg_d(HashMap<String, Object> jsonMap) {
		// making return map
		HashMap<String, Object> returnMap = new HashMap<String, Object>();
		
		
		PropertyUtil pl = new PropertyUtil(PROP_FILE);
		String folderPath = pl.get("IMG_UPLOAD_TRAINER_PATH") + "pt_id_" + jsonMap.get("pt_id") + File.separator + "news_id_" + jsonMap.get("news_id");
		String filePath = folderPath + File.separator + jsonMap.get("file_name");
		
		// delete file
		int iret = FileUtil.deleteFile(filePath);
		Log.print(LOGGER, "# deleteFile : [" + iret + "][" + filePath + "]");
		
		
		// delete folder
		FileUtil.deleteFolder(folderPath);
		Log.print(LOGGER, "# deleteFolder : [" + folderPath + "]");
		
				
		// db에서 삭제
		int ret = ajaxTrainerDAO.deleteNewsInfo(jsonMap);
				
		returnMap.put("retcode", "000");
		returnMap.put("retmsg",	"정상적으로 등록되었습니다.");
		
		return returnMap;
	}
	
	
	
	@Override
	public Map<String, Object> ptNewsSingle(HashMap<String, Object> jsonMap) throws Exception {

		HashMap<String, Object> retMap = new HashMap<String, Object>();
		
		// Select PT News Single Info 
		HashMap<String, Object> singleNews = ajaxTrainerDAO.selectPtNewsSingle(jsonMap);
		
		if (singleNews == null) {
			retMap.put("retcode", "999");
			retMap.put("retmsg", "조건에 맞는 데이타가 없습니다.");
			return retMap;
		}
		
		
		retMap.put("singleNews", singleNews);
		
		
		//select PT news info list
		List<?> newsList = ajaxTrainerDAO.selectNewsListBy(jsonMap);
		retMap.put("newsList", newsList);

		
		retMap.put("retcode", "000");
		retMap.put("retmsg", "정상적으로 조회되었습니다.");
		
		return retMap;
	}
	
	
	@Override
	public Map<String, Object> ptAllInfo(HashMap<String, Object> jsonMap) throws Exception {

		HashMap<String, Object> retMap = new HashMap<String, Object>();
		
		// Select PT Info
		HashMap<String, Object> ptInfo = ajaxTrainerDAO.selectPtAllInfo(jsonMap);
		
		if (ptInfo == null) {
			retMap.put("retcode", "999");
			retMap.put("retmsg", "조건에 맞는 데이타가 없습니다.");
			return retMap;
		}
		
		retMap.put("ptInfo", ptInfo);
		jsonMap.put("pt_id", ptInfo.get("pt_id"));
		
		
		//select PT class info list
		List<?> classList = ajaxTrainerDAO.selectClassList(jsonMap);
		retMap.put("classList", classList);
		
		
		// select PT contents info list
		List<?> contentList = ajaxTrainerDAO.selectContentList(jsonMap);
		retMap.put("contentList", contentList);
		
		
		//select PT news info list
		List<?> newsList = ajaxTrainerDAO.selectNewsList(jsonMap);
		retMap.put("newsList", newsList);

		
		retMap.put("retcode", "000");
		retMap.put("retmsg", "정상적으로 조회되었습니다.");
		
		return retMap;
	}
	
	
	
	public HashMap<String, Object> ptInfoRegU(HashMap<String, Object> jsonMap, List<MultipartFile> aMultipartFile) throws Exception {
		HashMap<String, Object> retMap = new HashMap<String, Object>();
		
		// making upload file path
		PropertyUtil pl = new PropertyUtil(PROP_FILE);
		String fileUploadPath = pl.get("IMG_UPLOAD_TRAINER_PATH") + "pt_id_" + jsonMap.get("pt_id") + File.separator;
		
		// Update User Info
		try {
			ajaxTrainerDAO.updateUserInfo(jsonMap);
		} catch (Exception e1) {
			e1.printStackTrace();
			jsonMap.put("retcode", 	"991");
			jsonMap.put("retmsg",	"can't update user info.");	
			return jsonMap;
		}
		
		
		// Update PT info
		try {
			ajaxTrainerDAO.updatePtInfo(jsonMap);
		} catch (Exception e1) {
			e1.printStackTrace();
			jsonMap.put("retcode", 	"991");
			jsonMap.put("retmsg",	"can't update pt info.");	
			return jsonMap;
		}
		
		
		// upload files into folder
		String flName = null;		
		// 업로드된 파일명과 동일한지 체크
		if(aMultipartFile.size() > 0 && "file[]".equals(aMultipartFile.get(0).getName())) {
			// delete file
			if(jsonMap.get("oldFileNm") != null) FileUtil.deleteFile(fileUploadPath + jsonMap.get("oldFileNm"));
			
			FileUtil.makeDir(fileUploadPath);

			try {
				flName = FileUtil.uploadFile(fileUploadPath, aMultipartFile.get(0));
				
				jsonMap.put("file_name", flName);
				ajaxTrainerDAO.updatePtImg(jsonMap);			
			} catch (Exception e) {
				jsonMap.put("retcode", 	"991");
				jsonMap.put("retmsg",	"파일를 UPLOAD 할 수 없습니다.");	
				return jsonMap;
			}				
		}
		
		
		retMap.put("retcode", "000");
		retMap.put("retmsg",	"정상적으로 등록되었습니다.");
		
		
		return retMap;
	}
	
	
	
	/*
	 * reg review 
	 */
	@SuppressWarnings("unchecked")
	public HashMap<String, Object> reviewInfoReg(HashMap<String, Object> jsonMap) {
		// making return map
		HashMap<String, Object> returnMap = new HashMap<String, Object>();
		
		// inserting review info
		try {
			ajaxTrainerDAO.insertReviewInfo(jsonMap);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			jsonMap.put("retcode", 	"991");
			jsonMap.put("retmsg",	"can't insert review info.");	
			return jsonMap;
		}
		
		
		returnMap.put("retcode", "000");
		returnMap.put("retmsg",	"정상적으로 등록되었습니다.");
		
		return returnMap;
	}
	
	
	@Override
	public Map<String, Object> reviewInfo(HashMap<String, Object> jsonMap) throws Exception {

		DecimalFormat df = new DecimalFormat("0.00");
		
		HashMap<String, Object> retMap = new HashMap<String, Object>();
		
		HashMap<String, Object> classInfo = ajaxTrainerDAO.selectClassInfo(jsonMap);
		retMap.put("classInfo", classInfo);
		
		// select review info list
		List<?> review = ajaxTrainerDAO.selectReviewList(jsonMap);
		
		double average_rating = 0.0;
		int total_review = 0;
		int five_star_review = 0;
		int four_star_review = 0;
		int three_star_review = 0;
		int two_star_review = 0;
		int one_star_review = 0;
		int total_user_rating = 0;
		
		for (int i = 0; i < review.size(); i++) {
			HashMap<String, Object> reviewInfo = (HashMap<String, Object>) review.get(i);
			int userRating = (int)reviewInfo.get("user_rating");
			switch (userRating) {
				case 1:
					one_star_review++;
					break;
				case 2:
					two_star_review++;
					break;
				case 3:
					three_star_review++;
					break;
				case 4:
					four_star_review++;
					break;
				case 5:
					five_star_review++;
					break;
	
				default:
					break;
			}
			
			total_review++;
			total_user_rating = total_user_rating + userRating;
		}
		
		if(review.size() != 0) average_rating = (double)total_user_rating / total_review;
		
		
		retMap.put("review_data", review);
		retMap.put("total_review", total_review);
		retMap.put("five_star_review", five_star_review);
		retMap.put("four_star_review", four_star_review);
		retMap.put("three_star_review", three_star_review);
		retMap.put("two_star_review", two_star_review);
		retMap.put("one_star_review", one_star_review);
		retMap.put("average_rating", df.format(average_rating));

		
		retMap.put("retcode", "000");
		retMap.put("retmsg", "정상적으로 조회되었습니다.");
		
		return retMap;
	}


	@Override
	public Map<String, Object> newApplyClassListInfo(HashMap<String, Object> jsonMap) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Object> retMap = new HashMap<String, Object>();
		
		// Select PT Info
		List<?> newApplyClassList = ajaxTrainerDAO.selectNewApplyClassList(jsonMap);
		
		if (newApplyClassList == null) {
			retMap.put("retcode", "999");
			retMap.put("retmsg", "조건에 맞는 데이타가 없습니다.");
			return retMap;
		}
		
		retMap.put("newApplyClassList", newApplyClassList);
		retMap.put("retcode", "000");
		retMap.put("retmsg", "정상적으로 조회되었습니다.");
		
		return retMap;
	}


	@Override
	public Map<String, Object> deleteNewApplyClassInfo(HashMap<String, Object> jsonMap) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Object> retMap = new HashMap<String, Object>();
		
		// delete review info
		try {
			ajaxTrainerDAO.deleteNewApplyClass(jsonMap);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			jsonMap.put("retcode", 	"991");
			jsonMap.put("retmsg",	"can't delete new apply class info info.");	
			return jsonMap;
		}
		
		// Select PT Info
		List<?> newApplyClassList = ajaxTrainerDAO.selectNewApplyClassList(jsonMap);
		
		if (newApplyClassList == null) {
			retMap.put("retcode", "999");
			retMap.put("retmsg", "조건에 맞는 데이타가 없습니다.");
			return retMap;
		}
		
		retMap.put("newApplyClassList", newApplyClassList);
		retMap.put("retcode", "000");
		retMap.put("retmsg", "정상적으로 조회되었습니다.");
		
		return retMap;
	}


	@Override
	public Map<String, Object> newApplyClassSingleInfo(HashMap<String, Object> jsonMap) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Object> retMap = new HashMap<String, Object>();
		
		// Select new apply class single Info
		HashMap<String, Object> classSingleInfo = ajaxTrainerDAO.selectNewApplyClassSingleInfo(jsonMap);		

		if (classSingleInfo == null) {
			retMap.put("retcode", "999");
			retMap.put("retmsg", "조건에 맞는 데이타가 없습니다.");
			return retMap;
		}		
		retMap.put("classSingleInfo", classSingleInfo);
		
		// Select Class Events List
		List<?> classEvents = ajaxTrainerDAO.selectClassEventsList(jsonMap);
		retMap.put("classEvents", classEvents);
		
		retMap.put("retcode", "000");
		retMap.put("retmsg", "정상적으로 조회되었습니다.");
		
		return retMap;
	}


	@Override
	public Map<String, Object> classEventReg(HashMap<String, Object> jsonMap) throws Exception {
		// TODO Auto-generated method stub	
		HashMap<String, Object> jsonRetMap = new HashMap<String, Object>();
		
		if("c".equals(jsonMap.get("crud_tp"))) {
			jsonRetMap = classEventReg_c(jsonMap);
		}
		if("d".equals(jsonMap.get("crud_tp"))) {
			jsonRetMap = classEventReg_d(jsonMap);
		}
		
		return jsonRetMap;
	}


	private HashMap<String, Object> classEventReg_c(HashMap<String, Object> jsonMap) {
		// TODO Auto-generated method stub
		HashMap<String, Object> jsonRetMap = new HashMap<String, Object>();

		try {
			ArrayList classEvents = (ArrayList) jsonMap.get("arrEvents");
			if(classEvents == null) { classEvents = new ArrayList();  }
			for(int i=0; i < classEvents.size(); i++) {
				HashMap<String, Object>  classEventsMap = (HashMap<String, Object>) classEvents.get(i);
				jsonMap.put("date", classEventsMap.get("date"));
				jsonMap.put("startTime", classEventsMap.get("startTime"));
				jsonMap.put("endTime", classEventsMap.get("endTime"));
				ajaxTrainerDAO.insertClassEvents(jsonMap);
			}
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			jsonRetMap.put("retcode", 	"991");
			jsonRetMap.put("retmsg",	"can't insert class event info.");	
			return jsonRetMap;
		}
		
		
		// Select Class Events List
		List<?> classEvents = ajaxTrainerDAO.selectClassEventsList(jsonMap);
		jsonRetMap.put("classEvents", classEvents);
		
		jsonRetMap.put("retcode", "000");
		jsonRetMap.put("retmsg", "정상적으로 조회되었습니다.");
		
		return jsonRetMap;
	}
	
	
	private HashMap<String, Object> classEventReg_d(HashMap<String, Object> jsonMap) {
		// TODO Auto-generated method stub
		HashMap<String, Object> jsonRetMap = new HashMap<String, Object>();

		try {
			ajaxTrainerDAO.deleteClassEventsInfo(jsonMap);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			jsonRetMap.put("retcode", 	"991");
			jsonRetMap.put("retmsg",	"can't delete class event info.");	
			return jsonRetMap;
		}
		
		
		// Select Class Events List
		List<?> classEvents = ajaxTrainerDAO.selectClassEventsList(jsonMap);
		jsonRetMap.put("classEvents", classEvents);
		
		jsonRetMap.put("retcode", "000");
		jsonRetMap.put("retmsg", "정상적으로 조회되었습니다.");
		
		return jsonRetMap;
	}

}
