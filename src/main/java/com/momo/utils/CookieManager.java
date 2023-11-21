package com.momo.utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieManager {

	public CookieManager() {}
	
	/**
	 * 쿠키를 생성 후 응답 객체에 저장
	 * 
	 * 쿠키를 생성하기 위해 필요한 값
	 * - 쿠키의 이름과 값, 시간, 응답 객체
	 * 
	 * 사용자에게 응답하기 위해서 필요한
	 * - 응답 객체를 매개변수로 전달받음
	 */
	public static void makeCookie(HttpServletResponse response, 
			String name, String value, int time) {
		 // 쿠키 생성
		Cookie cookie = new Cookie(name, value);
		// 유지기간 설정
		cookie.setMaxAge(time);
		// 응답 객체에 추가
		response.addCookie(cookie);
	}
	
	// 브라우저를 통해 처음 접근 했을 때(jsessionid 생성 x)
	// 쿠키가 하나도 저장되어있지 않을 경우
	public static String readCookie(HttpServletRequest request, String name) {
		String value = "";
		// 요청 객체로부터 쿠키배열을 획득
		Cookie[] cookies = request.getCookies();
		System.out.println("cookies : " + cookies);
		// 쿠키 배열을 돌면서 쿠키 이름이 일치하는 객체가 있는지 확인
		if(cookies !=null) {
			for(Cookie cookie : cookies) {
				if(name.equals(cookie.getName())) {
					value = cookie.getValue();
				}
			}
			return value;
		}
		else {
			return "";
		}
		
		
	}
	
	/**
	 * 쿠키 삭제
	 * @param response
	 * @param name
	 * 
	 */
	public static void deleteCookie(HttpServletResponse response, String name) {
		makeCookie(response, name, "", 0);
	}
}
