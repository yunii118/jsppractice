<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>각 영역에 저장된 속성 읽기</h2>
<br /> 페이지 영역 : ${pageScopeValue }
<br /> 요청 영역 : ${requestScopeValue }
<br /> 세션 영역 : ${sessionScopeValue }
<br /> 어플리케이션 영역 : ${applicationScopeValue }
</body>
</html>