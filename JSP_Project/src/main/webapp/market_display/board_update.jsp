<%@page import="mk.board.BoardBean"%>
<%@page import="mk.board.BoardDao"%>
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
		<%
		request.setCharacterEncoding("UTF-8");
		
		String num = request.getParameter("num");
		String pageNum = request.getParameter("pageNum");
	
		BoardDao bd = BoardDao.getInstance();
		BoardBean bb = bd.getCoententByNum(num);
	%>
		<h3 class="text-primary" align="center" style="padding: 10px;">글수정</h3>
		
	 <div align="right" class="card bg-light col-md-8" style="float: none; margin: auto;">
	 	<div class="card-body" align="center">
	<form method="post" name="updateForm" action="updateProc.jsp" onSubmit="return writeSave()">
		<input type="hidden" name="num" value="<%=num%>">
		<input type="hidden" name="pageNum" value="<%=pageNum%>">
		
		<table class="table">
			<tr>
				<td colspan="2" align="right">
					<a href="board_main.jsp">글목록</a>
				</td>
			</tr>
			
			<tr>
				<td>이 름</td>
				<td><input type="text" name="writer" value="<%=bb.getWriter()%>" class="form-control input-lg"></td>
			</tr>
			
			<tr>
				<td>제 목</td>
				<td><input type="text" name="subject" class="form-control input-lg" value="<%=bb.getSubject()%>"></td>
			</tr>
			
			<tr>
				<td>Email</td>
				<td><input type="text" name="email" class="form-control input-lg" value="<%=bb.getEmail()%>"></td>
			</tr>
			
			<tr>
				<td>내 용</td>
				<td>
					<textarea name="content" rows="10" class="form-control input-lg"><%=bb.getContent()%></textarea>
				</td>
			</tr>
			
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="passwd" class="form-control input-lg"></td>
			</tr>
			
			<tr height="30">
				<td colspan="2" align="center" style="padding-top: 30px;">
					<input type="submit" value="글수정">
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