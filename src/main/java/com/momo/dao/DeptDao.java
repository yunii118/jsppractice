package com.momo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import com.momo.common.DBConnection;
import com.momo.dto.DeptDto;

public class DeptDao extends DBConnection{
	
	// 생성자를 통해서 Connection객체를 생성 후 멤버변수 con에 저장
	public DeptDao(ServletContext application) {
		super(application);
	}
	
	public List<DeptDto> getList(){
		List<DeptDto> list = new ArrayList<>();
		String sql = "select d.dept_id, d.dept_title, l.local_name from department d, location l\r\n"
				+ "where d.location_id = l.local_code";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				DeptDto dto = new DeptDto();
				dto.setDept_id(rs.getString(1));
				dto.setDept_title(rs.getString(2));
				dto.setLocal_name(rs.getString(3));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			System.out.println("DB 연결 예외 발생");
			e.printStackTrace();
		}
		
		return list;
	}
	
	public static void main(String[] args) {
		
	}

}
