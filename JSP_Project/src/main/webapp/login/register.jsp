<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript" src="loginscript.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
span{
		font-size: 1px;
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

h2 {
	font-size: 24px;
	color: #6A24FE;
	margin-bottom: 20px;
}

input {
	width: 70%;
	height: 30px;
	padding: 0 10px;
	box-sizing: border-box;
	margin-bottom: 16px;
	border-radius: 6px;
	background-color: #F8F8F8;
}

input::placeholder {
	color: #D2D2D2;
}

input[type="submit"] {
	color: #fff;
	font-size: 16px;
	background-color: #6A24FE;
	margin-top: 10px;
	margin-bottom: 5px;
}

input[type="checkbox"] {
	display: none;
}

label {
	color: #999999;
}

input[type="checkbox"]+label {
	cursor: pointer;
	padding-left: 26px;
	background-image: url("checkbox.png");
	background-repeat: no-repeat;
	background-size: contain;
}

input[type="checkbox"]:checked+label {
	background-image: url("checkbox-active.png");
	background-repeat: no-repeat;
	background-size: contain;
}
	
</style>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/market_display/top.jsp"/>
	<h2 align="center">회원가입</h2>
	<form action="registerProc.jsp" method="post" onSubmit="return writeSave()">
		<table width="500" style="margin: auto;">
			
			<tr>
				<th style="padding-bottom: 30px;"><label for="id">아이디*</label></th>
				<td>
					<input type="text" name="id" onkeydown="keyd()" id="id">
					<input type="button" value="중복체크" onClick="duplicate()" style="width: 30%; float: right;"> 
					<br><span id="idmessage">&nbsp</span>
				</td>
			</tr>
			<!-- <tr> <td colspan="2" align=""><span id="idmessage">&nbsp</span></td> </tr> -->
			
			
			<tr>
				<th style="padding-bottom: 30px;"><label for="pw">비밀번호*</label></th>
				<td>
					<input type="text" name="password" onkeyup="return pwcheck()" id="pw"> 
					<br><span id="pwmessage">&nbsp</span>
				</td>
			</tr>

			<tr>
				<th style="padding-bottom: 30px;"><label for="pw2">비밀번호 확인*</label></th>
				<td>
					<input type="text" name="password2" onkeyup="pw2check()" id="pw2">
					<br><span id="pwmessage2">&nbsp</span>
				</td>
			</tr>

			<tr>
				<th style="padding-bottom: 30px;"><label for="name">이름*</label></th>
				<td >
					<input type="text" name="name" id="name">
					<br><span>&nbsp</span>
				</td>
			</tr>
			
			<tr>
				<th style="padding-bottom: 30px;"><label for="email">이메일*</label></th>
				<td >
					<input type="text" name="email" id="email" onkeyup="emailcheck()">
					<br><span id="emailmsg">&nbsp</span>
				</td>
			</tr>


			<tr>
				<th style="padding-bottom: 30px;"><label for="birth">생년월일*</label></th>
				<td >
					<input type="text" name="birth" maxlength="6" id="birth" onkeyup="birthcheck()">
					<br><span id="birthmsg">&nbsp</span>
				</td>
			</tr>

			<tr>
				<th style="padding-bottom: 30px;"><label for="tel">휴대폰 번호*</label></th>
				<td > 
					<input type="text" name="tel" maxlength="13" id="tel" onkeyup="telcheck()">
					<br><span id="telmsg">&nbsp</span>
				</td>
			</tr>

			<tr>
				<td colspan="2" align="center" style="padding-bottom: 20px;">
					<input type="submit" value="가입하기"> 
				</td>
			</tr>
		</table>
	</form>
<jsp:include page="/market_display/bottom.jsp"/>	
</body>
</html>