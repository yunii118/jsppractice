<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>내장객체 - response</h2>
<%
	String userId = "momo";
	String msg = "";
	if("1".equals(request.getParameter("loginErr"))){
		msg ="아이디 또는 비밀번호가 올바르지 않습니다. 다시 로그인해주세요.<br />";
	}
	out.print(msg);
	if(request.getParameter("id")!=null){
		userId = request.getParameter("id");
	}

%>
	<form action = "responseLogin.jsp" method = "post">
		아이디 : <input type = "text" name="id" value = <%=userId %> autofocus required>
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
