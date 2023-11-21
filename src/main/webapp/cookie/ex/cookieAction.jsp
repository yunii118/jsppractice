<%@page import="com.momo.utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	
</script>
<title>Insert title here</title>
</head>
<body>
<!-- 
	팝업용 쿠키 생성 후 cookieMain 페이지로 전환
 -->
 <%	
 	String popup_checkbox = request.getParameter("inactiveToday");
 
 	if("Y".equals(popup_checkbox)){
 		CookieManager.makeCookie(response, "popupClose", "Y", 86400);
 	}
 	
 	
 	response.sendRedirect("cookieMain.jsp");
 %>
 
</body>
</html>