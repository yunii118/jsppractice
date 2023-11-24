package com.momo;

import java.sql.SQLException;

import com.momo.common.DBConnection;

/**
 * jdbc를 활용한 테스트 데이터 생성
 * board 테이블에 테스트 데이터를 생성함
 */
public class MakeTestData extends DBConnection{
	public void insert() {
		String sql = "insert into board values (seq_board_num.nextval, ?, ?, 'test', sysdate, 0)";
		for(int i = 204;i<=303;i++) {
			try {
				pstmt=con.prepareStatement(sql);
				// 파라메터 세팅
				pstmt.setString(1, "제목입니다" + i);
				pstmt.setString(2, "내용입니다" + i);
				
				// 입력 실행
				int res = pstmt.executeUpdate();
				System.out.println(res + "건 입력되었습니다.");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}
	public void bookInsert() {
		String sql = "insert into book values (?, ?, 'N', ?)";
		for(int i = 1;i<=303;i++) {
			try {
				pstmt=con.prepareStatement(sql);
				// 파라메터 세팅
				pstmt.setInt(1, i);
				pstmt.setString(2, "책" + i);
				pstmt.setString(3, "작가" + i);
				
				// 입력 실행
				int res = pstmt.executeUpdate();
				System.out.println(res + "건 입력되었습니다.");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}
	/**
	 * 자바 프로그램 실행
	 * @param args
	 */
	public static void main(String[] args) {
		MakeTestData d = new MakeTestData();
		d.bookInsert();
	}
}
