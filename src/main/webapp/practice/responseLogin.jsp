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
	String id = request.getParameter("id");
	String pw = request.getParameter("password");
	
	if("momo".equals(id) && "1234".equals(pw)){
		response.sendRedirect("responseWelcome.jsp?id=" + id);
	}
	else{
		request.getRequestDispatcher("responseMain.jsp?loginErr=1").forward(request, response);
	}
	
%>

</body>
</html>