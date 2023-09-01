<%@page import="mk.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
    	request.setCharacterEncoding("UTF-8");
    	String pageNum = request.getParameter("pageNum");
    %>
    
    <jsp:useBean id="bb" class="mk.board.BoardBean"/>
    <jsp:setProperty property="*" name="bb"/>
    
    <%
    	BoardDao bdao = BoardDao.getInstance();
	
		int cnt = bdao.updateArticle(bb);
		
		if(cnt>0){
			response.sendRedirect("board_main.jsp?pageNum="+pageNum);
		}else{
	%>
		<script>
			alert("비밀번호가 일치하지 않습니다.");
			history.go(-1);
		</script>
	<%		
		}
    %>
</body>
</html>