<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	form{
		width:300px;
	}
	
	
</style>
<title>Insert title here</title>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<!-- 메인 컨텐츠 -->
<!-- Begin Page Content -->
<div class="container-fluid">
	 <!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
	    	<h6 class="m-0 font-weight-bold text-primary">Login</h6>
	    </div>
	    <div class="card-body">
	    <div class="table-responsive">
			<!-- 메인 컨텐츠 영역 끝 -->
			<c:if test="${not empty param.isError }">
			  아이디/비밀번호를 확인해주세요.
			</c:if>
			<form action="/login" name="loginForm" method="post">
			  <div class="mb-3">
					<label for="id" class="form-label">아이디</label>
					<input type="text" id="id" name="user_id"  class="form-control bg-light border-0 small" required>				
			  </div>
			  <div class="mb-3">
					<label for="pw" class="form-label">비밀번호</label>
					<input type="password" id="pw" name="user_pw"  class="form-control bg-light border-0 small" required>				
				</div>
			  <p><button type="submit" class="btn text-center">login</button></p>
			  <input name="from" type="text" value="${param.from }" hidden="true">
			  <div class="text-center">
			      <a class="small" href="../book/findPassword.jsp">Forgot Password?</a>
			  </div>
			</form>
			</div>
	    </div>
	</div>    

</div>

    
<%@ include file="../common/footer.jsp" %>

</body>
</html>