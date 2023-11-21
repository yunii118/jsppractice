<%@page import="com.momo.dto.JobDto"%>
<%@page import="java.util.List"%>
<%@page import="com.momo.dao.JobDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
<h2>직급 목록</h2>
<%
	JobDao dao = new JobDao(application);
	List<JobDto> list = dao.getList();
	int i = 0;
	String[] strArr = {"One", "Two", "Three", "Four", "Five", "Six", "Seven"};
%>


<div class="accordion" id="accordionExample">
<% for(JobDto dto : list){
	
%>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse<%=strArr[i] %>" aria-expanded="true" aria-controls="collapse<%=strArr[i] %>">
       	<%= dto.getJob_code() %>
      </button>
    </h2>
    <div id="collapse<%=strArr[i] %>" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
      <div class="accordion-body">
			<%=dto.getJob_name() %>
      </div>
    </div>
  </div>
 <%
	i++; 
} 

	dao.close();%> 
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>