<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<jsp:include page="/market_display/top.jsp"/>
		<%
			request.setCharacterEncoding("UTF-8");
			String num = request.getParameter("num");
			String pageNum = request.getParameter("pageNum");
		
		%>
		
		<h3 class="text-primary" align="center" style="padding: 10px;">글삭제</h3>
		
	 <div align="right" class="card bg-light col-md-4" style="float: none; margin: auto;">
	 	<div class="card-body" align="center">
	<form name="deleteForm" action="deleteproc.jsp" method="post">  
    <input type="hidden" name="num" value="<%=num%>">
    <input type="hidden" name="pageNum" value="<%=pageNum%>">
		
		<table class="table">
			<tr align="center">
				<td><B>비밀번호를 입력해 주세요.</B></td>
			</tr>
			
			<tr align="center">
				<td>비밀번호 : <input type="password" name="passwd" size="10"></td>
			</tr>
			
			<tr align="center">
				<td>
					<input type="submit" value="글삭제">
					<input type="button" value="글목록" onclick="location.href='board_main.jsp'">
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