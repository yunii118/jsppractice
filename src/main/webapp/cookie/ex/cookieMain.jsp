<%@page import="com.momo.utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.none{display:none}
	.w30{width:30px}
	div#popup {
        position: absolute; top:100px; left:50px; color:yellow;  
        width:270px; height:100px; background-color:gray;
    }
    div#popup>div {
        position: relative; background-color:#ffffff; top:0px;
        border:1px solid gray; padding:10px; color:black;
    }
</style>
</head>
<body>
<% 
	String none="none";
	String str = "안녕하세요";
%>
<script type="text/javascript">
	//alert("none");
	//alert("<%=none%>");
	//alert('<%="none"%>');
	
	//alert("안녕하세요");
	//alert("<%=str%>");
	
	/*
	document.querySelector("선택자");
	* 선택자
		.클래스
		#아이디
		태그명
	*/
	window.onload = function(){
		// popup 쿠키가 없으면 화면에 출력
		<%
			String display = "none";
			if(!"Y".equals(CookieManager.readCookie(request, "popupClose"))){
				display = "block";
			}
		%>
		
		document.querySelector("#popup").style.display='<%=display%>';
		

		// 닫기버튼을 클릭 하면 form을 전송
		document.querySelector("#closeBtn").onclick = function(){
			
			// 닫기버튼이 클릭 되었으면 체크박스가 체크되었는지 확인
			if(document.querySelector("input[id=inactiveToday]").checked){
				// fetch의 역할 : 서버에 요청
				fetch('cookieAction.jsp')
				.then((data) => data.json)
				.then((json) => {
					console.log("data.json ", json);
		
				})
				console.log('fetch를 이용하여 서버에 cookieAction.jsp 페이지 요청')
				// 서버에 페이지를 요청
				
			}
			// 팝업창 닫기
			document.querySelector("#popup").style.display='none';
			
		}			
		
	}
</script>
<h2 class="none">쿠키 - 팝업 연습</h2>

		<form action="cookieAction.jsp" name="popupForm">
	<!-- 
		<%=none%> : 변수 선언후에 사용
		<%="none"%>
		태그에 속성을 정의 할따, 홑따옴표 또는 쌍따옴표로 감싸주는것은
		해당 속성의 값이 어디까지인지를 정의하는 것
		
		class 속성에 값을 정의 할수 있는데, 여러개 값을 정의할수 있어요!
		class="none w30"
	 -->
	<div id="popup" class="none" >
        <h2 align="center">공지사항 팝업입니다.</h2>
        <div align="right">
	        
	            <input type="checkbox" id="inactiveToday" name="inactiveToday" value="Y" checked/> 
	            하루 동안 열지 않음
	            <input type="button" value="닫기" id="closeBtn" /> 
	       
        </div>
    </div>
    
</form>
		


    
</body>
</html>