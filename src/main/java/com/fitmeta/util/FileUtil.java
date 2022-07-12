/*
 * @(#)FileUtil.java	1.0  2021/12/15
 *
 * Copyright 2001 - 2004 Bestech, Inc. All rights reserved.
 * This software is the proprietary information of Bestech, Inc.
 * Use is subject to license terms.
 */

package com.fitmeta.util;

import java.io.*;
import java.nio.channels.FileChannel;
//import java.text.*;
import java.util.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;


/**
 * File 관련 Utility. File 을 읽고, 원하는 형태로 쓰고, 파일관련 속성 정보를 얻는다.
 * 
 * @author  ELMU
 * @version 1.0, 2022/04/13
 * @since   1.0
 */
public class FileUtil
{
	static Logger log = LoggerFactory.getLogger(FileUtil.class);
	/**
	 * sPath1파일을 sPath2로 옮긴다.
	 *
	 * @param sPath1 소스 파일명(절대패스포함)
	 * @param sPath2 옮길 파일명(절대패스포함)
	 * @return 0(정상), 그외(비정상)
	 */
	public static int moveFile(String sPath1, String sPath2)
	{
		try
		{
			int copySize = 0;
			File srcFile = new File(sPath1);
			File desFile = new File(sPath2);

			if( !srcFile.exists() ) return -1;
			if( srcFile.isDirectory() ) return -2;

			if( desFile.isDirectory() )
			{
				int i;
				String sFileName = new String();

				for(i=sPath1.length(); i>= 0; i--)
				{	
					if(sPath1.substring(i-1,i).equals("/"))
						break;
				}

				sFileName = sPath1.substring(i, sPath1.length());

				if(sPath2.substring(sPath2.length()-1, sPath2.length()).equals("/"))
				{
					sPath2 += sFileName;
				}
				else
				{
					sPath2 += ("/" + sFileName);
				}
			}
			desFile = new File(sPath2);

			InputStream in = new FileInputStream( srcFile );
       		OutputStream out = new FileOutputStream( desFile );
       		byte buf[] = new byte[2048];

       		for( int cnt; (cnt = in.read(buf)) != -1; )
			{
        		copySize += cnt;
            	out.write( buf, 0, cnt );
       		}
       		in.close();
       		out.close();
	
			srcFile.delete();  
		}
		catch(Exception e)
		{
			log.error("In MoveFile() Exception : " + e );
			return -3;
		}

		return 0;
   } // End : int MoveFile()


	/**
	 * info문자열을 파일에 Append한다.
	 *
	 * @param file 파일명(절대패스포함)
	 * @param info 첨부할 문자열
	 * @return void
	 */
	public synchronized static void appendStringToFile(String file, String info)
	{
		FileWriter logs = null;

		try
		{
			logs = new FileWriter(file, true);

			logs.write(info);
			logs.close();
		}
		catch(IOException e)
		{
			// log.info("IOException err:" + e);
		}
		catch(Exception e)
		{
			// log.info("Exception err:" + e);
		}
		finally
		{
			if( logs != null ) try { logs.close(); }catch(Exception e) {}
		}
		return;
	} // End : void appendStringToFile()


	/**
	 * 파일의 길이를 구한다.
	 *
	 * @param sfileName 파일명(절대패스포함)
	 * @return 파일길이
	 */
    public static long getFileSize(String sfileName)
    {
		try
		{
			File file = new File(sfileName);
			return file.length();
		}
		catch(Exception e)
		{
			;
		}
		return 0;
    }

