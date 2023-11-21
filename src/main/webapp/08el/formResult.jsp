<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>폼값 출력</h2>

<p>표현식</p>
<br />이름 : <%=request.getParameter("name") %>
<br />성별 : <%=request.getParameter("gender") %>
<br />학력 : <%=request.getParameter("grade") %>
<br />취미 : <%=request.getParameter("fav") %>
<hr />

<%
/*
	요청시 받아온 파라메터 출력
	체크박스는 선택된 내용만 넘어옴
	null에 대한 오류 처리 없이 사용 가능
*/

%>


<p>er</p>
<br />이름 : ${param.name }
<br />성별 : ${param.gender }
<br />학력 : ${param.grade }
<br />취미 : ${paramValues.fav[0] }
			${paramValues.fav[1] }
			${paramValues.fav[2] }
			${paramValues.fav[3] }
				
</body>
</html>