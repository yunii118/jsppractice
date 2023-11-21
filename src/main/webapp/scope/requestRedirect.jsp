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
<h2>sendRedirect</h2>
<%
	/*
	redirect 방식을 이용시 다음 요청 페이지에 값을 넘기는 방법
		request 영역이 공유되지 않으므로 request 영역에 값을 저장해도 유지가 안됨.
		
		1. queryString을 이용하는 방법
			queryString을 이용할 때에는 getParameter를 이용하여 값을 꺼내올 수 있다.
		2. session을 이용하는 방법
			세션은 서버에 저장되는 영역이므로 필요시 생성 후 반드시 제거해준다.
	*/
	
	String str = "";
	Person person = new Person();
	
	if(request.getAttribute("request_str") != null){
		str = request.getAttribute("request_str").toString();
	}
	if(request.getAttribute("request_person")!=null){
		person = (Person)request.getAttribute("request_person");
	}
%>
<h2>getAttribute 출력</h2>
<p>redirect시 request영역은 공유되지 않으므로 값이 출력되지 않음</p>
str : <%=str %>
<br />person : <%=person %>

<h2>queryString 출력</h2>
<p>리다이렉트시 request 영역은 공유되지 않으므로 값이 출력되지 않음</p>
isDirect : <%=request.getParameter("isDirect") %>

<h3>session을 이용한 값 출력</h3>
session_str : <%=session.getAttribute("session_str") %>

<%
	//session에 저장된 속성 제거
	session.removeAttribute("session_str");
%>

<h3>session 제거</h3>
session_str : <%=session.getAttribute("session_str") %>

</body>
</html>