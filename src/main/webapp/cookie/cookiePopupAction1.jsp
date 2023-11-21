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
		// inactivetoday값 출력
		String popup_checkbox = request.getParameter("inactiveToday");
		out.print("inactiveToday : " + popup_checkbox);

		//팝업닫기용 쿠키 생성(popupClose, Y)
		if("Y".equals(popup_checkbox)){
			CookieManager.makeCookie(response, "popupClose","Y",86400);
		}
		
		
		// 끝나면 main페이지로 전환
		response.sendRedirect("cookiePopupMain.jsp");
		
	%>
</body>
</html>