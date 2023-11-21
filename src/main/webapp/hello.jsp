<!-- 
	페이지 지시어
	jsp 페이지를 자바코드로 변환하는데 필요한 정보를 jsp 엔진에 알려주며,
	주로 스크립트 언어나 인코딩 방식 등을 설정
	
	* 페이지 지시어가 없는 경우 오류가 발생
	
	속성 = 값
	language = "java"
	
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
	page import = "java.util.Date"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	jsp 파일 호출 방법
	localhost:포트/path/파일이름
	
	*welcome 페이지 뜨는지 안뜨는지 확인해보고 하기(서버에 정상적으로 접근하고 있는지)
	
	servlet 호출 방법
	localhhost:포트/path/mapping 주소
	
-->
	<h1>hello jsp</h1>
	
	<%
		// 자바 코드를 입력하기 위해 스크립트 열어줌
		
		// 외부 클래스 이용하기 위해 page 지시어의 import 구문 이용
		Date today = new Date();
		
		// 웹 브라우저에 출력하기 위한 내장객체
		// 내장 객체 : 생성하지 않았지만 클래스로 변환시 자동으로 생성해주는 객체
		// out : 웹 브라우저에 출력하기 위한 내장 객체
		out.print(today);
	
	%>
	<hr />
	오늘 날짜 : <%=today  %>
	
</body>
</html>