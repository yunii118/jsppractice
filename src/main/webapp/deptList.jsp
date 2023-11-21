<%@page import="com.momo.dto.DeptDto"%>
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
<h2>부서목록</h2>
<% 
	// jsp를 단독 실행할 경우, null이 출력될 수 있다.
	// request : 현재 페이지와 follow 페이지에 공유. 
	List<DeptDto> list = (List<DeptDto>)request.getAttribute("list"); 
	out.print(list);
	
	%>
</body>
</html>