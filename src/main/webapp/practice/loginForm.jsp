<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>로그인</h2>
<%
	// 에러메세지 출력
	if("1".equals(request.getParameter("isErr"))){
		out.print("아이디 또는 패스워드가 올바르지 않습니다. 다시 입력해주세요.");
	}
%>

<form action="/loginPractice" method="post" name="loginForm"
        onsubmit="return validateForm(this);">
        아이디 : <input type="text" name="user_id" value = "test" required="required"/><br />
        패스워드 : <input type="password" name="user_pw" value = "1234" required="required"/><br />
        <input type="submit" value="로그인하기" />
    </form> 
</body>
</html>