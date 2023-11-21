<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>응답헤더 정보 출력하기</h2>
<%
	response.addIntHeader("age", 100);
	response.addHeader("id", "momo");
	response.setHeader("id", "id");
	
	String str = "";
	Collection<String> headers = response.getHeaderNames();
	
	for(String header : headers){
		str += header + " ";
	}
	
	for(String hName : headers){
		String hValue = response.getHeader(hName);
%>
	<li> 헤더명 : <%=hName %> / 헤더값 : <%= hValue %> </li>
<%
	}
%>

</body>
</html>