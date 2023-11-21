<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - out</title>
</head>
<body>
<%
	out.print(1);
	out.print(false);
	out.print('가');
	out.print("잘가~");
	
	// 버퍼의 내용 삭제
	out.clearBuffer();
	
	// 버퍼의 크기 확인
	out.print(out.getBufferSize());
	// 남은 버퍼의 크기
	out.print(out.getRemaining());
	
%>
</body>
</html>