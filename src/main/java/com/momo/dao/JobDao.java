package com.momo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import com.momo.common.DBConnection;
import com.momo.dto.JobDto;

public class JobDao extends DBConnection{
	public JobDao(ServletContext application) {
		super(application);
	}
	
	/**
	 * dto : 
	 * 
	 * dao : data access 
	 * 
	 */
	
	public List<JobDto> getList(){
		List<JobDto> list = new ArrayList<>();
		
		try {
			stmt = con.createStatement();
			rs= stmt.executeQuery("Select * from job");
			
			while(rs.next()) {
				JobDto dto = new JobDto();
				dto.setJob_code(rs.getString(1));
				dto.setJob_name(rs.getString(2));
				
				list.add(dto);
			}
			
			for(JobDto dto : list) {
				System.out.println(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	public static void main(String[] args) {
		
	}
}
