<%@page import="com.momo.utils.CookieManager"%>
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
	String userId= "";
	String checked = "";
	
	userId = CookieManager.readCookie(request, "userId");
	if(!userId.isEmpty()){
		checked = "checked";
	}
	// userId 쿠키에서 찾고
	/* Cookie[] cookies = request.getCookies();
	// 요청객체로부터 쿠키정보를 찾아 꺼내옴
	if(cookies != null){
		out.print("아이디를 찾았습니다.");
		for(Cookie cookie : cookies){
			if("userid".equals(cookie.getName())){
				userId = cookie.getValue();
				checked = "checked";
				break;
			}
		}
	} 
	*/
%>
<form action = "loginAction.jsp" method = "post">
	<div class='loginbox'>
        <div id='login'>
            <input type="text" name="userid" id="userid" placeholder='ID를 입력해주세요.' 
            				required="required" value=<%=userId %>><br />		
            <input type="password" name="userpw" id="userpw" value="1234" placeholder='PW를 입력해주세요.' required="required"><br>
            <input type="checkbox" <%=checked %> name="save_check" value="Y">아이디 저장하기<br>
        </div>
        <div id='button'>
        <input type="submit" value="로그인">
        </div>
        
    </div>
    <div id='info'>
        <a href="">회원가입</a>
        <a href="">ID찾기</a>
        <a href="">PW찾기</a>
    </div>
    </form>
     
</body>
</html>