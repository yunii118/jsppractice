<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
outerPage
	<h2>외부파일 1</h2>
	<%
		String newVar1 = "외부파일1에서 선언한 변수";
	%>
	<ul>
		<li>page 영역 속성 : <%=pageContext.getAttribute("attrPage") %></li>
		<li>request 영역 속성 : <%=request.getAttribute("attrRequest") %></li>
	</ul>
</body>
</html>