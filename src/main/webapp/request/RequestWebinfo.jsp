<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.momo.UserVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<ul>
	<li>데이터 전송 방식 : <%=request.getMethod() %></li>
	<li>url : <%=request.getRequestURL() %></li>
	<li>프로토콜 : <%=request.getProtocol() %></li>
	<li>서버명 : <%=request.getServerName() %></li>
	<li>포트번호 : <%=request.getServerPort() %></li>
	<li>클라이언트 IP : <%=request.getRemotePort() %></li>
	<!-- url?이름=값&이름=값 
		이름 : tag가 가지고있는 name속성 의미-->
	<li>쿼리스트링 : <%=request.getQueryString() %></li>
	<li>파라메터 : <%=request.getParameter("eng") %></li>
	<li>파라메터 : <%=request.getParameter("han") %></li>
	<%
		UserVO user = new UserVO();
		String age = request.getParameter("age");
		
		user.setAge(Integer.parseInt(age));
		user.setName(request.getParameter("name"));
	%> 
</ul>
</body>
</html>