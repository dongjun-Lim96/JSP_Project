<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓</title>
<style type="text/css">
* {
	padding: 0;
	margin: 0;
	border: none;
}

body {
	font-size: 14px;
	font-family: 'Roboto', sans-serif;
}

.login-wrapper {
	width: 400px;
	height: 350px;
	padding: 40px;
	box-sizing: border-box;
}

.login-wrapper>h2 {
	font-size: 24px;
	color: #6A24FE;
	margin-bottom: 20px;
}

#login-form>input {
	width: 100%;
	height: 48px;
	padding: 0 10px;
	box-sizing: border-box;
	margin-bottom: 16px;
	border-radius: 6px;
	background-color: #F8F8F8;
}

#login-form>input::placeholder {
	color: #D2D2D2;
}

#login-form>input[type="submit"] {
	color: #fff;
	font-size: 16px;
	background-color: #6A24FE;
	margin-top: 10px;
	margin-bottom: 5px;
}

#login-form>input[type="checkbox"] {
	display: none;
}

#login-form>label {
	color: #999999;
}

#login-form input[type="checkbox"]+label {
	cursor: pointer;
	padding-left: 26px;
	background-image: url("checkbox.png");
	background-repeat: no-repeat;
	background-size: contain;
}

#login-form input[type="checkbox"]:checked+label {
	background-image: url("checkbox-active.png");
	background-repeat: no-repeat;
	background-size: contain;
}
</style>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<jsp:include page="/market_display/top.jsp" />
	<div class="login-wrapper" style="margin: auto;">
		<h2 align="center">Login</h2>
		<form method="post" action="loginProc.jsp" id="login-form">
			<input type="text" name="id" placeholder="id"> 
			<input type="password" name="password" placeholder="Password"> 
			
			<input type="submit" value="Login"> 
			
			<div align="center">
				<a href="findid.jsp"><span>아이디 찾기</span></a>
				<a href="register.jsp"><span>회원가입</span></a>
				<a href="findpw.jsp"><span>비밀번호 찾기</span></a>
			</div>
		</form>
	</div>
	<jsp:include page="/market_display/bottom.jsp" />
</body>
</html>