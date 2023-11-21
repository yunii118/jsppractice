package com.momo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnectionMain1 {
	public static void main(String[] args) {
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String id = "test";
		String pw = "1234";
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			// 1. 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 2. 커넥션 생성
			con = DriverManager.getConnection(url, id, pw);
			// 3. 쿼리문장 준비
			String sql = "select sysdate from dual";
			// 4. 쿼리문장 실행
			stmt = con.createStatement();
			// select 문장을 실행할 경우 ResultSet을 반환
			// stmt.executeUpdate(sql)
			// update, insert, delete의 경우 int 타입을 반환
			// -> 실행결과 몇건이 처리되었는지.
			rs = stmt.executeQuery(sql);
			rs.next();
			// 숫자를 입력시 1부터
			// 숫자 또는 결과집합의 컬럼명
			System.out.println(rs.getString("sysdate"));
			
		} catch (ClassNotFoundException e) {
			System.out.println("클래스를 찾을 수 없습니다.");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println();
			e.printStackTrace();
		}
		finally{
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(con != null) con.close();
			}
			catch(Exception e) {
				System.out.println("자원 해제중 예외가 발생하였습니다.");
			}
		}
		
	}
}
