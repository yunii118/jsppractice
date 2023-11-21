<%@page import="com.momo.dto.EmpDto"%>
<%@page import="java.util.List"%>
<%@page import="com.momo.common.DBConnection"%>
<%@page import="com.momo.dao.EmpDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>JDBC 테스트 1</h2>
<%	
	DBConnection dbcon = new DBConnection();
	dbcon.stmt = dbcon.con.createStatement();
	dbcon.rs = dbcon.stmt.executeQuery("select sysdate from dual");
	
	
	dbcon.rs.next();
	out.print("db 시간 : " + dbcon.rs.getString(1));
	
	// 자원 반납
	dbcon.close();
	
	out.print("<br />init param : " + application.getInitParameter("INIT_PARAM"));
	out.print("<br />driver : " + application.getInitParameter("driver"));
	out.print("<br />url : " + application.getInitParameter("url"));
	out.print("<br />id : " + application.getInitParameter("id"));
	out.print("<br />pw : " + application.getInitParameter("pw"));

%>

<h2>JDBC 테스트 2</h2>
<%
	String driver = application.getInitParameter("driver");
	String url = application.getInitParameter("url");
	String id = application.getInitParameter("id");
	String pw = application.getInitParameter("pw");
	
	DBConnection dbcon2 = new DBConnection(driver, url, id, pw);
	dbcon2.stmt = dbcon2.con.createStatement();
	dbcon2.rs = dbcon2.stmt.executeQuery("select sysdate from dual");
	
	dbcon2.rs.next();
	out.print("db 시간 : " + dbcon2.rs.getString(1));
	dbcon.close();
	
%>
<h2>JDBC 테스트 3</h2>
<%
	DBConnection dbcon3 = new DBConnection(application);
	
	dbcon3.stmt = dbcon3.con.createStatement();
	dbcon3.rs = dbcon3.stmt.executeQuery("select sysdate from dual");
	
	dbcon3.rs.next();
	out.print("db 시간 : " + dbcon3.rs.getString(1));
	dbcon.close();
%>

<h2>empDao.getList()</h2>
<%
	EmpDao empDao = new EmpDao();
	List<EmpDto> list = empDao.getList();
%>
<table>
	<tr>
		<td>사원ID</td>
		<td>사원명</td>
		<td>주민번호</td>
	</tr>		
</table>
<%
	for(EmpDto dto : list){

%>
<%
	}
	empDao.close();
%>
</body>
</html>