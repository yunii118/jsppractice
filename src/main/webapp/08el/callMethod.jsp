<%@page import="com.momo.MyElClass"%>
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
	MyElClass myClass = new MyElClass();
	request.setAttribute("myClass", myClass);
	myClass.getGender("123456-4532158");
%>
<h3>객체를 영역에 저장 후 메서드 호출하기</h3>
<br />123456-4532158 : ${myClass.getGender("123456-4532158") }
<br /> ${myClass.gender }

<h3>정적메서드 호출하기</h3>
<%
	request.setAttribute("response", response);
	
%>

response : ${response }
${CookieManager.makeCookie(response, "myCookie", "el사용해보기", 100) }

<h3>메서드 호출하기</h3>
${"123-123".replace("-", "") }
</body>
</html>