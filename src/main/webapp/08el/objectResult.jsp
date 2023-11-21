<%@page import="com.momo.utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>영역을 통해 전달된 객체 읽기</h3>

<%
/*
	표현언어 이용하면 형번환 필요 없이 파라메터 읽어올 수 있음
	별도의 null처리 하지 않아도 오류 발생 안함
	객체 사용하기 위해 임포트만 해주면 됨

*/	
	
%>
<ul>
	<li>Person객체(personObj)
		<p>이름 : ${personObj.getName() }/나이 : ${personObj.getAge() }</p>
	</li>
	<li>String : ${str }</li>
	<li>int : ${integer }</li>
</ul>

</body>
</html>