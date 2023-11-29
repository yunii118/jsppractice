<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	ul>li{
		list-style:none;
	}
	#regiBtn{
		align:center;
	}
	.w-20{
		width:20%;
	}
</style>
</head>
<body>
<script type="text/javascript">
	window.onload = function(){
		document.querySelector("#regBtn").addEventListener('click', function(){
			// 폼 요소의 이름으로 접근하여 폼을 전송(새로운 페이지 요청)
			bookRegiForm.submit();
		})
	}
</script>
<%@ include file="../common/header.jsp" %>
<!-- 메인 컨텐츠 -->
<!-- Begin Page Content -->
<div class="container-fluid">
	 <!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
	    	<h6 class="m-0 font-weight-bold text-primary">도서 등록</h6>
	    </div>
	    <div class="card-body">
	    <!-- 파일 업로드 위해 컨트롤러 변경, enctype 지정 -->
			<form name="bookRegiForm" action="/book/regFileupload" method="post" enctype="application/x-www-form-urlencoded">
				<div class="input-group mb-3">
					<span class="w-20 input-group-text" id="inputGroup-sizing-default">도서명</span>
					<input type="text" name="title" placeholder="책 이름을 입력해주세요." class="form-control bg-light border-0 small" required>				
				</div>
				<div class="input-group mb-3">
					<span class="w-20 input-group-text" id="inputGroup-sizing-default">작가명</span>
					<input type="text" name="author" placeholder="작가 이름을 입력해주세요." class="form-control bg-light border-0 small" required>
				</div>
				<div class="input-group mb-3">
					<span class="w-20 input-group-text" id="inputGroup-sizing-default">도서소개</span>
					<input type="text" name="detail" placeholder="도서 소개를 입력해주세요." class="form-control bg-light border-0 small" required>
				</div>
				<div class="input-group mb-3">
					<span class="w-20 input-group-text" id="inputGroup-sizing-default">표지이미지</span>
					<input type="file" class="form-control" id="inputGroupFile02" name="img">
					<label class="input-group-text" for="inputGroupFile02">upload</label>
				</div>
				<p><button class="btn" id="regBtn">등록하기</button></p>
			</form>
				
	    </div>
	    </div>
	</div>    

</div>
<!-- 메인 컨텐츠 영역 끝 -->
<%@ include file="../common/footer.jsp" %>


</body>
</html>