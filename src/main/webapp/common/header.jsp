<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	#menu>ul>li{
		float:left;
		list-style : none;
	}
	.floatClear{
		clear:both;
	}

</style>
<title>Insert title here</title>
</head>
<body>

<!-- 메뉴, 로그인정보 -->
메뉴 출력
로그인정보 출력
<header>

<nav id="menu">
	<ul>
		<li>
 			<form name="loginForm"> 
 			<%
 				String url="";
 				if("http://localhost:8080/lib/bookList.jsp".equals(request.getRequestURL().toString())){
					url="/bookList?" + request.getQueryString();
				}
				else if(request.getRequestURL().toString().indexOf("http://localhost:8080/lib/bookRead.jsp") != -1){
					url = "/bookRead?"+ request.getQueryString();
				}
			%>
				<c:if test="${empty userId }">
					<button id="loginBtn">Login</button>
				</c:if>
				<c:if test="${not empty userId }">
					<button id="logoutBtn">Logout</button>
				</c:if>
				<input type="text" name="from" value="<%=url %>">
			</form>
		</li>
	</ul>

</nav>
</header>
<hr class="floatClear"/>
</body>
</html>