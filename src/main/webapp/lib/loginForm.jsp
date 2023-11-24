<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<style type="text/css">
	form{
		width:300px;
	}
	
	
</style>
<title>Insert title here</title>
</head>
<body>
<c:if test="${not empty param.isError }">
  아이디/비밀번호를 확인해주세요.
</c:if>
<form action="/login" name="loginForm" class="position-absolute top-0 start-50 translate-middle-x" method="post">
  <div class="mb-3">
    <label for="InputId" class="form-label">Id</label>
    <input type="text" name="user_id" class="form-control" id="exampleInputEmail1" aria-describedby="InputId">
  </div>
  <div class="mb-3">
    <label for="InputPassword" class="form-label">Password</label>
    <input type="password" name="user_pw" class="form-control" id="InputPassword">
  </div>
  <button type="submit" class="btn btn-primary">login</button>
  <input name="from" type="text" value="${param.from }">
</form>
    

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

</body>
</html>