	/**
	 * sPath 에서 파일명이 sName으로 시작하는 화일들을 골라내서 sAS 정보를 가지고 소트한다음 ArrayList 형태로 리턴한다.
	 *
	 * @param sPath 절대패스
	 * @param sName 파일의 일부명( "*" 이면 모든 파일)
	 * @param sAS 소트기준 문자열( "+" : 오름차순 or "-" : 내림차순)
	 * @return 파일리스트 ArrayList
	 */
    public static ArrayList getFileListBySort(String sPath , String sName, String sAS)
    {

		ArrayList alist = new ArrayList(); //배열리스트
		ArrayList ConvAlist = new ArrayList(); //배열리스트


		File	srcDirFile	= new File(sPath);
		File[]	srcListFile = srcDirFile.listFiles();

		String desFileName;

		int		su=0;

		for(int i=0; i < srcListFile.length; i++)
		{

			desFileName = srcListFile[i].getName();

			if( !srcListFile[i].isDirectory() )
			{
				//log.info("desFileName=[" + desFileName + "]");
				
				if(!sName.equals("*"))
				{
					// sName의 형태의 화일인지 체크
					if(sName.length() > desFileName.length())
						continue;

					if(!sName.equals(desFileName.substring(0,sName.length())))
						continue;
				}
				alist.add(desFileName); 
				su ++;
			}
		} 

		Collections.sort(alist);

		if(sAS.equals("+"))
		{
			return alist;
		}
		else if(sAS.equals("-"))
		{
			for(int i = alist.size()-1; i >= 0;  i--)
			{
				ConvAlist.add(alist.get(i));
				//log.info("ConvAlist=[" + alist.get(i)+ "]");
			}
			return ConvAlist;
		}
		else
		{
			return null;
		}
	} // End : ArrayList getFileListBySort()

	/**
	 * 디렉토리를 생성한다.
	 *
	 * @param sPath 절대패스
	 * @return void
	 * @since 1.0
	 */
    public static void makeDir(String sPath)
	{
		File desDirFile	= new File(sPath);
		if( !desDirFile.exists() )
			desDirFile.mkdir();
	}


	/**
	 * 디렉토리가 존재하는지 체크한다.
	 *
	 * @param sPath 절대패스
	 * @return void
	 * @since 1.0
	 */
    public static boolean isDirExist(String sPath)
	{	
		File	desDirFile	=	new File(sPath);
		if( desDirFile.exists() )
			return true;
		else
			return false;
	}

	/**
	 * 파일을 내용을 주석("#")을 제외하고 한행씩 ArrayList에 저장하여 반환한다.
	 *
	 * @param sFile 파일명(절대패스포함)
	 * @return 파일내용이 있는 ArrayList
	 * @since 1.0
	 */
	public	static ArrayList getOneLineListToFile2(String sFile)
	{
		String		line;
		ArrayList	aList = new ArrayList();

        FileReader reader = null;
        BufferedReader in = null;


		try
		{
            reader = new FileReader(new File(sFile));
            in = new BufferedReader(reader);
		}
		catch(Throwable e)
		{

			try
			{
				if(reader != null)
					reader.close();
				if(in != null)
               		in.close();
			}
			catch(Exception e1)
			{}

			return null;
		}


		try
		{
			// file을 한행씩 읽어 들인다. 
			while((line = in.readLine()) != null)
			{
				if(line.indexOf("#")==0) continue;	

				aList.add(line);
			}

			if(reader != null)
                reader.close();
            if(in != null)
                in.close();
		}
		catch(IOException e)
		{
            try
            {
                if(reader != null)
                    reader.close();
                if(in != null)
                    in.close();
            }
            catch(IOException e1)
            {}

			log.error("Error(Util) in reading=[" + e + "]");	
		}	

		return aList;
	}

