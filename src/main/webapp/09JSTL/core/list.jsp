<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
리스트 : ${list }
<table>
	<tr>
		<th>번호</th>
		<th style="width:60%">제목</th>
		<th>작성자</th>
		<th style="width:5%">작성일</th>
		<th style="width:5%">조회수</th>
	</tr>
<c:if test="${empty list }" var="result">
	<tr>
		<td colspan="5" align="center">작성된 게시글이 없습니다.</td>
	</tr>
</c:if>
<c:if test="${not result }">
	<c:forEach items="${list }" var="boardDto">
		<tr>
			<td>${boardDto.num }</td>
			<td>${boardDto.title }</td>
			<td>${boardDto.id }</td>
			<td>${boardDto.postdate }</td>
			<td>${boardDto.visitcount }</td>
		</tr>
	</c:forEach>
</c:if>
</table>
</body>
</html>