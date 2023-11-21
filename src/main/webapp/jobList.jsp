<%@page import="com.momo.dao.JobDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>job서블릿 호출 결과</h2>
<%
	List<JobDao> list = (List<JobDao>)request.getAttribute("jobList");
	out.print(list);
%>
</body>
</html>