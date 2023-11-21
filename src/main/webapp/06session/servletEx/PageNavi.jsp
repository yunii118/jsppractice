<%@page import="com.momo.dto.PageDto"%>
<%@page import="com.momo.dto.Criteria"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<%	
	// controller에서 request영역에 저장한 pageDto를 화면에서 사용할 수 있도록 변수에 저장
	PageDto pageDto = null;
	if(request.getAttribute("pageDto") != null
		&& !"".equals("pageDto")){
		pageDto = (PageDto)request.getAttribute("pageDto");
	}
	else{
		pageDto = new PageDto(0, new Criteria());
	}
	
%>
</head>
<body>

<!-- 페이지네이션 -->
<nav aria-label="...">
  <ul class="pagination">
  <!-- 앞으로가기 버튼 disabled : 비활성화 -->
    <li class="page-item <%= pageDto.isPrev() ? "" : "disabled"%>">
      <a class="page-link" href="/boardList?pageNo=<%=pageDto.getStartNo() -1 %>">Previous</a>
    </li>
    <!-- 앞으로가기 버튼 끝 -->
    
    <%
    	for(int i = pageDto.getStartNo();i<=pageDto.getEndNo();i++){
    		
    	
    %>
	    <li class="page-item">
	    	<a class="page-link <%=pageDto.getCri().getPageNo() == i? "active":"" %>" href="/boardList?pageNo=<%=i %>" ><%=i %></a>
	    </li>
    <% } %>
    
    	
    <!-- 뒤로가기 버튼 시작 -->
    <li class="page-item">
      <a class="page-link <%=pageDto.isNext()? "":"disabled" %>" href="/boardList?pageNo=<%=pageDto.getEndNo() +1 %>">Next</a>
    </li>
    <!-- 뒤로가기 버튼 끝 -->
  </ul>
</nav>

<!-- 부트스트랩 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

</body>
</html>