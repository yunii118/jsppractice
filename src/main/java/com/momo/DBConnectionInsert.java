package com.momo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DBConnectionInsert {

	public static void main(String[] args) {
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String id = "scott";
		String pw = "tiger";
		
		Connection conn = null;
		
		try {
			// 1. 드라이버가 정상적으로 로딩되었는지 확인
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 2. 커넥션 생성
			conn = DriverManager.getConnection(url, id, pw);
			// 3. 쿼리 생성
			String sql = "insert into job values (?, ?)";
			
			// pstmt 객체 생성(동적인 sql문 처리)
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "99");
			pstmt.setString(2, "값99");
			
			int res = pstmt.executeUpdate();
			System.out.println(res + "건 생성되었습니다.");
			
			
		} catch (ClassNotFoundException e) {
			System.out.println("라이브러리를 확인해주세요.");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("");
			e.printStackTrace();
		}
	}

}
