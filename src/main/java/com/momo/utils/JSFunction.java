package com.momo.utils;

import java.io.IOException;

import javax.servlet.jsp.JspWriter;

public class JSFunction {
	
	/**
	 * 알림창을 띄우고 이전페이지로 이동
	 * 
	 */
	public static void alertBack(String msg, JspWriter out) {
		String script = "<script type=\"text/javascript\">\r\n"
				+ "	alert('"+msg+"');\r\n"
				+ " history.go(-1);"
				+ "</script>";
		try {
			// out 객체를 활용하여 스크립트 화면에 출력
			out.print(script);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 알람창을 띄우고 가고싶은 페이지로 이동
	 */
	public static void alertLocation(String msg, String url, JspWriter out) {
		String script = "<script type=\"text/javascript\">\r\n"
				+ "	alert('"+msg+"');\r\n"
				+ " location.href='"+url+"';"
				+ "</script>";
		try {
			// out 객체를 활용하여 스크립트 화면에 출력
			out.print(script);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
