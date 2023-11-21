<%@page import="com.momo.dto.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Object page_str = pageContext.getAttribute("page");
	Object page_int = pageContext.getAttribute("page_int");
	Object page_person = pageContext.getAttribute("page_person");
%>
	<ul>
		<li>page_str : <%=page_str %></li>
		<li>page_int : <%=(Integer)page_int %></li>
		<li>page_person : <%=(Person)page_person %>
	
	</ul>

</body>
</html>