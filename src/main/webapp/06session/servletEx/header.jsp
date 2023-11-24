<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	#logo>nav>ul>li{
		float : left; /* 가로로 출력하기 위해 float 속성 사용 */
		width:25%;
		height:30px;
		list-style : none;
	}
	.floatClear{
		clear : both;
	}
</style>
<title>Insert title here</title>
</head>
<body>
<!-- 목록태그 이용해서 메뉴 만들기 -->
<header id="logo">
<nav>
	<ul>
		<li>Home</li>
		<li>Board</li>
		<li>Contact</li>
		<li>map</li>
		<li>
			<form name = "login">
				 <c:if test="${not empty userId }">
				 		${userId }님 환영합니다.
				 		<button id="logoutBtn">로그아웃</button>
				 </c:if>
				 <c:if test="${empty userId }">
				 	<button id="loginBtn">로그인</button>
				 </c:if>
			</form>
		</li>
	</ul>
</nav>
</header>
<hr class="floatClear"/>
</body>
</html>