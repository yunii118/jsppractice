<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
 <style type="text/css">
 	.pointer:hover{
 		cursor : pointer;
 	}
 </style>
<title>Insert title here</title>
</head>
<body>
<!-- header파일 include -->
<%@ include file="../common/header.jsp" %>
<!-- 도서목록 출력 -->
도서목록 출력
<br />
<script type="text/javascript">
	
	window.onload = function(){
		if(document.querySelector("#loginBtn")!=null){
			let loginBtn = document.querySelector("#loginBtn");
			
			loginBtn.addEventListener('click', function(){
				loginForm.action='/lib/loginForm.jsp';
				loginForm.submit();
			})
		}
		if(document.querySelector("#logoutBtn")!=null){
			let logoutBtn = document.querySelector("#logoutBtn");
			
			logoutBtn.addEventListener('click', function(){
				loginForm.action='/bookLogout';
				loginForm.submit();
			})
		}
	}
	
	
	function goPage(num){
		searchForm.pageNo.value=num;
		searchForm.submit();
	}
	
	function goDetail(num){
		searchForm.no.value=num;
		searchForm.action='/bookRead';
		searchForm.submit();
		
		
	}
	

</script>

	

<form name="searchForm">
	<input type="text" name = "pageNo" value="${pageDto.cri.pageNo }" >
	<input type="text" name="no" value="${bookDto.no }">
	<div class="input-group">
	  <select name="searchField" class="form-select" id="inputGroupSelect04" aria-label="Example select with button addon">
	    <option value="title" class="${pageDto.cri.searchField eq 'title'? 'selected' : '' }">제목</option>
	    <option value="author" class="${pageDto.cri.searchField eq 'author'? 'selected' : '' }">작가</option>
	  </select>
	  <input type="text"  value ="${pageDto.cri.searchWord }" name="searchWord" class="form-control" aria-label="Text input with segmented dropdown button">
	  <button id="searchBtn" class="btn btn-outline-secondary" type="submit">검색</button>
	</div>
</form>

<table class="table table-hover">
	<thead>
		<tr>
			<th>no</th>
			<th>제목</th>
			<th>작가</th>
			<th>대여여부</th>
		</tr>
	</thead>
		<c:if test="${empty list }">
			<tr>
				<td colspan="4" align="center">도서목록이 존재하지 않습니다.</td>
			</tr>
		
		</c:if>
		<c:if test="${not empty list }">
		<c:forEach	items="${list }" var="bookDto">
		
			<tr>
				<td>${bookDto.no }</td>
				<td class="pointer"><a onclick="goDetail(${bookDto.no})">${bookDto.title }</a></td>
				<td>${bookDto.author }</td>
				<td>${bookDto.rentYnStr }</td>
			
			</tr>
			
		</c:forEach>
		</c:if>
	<tbody>
	
	</tbody>

</table>




<%@ include file="pageNavi.jsp" %>
<!-- footer파일 include -->
<%@ include file="../common/footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

</body>
</html>