	/**
	 * 파일을 내용을 한행씩 ArrayList에 저장하여 반환한다.
	 *
	 * @param sFile 파일명(절대패스포함)
	 * @return 파일내용이 있는 ArrayList
	 * @since 1.0
	 */
	public	static ArrayList getOneLineListToFile(String sFile)
	{
		String		line;
		ArrayList	aList = new ArrayList();

        FileReader reader = null;
        BufferedReader in = null;


		try
		{
            reader = new FileReader(new File(sFile));
            in = new BufferedReader(reader);

		}
		catch(Throwable e)
		{

			try
			{
				if(reader != null)
					reader.close();
				if(in != null)
               		in.close();
			}
			catch(Exception e1)
			{}

			return null;
		}


		try
		{
			// file을 한행씩 읽어 들인다. 
			while((line = in.readLine()) != null)
			{
				aList.add(line);
			}

			if(reader != null)
                reader.close();
            if(in != null)
                in.close();
		}
		catch(IOException e)
		{
            try
            {
                if(reader != null)
                    reader.close();
                if(in != null)
                    in.close();
            }
            catch(IOException e1)
            {}

			log.error("Error(Util) in reading=[" + e + "]");	
		}	

		return aList;
	}

	
	public	static ArrayList getOneLineListToFileUTF8(String sFile)
	{
		String		line;
		ArrayList	aList = new ArrayList();

		FileInputStream fis = null;
		InputStreamReader isr = null;
		BufferedReader br = null;
		
		try
		{
			fis = new FileInputStream(new File(sFile)); 
			isr = new InputStreamReader(fis,"UTF-8"); 
			br = new BufferedReader(isr);	
			while(true){
				String str = br.readLine();
				if(str==null) break;
				aList.add(str);
			}
		}
		catch(Exception e)
		{
			log.error("Error(Util) in reading=[" + e + "]");	
		}
		finally
		{
				if(fis != null)
					try {
						fis.close();
					} catch (IOException e) {}
				if(isr != null)
					try {
						isr.close();
					} catch (IOException e) {}
				if(br != null)
					try {
						br.close();
					} catch (IOException e) {}
		}


		return aList;
	}

	/**
	 * 파일을 새로 생성한다음 info를 Write 한다. 기존에 파일이 존재하더라도 새로 작성한다.
	 * @param file 작성할 파일 이름
	 * @param info 작성할 파일 내용
	 * @return 0(정상), -1(IOException), -2(SecurityException)
	*/	
	public static int fileWrite(String file,String info)
    {

        try
        {
            FileWriter logs = new FileWriter(file, false);

            logs.write(info);

            logs.close();
            return 0;

        }
        catch(IOException e)
        {
            // log.info("IOException err:" + e);
            return -1;
        }
        catch(SecurityException se )
        {
            // log.info("SecurityException err:" + se);
            return -2;
        }

    }


	/**
	 * 파일을 새로 생성한다음 info를 Write 한다. 기존에 파일이 존재하더라도 새로 작성한다.
	 * @param file 작성할 파일 이름
	 * @param info 작성할 파일 내용
	 * @return 0(정상), -1(IOException), -2(SecurityException)
	*/	
	public static int fileWrite(String file,ArrayList info)
    {

        try
        {
            FileWriter logs = new FileWriter(file, false);

			for(int i=0;i<info.size();i++)
			{
            	logs.write(info.get(i).toString());
			}

            logs.close();
            return 0;

        }
        catch(IOException e)
        {
            // log.info("IOException err:" + e);
            return -1;
        }
        catch(SecurityException se )
        {
            // log.info("SecurityException err:" + se);
            return -2;
        }

    }

	/**
	 * sFile파일의 iLine번째행의 문자열을 얻는다.
	 *
	 * @param sFile 파일명(절대패스포함)
	 * @param iLine 파일행수
	 * @return 파일의 한라인 문자열
	 * @since 1.0
	 */
	public static String getOneLineToFile(String sFile, int iLine)
	{

		String	line;
		int		iCurrLine = 0;

        FileReader reader = null;
        BufferedReader in = null;

		try
		{
            reader = new FileReader(new File(sFile));
            in = new BufferedReader(reader);
		}
		catch(Throwable e)
		{
			try
			{
           		if(reader != null)
                	reader.close();
            	if(in != null)
                	in.close();
			}
			catch(Exception e1)
			{}

			log.error("Error(Config) Open e=[" + e + "]");	
			return "";
		}


		try
		{
			// file을 한행씩 읽어 들인다. 
			while((line = in.readLine()) != null)
			{
				iCurrLine ++;

				if(iCurrLine == iLine)
				{
					if(reader != null)
						reader.close();
					if(in != null)
						in.close();

					return line;
				}
			}
            if(reader != null)
                reader.close();
            if(in != null)
                in.close();

		}
		catch(IOException e)
		{
            try
            {
                if(reader != null)
                    reader.close();
                if(in != null)
                    in.close();
            }
            catch(IOException e1)
            {}
		}	

		return "";
	}


