<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mk.board.BoardBean"%>
<%@page import="mk.board.BoardDao"%>
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
	<jsp:include page="top.jsp" />
	<%
		request.setCharacterEncoding("UTF-8");
		BoardDao dao = BoardDao.getInstance();
		String num = request.getParameter("num");
		String pageNum = request.getParameter("pageNum");
		
		BoardBean article = dao.getArticleByNum(num); 
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	%>
	<div class="p-3"></div>
	<div align="right" class="card bg-light col-md-8" style="float: none; margin: auto;">
		<div class="card-body" align="center">
		
		<form name="contentForm">
		<table class="table">
			<tr>
				<td colspan="4" align="center"><h1><%=article.getSubject()%></h1></td>
			</tr>
			<tr align="center">
				<td>글번호: <%=article.getNum()%></td>
				<td>조회수: <%=article.getReadcount()%></td>
				<td>작성자: <%=article.getWriter()%></td>
				<td>작성일: <%=sdf.format(article.getReg_date())%></td>
			</tr>
			
			<tr>
				<td align="center" colspan="4"><h5>글내용</h5></td>
			</tr>	
			
			<tr>
				<td colspan="4" align="left">
				<textarea rows="20" class="form-control input-lg" disabled="disabled"><%=article.getContent()%></textarea>
				</td>
			</tr>
			
			<tr>
				<td colspan="4" align="right">
					<input type="button" value="글수정" onClick="location.href='board_update.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
					<input type="button" value="글삭제"  onClick="location.href='board_delete.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
					<input type="button" value="답글쓰기" onClick="location.href='board_reply.jsp?ref=<%=article.getRef()%>&re_step=<%=article.getRe_step()%>&re_level=<%=article.getRe_level()%>&pageNum=<%=pageNum%>'">
					<input type="button" value="글목록" onclick="location.href='board_main.jsp?pageNum=<%=pageNum%>'">
				</td>
			</tr>
		</table>
		</form>
		</div>
	</div>
	<div class="p-3"></div>
	<jsp:include page="bottom.jsp" />
</body>
</html>