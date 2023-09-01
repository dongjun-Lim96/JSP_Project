<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript" src="script.js"></script>

<title>Insert title here</title>
</head>
<body>
<jsp:include page="/market_display/top.jsp"/>
	<td colspan="6" align="center">
	
	<h2 align="center">회원가입</h2>
	<form action="registerProc.jsp" method="post" onSubmit="return writeSave()">
		<table width="400" >
			
			<tr>
				<th><label>아이디*</label></th>
				<td style="padding-bottom: 10px;">
					<input type="text" name="id" onkeydown="keyd()"> 
					<input type="button" value="중복체크" onClick="duplicate()"> 
					<br><span id="idmessage"></span>
				</td>
				 
			</tr>

			<tr>
				<th><label>비밀번호*</label></th>
				<td style="padding-bottom: 10px;">
					<input type="text" name="password" onblur="return pwcheck()"> 
				</td>
				<td> <span id="pwmessage"></span> </td>	
			</tr>

			<tr>
				<th><label>비밀번호 확인*</label></th>
				<td style="padding-bottom: 10px;">
					<input type="text" name="password2" onkeyup="pw2check()">
				</td>
			</tr>

			<tr>
				<th><label>이름*</label></th>
				<td style="padding-bottom: 10px;">
					<input type="text" name="name" >
				</td>
			</tr>
			
			<tr>
				<th><label>이메일*</label></th>
				<td style="padding-bottom: 10px;">
					<input type="text" name="email">
				</td>
			</tr>


			<tr>
				<th><label>생년월일*</label></th>
				<td style="padding-bottom: 10px;">
					<input type="text" name="birth" maxlength="6">
				</td>
			</tr>

			<tr>
				<th><label>휴대폰 번호*</label></th>
				<td style="padding-bottom: 20px;"> 
					<input type="text" name="tel" maxlength="13">
				</td>
			</tr>

			<tr>
				<td colspan="2" align="center" style="padding-bottom: 20px;">
					<input type="submit" value="가입하기"> 
				</td>
			</tr>
		</table>
	</form>
	</td>	
<jsp:include page="/market_display/bottom.jsp"/>	
</body>
</html>