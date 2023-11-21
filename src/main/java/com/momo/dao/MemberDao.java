package com.momo.dao;

import java.sql.SQLException;

import com.momo.common.DBConnPool;
import com.momo.dto.MemberDto;

public class MemberDao extends DBConnPool {
	
	public MemberDto login(String id, String pw) {
		MemberDto memberDto = new MemberDto();
		
		// 입력받은 사용자 정보를 db로부터 조회
		String sql = "select * from member where id=? and pass =?";
		
		try {
			pstmt = con.prepareStatement(sql);
			// 파라메터 세팅
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			// 쿼리 실행
			rs = pstmt.executeQuery();
			
			// 있거나/없거나 둘중 하나임
			if(rs.next()) {
				//로그인 성공
				memberDto.setId(id);
				memberDto.setName(rs.getString(3));
				memberDto.setRegidate(rs.getString(4));
				
				return memberDto;
			}
			else {
				// 로그인 실패
				return null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return memberDto;
	}
	
	

}
