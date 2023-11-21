<%@page import="java.util.ArrayList"%>
<%@page import="com.momo.dto.Person"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <!-- 
 	웹브라우저에서 서버에 처음 요청할 때 sessionID 발급,
 	-> 응답객의 쿠키에 담아서 웹브라우저로 전송
 	-> 웹브라우저는 응답을 받아 쿠키에 저장
 	-> 서버에 요청시 쿠키정보를 담아서 요청
 	
 	회원 인증후 로그인 상태를 유지하는데 사용
 	웹브라우저를 닫고 다시 열게 되면 세션은 유지되지 않음
 
  -->
  
  <%
  	session.setAttribute("person", new Person("momo", 30));
  	
  	List<String> list = new ArrayList<>();
  	list.add("list");
  	list.add("set");
  	list.add("map");
  	
  	session.setAttribute("list", list);
  %>
  <h2>페이지 이동 후 session 영역에 저장된 값을 출력</h2>
  <a href = "sessionLocation.jsp">sessionLocation.jsp 바로가기</a>
  <h2>session 무효화</h2>
  <a href = "sessionInvalidate.jsp">sessionInvalidate.jsp 바로가기</a>
  
</body>
</html>