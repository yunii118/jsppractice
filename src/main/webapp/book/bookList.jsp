<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <style type="text/css">
 	.pointer:hover{
 		cursor : pointer;
 	}
 </style>
<script type="text/javascript">
	
	window.onload = function(){
		if(document.querySelector("#loginBtn")!=null){
			
 			let loginBtn = document.querySelector("#loginBtn");
 			loginBtn.addEventListener('click', function(){
  				loginForm.action='/book/loginForm.jsp';
 				loginForm.submit();
 			})
		}
		if(document.querySelector("#signUpBtn")!=null){
			let signUpBtn = document.querySelector("#signUpBtn");
			
			signUpBtn.addEventListener('click', function(){
				loginForm.action='/book/register.jsp';
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
		document.querySelector("#searchBtn").addEventListener('click', function(){
			searchForm.pageNo.value=1;
			searchForm.submit();
		})
		
		document.querySelector("#regBtn").addEventListener('click', function(){
			 location.href="/book/bookReg.jsp";
		})
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
<title>Insert title here</title>
<link rel="short icon" href="#">
</head>
<body>
<!-- header파일 include -->
<%@ include file="../common/header.jsp" %>
<!-- 도서목록 출력 -->
<form name="loginForm" hidden="true"> 
	<%
		String url="";
		if("http://localhost:8080/lib/bookList.jsp".equals(request.getRequestURL().toString())){
		url="/bookList?" + request.getQueryString();
		}
		else if(request.getRequestURL().toString().indexOf("http://localhost:8080/lib/bookRead.jsp") != -1){
			url = "/bookRead?"+ request.getQueryString();
		}
	%>
	<input type="text" name="from" value="<%=url %>" hidden="true">
</form>


<!-- 메인 컨텐츠 -->
<!-- Begin Page Content -->
<div class="container-fluid"> 

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">이대 도서관</h1>
	<p class="mb-4">이대 도서관에 오신걸 환영합니다. <br />
		이대 도서관에서는 다양한 학술 자료와 서적을 수장하고 학문적 활동을 지원합니다.</p>
 

 <!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
    		<h6 class="m-0 font-weight-bold text-primary">도서목록</h6>
    	</div>
    	<div class="card-body">
    		<div class="table-responsive">
    		<!-- 검색폼 -->
				<form name="searchForm" action="/bookList">
					<input type="text" name = "pageNo" value="${pageDto.cri.pageNo }" hidden="true">
					<input type="text" name="no" value="${bookDto.no }" hidden="true">
					<div class="input-group">
						<select name="searchRent" class="form-select" aria-label="Example select with button addon">
							<option value="entire" class="${pageDto.cri.searchRent eq 'entire'? 'selected' : '' }">전체</option>
							<option value="available " class="${pageDto.cri.searchRent eq 'available'? 'selected' : '' }">대여가능</option>
						</select>
						<select name="searchField" class="form-select" aria-label="Example select with button addon">
							<option value="title" class="${pageDto.cri.searchField eq 'title'? 'selected' : '' }">제목</option>
							<option value="author" class="${pageDto.cri.searchField eq 'author'? 'selected' : '' }">작가</option>
						</select>
						<input type="text"  value ="${pageDto.cri.searchWord }" name="searchWord" class="form-control" aria-label="Text input with segmented dropdown button">
						<button id="searchBtn" class="btn btn-outline-secondary" type="button">검색</button>
					</div>
				</form>
				<p> <button class="btn btn-secondary" id="regBtn">글쓰기</button> </p>
				<!-- id-="dataTable"을 삭제해주면 페이징 및 검색 생성되지 않음 -->
        		<table class="table table-bordered"  width="100%" cellspacing="0">
            		<thead>
                		<tr>
                    		<th>no</th>
                        	<th>제목</th>
                        	<th>작가</th>
                        	<th>대여여부</th>
                        	<th>조회수</th>
                     	</tr>
                 	</thead>
                 	<tfoot>
                 		<tr>
                    		<th>no</th>
                        	<th>제목</th>
                        	<th>작가</th>
                        	<th>대여여부</th>
                        	<th>조회수</th>
                    	</tr>
                  	</tfoot>
                  	<tbody>
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
									<td>${bookDto.visitcount }</td>
								</tr>
							</c:forEach>
						</c:if>
            		</tbody>
           		</table>
           		<!-- page navi -->
				<!-- pageDto가 request영역에 저장 되어 있으면 페이지 블럭을 출력 합니다. -->
         		<%@ include file="pageNavi.jsp" %>
			</div>
		</div>
	</div>
</div>
      <!-- /.container-fluid -->
<!-- 메인컨텐츠 영역 끝 -->
            








<!-- footer파일 include -->
<%@ include file="../common/footer.jsp" %>

</body>
</html>