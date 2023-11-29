<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">

	window.onload = function(){
		document.querySelector("#listBtn").addEventListener('click', function(){
		    searchForm.action='/bookList';
		    searchForm.submit();
		})
		document.querySelector("#beforeBtn").addEventListener('click', function(){
			history.go(-1);
		})
		
		
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
		
		
		
	};
	
	
</script>
<!-- header -->
<%@ include file="/common/header.jsp" %>

<!-- main -->
<h2>${bookDto.title } 상세 페이지</h2>
<form name = "searchForm" hidden="true">
	pageNo : <input type="text" name="pageNo" value="${param.pageNo }"> 
	searchField : <input type="text" name="searchField" value="${param.searchField }"> 
	searchWord : <input type="text" name="searchWord" value="${param.searchWord }"> 
</form> 
<p class="float-sm-end">
	<button type="button" id="beforeBtn" class="btn btn-secondary">이전</button>
	<button type="button" id="listBtn" class="btn btn-secondary">리스트</button>
	&nbsp;
</p>
<br />조회수 : ${bookDto.visitcount }
<br />요청 도서 번호 : ${param.no }
<br />도서정보 : ${bookDto }
<br />도서번호 : ${bookDto.no }
<br />도서명 : ${bookDto.title }
<br />작가 : ${bookDto.author }
<br />대여여부 : ${bookDto.rentYnStr }


<!-- footer -->
<%@ include file="/common/footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

</body>
</html>