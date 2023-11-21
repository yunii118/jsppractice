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
	String userId = "";
	// if error : userid = 에러난 아이디
	if("1".equals(request.getParameter("loginErr"))){
		out.print("아이디 또는 비밀번호가 일치하지 않습니다.<br />");
	}
	if(request.getParameter("id") != null){
		userId = request.getParameter("id");
	}
	// 아니면 empty

%>
	<form action = "responseLogin.jsp" method = "post">
		아이디 : <input type = "text" name="id" value = "<%=userId %>" autofocus required>
		비밀번호 : <input type = "password" name="password" 
		maxlength = "15" minlength = "2" value = "1234" required>
		<button type="submit">로그인</button>
	</form>
	
	<h2>응답헤더 확인하기</h2>
	<form action="responseHeader.jsp" method = "post">
		<button>응답헤더</button>
	</form>
</body>
</html>