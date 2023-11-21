<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <!-- 다른 jsp 파잉ㄹ을 포함하겠다는 의미 -->
<%@ include file="includeFile.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>include 지시어</h1>
	오늘 날짜 : <%=today %>
	<hr />
	
	선언부(클래스 내부에 생성, jsp가 자바파일로 변환이 될 때)
		- 메서드 작성 가능
		- <%! %> 
	스크립틀릿(메소드 내부에 생성)
		- 메서드 작성 불가능
		- 자바 코드
		- <% %>
	표현식
		- 실행 결로가 하나의 값을 출력
		- 상수, 변수, 연산자, 수식
		- 값이 있는 메서드 호출 가능
		- <%= 10+20 %>
		- <%= "오늘 날짜는 " + today %>
		
	
	<%@ include file="includeFooter.jsp" %>
	
</body>
</html>