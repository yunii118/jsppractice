<%@page import="com.momo.dto.Criteria"%>
<%@page import="java.util.List"%>
<%@page import="com.momo.dao.BoardDao"%>
<%@page import="com.momo.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<title>Insert title here</title>
</head>
<body>
<!-- 로그인 여부 체크
	로그인을 했을 때 : 세션에 userId가 저장되어있으면
				- 로그아웃 버튼 출력
		없으면
				- 로그인 버튼 출력
 -->
 <script type="text/javascript">
 	
 	window.onload = function(){
	 	let logoutBtn = document.querySelector("#logoutBtn");
	 	let loginBtn = document.querySelector("#loginBtn");
	 	
	 	if(logoutBtn != null){
	 		logoutBtn.addEventListener('click', function(){
		 		login.action = "/logout";
		 		login.submit();	 			
	 		});
	 	}
	 	if(loginBtn != null){
	 		loginBtn.addEventListener('click', function(){
		 		login.action = "/06session/servletEx/loginForm.jsp";
		 		login.submit();
	 			
	 		});
	 	}
	 	
	 	
 	}
 	
 </script>
 <form name = "login">
 <c:if test="${not empty userId }">
 		<%=session.getAttribute("userId") %>님 환영합니다.
 		<button id="logoutBtn">로그아웃</button>
 </c:if>
 <c:if test="${empty userId }">
 	<button id="loginBtn">로그인</button>
 </c:if>
 	
 
</form>

<h2>게시글 목록</h2>

<table border="1">
	<tr>
		<th>일련번호</th>
		<th>제목</th>
		<th>내용</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	<!-- 리스트 사이즈가 0이라면 조회된 데이터가 없습니다 출력 -->
	<c:if test="${empty list }" var="result">
		<tr>
			<td colspan="6">조회된 데이터가 없습니다.</td>
		</tr>
	</c:if>
	<!-- 리스트 사이즈가 0이 아니라면 목록 출력 -->
	<c:if test="${not result }">
		<c:forEach items="${list }" var="boardDto">
			<tr>
				<td>${boardDto.num }</td>
				<td><a href="/boardRead?num=${boardDto.num }">${boardDto.title }</a></td>
				<td>${boardDto.content }</td>
				<td>${boardDto.id }</td>
				<td>${boardDto.postdate }</td>
				<td>${boardDto.visitcount }</td>
			</tr>
		</c:forEach>
	</c:if>
	
</table>
<!-- 페이지 네비게이션 작성 
	 - 페이지 번호
	 - 페이지 블럭 당 페이지 갯수(페이지 블럭의 시작번호~끝번호)
	 - 총 게시물의 수
	 - 한페이지당 게시물의 수(끝번호)-->
	 
	 <%=request.getAttribute("pageDto") %>
<!-- pageVavi include -->
	 	<%@ include file="PageNavi.jsp" %>
	

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

</body>
</html>