<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page 지시어</title>
</head>
<body>
<%
	int age = 0;
	try{
		age = Integer.parseInt(request.getParameter("age"));
		
		out.print("나이 : "+ age);
		
	}catch(Exception e){
		out.print("실행중 예외가 발생하였습니다.");
	}
	// 변수 선언

%>
<hr />
<%= "나이 : " + age %>
</body>
</html>