package com.momo;

public class MyElClass {
	
	public String gender ="str";
	
	/**
	 * 주민번호를 입력받아서 성별을 반환
	 * @param jumin
	 * @return 성별(남, 여)
	 */
	public String getGender(String jumin) {
		String gender = "";
		
		// 문자열의 위치 확인 indexOf
		// substring(시작인덱스 : 포함, 끝인덱스 : 불포함)
		char ch = jumin.charAt(jumin.indexOf("-") + 1);
		
		if(ch == '1' || ch == '3') {
			gender= "남";
		}
		else if(ch == '2' || ch == '4') {
			gender = "여";
		}
		else {
			gender = "주민등록번호를 확인해주세요.";
		}
		
		
		return gender;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

}
