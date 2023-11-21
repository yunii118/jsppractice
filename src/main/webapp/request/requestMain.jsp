<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>1. 클라이언트와 서버의 환경정보 읽기</h2>
<!--  method 지정하지 않을 경우 get방식으로 호출 -->
<p>
	<a href="RequestWebinfo.jsp?eng=Hello&han=안녕">GET 방식 요청</a>
</p>

<h2>2. 클라이언트의 요청 매개변수 읽기</h2>
	<form action="RequestParameter.jsp" method="post">
		아이디 : <input type = "text" name ="id" value="momo">
		성별 : <input type= "radio" name = "sex" value="man">남
			 <input type ="radio" name = "sex" value= "woman" checked= "checked">여
			 <br />
		관심사항 :<input type = "checkbox" name = "favo" value="eco" checked= "checked"> 경제
				<input type = "checkbox" name = "favo" value="pol"> 사회
				<input type = "checkbox" name = "favo" value="ent"> 연예
				<br />
		자기소개 : <textarea cols="30" rows="4" name = "intro">만나서 반갑습니다.</textarea>
		<button type="submit">submit</button>
	</form>
<h2>3. http 헤더 정보 출력 하기</h2>
	<a href="requestHeader.jsp">요청 헤더 정보 읽기</a>


</body>
</html>