	/**
	 *  지정된 이름에 해당하는 파일을 삭제한다.
	 *
	 * @param filename 파일명을 포함한 절대 경로
	 * @return 0(정상삭제), -1(삭제오류), -2(삭제불능, 권한없음)
	 */
	public static int deleteFile(String filename) 
	{

		if (filename == null || "".equals(filename.trim()))
			return -1;
		File file = new File(filename);
		try {
			if (file.exists()){
				if (file.canWrite()) {
					file.delete();
				} else {
					return -2;
				}
			}else	{
				return -1;
			}
		} catch (Exception e) {
			return -1;
		}
		return 0;
	}


	/**
	 *  지정된 이름에 해당하는 파일을 삭제한다.
	 *
	 * @param dir 파일의 절대 경로
	 * @param filename 파일 이름
	 * @return 0(정상삭제), -1(삭제오류), -2(삭제불능, 권한없음)
	 */
	public static int deleteFile(String dir, String filename) {

		if (filename == null || "".equals(filename.trim()))
			return -1;
		File file = new File(dir, filename);
		try {
			if (file.exists()){
				if (file.canWrite()) {
					file.delete();
				} else {
					return -2;
				}
			}else	{
				return -1;
			}
		} catch (Exception e) {
			return -1;
		}
		return 0;
	}

	/**
	 * sLogFile파일에 sBuf로그를 남긴다.
	 *
	 * @param sLogFile 로그파일명(절대패스포함)
	 * @param sBuf 로그로 남길 문자열
	 * @return  void
	 */
	public synchronized static void log(String sLogFile, String sBuf)
	{
		
		
		if(sLogFile == null)
			return;

		if(sLogFile.startsWith("NONE"))
			return;

		FileWriter logs = null;
		try
		{
			String sDate = DateUtil.getDateNTimeByForm("yyyyMMdd");
			String sTime = DateUtil.getDateNTimeByForm("(HH:mm:ss) : ");

			String sLogData = sTime+sBuf;

			logs = new FileWriter(sLogFile+"_"+sDate+".log", true);
			logs.write(sLogData);
			logs.write("\n");
			logs.close();
		}
		catch(IOException e)
		{
			//log.info("In Log() IOException:"+e);
		}
		catch(Exception e)
		{
			//log.info("In Log() Exception:"+e);
		}
		finally
		{
			if( logs != null ) try { logs.close(); }catch(Exception ex) {}
		}
		return;
	}

	/**
	 * sLogFile파일에 Exception e에 대한 내용을 남긴다.
	 *
	 * @param sLogFile 로그파일명(절대패스포함)
	 * @param e Exception 내용
	 * @return  void
	 */
	public synchronized static void log(String sLogFile, Exception e)
	{
		if(sLogFile == null)
			return;

		if(sLogFile.startsWith("NONE"))
			return;

		FileWriter logs = null;
		try
		{
			String sDate = DateUtil.getDateNTimeByForm("yyyyMMdd");
			String sTime = DateUtil.getDateNTimeByForm("(HH:mm:ss) : ");

			String sLogData = sTime;

			logs = new FileWriter(sLogFile+"_"+sDate+".log", true);
			logs.write(sLogData);
			e.printStackTrace(new PrintWriter(logs));
			logs.write("\n");
			logs.close();

			// All Exception Log File
/*
			String sExceptionLog = sLogFile.substring(0, 1 + sLogFile.lastIndexOf(System.getProperty("file.separator"))) + "Exception";
			String sExceptionLog = sLogFile+"_Exception";

			logs = new FileWriter(sExceptionLog+"_"+sDate+".log", true);
			logs.write(sLogData);
			e.printStackTrace(new PrintWriter(logs));
			logs.write("\n");
			logs.close();
*/

		}
		catch(IOException ex)
		{
			log.error("In Log() IOException:"+e);
		}
		catch(Exception ex)
		{
			log.error("In Log() Exception:"+e);
		}
		finally
		{
			if( logs != null ) try { logs.close(); }catch(Exception ex) {}
		}

		return;
	}


