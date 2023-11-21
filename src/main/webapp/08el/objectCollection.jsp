<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.momo.dto.Person"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
	// 리스트 생성
	List<Object> aList = new ArrayList<>();
	aList.add("문자열");
	aList.add(new Person("momo", 25));
	
	// 내장객체에 저장되지 않으면 값 안불러줌
	pageContext.setAttribute("aList", aList);
%>

<h3>list 컬렉션</h3>
<!-- 영역 지정하지 않아도 작은 영역부터 탐색해서 있으면 출력 -->
<br />${aList }
<!-- 객체의 주소값이 출력(toString()메서드의 호출 결과
		-> toString을 재정의 한 경우 해당 메서드의 실행 결과가 출력됨-->
<br />${aList[0] }
<br />${aList[1].name }
<br />${aList[1].age }


<!-- 값이 없어도 오류가 발생하지 않음 -->
<br />없어도 오류 발생하지 않음 ===== ${aList[2].age }

<h3>map 컬렉션</h3>
<%
	Map<String, String> map = new HashMap<>();
	
	map.put("한글", "모모");
	map.put("영어", "momo");
	
	pageContext.setAttribute("map", map);
%>
<br />${map }
<br />${map.get("한글") }
<br />${map.get("영어") }
<br />${map["한글"] }
<br />${map["영어"] }
<!-- 한글은 .을 찍어서 접근할 수 없음 
		\${} : 주석처리-->
<br /> \${map.한글 }
<br /> <%=map.get("한글") %>


</body>
</html>