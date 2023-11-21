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
<script type="text/javascript">
	window.onload = function(){
		document.querySelector("#gradeBtn").addEventListener('click', function(){
			
			res = validateForm(gradeForm);
			
			if(res){
				// 폼 전송
				gradeForm.submit();
			}
			
		})
	}
	/*
		유효성 검사 validation check
		form 요소를 매개변수로 받아서
		form이 가지고있는 요소의 값을 체크
		
		함수 정의 : type, 
	*/
	function validateForm(form){
		event.preventDefault();
			// 유효성 검사 validation check
			// 유효성 검사 결과 gradeForm submit
			// 체크로직을 모두 통과했다면 서버에 요청, 체크로직 통과하지 못했다면 메세지 처리
		console.log(form.kor.value);
		if(form.kor.value == ''){
			alert('국어점수를 입력해주세요.');
			form.kor.focus()
			return false;
		}
		console.log(form.eng.value);
		if(form.eng.value==''){
			alert('영어점수를 입력해주세요.');
			form.eng.focus()
			return false;
		}
		console.log(form.math.value);
		if(form.math.value==''){
			form.math.focus()
			alert('수학점수를 입력해주세요.');
			return false;
		}
	}
	
</script>

<h2>다중 조건문</h2>

<p>홀짝 판단하기</p>
<!-- 변수 선언 -->
<c:set var="num" value="101" />

<!-- 다중 조건문 사용하기 -->
<c:choose>
	<c:when test="${num mod 2 eq 0 }">
		num(${num })은 짝수입니다.
	</c:when>
	<c:otherwise>
		num(${num })은 홀수입니다.	
	</c:otherwise>
</c:choose>

<h2>국, 영, 수 점수를 입력하면 평균을 내어 학점을 출력</h2>
<p>>=90 : A학점, >=80 : B학점, >=70 : C학점, >=60 : D학점</p>
<!-- form에 action을 주지 않은 경우, 동일한 페이지 다시 요청 -->
<form name="gradeForm">
	이름 : <input type="text" name="name" value="momo"><br />
	국어 : <input type="number" name="kor"><br />
	영어 : <input type="number" name="eng"><br />
	수학 : <input type="number" name="math"><br />
	<!-- 
		폼에 버튼이 하나만 있다면 이 버튼은 submit
		폼을 전송하는 기본이벤트가 정의되어있음
		유효성검사를 진행하기 위해서는 기본이벤트를 정의하는 작업 해야함 
		-->
	<button id="gradeBtn">학점 구하기</button>
</form>

<form name="gradeForm1">
	이름 : <input type="text" name="name" value="momo"><br />
	국어 : <input type="number" name="kor"><br />
	영어 : <input type="number" name="eng"><br />
	수학 : <input type="number" name="math"><br />
	<button onclick="return validateForm(gradeForm1)">학점 구하기</button>
</form>
<form name="gradeForm2" onsubmit="return validateForm(gradeForm2)">
	이름 : <input type="text" name="name" value="momo"><br />
	국어 : <input type="number" name="kor"><br />
	영어 : <input type="number" name="eng"><br />
	수학 : <input type="number" name="math"><br />
	<button>학점 구하기</button>
</form>

<c:if test="${not (empty param.kor
					or empty param.eng
					or empty param.math) }">
	이름 : ${param.name}<br>
	국어점수 : ${param.kor }<br>
	영어점수 : ${param.eng }<br>
	수학점수 : ${param.math }<br>
	평균점수 : ${avg = (param.kor+param.eng+param.math)/3; avg }<br>
	${param.name }님의 학점은 
	<c:choose>
		<c:when test="${avg ge 90 }">
			A
		</c:when>
		<c:when test="${avg ge 80 }">
			B
		</c:when>
		<c:when test="${avg ge 70 }">
			C
		</c:when>
		<c:when test="${avg ge 60 }">
			D
		</c:when>
	</c:choose>
	입니다.
</c:if>
</body>
</html>