	/**
	 * sStr문자열을 sFullFileName파일에 쓴다.
	 * @param sFullFileName 파일이름(Full Path)
	 * @param sStr 파일에 쓸 문자열
	 * @return void
	 */
	public synchronized static void writeStrToFile(String sFullFileName, String sStr) 
	{
		BufferedWriter bw = null;
		File file = new File(sFullFileName);

		try
		{
			bw = new BufferedWriter(new FileWriter(file) );
			bw.write(sStr);
			bw.close();
		}
		catch(Exception e)
		{
			log.error("In writeStrToFile() Exception:"+e);
		}
		finally
		{
			if( bw != null ) try { bw.close(); }catch(Exception e) {}
		}

		return;
	} // End : void writeStrToFile()


	public static String uploadFile(String path, MultipartFile file)
			throws Exception {
		// TODO Auto-generated method stub
		UUID randomeUUID = UUID.randomUUID();

		String saved_file_name = null;
		if (file != null) {

			System.out.println("uploadFile> 파라미터명:" + file.getName());
			System.out.println("uploadFile> 파일크기:" + file.getSize());
			System.out.println("uploadFile> 파일 존재:" + file.isEmpty());
			System.out.println("uploadFile> 오리지날파일이름:" + file.getOriginalFilename());
			
			InputStream inputStream = null;
			OutputStream outputStream = null;

			String organizedfilePath = "";

			try {
				if (file.getSize() > 0) {
					inputStream = file.getInputStream();
					File realUploadDir = new File(path);

					if (!realUploadDir.exists()) {
						realUploadDir.mkdirs();// 폴더생성.
					}
					
					//saved_file_name = randomeUUID.toString().replaceAll("-", "") + "_" + file.getOriginalFilename();
					if(file.getOriginalFilename().lastIndexOf(".") > 0) {
						saved_file_name = file.getOriginalFilename().substring(0, file.getOriginalFilename().lastIndexOf(".")) + 
										file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")).toLowerCase();
					}
					else {
						saved_file_name = randomeUUID.toString().replaceAll("-", "") + "_" + file.getOriginalFilename();
					}
					
					organizedfilePath = path + saved_file_name;
					
					System.out.println("uploadFile> saved_file_name:" + saved_file_name);// 파일이 저장된경로 + 파일명

					outputStream = new FileOutputStream(organizedfilePath);

					int readByte = 0;
					byte[] buffer = new byte[8192];

					while ((readByte = inputStream.read(buffer, 0, 8120)) != -1) {
						outputStream.write(buffer, 0, readByte); // 파일 생성 !
					}
				}
			} finally {
				outputStream.close();
				inputStream.close();
			}
		}
		
		return saved_file_name;
	}

	public static void copyFile(String inFile, String outFile) throws Exception {

		FileInputStream fis = null;
		FileOutputStream fos = null;

		try {
			fis = new FileInputStream(inFile);
			fos = new FileOutputStream(outFile);

			FileChannel fcin = fis.getChannel();
			FileChannel fcout = fos.getChannel();

			long size = fcin.size();
			fcin.transferTo(0, size, fcout);

			fcin.close();
			fcout.close();

			fis.close();
			fos.close();

		} catch (IOException e) {
			throw e;
		}

	}

	public static void deleteFolder(String path) {
		if(path.endsWith(File.separator)) {
			path = path.substring(0, path.length()-1);
		}
		
		System.out.println("## deleteFolder:" + path);
		
		if(isDirExist(path)) {
			deleteFolder(new File(path));
		}
	}

	public static void deleteFolder(File targetFolder) {
		// TODO Auto-generated method stub
	    File[] childFile = targetFolder.listFiles();
	    int size = childFile.length;
	    if (size > 0) {
	        for (int i = 0; i < size; i++) {
	            if (childFile[i].isFile()) {
	                childFile[i].delete();
	                System.out.println(childFile[i] + " 삭제");
	            } else {
	                deleteFolder(childFile[i]);
	            }
	        }
	    }
	 
	    targetFolder.delete();
	}
	
} // End Of File
