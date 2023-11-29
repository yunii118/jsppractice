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
<h2>파일 목록</h2>
<table border="1">
	<thead>
		<tr>
			<th>file_no</th>
			<th>name</th>
			<th>title</th>
			<th>cate</th>
			<th>ofile</th>
			<th>sfile</th>
			<th>postdate</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${list }" var="fileDto">
			<tr>
				<td>${fileDto.file_no }</td>
				<td>${fileDto.name }</td>
				<td>${fileDto.title }</td>
				<td>${fileDto.cate }</td>
				<td><a href="/10upload/filedownload.jsp?ofile=${fileDto.ofile }&sfile=${fileDto.sfile }">${fileDto.ofile }</a></td>
				<td>${fileDto.sfile }</td>
				<td>${fileDto.postdate }</td>
			</tr>
		</c:forEach>
	</tbody>

</table>
<!-- ofile 원본파일명
	 sfile 저장된 파일명 
 -->
<a href="filedownload.jsp?ofile=abc.txt&&sfile=abc.txt">
	파일명(링크 - ofile)
</a>

</body>
</html>