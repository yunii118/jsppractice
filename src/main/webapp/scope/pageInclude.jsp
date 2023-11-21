<%@page import="com.momo.dto.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- <ul>
	<li>String : <%=page_str %></li>
	<li>int : <%=page_int %></li>
	<li>person : <%=page_p.getAge() %>/<%=page_p.getName() %></li>
</ul> --%>

<ul>
	<li>String : <%= pageContext.getAttribute("page").toString() %></li>
	<li> int : <%= (Integer)pageContext.getAttribute("page_int") %></li>
	<li>person : <%= (Person)pageContext.getAttribute("page_person") %></li>
</ul>

</body>
</html>