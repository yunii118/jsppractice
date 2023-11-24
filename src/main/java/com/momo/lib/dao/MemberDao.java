package com.momo.lib.dao;

import java.sql.SQLException;

import com.momo.common.DBConnPool;
import com.momo.lib.dto.MemberDto;

public class MemberDao extends DBConnPool{
	
	/**
	 * 로그인 가능한지 확인
	 * @param userId
	 * @param userPw
	 * @return
	 */
	public MemberDto getLogin(String userId, String userPw) {
		String sql = "select * from bookmember\r\n"
				+ "where id=? and pw=?";
		
		MemberDto memberDto = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPw);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String adminyn = rs.getString("adminyn");
				String status = rs.getString("status");
				String grade = rs.getString("grade");
				
				memberDto = new MemberDto(id, pw, name, adminyn, status, grade);
			}
		} catch (SQLException e) {
			System.out.println("login 예외 밣생");
			e.printStackTrace();
		}
		return memberDto;
	}

}
