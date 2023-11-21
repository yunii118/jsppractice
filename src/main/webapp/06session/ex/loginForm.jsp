<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>서블릿을 통한 로그인</h2>
<!-- 
	loginProcess 또는 ./loginProcess
	: 현재 페이지 위치를 기준으로 경로를 호출
	/06session/ex/loginProcess
	/loginProcess
	: 루트 경로를 기준으로
	../ 
	: 상위 경로

 -->
<form action="loginProcess" method="post" name="loginFrm"
        onsubmit="return validateForm(this);">
        아이디 : <input type="text" name="user_id" required="required"/><br />
        패스워드 : <input type="password" name="user_pw" required="required"/><br />
        <input type="submit" value="로그인하기" />
    </form> 
</body>
</html>