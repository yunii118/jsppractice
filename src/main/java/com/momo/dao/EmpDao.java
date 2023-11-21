package com.momo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import com.momo.common.DBConnPool;
import com.momo.dto.EmpDto;

/**
 * db에 접근해서 데이터 입력, 출력, 삭제, 조회 작업
 * 
 * Dao(구) -> mapper(신)
 */
public class EmpDao extends DBConnPool {
	
	/**
	 * 생성자를 이용하여 Connection 객체를 생성후
	 * 멤버변수인 con에 저장
	 * 
	 */
	
	/**
	 * db로부터 사원의 목록을 조회하여 반환
	 * 조회된 데이터를 반환하기 위해 리스트에 담아줌
	 */

	public List<EmpDto> getList() {
		List<EmpDto> list = new ArrayList<>(); 
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery("select * from employee");

			while (rs.next()) {
				EmpDto empDto = new EmpDto();
				empDto.setEmp_id(rs.getString(1));
				empDto.setEmp_name(rs.getString(2));
				empDto.setEmp_no(rs.getString(3));
				
				list.add(empDto);
			}

		} catch (SQLException e) {
			System.out.println("SQLException 예외 발생");
			e.printStackTrace();
		}
		return list;
	}
	 public static void main(String[] args) {
	  
			/*
			 * EmpDao empDao = new EmpDao(); 
			 * empDao.getList();
			 */
	  
	 }
	 
}