<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<style type="text/css">
	#msgAlert{
		width: fit-content;
	}
</style>
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	window.onload = function(){
		document.querySelector("#closeBtn").addEventListener('click', function(){
			location.href='/book/register.html';
		})
	}
</script>
<div id="msgAlert" class="alert alert-primary" role="alert">
  ${msg }
  <button id="closeBtn" type="button" class="btn-close" aria-label="Close"></button>
</div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

</body>
</html>