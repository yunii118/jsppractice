<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.momo.dto.Person" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>페이지 이동 후 페이지 영역의 속성값 읽기</h2>
	<%
	// getAttribute 메서드의 반환 타입은 object, 형변환 필요
	Object page_str = pageContext.getAttribute("page");
	Object page_int = pageContext.getAttribute("page_int");
	Object page_p = pageContext.getAttribute("pagePerson");
	
	%>
	
	<br />String : <%=page_str ==null? "값없음" : page_str %>
	<br />int : <%= page_int == null? "값 없음" : page_int %>
	<br />person : <%=page_p == null? "값 없음" : page_p %>
	
</body>
</html>