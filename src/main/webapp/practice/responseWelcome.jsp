<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>로그인 성공</h2>
<p>
<%
	out.print(request.getParameter("id") + "님 환영합니다.");
%>

</p>
</body>
</html>