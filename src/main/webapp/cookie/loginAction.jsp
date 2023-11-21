<%@page import="com.momo.utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	
	String id = request.getParameter("userid");
	String pw = request.getParameter("userpw");
	// 체크박스는 값이 선택된 경우에만 넘어옴
	String save_check = request.getParameter("save_check");
	//save_check 값이 null이 아니라면
	if(save_check != null){
		// cookie에 아이디를 저장
		
		CookieManager.makeCookie(response, "userid", id, 3600);
		
		/* Cookie cookie = new Cookie("userid", id);
		cookie.setMaxAge(3600);
		
		response.addCookie(cookie);
		out.print("아이디를 쿠키에 저장했습니다."); */
	}
	
	if("momo".equals(id) && "1234".equals(pw)){
		out.print("<h2>로그인 성공</h2>");
	}
	else{
%>
<script type="text/javascript">
	alert('id/pw를 확인해주세요.');
	history.go(-1);
</script>
<%
}
%>
</body>
</html>