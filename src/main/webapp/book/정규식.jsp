<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	.area1{
		border : 1px solid;
		width : 500px;
		height : 300px
		
	}
</style>
<title>Insert title here</title>


</head>
<body>
<script type="text/javascript">
	window.onload = function(){
		document.querySelector("#btn1").addEventListener('click', function(){
			// 전화번호 : 숫자3-숫자4-숫자4
			// 이메일 : 영문대소자, 몇가지기호@영문자.영문자
			
			
			// RegExp정규식 패턴 만드는 객체
			// 생성자를 이용한 정규표현식 객체 생성
			// 생성자의 매개값 : 패턴 문자열
			let regExp = new RegExp('script');
			console.log(regExp, typeof(regExp), regExp instanceof RegExp);
			
			// 리터럴을 이용한 정규표현식 객체 생성
			// 패턴 양쪽에 /로 작성
			let regExp1 = /script/;
			console.log(regExp1, typeof(regExp1), regExp1 instanceof RegExp);
			
			/*
	        RegExp 객체에서 제공하는 메소드
	            객체.test(문자열) : 문자열에 정규식 패턴을 만족하는 값이 있으면 true, 없으면 false를 리턴한다.
	            객체.exec(문자열) : 문자열에 정규식 패턴을 만족하는 값이 있으면 처음 매치된 문자열 리턴한다.
            */ 
            let str1 ="javascript jquery ajax";
	        let str2 = "java jquery ajax";
	        
	        regExp.test(str1);
	        regExp.test(str2);
	        
	        regExp.exec(str1);
	        regExp.exec(str2);
	        
	        area1.innerHTML="<br />regExp.test(str1) : " + regExp.test(str1)
	        +"<br />regExp.test(str2) : " + regExp.test(str2);
	        area1.innerHTML +="<br />regExp.exec(str1) : " + regExp.exec(str1)
	        +"<br />regExp.exec(str2) : " + regExp.exec(str2);
	         
	        /*
	        	숫자 : \d
	        	+ : 1개이상
	        	$ : 문자열의 끝을 의미
	        */
	        let num = /\d+/;
	        let num1 = /\d+$/;
	        console.log("num.test('0123')", num.test('0123'));
	        console.log("num.test('0123ee')", num.test('0123ee'));
	        
	        
	        console.log("num1.test('0123')", num.test('0123'));
	        console.log("num1.test('0123ee')", num.test('0123ee'));
	        
	        /*
	        	전화번호 체크
	        	숫자3-숫자4-숫자4
	        */
	        let phone = /\d{3}-\d{4}-\d{4}/;
	        console.log('phone : ', phone.test('000-0000-0000'));
	        console.log('phone : ', phone.test('s00-0000-0000'));
 			
	        
	        /*
	        	^ : 시작
	        	$ : 종료
				\w : 알파벳 문자와 숫자
				\.- : .,-
				
				[영대소문자, 숫자, ., -]한번이상 @ [영대소문자, 숫자, ., -] 한번이상 . 영어대소문자 2번이상
	        	*/
	        let email = /^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$/;
	        
	        console.log('email', email.test('dbs5514@naver.com'));
	        area1.innerHTML += "<br />num.test('0123') : " +num.test('0123')
	        
			// 박스안에 출력하기
			/* area1.innerHTML="<table>              "
				+"	<tr>               "
				+"		<td>test1</td> "
				+"		<td>test2</td> "
				+"		<td>test3</td> "
				+"	</tr>              "
				+"</table>           "
			  */
			
		})
	}
</script>
<h1>정규 표현식</h1>
<p>
    정규 표현식(Regular Expresison)이란, <br>
    특정 규칙을 가진 문자열을 검색하거나 치환할 때 사용하는 형식 언어이다. <br><br>

    정규 표식을 이용하면 입력된 문자열에 대해 특정 조건 검색이나 치환 시
    복잡한 조건을 제시할 필요 없이 간단하게 처리가 가능하다.
</p> 
<h2>1. 정규 표현식 객체 생성</h2>
<p>
    정규 표현식 객체를 생성하기 위해서는 정규 표현식 리터럴과 RegExp 생성자 함수를 사용한다. <br>
    리터럴을 사용하는 것이 일반적이다. (/패턴/플래그)
</p> 

<button id="btn1">실행</button>
<div id="area1" class="area1" />

</body>
</html>