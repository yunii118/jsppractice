<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>액션태그를 활용한 포워딩</h2>
<!-- 
	페이지 전환(새로운 페이지로 이동하는 것)
	포워드 방식 이용 : page영역은 공유되지 않음. request 영역 공유
 -->
 <% 
 	pageContext.setAttribute("pageAttr", "페이지 영역");
 	request.setAttribute("requestAttr", "요청 영역");
 	
 	// request.getRequestDispatcher("경로").forward(request, response);
 %>
 <jsp:forward page="forwardSub.jsp">
 	<jsp:param value = "액션태그 파라메터" name= "param" />
 </jsp:forward>
</body>
</html>