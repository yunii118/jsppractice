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
<%@ include file="../common/header.jsp" %>
<!-- 메인 컨텐츠 -->
<!-- Begin Page Content -->
<div class="container-fluid">
	 <!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
	    	<h6 class="m-0 font-weight-bold text-primary">비밀번호 찾기</h6>
	    </div>
	    <div class="card-body">
	    	<div class="table-responsive">
				<form action="/findPw" method="post">
					<div class="alert alert-light" role="alert">
					  가입한 아이디와 이메일을 입력해주세요!
					</div>
					<div class="mb-3">
						<label for="id" class="form-label">아이디</label>
						<input type="text" id="id" name="id"  class="form-control bg-light border-0 small" required>				
				    </div>
					<div class="mb-3">
						<label for="id" class="form-label">이메일</label>
						<input type="email" id="id" name="email"  class="form-control bg-light border-0 small" required>				
				  	</div>
					<input type="text" name="url" value="/book/findPassword.jsp" hidden="true">
					<button type="submit" class="btn">Submit</button>
				</form>
		    </div>
		</div>
	</div>  
</div>  
<!-- 메인 컨텐츠 영역 끝 -->
<%@ include file="../common/footer.jsp" %>

</body>
</html>