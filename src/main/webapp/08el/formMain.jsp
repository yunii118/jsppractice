<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	window.onload = function(){
		let submitBtn = document.querySelector("#submitBtn");
		submitBtn.addEventListener('click', ()=>{
			actionForm.action="formResult.jsp";
			actionForm.method="post";
			actionForm.submit();
		})
	}
</script>
<h2>폼값 전송하기</h2>
<form name="actionForm">
	<ul>
		<li>이름 : <input type="text" width="20px" name="name" required></li>
		<li>성별 : <label><input type="radio" name="gender">남자</label>
				<label><input type="radio" name="gender">여자</label></li>
		<li>학력 : <select name="grade">
					<option value="ele">초등</option>
					<option value="mid">중등</option>
					<option value="high">고등</option>
					<option value="uni">대학</option>
				</select>
		</li>
		<li>관심사항 : <input type="checkbox" name="fav" value="pol">정치
					<input type="checkbox" name="fav" value="eco">경제
					<input type="checkbox" name="fav" value="ent">연예
					<input type="checkbox" name="fav" value="exer">운동</li>	
	</ul>
	<input type="button" value="전송하기" id="submitBtn" />
</form>
</body>
</html>