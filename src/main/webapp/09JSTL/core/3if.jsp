<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>jstl 제어문 통해 짝수/홀수 판단하기</h2>
<c:set var="num" value="101" />

	<!-- 제어문에서 사용되는 속성
		test : if문에서 사용할 조건 지정(표현언어 사용 가능)
		var : 조건의 결과를 저장할 변수명
		scope : 변수가 저장될 영역 
	-->
	<c:if test="${num mod 2 eq 0}" var="result">
	<!-- 조건이 참일때만 실행. else가 없음
			-> 단일 조건문만 가능 -->
		${num }은 짝수입니다.
	</c:if>
	result : ${result }
	<c:if test="${not result }">
		${num }은 홀수입니다.
	</c:if>
	
	<h2>문자열 비교와 else문장</h2>
	<c:set var="str" value="JSP"></c:set>
	<c:if test="${str eq 'Java' }" var="result">
		\${str eq 'Java' }
		<br />문자열 : ${str }<br />
	</c:if>
	
	<c:if test="${str ne 'Java' }">
		\${str ne 'Java' }
		<br />문자열 : ${str }<br />
	</c:if>
	<c:if test="${not result }">
		\${not result }
		<br />문자열 : ${str }<br />
	</c:if>
	
	<h2>조건식 주의사항</h2>
	<!-- el(표현언어)가 사용되지 않은 경우 -->
	<!-- true를 입력시 대소문자 상관없이 true -->
	<c:if test="true" var="result4"></c:if>
	<c:if test="tRuE" var="result6"></c:if>
	<!-- 숫자, 문자 입력시 : false -->
	<c:if test="100" var="result5"></c:if>
	<!-- 표현언어 {} 밖에 공백이 있는 경우 : false  -->
	<c:if test="${true }" var="result7"></c:if>
	<c:if test="str" var="result8"></c:if>
	result4 : ${result4 }<br />
	result5 : ${result5 }<br />
	result6 : ${result6 }<br />
	result7 : ${result7 }<br />
	result8 : ${result8 }<br />
	
		
</body>
</html>