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
	String id = request.getParameter("id");
	String pw = request.getParameter("password");
	if("momo".equals(id)&&"1234".equals(pw)){
		// 로그인 성공
		// 페이지 전환 -> 웹블우저 -> 웹브라우저가 다시 요청
		// 기존 요청 정보가 공유되지 않음.
		// 아이디를 파라메터로 넘겨주지 않으면 공유되지 않음
		response.sendRedirect("responseWelcome.jsp?id="+request.getParameter("id"));
			
	}
	else{
		// 로그인 실패
		// 기존 요청 정보가 공유됨
		request.getRequestDispatcher("responseMain.jsp?loginErr=1")
		.forward(request, response);
	}
%>
<h2>페이지를 전환하는 방법</h2>
<p>sendRedirect</p>

<p>forward</p>
</body>
</html>