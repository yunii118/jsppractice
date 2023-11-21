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
	request.setAttribute("request", "request에 값 저장");
	request.setAttribute("request_person", new Person("momo", 30));
	
	String request_str = "값없음";
	Person request_person = new Person();
	
	if(request.getAttribute("request") != null){
		request_str = request.getAttribute("request").toString();
	}
	if(request.getAttribute("request_person") != null){
		request_person = (Person)request.getAttribute("request_person");
	}
%>
	String : <%=request_str %>
	Person : <%=request_person %>
<%
	
	request.getRequestDispatcher("requestForward.jsp").forward(request, response);
%>
</body>
</html>