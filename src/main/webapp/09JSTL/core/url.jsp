<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>url태그 이용하여 링크 걸기</h2>
<!-- 
   	c:URL
   	지정한 경로와 매개변수를 이용해서 컨텍스트루트를 포함한 URL을 생성 합니다.
   	a태그의 href속성이나 form태그의 action속성에 이용할 수 있습니다.
   	
    value 	: 경로
    var 	: 변수명
	    
--> 
<c:set var="root" value="<%=request.getContextPath() %>"></c:set>

<c:url var="url" value="/09JSTL/inc/otherPage.jsp"></c:url>
url : ${url }<br />
<a href="${url }">외부페이지 바로가기 - url태그 이용</a>

<p>contextPath : <%=request.getContextPath() %></p>
<a href="${root }//09JSTL/inc/otherPage.jsp">외부페이지 바로가기 - request.getContextPath() 사용</a>

<h2>예외처리</h2>
<!-- 
c:catch태그
	예외가 발생하면 지정한 변수에 에러메세지가 저장되어 전달
 -->
 <%
 	int i = 100;
 
 %>
 <c:catch var="errorMsg">
<%
	int res = i/0;
%>
</c:catch>
예외내용 : ${errorMsg }

<h2>el 표현언어에서 예외처리</h2>
<c:set var="num" value="200" />
<c:catch var="errorMsg">
${"str" + num }
</c:catch>

예외내용 : ${errorMsg }
</body>
</html>