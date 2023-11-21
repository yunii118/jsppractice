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
<!-- 
	import : 외부파일을 현재 위치에 삽입
	
		url 	: 외부파일 파일 경로
		scope 	: 영역
		var 	: 변수명
					변수명을 사용하면 선언과 삽입을 분리 할수 있습니다. 

 -->
<h2>import 태그</h2>
<!-- ../ : 상위 폴더로 이동 -->
<hr />
<h2>외부 파일에 매개변수 넣기</h2>
<!-- 
	- url의 쿼리스트링으로 전달
	- c:param 태그 사용
 -->
<c:import url="../inc/link.jsp"> 
	<c:param name="title">링크페이지에 오신것을 환영합니다.</c:param>
</c:import>
<hr />
<%-- <c:import url="../inc/otherPage.jsp"></c:import> --%>

${link }

<h2>iframe을 이용한 외부자원 삽입하기</h2>`
<iframe src="../inc/otherPage.jsp" style="width:100px;height:100px;"></iframe>

<h2>out태그 : el표현언어 출력</h2>
<!-- value 속성을 이용해서 값을 지정하고 태그안에도 값을 지정한 경우, 오류 발생 가능
	set태그 이용하여 값을 지정할때는 한가지 방법으로만 지정 -->
<c:set var="iTag" value="기울임">
</c:set>
<!-- html 태그를 해석하여 마크업이 적용된 상태로 출력
 -->
<c:out value="${iTag }" escapeXml="false"></c:out><br />
<c:out value="${param.text }" default="값없음"></c:out><br />
<c:out value="" default="빈 문자열도 값임"></c:out><br />

<h2>redirect</h2>
<!-- redirect : request 영역공유되지 않음 -->
<%-- 
<c:redirect url="../inc/otherPage.jsp">
	<c:param name="title">제목</c:param>
</c:redirect>
--%>
</body>
</html>