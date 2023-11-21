<%@page import="com.momo.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="com.momo.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
// 로그인 버튼 클릭했을때에는 로그인 폼으로 이동
// 로그아웃 버튼 클릭했을 경우 로그아웃 서블릿으로 이동
	window.onload = function(){
		document.querySelector("#loginBtn").addEventListener('click', ()=>{
			login.action="/practice/loginForm.jsp";
		})
		
		document.querySelector("#logoutBtn").addEventListener('click', ()=>{
			login.action = "/logoutPractice";
		})
}
</script>
<h2>게시판</h2>
<form name = "login">
<%
	if(session.getAttribute("id") != null || !"".equals(session.getAttribute("id"))){
	// 로그인 되어있으면 로그아웃 버튼출력 + 보드 내용 출력
%>
	<button id="logoutBtn">로그아웃</button>
<%}else{
	// 로그아웃상태 로그인 버튼 출력 + 보드 내용 숨기기
		%>
		
	<button id="loginBtn">로그인</button>
		
		<%
	}
%>
</form>
</body>
</html>