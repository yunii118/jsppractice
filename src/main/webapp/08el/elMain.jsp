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
/*
	표현 언어(Expression Language, EL)
	변수의 값을 출력할 때 사용하는 스크립트 언어
	
	4가지 영역에 저장된 값을 출력할 때 사용
	사용법이 매우 간결하고, 예외와 형변환에 관대
	
	서블릿에서 처리된 결과는 영역을 통해 전달
	표현언어로 접근하여 쉽게 출력 가능
	
	- JSP 내장 객체의 영역에 담긴 속성을 사용할 수 있음
	- 산술 연산, 비교 연산, 논리 연산이 가능
	- 자바 클래스에 정의된 메서드를 호출할 수 있음
	- 표현 언어만의 객체를 통해 JSP와 동일한 기능을 수행
	
	기본사용법
	${ 영역.속성 }
	변수에 접근 하기 위해서는 영역을 지정 해주어야 합니다.
	
	페이지영역 		: pageScope
	요청영역 		: requestScope
	세션영역 		: sessionScope
	어플리케이션영역 	: applicationScope
	
	영역 지정해주지 않아도 페이지영역부터 차례대로 훑으면서 속성 찾음
	
	${requestScope.saveVar}
	
	요청 파라메터
	request.getParameter("매개변수명")
	${ param.매개변수명 }
	${ param["매개변수명"] }
	${ param['매개변수명'] }
	
	한글, 특수문자가 입력된 경우 대괄호([])를 이용해야 오류가 발생하지 않습니다.
	ex) ${param["user-agent"]}
		${param["한글"]}

	
*/
	
	pageContext.setAttribute("pageScopeValue", "페이지영역");
	request.setAttribute("requestScopeValue", "요청영역");
	session.setAttribute("sessionScopeValue", "세션영역");
	application.setAttribute("applicationScopeValue", "어플리케이션 영역");
%>

<h2>각 영역에 저장된 속성 읽기</h2>
<br />표현법 : <%=request.getAttribute("requestScopeValue") %>
<br />표현언어 : ${requestScope.requestScopeValue}, ${requestScopeValue }

<hr />

<ul>
	<li>페이지 영역 : ${pageScope.pageScopeValue }</li>
	<li>요청 영역 : ${requestScope.requestScopeValue}</li>
	<li>세션 영역 : ${sessionScope.sessionScopeValue}</li>
	<li>어플리케이션 영역 : ${applicationScope.applicationScopeValue}</li>

</ul>

<jsp:forward page="elForward.jsp"></jsp:forward>

</body>
</html>