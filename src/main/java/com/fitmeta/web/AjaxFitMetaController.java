package com.fitmeta.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fitmeta.main.service.FitMetaMainService;
import com.fitmeta.member.service.FitMetaMemberService;
import com.fitmeta.trainer.service.AjaxTrainerService;
import com.fitmeta.util.DateUtil;
import com.fitmeta.util.Log;
import com.fitmeta.util.PropertyUtil;
import com.fitmeta.util.StrUtil;

@Controller
public class AjaxFitMetaController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(AjaxFitMetaController.class);
	
	private String PROP_FILE = "/property/fitmeta.properties";
	
	@Autowired
	private  AjaxTrainerService ajaxTrainerService;
	
	@Autowired
	private  FitMetaMemberService fitMetaMemberService;
	
	@Autowired
	private  FitMetaMainService fitMetaMainService;
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/AjaxFitMetaController.do", method = RequestMethod.POST )
	@ResponseBody
	public Object get3DWorldControllerJSON(HttpServletRequest request, HttpServletResponse response, @RequestParam Map<String, String> params) {
		
		String jsondata = params.get("jsondata");
		
		long start_time = System.currentTimeMillis();
		
		Log.print(LOGGER,"==============================================================================================");
		Log.print(LOGGER,"/AjaxFitMetaController.do 데이타수신 jsondata :" + jsondata);
		Log.print(LOGGER,"==============================================================================================");
		
		ObjectMapper om = new ObjectMapper();
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		try {
			jsondata = URLDecoder.decode(jsondata, "UTF-8");
			Log.print(LOGGER, "[URLDecoder.decode후(1)..]>jsondata=" +jsondata);
		} catch (Exception e2) {
			Log.print(LOGGER, e2);
			resMap.put("retcode", "999");
			resMap.put("retmsg", "수신데이타 파싱에러:" + e2);
			return resMap;
		}
		
		jsondata = jsondata.replaceAll("”","\""); // 이상한 따옴표가...
		jsondata = jsondata.replaceAll("“","\""); // 이상한 따옴표가...
		
		Log.print(LOGGER,"[URLDecoder.decode후(2)..]>jsondata=" +jsondata);
		
		String service_tp = null;
		
		try {
			
			ObjectMapper mapper = new ObjectMapper();
			HashMap<String, Object>  jsonMap  = mapper.readValue(jsondata, HashMap.class);
			
			service_tp = (String) jsonMap.get("service_tp");		
			Log.print(LOGGER,"service_tp=[" +service_tp +"]");
			
			String inputcheckret = null;
			
			//getService_tp 값에 따른 case 처리
			switch (DefineService.Service.valueOf(service_tp))
			{	
			
	 			case pt_info_reg :
					if((inputcheckret = check_intpufield(jsonMap,(new String[]
					{	/* 공통부 */	"gUser_id", "user_tp", "crud_tp"}))) != null) break;
		 			resMap = ajaxTrainerService.ptInfoReg(jsonMap);
		 			break;
		 			
		 			
	 			case user_info_reg :
					if((inputcheckret = check_intpufield(jsonMap,(new String[]
					{	/* 공통부 */	"gUser_id", "user_tp", "crud_tp"}))) != null) break;
		 			resMap = fitMetaMemberService.userInfoReg(jsonMap);
		 			break;
			
				/*
				 *	로그인
				 */
				case user_login:
					if((inputcheckret = check_intpufield(jsonMap, (new String[] {
						/* check */ "gUser_id",
					}))) != null) break;
					resMap = fitMetaMemberService.userLogin(jsonMap, request, response);
					break;
					
					
				// [PT 정보 조회]
				case pt_info:
					if("pt".equals(jsonMap.get("user_tp")) && (inputcheckret = check_intpufield(jsonMap,(new String[]
					{	"user_id" }))) != null) break;
					if("pu".equals(jsonMap.get("user_tp")) && (inputcheckret = check_intpufield(jsonMap,(new String[]
					{	"pt_id" }))) != null) break;
					resMap = ajaxTrainerService.ptInfo(jsonMap);
					break;
					
					
				// [PT plan info]
				case pt_plan_info:
					if("pt".equals(jsonMap.get("user_tp")) && (inputcheckret = check_intpufield(jsonMap,(new String[]
					{	"user_id" }))) != null) break;
					if("pu".equals(jsonMap.get("user_tp")) && (inputcheckret = check_intpufield(jsonMap,(new String[]
					{	"pt_id" }))) != null) break;
					resMap = ajaxTrainerService.ptPlanInfo(jsonMap);
					break;
					
					
				// [PT contents info]
				case pt_contents_info:
					if("pt".equals(jsonMap.get("user_tp")) && (inputcheckret = check_intpufield(jsonMap,(new String[]
					{	"user_id" }))) != null) break;
					if("pu".equals(jsonMap.get("user_tp")) && (inputcheckret = check_intpufield(jsonMap,(new String[]
					{	"pt_id" }))) != null) break;
					resMap = ajaxTrainerService.ptContentsInfo(jsonMap);
					break;
					
					
				// [PT class info]
				case pt_class_info:
					if("pt".equals(jsonMap.get("user_tp")) && (inputcheckret = check_intpufield(jsonMap,(new String[]
					{	"user_id" }))) != null) break;
					if("pu".equals(jsonMap.get("user_tp")) && (inputcheckret = check_intpufield(jsonMap,(new String[]
					{	"pt_id" }))) != null) break;
					resMap = ajaxTrainerService.ptClassInfo(jsonMap);
					break;
					
					
				// [PT service info]
				case pt_service_info:
					if("pt".equals(jsonMap.get("user_tp")) && (inputcheckret = check_intpufield(jsonMap,(new String[]
					{	"user_id" }))) != null) break;
					if("pu".equals(jsonMap.get("user_tp")) && (inputcheckret = check_intpufield(jsonMap,(new String[]
					{	"pt_id" }))) != null) break;
					resMap = ajaxTrainerService.ptServiceInfo(jsonMap);
					break;
					
					
				// [PT news info]
				case pt_news_info:
					if("pt".equals(jsonMap.get("user_tp")) && (inputcheckret = check_intpufield(jsonMap,(new String[]
					{	"user_id" }))) != null) break;
					if("pu".equals(jsonMap.get("user_tp")) && (inputcheckret = check_intpufield(jsonMap,(new String[]
					{	"pt_id" }))) != null) break;
					resMap = ajaxTrainerService.ptNewsInfo(jsonMap);
					break;
					
					
				// [PT news info]
				case pt_news_single:
					if((inputcheckret = check_intpufield(jsonMap, (new String[] {
						/* check */ "pt_id", "news_id",
					}))) != null) break;
					resMap = ajaxTrainerService.ptNewsSingle(jsonMap);
					break;
					
					
				// [Main Page info]
				case main_page_info:
					resMap = fitMetaMainService.mainPageInfo(jsonMap);
					break;
					
					
				// [PT all info]
				case pt_all_info:
					if("pt".equals(jsonMap.get("user_tp")) && (inputcheckret = check_intpufield(jsonMap,(new String[]
					{	"user_id" }))) != null) break;
					if("pu".equals(jsonMap.get("user_tp")) && (inputcheckret = check_intpufield(jsonMap,(new String[]
					{	"pt_id" }))) != null) break;
					resMap = ajaxTrainerService.ptAllInfo(jsonMap);
					break;
					
					
				// [Class info]
				case class_info:
					if((inputcheckret = check_intpufield(jsonMap,(new String[] {"class_id"}))) != null) break;
					resMap = fitMetaMainService.classInfo(jsonMap);
					break;
					
					
				// [Chat user info list]
				case chat_user_list:
					if((inputcheckret = check_intpufield(jsonMap,(new String[] {"user_id"}))) != null) break;
					resMap = fitMetaMemberService.chatUserList(jsonMap);
					break;
					
				// [Chat user info]
				case chat_user_info:
					if((inputcheckret = check_intpufield(jsonMap,(new String[] {"user_id"}))) != null) break;
					resMap = fitMetaMemberService.chatUserInfo(jsonMap);
					break;
					
				// [Insert Msg Info]
				case msg_info_reg:
					if((inputcheckret = check_intpufield(jsonMap,(new String[] {"incoming_user_id", "outgoing_user_id"}))) != null) break;
					resMap = fitMetaMemberService.msgInfoReg(jsonMap);
					break;
					
				// [new apply class list info]
				case new_apply_class_info:
					if((inputcheckret = check_intpufield(jsonMap,(new String[] {"user_id"}))) != null) break;
					resMap = ajaxTrainerService.newApplyClassListInfo(jsonMap);
					break;
					
					
				// [delete new apply class list info]
				case delete_new_apply_class_info:
					if((inputcheckret = check_intpufield(jsonMap,(new String[] {"id", "user_id"}))) != null) break;
					resMap = ajaxTrainerService.deleteNewApplyClassInfo(jsonMap);
					break;
					
					
				// [new apply class single info]
				case new_apply_class_single_info:
					if((inputcheckret = check_intpufield(jsonMap,(new String[] {"id", "pt_id"}))) != null) break;
					resMap = ajaxTrainerService.newApplyClassSingleInfo(jsonMap);
					break;
					
				// [class event reg]
				case class_event_reg:
					if("c".equals(jsonMap.get("crud_tp")) && (inputcheckret = check_intpufield(jsonMap,(new String[]
					{	"pt_id", "user_id", "class_id" }))) != null) break;
					if("d".equals(jsonMap.get("crud_tp")) && (inputcheckret = check_intpufield(jsonMap,(new String[]
					{	"pt_id", "event_id" }))) != null) break;
					resMap = ajaxTrainerService.classEventReg(jsonMap);
					break;
					
				// [Class List Info]
				case class_list_info:
					resMap = fitMetaMainService.classListInfo(jsonMap);
					break;
					
					
	 			case review_info_reg :
		 			resMap = ajaxTrainerService.reviewInfoReg(jsonMap);
		 			break;
		 			
	 			case review_info :
		 			resMap = ajaxTrainerService.reviewInfo(jsonMap);
		 			break;
													
			}
			
		} catch (Exception e) {
			
			try {
				resMap.put("retcode", "999");
				resMap.put("retmsg", "시스템오류입니다.[" + e.getMessage()+ "]");
				System.out.println("error 시스템오류입니다 " + e);
			} catch (Exception e1) {}

			Log.print(LOGGER,"error 'AjaxFitMetaController.do', jsondata=" + jsondata);
			Log.print(LOGGER,e);
		}
		
		response.setHeader("retcode", (String)resMap.get("retcode"));
		response.setHeader("retmsg", (String)resMap.get("retmsg"));
		
		String jsonString = null;
		try {
			jsonString = om.writeValueAsString(resMap);
		} catch (Exception e) {
			e.printStackTrace();
			jsonString = e.getMessage();
		}
		

		long end_time = System.currentTimeMillis();
		Log.print(LOGGER,"/AjaxFitMetaController.do 결과전송, 처리시간(TimeMillis)=[" + (end_time-start_time) + "]");
		Log.print(LOGGER,"=========================================================\n\r");
		
		return resMap;
	}
	
	
	
	@RequestMapping(value = "/downThumbImg.do", method = RequestMethod.GET)
	public void downThumbImg(HttpServletRequest request, HttpServletResponse response, @RequestParam Map<String, String> params) throws Exception {
		
		PropertyUtil pl = new PropertyUtil(PROP_FILE);
		
        String filename = params.get("file");
        String dir = params.get("dir");
        String realPath = "";
        String root = "";
        
        if(dir.equals("class")) {
        	root = "pt_id_" + params.get("pt_id") + "\\" + "class_id_" + params.get("class_id") + "\\" + filename;
        } else if(dir.equals("news")) {
        	root = "pt_id_" + params.get("pt_id") + "\\" + "news_id_" + params.get("news_id") + "\\" + filename;
        } else if(dir.equals("pt")) {
        	root = "pt_id_" + params.get("pt_id") + "\\" + filename;
        }
		
        try {
            String browser = request.getHeader("User-Agent"); 
            //파일 인코딩 
            if (browser.contains("MSIE") || browser.contains("Trident")
                    || browser.contains("Chrome")) {
                filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
            } else {
                filename = new String(filename.getBytes("UTF-8"), "ISO-8859-1");
            }
        } catch (UnsupportedEncodingException ex) {
            System.out.println("UnsupportedEncodingException");
        }
        
        realPath = pl.get("IMG_UPLOAD_TRAINER_PATH") + root;
        System.out.println(realPath);
        File file1 = new File(realPath);
        if (!file1.exists()) {
        	Log.print(LOGGER, "업로드할 파일[---------------------------------------------------");
            return ;
        }
        
        Log.print(LOGGER, "업로드할 파일[==========================================================");
        
        // 파일명 지정        
        response.setContentType("application/octer-stream");
        response.setHeader("Content-Transfer-Encoding", "binary;");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
		
        try {
            OutputStream os = response.getOutputStream();
            FileInputStream fis = new FileInputStream(realPath);
 
            int ncount = 0;
            byte[] bytes = new byte[512];
 
            while ((ncount = fis.read(bytes)) != -1 ) {
                os.write(bytes, 0, ncount);
            }
            fis.close();
            os.close();
        } catch (FileNotFoundException ex) {
            System.out.println("FileNotFoundException");
        } catch (IOException ex) {
            System.out.println("IOException");
        }
	}
	
	
	private String check_intpufield(Map<String, Object>  jsonMap, String field[]) {

		String retmsg = null;
		for(int i=0;i<field.length;i++)
		{
			try
			{
				if(jsonMap.get(field[i]) == null ||String.valueOf(jsonMap.get(field[i])).trim().length() == 0)
				{
					retmsg = "입력필드를 확인하세요. 필드[" + field[i] + "]가 없거나 데이타가 셋팅이 안되어있음.";
					break;
				}
			}catch(Exception ee)
			{
				System.out.println(ee);
			}

			if(field[i].equals("inq_start_date") || field[i].equals("inq_end_date"))
			{
				if(!DateUtil.checkDateFormat((String) jsonMap.get(field[i]), "yyyyMMdd"))
				{
					retmsg = "inq_start_date/inq_end_date는 yyyyMMdd 형식입니다. ";
					break;
				}


				if(StrUtil.bigCompareTo((String) jsonMap.get("inq_start_date"), (String) jsonMap.get("inq_end_date")) > 0)
				{
					retmsg = "시작날짜가 종료날짜보다 큽니다.";
					break;
				}
			}
		}
		return retmsg;
	}

}
