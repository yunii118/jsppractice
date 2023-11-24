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
<script type="text/javascript">
	let msg = '${msg}';
	// 서버로 부터 전달 받은 url로 이동 합니다.
	// 단, url이 없다면 뒤로가기를 시행 합니다.
	
	let url = '${param.url}';
	if(msg != ''){
		alert(msg);
	}
	if(url != ''){
		location.href = url;
	} else {
		history.go(-1);
	}
</script>

</body>
</html>