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
	pageContext.setAttribute("page", "page값 넣기");
	pageContext.setAttribute("page_int", 10000);
	pageContext.setAttribute("page_person", new Person("dkdk", 1234));
	
	String page_str = pageContext.getAttribute("page").toString();
	int page_int = (Integer)pageContext.getAttribute("page_int");
	Person page_person = (Person)pageContext.getAttribute("page_person");
%>
<ul>
	<li>page_str = <%=page_str %></li>
	<li>page_int = <%=page_int %></li>
	<li>page_person = <%=page_person %></li>
</ul>

<%@ include file="pageInclude.jsp" %>

<a href = "pageLocation.jsp">pageLocation 읽어오기</a>

</body>
</html>