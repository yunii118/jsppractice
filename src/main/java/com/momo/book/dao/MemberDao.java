package com.momo.book.dao;

import java.sql.SQLException;

import com.momo.common.DBConnPool;
import com.momo.book.dto.MemberDto;

public class MemberDao extends DBConnPool{
	/**
	 * 로그인 가능한지 확인
	 * @param userId
	 * @param userPw
	 * @return
	 */
	public MemberDto getLogin(String userId, String userPw) {
		String sql = "select * from member\r\n"
				+ "where id=? and pass=?";
		
		MemberDto memberDto = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPw);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pass");
				String name = rs.getString("name");
				String email = rs.getString("email");
				
				memberDto = new MemberDto(id, pw, name, email);
			}
		} catch (SQLException e) {
			System.out.println("login 예외 발생");
			e.printStackTrace();
		}
		return memberDto;
	}
	
	boolean checkEmail(String email) {
		boolean possible = false;
		String sql = "select * from member\r\n"
				+ "where email = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			possible = rs.next()?false:true; 
		} catch (SQLException e) {
			System.out.println("이메일 존재 유무 확인 실패");
			e.printStackTrace();
		}
		return possible;
	}
	
	boolean checkId(String Id) {
		boolean possible = false;
		String sql = "select * from member\r\n"
				+ "where id = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, Id);
			rs = pstmt.executeQuery();
			
			possible = rs.next()?false:true; 
		} catch (SQLException e) {
			System.out.println("아이디 존재 유무 확인 실패");
			e.printStackTrace();
		}
		return possible;
	}
	
	public int regist(String id, String name, String email, String pw) {
		int res = 0;
		
		if(!checkEmail(email)) {
			return 99;
		}
		if(!checkId(id)) {
			return 100;
		}
		
		String sql = "insert into member(id, pass, name, regidate, email)\r\n"
					+ "values (?, ?, ?, sysdate, ?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("회원가입 처리 실패");
			e.printStackTrace();
		}
		
		return res;
		
	}
	
	public String findPw(String id, String email) {
		String sql ="select * from member\r\n"
				+ "where id=? and email=?";
		String pw = "";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pw = rs.getString("pass");
			}
		} catch (SQLException e) {
			System.out.println("pw 찾기 실패.");
			e.printStackTrace();
		}
		
		return pw;
	}

}
