<%@page import="com.momo.dto.Criteria"%>
<%@page import="com.momo.lib.dto.PageDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<title>Insert title here</title>
</head>
<body>
<%	

	if(request.getAttribute("pageDto") == null ||
	"".equals(request.getAttribute("pageDto"))){
		request.setAttribute("pageDto", new PageDto(0, new Criteria()));
	}
		
%>
<nav aria-label="...">
  <ul class="pagination justify-content-center">
  	<!-- 이전 버튼 -->
    <li class="page-item ${pageDto.prev? '' : 'disabled' }">
      <a class="page-link" onclick="goPage(${pageDto.startNo - 1})">Previous</a>
    </li>
    
    <!-- 숫자 버튼 -->
    <c:forEach begin="${pageDto.startNo }" end="${pageDto.endNo }" var="i">
	    <li class="page-item ${(i eq pageDto.cri.pageNo)? 'active':'' }" aria-current="page">
	      <a class="page-link" onclick="goPage(${i})">${i }</a>
	    </li>
    </c:forEach>
    
    <!-- 다음으로가기 버튼 -->
    <li class="page-item ${pageDto.next? '' : 'disabled' }">
      <a class="page-link" onclick="goPage(${pageDto.endNo + 1})">Next</a>
    </li>
  </ul>
</nav>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

</body>
</html>