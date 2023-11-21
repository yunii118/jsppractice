package com.momo.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class DBConnection {
	// con이 null인 경우 오류가 발생할 수 있음(url, id, pw중 하나 이상의 오타 등 확인)
	public Connection con;
	public Statement stmt;
	public PreparedStatement pstmt;	
	public ResultSet rs;
	
	
	/**
	 * 생성자 - Connection 객체 생성
	 */
	public DBConnection() {
		try {
			// 1. 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			String id = "scott";
			String pw = "tiger";
			
			con = DriverManager.getConnection(url, id, pw);
			System.out.println("DB 연결 성공(기본생성자)");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * 생성자 - 필요한 값을 매개변수로 받아옴
	 */
	public DBConnection(String driver, String url, String id, String pw) {
		try {
			// 1. 드라이버 로딩
			Class.forName(driver);
			// 2. DB Connection 객체 생성
			con = DriverManager.getConnection(url, id, pw);
			
			System.out.println("db 연결 성공");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 예외 발생");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("db 연결 예외 발생");
			e.printStackTrace();
		}
	}
	/**
	 * 생성자에 application 넣어서 중복코드 없애기
	 */
	public DBConnection(ServletContext application) {
		String driver = application.getInitParameter("driver");
		String url = application.getInitParameter("url");
		String id = application.getInitParameter("id");
		String pw = application.getInitParameter("pw");
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, id, pw);
			System.out.println("application 내장객체 활용한 Connection 생성");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("Connection 객체 생성 실패");
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 연결해제(자원 반납)
	 */
	
	public void close() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(stmt != null) stmt.close();
			if(con != null) con.close();
			System.out.println("자원 반납 성공");
		} catch (Exception e) {
			System.out.println("자원반납 중 예외 발생");
			e.printStackTrace();
		}
	}

}
