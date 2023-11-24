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
	 	
	 	// select 요소에 값 추가
	 	var searchField = '${pageDto.cri.searchField}';
	 	console.log("searchField : ", searchField);
	 	var options = searchForm.searchField.options;
	 	
	 	for(let i = 0;i<options.length;i++){
	 		options[i].removeAttribute("selected");
	 	}
	 	
	 	// select 요소 옵션의 selected 속성 부여
	 	for(let i = 0;i<options.length;i++){
	 		console.log(options[i].value);
	 		if(options[i].value == searchField){
	 			options[i].setAttribute("selected", "selected");
	 		}
	 	}
 	}
 	
 	// 함수는 onload함수 외부에 작성
 	/**
 	 * 입력받은 페이지 번호로 이동
 	*/
 	function goPage(num){
 		// 파라메터로 넘어온 페이지 번호를 searchForm의 pageNo에 입력
 		searchForm.pageNo.value = num;
 		searchForm.submit();
 	}
 	
 	function goDetail(num){
 		//파라메터로 넘어온 페이지 번호를 searchForm의 pageNo에 입력
 		searchForm.action = '/boardRead';
 		searchForm.num.value = num;
 		searchForm.submit();
 	}
 	
 	function formSubmit(){
 		// 1. 폼을 선택 -> 폼의 이름을 불러줌
 		// 2. 폼의 요소 선택 - 폼.요소의 이름
 		searchForm.pageNo.value = '페이지 번호';
 		// form.action = '';
 		//3. 폼 전송하기 - form의 action속성에 정의된 url 호출
 		//			- 폼 안의 요소들을 파라메터로 서버에 전달
 		searchForm.submit();
 	}
 </script>
 <!-- 로그인 폼 -->
 <%@ include file="header.jsp" %>

<h2>게시글 목록</h2>
<table width="90%" align="center">
	<tr>
		<td>
	
<!-- 검색 폼 -->

<%-- pageDto : ${pageDto }<br />
cri : ${pageDto.cri }<br />
pageNo : ${pageDto.cri.pageNo }<br />
searchField : ${pageDto.cri.searchField }<br />
searchWord : ${pageDto.cri.searchWord }<br /> --%>

<form name="searchForm">
pageNo : <input type="text" name="pageNo" value="${pageDto.cri.pageNo }"><br />
num : <input type="text" name="num" value="${boardDto.num }">
	<div class="input-group">
	  <select name="searchField" class="form-select" value="${pageDto.cri.searchWord }" id="inputGroupSelect04" aria-label="Example select with button addon">
	    <option value="title"  ${(pageDto.cri.searchField eq "title")?"selected":""}>제목</option>
	    <option value="id" ${(pageDto.cri.searchField eq "id")?"selected":""}>작성자</option>
	    <option value="content" ${(pageDto.cri.searchField eq "content")?"selected":""}>내용</option>
	  </select>
	  <input type="text" value="${pageDto.cri.searchWord }" name="searchWord" class="form-control" aria-label="Text input with segmented dropdown button">
	  <button class="btn btn-outline-secondary" type="submit">검색</button>
	</div>
</form>
<br />

<table border="1">
	<thead>
		<tr>
			<th>일련번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
	</thead>
	<tbody>
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
				<td><a onclick="goDetail(${boardDto.num})">
				${boardDto.title }</a></td>
				<td>${boardDto.content }</td>
				<td>${boardDto.id }</td>
				<td>${boardDto.postdate }</td>
				<td>${boardDto.visitcount }</td>
			</tr>
		</c:forEach>
	</c:if>
	</tbody>
</table>

<!-- 페이지 네비게이션 작성 
	 - 페이지 번호
	 - 페이지 블럭 당 페이지 갯수(페이지 블럭의 시작번호~끝번호)
	 - 총 게시물의 수
	 - 한페이지당 게시물의 수(끝번호)-->
	 
<!-- pageVavi include -->
	 	<%@ include file="PageNavi.jsp" %>
	
	</td>
	</tr>
</table>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

</body>
</html>