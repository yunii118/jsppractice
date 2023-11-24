<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Register</title>

    <!-- Custom fonts for this template-->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">
<script>
	window.onload = function(){
		/*
		 변수 선언
		 var - 변수의 중복 선언 가능.
		 let - 지역변수, 중복 선언 불가능
		 const - 지역상수, 중복 선언 불가능
		
		*/
		
		if(document.querySelector("#regiBtn") != null){
			let regiBtn = document.querySelector("#regiBtn");
			
			// 익명의 함수를 작성할 수도 있고, 이미 작성된 함수의 이름을 넘겨줄 수도 있음
			// 함수의 이름을 넣어줄때에는 함수 이름 뒤에 ()를 붙이면 안됨(함수 즉시실행)
			regiBtn.addEventListener('click', function(){
				// 유효성 검사
				res = validationCheck(regiForm);
				if(res){
					// 등록 요청
					// 폼을 전송 - 새로은 페이지를 요청
					regiForm.submit();
				}
			})
			
		}
	}
	
	function validationCheck(form){
		event.preventDefault();
		if(form.id.value == ''){
			alert('아이디를 입력해주세요.');
			form.id.focus();
			return false;
		}
		if(form.id.length > 10){
			alert('아이디의 길이는 10자를 초과할 수 없습니다.');
			form.id.focus();
			return false;
		}
		if(form.name.value == ''){
			alert('이름을 입력해주세요.');
			form.name.focus();
			return false;
		}
		if(form.name.length > 15){
			alert('이름의 길이는 15자를 초과할 수 없습니다.');
			form.name.focus();
			return false;
		}
		if(form.email.value == ''){
			alert('이메일을 입력해주세요.');
			form.email.focus();
			return false;
		}
        let email_reg = /^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$/;
		if(!email_reg.test(form.email.value)){
			alert('이메일 형식이 일치하지 않습니다.');
			form.email.focus();
			return false;
		}
		if(form.email.length > 100){
			alert('이메일의 길이는 100자를 초과할 수 없습니다.');
			form.email.focus();
			return false;
		}
		if(form.pw.value == ''){
			alert('비밀번호를 입력해주세요.');
			form.pw.focus();
			return false;
		}
		if(form.pw.length > 10 || form.pwRepeat.length > 10){
			alert('비밀번호의 길이는 10자를 초과할 수 없습니다.')
			form.pw.focus();
			return false;
		}
		if(form.pwRepeat.value == ''){
			alert('비밀번호를 다시 입력해주세요.');
			form.pwRepeat.focus();
			return false;
		}
		if(form.pw.value != form.pwRepeat.value){
			alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
			form.pw.focus();
			return false;
			
		}
		
		return true;
	}
	function getByteLength(str) {
		  // TextEncoder 객체 생성 (UTF-8 사용) : 한글 3byte로 계산됨
		  var encoder = new TextEncoder('utf-8');
		  // 문자열을 바이트 배열로 인코딩
		  var encoded = encoder.encode(str);
		  // 바이트 배열의 길이 반환
		  return encoded.length;
		} 
</script>
    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">회원가입</h1>
                            </div>
                            <form name="regiForm" class="user" method="post" action="/book/regProcess?url=<%=request.getRequestURL().toString()%>">
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="id"
                                        name="id" placeholder="id" required>             
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="name"
                                        name="name" placeholder="name" required>             
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control form-control-user" id="email"
                                       name="email" placeholder="Email Address" required>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user"
                                           name="pw" id="pw" placeholder="Password" required>
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control form-control-user"
                                            name="pwRepeat" id="pwRepeat" placeholder="Repeat Password" required>
                                    </div>
                                </div>
                                <button id="regiBtn" class="btn btn-primary btn-user btn-block">
                                  회원가입
                                 </button>
                                <hr>
                                <a href="../index.html" class="btn btn-google btn-user btn-block">
                                    <i class="fab fa-google fa-fw"></i> Register with Google
                                </a>
                                <a href="../index.html" class="btn btn-facebook btn-user btn-block">
                                    <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
                                </a>
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="findPassword.jsp">Forgot Password?</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="../lib/loginForm.jsp">Already have an account? Login!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../js/sb-admin-2.min.js"></script>

</body>

</html>