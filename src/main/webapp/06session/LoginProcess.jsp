<%@page import="com.momo.dto.MemberDto"%>
<%@page import="com.momo.dao.MemberDao"%>
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
	// 사용자의 요청 파라메터 수집
	String userId = request.getParameter("user_id");
	String userPw = request.getParameter("user_pw");
	// db에 등록된 사용자인지 확인 - user 테이블 생성, 사용자 정보 등록
	
	MemberDao memberDao = new MemberDao();
	MemberDto dto = memberDao.login(userId, userPw);
	memberDao.close();
	
	if(dto != null){
		// 로그인 성공
		// 세션에 로그인 정보 저장
		session.setAttribute("id", dto.getId());
		session.setAttribute("memberDto", dto);
		// 메인 페이지로 이동
		request.getRequestDispatcher("main.jsp").forward(request, response);		
	}
	else{
		// 로그인 실패 -> 로그인 페이지로 이동 후 메세지 출력
		
		request.getRequestDispatcher("loginForm.jsp?isError=1").forward(request, response);		
		
	}
	
%>
</body>
</html>