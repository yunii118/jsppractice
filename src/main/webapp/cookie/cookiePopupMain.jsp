<%@page import="com.momo.utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
 div#popup {
        position: absolute; top:100px; left:50px; color:yellow;  
        width:270px; height:100px; background-color:gray;
    }
    div#popup>div {
        position: relative; background-color:#ffffff; top:0px;
        border:1px solid gray; padding:10px; color:black;
    }
</style>
<title>Insert title here</title>
</head>
<body>
<h2>쿠키를 이용한 팝업창 제어 ver 1.0</h2>
<script>
	// window 객체의 onload 이벤트가 발생하면 실행
	// html 요소들을 모두 그리면서 실행
	window.onload = function(){
		
		// 팝업 클로즈 쿠키의 값이 'Y'이면, 팝업창을 화면에서 숨김처리
		
		
		// 버튼에 따라 이벤트 추가
		closeBtn.onclick = function(){
			// 체크박스가 체크되어 있으면
			if(document.querySelector('#inactiveToday').checked){
				// alert('체크박스가 선택되었습니다.');
				console.log('체크박스가 선택되었습니다.')
				// 서버 요청 방법
				// 1. href : queryString을 이용하여 파라메터 전달
				// 2. form submit : 폼 안의 요소를 가지고 이동
				popupForm.submit();
				
			} else{
				console.log('체크박스가 선택되지 않았습니다.')
			}
			// 체크박스가 선택되었습니다 메세지를 출력하시오.
			
			alert('버튼이 클릭되었습니다.')
			// display 속성을 none으로 설정하면 화면에서 숨김처리
			popup.style.display = 'none';
		}
	}

</script>

<!-- 
	1. 닫기 버튼을 클릭하면 cookiePopupAction.jsp 파일을 호출
		- 팝업닫힘 쿠키 생성
	2. 팝업닫힘 쿠키가 생성이 되어있다면, 더이상 팝업을 보여주지 않도록 처리

 -->
 <form action="cookiePopupAction.jsp" name = "popupForm">
 <%
 			// 쿠키에 저장된 popupClose의 값이 Y가 아니면 팝업을 생성
			String popupClose = CookieManager.readCookie(request, "popupClose");
			if(!"Y".equals(popupClose)){
		%>
	<div id="popup" >
        <h2 align="center">공지사항 팝업입니다.</h2>
        <div align="right">   
	    <input type="checkbox" id="inactiveToday" name ="inactiveToday" value="Y" /> 
	    하루 동안 열지 않음
	    <input type="button" value="닫기" id="closeBtn" />   
        </div>
    </div>
    <%} %> 
    </form>
    
</body>
</html>