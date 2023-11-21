package com.momo;
/**
 * VO : 데이터를 수집하는 그릇
 */

public class UserVO {
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	private int age;
	private String name;

}
