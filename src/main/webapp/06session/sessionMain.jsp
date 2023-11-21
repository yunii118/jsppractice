<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>세션 설정</h2>
<!-- 
	세션의 유지시간
		유지시간을 설정하지 않으면 기본 30분(1800초)
		유지시간이 만료되기전 새로운 요청이 들어오면 유지시간이 연장
		
		클라이언트가 유지시간 내 요청이 없는 경우 해당 세션은 서버에서 제거됨
		
		클라이언트에서 Jsession 쿠키를 제거할 경우 서버에서는
		새로운 세션 아이디를 발급함
		
	유지시간 설정 방법
		web.xml : 유지시간을 분단위로 설정 할 수 있음. 유지시간 설정 후
				  웹브라우저를 닫았다가 다시 열어야 확인 가능
		session.setMaxInactiveIntervel() : 유지시간을 초단위로 설정 가능

 -->
<h2>Session 설정 확인</h2>
<%	
	//session.setMaxInactiveInterval(300); // 이렇게하면 해당 페이지에서만 유지
	// 날짜 표시 형식 지정
	// long타입 날짜의 포맷을 변환하여 출력
	SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
	String createTime = format.format(new Date(session.getCreationTime()));
	String lastTime = format.format(new Date(session.getLastAccessedTime()));
%>
<ul>
	<li>세션 유지 시간 : <%=session.getMaxInactiveInterval() %></li>
	<li>세션 아이디 : <%=session.getId() %></li>
	<li>최초 요청 시각 : <%=session.getCreationTime() + "/" + createTime%></li>
	<li>마지막 요청 시각 : <%=session.getLastAccessedTime() + "/" + lastTime%></li>
</ul>

</body>
</html>