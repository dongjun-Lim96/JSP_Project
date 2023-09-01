<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="script.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<jsp:include page="/market_display/top.jsp"/>
	<h3 class="text-primary" align="center" style="padding: 10px;">글쓰기</h3>
 <div align="right" class="card bg-light col-md-8" style="float: none; margin: auto;">
 	<div class="card-body" align="center">
<form method="post" name="writeForm" action="writeProc.jsp" onSubmit="return writeSave()">
	<table class="table">
		<tr>
			<td colspan="2" align="right">
				<a href="board_main.jsp">글목록</a>
			</td>
		</tr>
		
		<tr>
			<td>이 름</td>
			<td><input type="text" name="writer" value="<%=session.getAttribute("sid") %>" class="form-control input-lg"></td>
		</tr>
		
		<tr>
			<td>제 목</td>
			<td><input type="text" name="subject" class="form-control input-lg"></td>
		</tr>
		
		<tr>
			<td>Email</td>
			<td><input type="text" name="email" class="form-control input-lg"></td>
		</tr>
		
		<tr>
			<td>내 용</td>
			<td>
				<textarea name="content" rows="10" class="form-control input-lg"></textarea>
			</td>
		</tr>
		
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="passwd" class="form-control input-lg"></td>
		</tr>
		
		<tr height="30">
			<td colspan="2" align="center" style="padding-top: 30px;">
				<input type="submit" value="글쓰기">
				<input type="reset" value="다시작성">
				<input type="button" value="목록보기" onclick="location.href='board_main.jsp'">
			</td>
		</tr>
	</table>
	</form>
	</div>		
</div>	
<div class="p-3"></div>	
	<jsp:include page="/market_display/bottom.jsp"/>
</body>
</html>