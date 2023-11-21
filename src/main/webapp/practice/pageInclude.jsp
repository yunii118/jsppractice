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
	<%-- <ul>
		<li>page_str = <%=page_str %></li>
		<li>page_num = <%=page_num %></li>
		<li>page_person = <%=page_person %></li>
	</ul> --%>

	String page_str = <%= pageContext.getAttribute("page").toString()%>
	page_int =<%=(Integer)pageContext.getAttribute("page_int")%>;
	age_person = <%=(Person)pageContext.getAttribute("page_person")%>;

	
	
</body>
</html>