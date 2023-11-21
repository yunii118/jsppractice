<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Arrays"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//post 방식일 때 한글 깨짐 방지
	
	request.setCharacterEncoding("utf-8");
	String favo="";
	String id = request.getParameter("id");
	String sex = request.getParameter("sex");
	// 체크박스는 여러개가 선택될 수 있기 때문에 getparametervalues 로 배열로 처리해야함
	String[] favoArr = request.getParameterValues("favo");
	// 1. 반복문을 사용하여 하나씩 출력
	// 1-1. 배열의 처음부터 끝까지 돌면서 값을 저장
	for(String favoStr : favoArr){
		favo += favoStr + " ";
	}
	// 1-2.인덱스를 이용한 반복 - 범위 지정 가능
	//for(int i =0;i<favoArr.length;i++){
	//	favo += favoArr[i] + " ";
	//}
	// 2. Arrays.toString() 이용
	//out.println("======================");
	//out.println(Arrays.toString(favoArr));
	String intro = request.getParameter("intro");
%>

<ul>
	<li>아이디 : <%=id %></li>
	<li>성별 : <%=sex %></li>
	<li>관심사항 : <%=favo %></li>
	<li>자기소개 : <%=intro %></li>
</ul>
</body>
</html>