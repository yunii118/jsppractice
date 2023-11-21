<%@page import="com.momo.dto.DeptDto"%>
<%@page import="java.util.List"%>
<%@page import="com.momo.dao.DeptDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>dept</h2>
<%
	DeptDao dao = new DeptDao(application);
	List<DeptDto> list = dao.getList(); 
	
	for(DeptDto dto : list){
		out.print(dto+"<br />");
	}
	
	dao.close();
%>

</body>
</html>