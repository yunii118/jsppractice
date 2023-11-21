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
	// 변수 선언 및 값 할당
	int num1 = 3;

pageContext.setAttribute("num2", 4);
pageContext.setAttribute("num3", "5");
pageContext.setAttribute("num4", "8");

%>

<h3>변수 선언 및 할당</h3>

<p>스클립틀릿에서 선어한 변수 : ${num1 }</p>
<p>페이지 영역에 저장한 변수 : ${num2 }, ${num3 }, ${num4 }</p>

<!-- 3.0 버전부터 대입연산자 이용하여 값 대입 가능 -->
<p>변수 할당 및 즉시 출력 : ${num1 = 7 }</p>
<p>변수 할당 : ${num2 = 8;"" };</p>
<p>할당된 값 출력 : ${num2 }</p>

num1= ${num1 }, num2= ${num2 },num3= ${num3 },num4= ${num4 }


<br>num1 + num2 = ${num1 + num2 }
<br>num1 - num2 = ${num1 - num2 }
<br>num1 * num2 = ${num1 * num2 }
<br>num1 / num2 = ${num1 / num2 }


<!-- 표현언어 이용하면 산술연산시 자동으로 숫자로 변환
	(문자형태의 숫자를 숫자로 변환하여 연산) -->

<br>num3 div num4 = ${num3 div num4 }
<br>num3 mod num4 = ${num3 mod num4 }

<!-- +연산자 : 문자열의 연결. 
		el표현언어에서는 불가능 -->
<br />\${num1 + "str" }

<h3>비교연산자</h3>
<!-- 문자 형태의 연산자 -->
<!-- 문자 형태의 연산자를 이용하여 코드를 좀 더 직관적으로 작성할 수 있다. -->
	<br />num1 == num4 : ${num1 eq num4 }
	<br />num4 > num3 : ${num4 gt num3 }
	<br />num1 < num3 : ${num1 lt num3 }
	<br />num2 >= num4 : ${num2 ge num4 }

<br />${num1 > num4 }

</body>
</html>