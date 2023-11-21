<%@page import="com.momo.dto.EmpDto"%>
<%@page import="java.util.List"%>
<%@page import="com.momo.dao.EmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	table, tr, td{
		border : solid 1px;
	}
	
</style>
<title>Insert title here</title>
</head>
<body>
<h2>empList</h2>
<%
	List<EmpDto> list = (List<EmpDto>)request.getAttribute("list");
%>
<table>
	<tr>
		<td>사번</td>
		<td>사원명</td>
		<td>주민등록번호</td>
	</tr>
	<%for(EmpDto dto:list){ %>
	<tr>
		<td><%=dto.getEmp_id() %></td>
		<td><%=dto.getEmp_name() %></td>
		<td><%=dto.getEmp_no() %></td>
	</tr>
	<%}%>
</table>

</body>
</html>