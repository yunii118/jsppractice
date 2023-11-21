<%@page import="java.util.Set"%>
<%@page import="com.momo.dto.Person"%>
<%@page import="java.util.Map"%>
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
	if(application.getAttribute("map")!=null){
		
		// 브라우저를 닫았다가 다시 열어도 값이 유지됨
		// 서버를 종료 후 닷 ㅣ실행 시 제거되는 것을 확인할 수 있다.
		Map<String, Person> map 
			= (Map<String, Person>)application.getAttribute("map");
		// 맵에 담긴 데이터의 키값을 조회함
		// keySet() : 키의 집합을 set타입으로 반환
		Set<String> keys = map.keySet();
		// map은 key, value가 쌍으로 저장되는 컬렉션 타입
		// get(key) : key를 이용하여 value값을 반환
		for(String key :keys){
			Person p = map.get(key);
			out.print(p + "<br />");
		}
	}else{
		out.print("map이 존재하지 않습니다.");
	}
%>
</body>
</html>