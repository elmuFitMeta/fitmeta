package com.fitmeta.util;

import java.math.BigDecimal;

public class StrUtil {
	
	public static String  removeComment(String str)
	{
		// str = "/*-- 주석1 --*/ /**-- 주석2 --**/  주석아님1 /** 주석3 **/  /* \n 주석 \n 주석 */  주석아님2";

		//	str = str.replaceAll("/\\*(?:.|[\\n\\r])*?\\*/", "");
	
		//	str = str.replaceAll("--.*\n", "\n");
		//	str = str.replaceAll("--.*\r", "\r");
		//	str = str.replaceAll("--.*$", "");
			
		//	str = str.replaceAll("//.*\n", "\n");
		//	str = str.replaceAll("//.*\r", "\r");
		//	str = str.replaceAll("//.*$", "");
		
		str = str.replaceAll("(?://.*\n{0,1})|(?:/\\*(?:.|\\s)*?\\*/\n{0,1})", "");
		return str;
	}
	
	
	/**
	 * 지정한 <tt>String</tt> 타입의 s1, s2 의 값을 비교한다. (Compare s1 to s2)
	 * 내부적으로 <tt>BigDecimal</tt> 타입으로 변환하여 계산한다.
	 * @param s1 첫번째 문자열
	 * @param s2 두번째 문자열
	 * @return 이 BigDecimal 의 값이 o 보다 작은 경우는 부의 수, 동일한 경우는 0, 
	 * 			큰 경우는 정의 수. 
	 */ 
    public static int bigCompareTo(String s1, String s2)
    {
		if(s1 == null)
			s1 = "0";
		if(s2 == null)
			s2 = "0";


		BigDecimal B1 = new BigDecimal(s1);
		BigDecimal B2 = new BigDecimal(s2);

		return B1.compareTo(B2);
	}

}
