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
    
    	String num = request.getParameter("num");
    	String passwd = request.getParameter("passwd");
    	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
    %>
    
    <jsp:useBean id="bb" class="mk.board.BoardBean"/>
    <jsp:setProperty property="*" name="bb"/>
    
    <%
	    System.out.println(num);
		System.out.println(passwd);
		
    	BoardDao bdao = BoardDao.getInstance();
		int cnt = bdao.deleteArticle(num,passwd);
		
		if(cnt>0){ //삭제 성공시
			int pageSize = 5;
			int count = bdao.getArticleCount();
			int pageCount = count/pageSize+(count%pageSize==0? 0 : 1);
			
			if(pageNum > pageCount){
				response.sendRedirect("board_main.jsp?pageNum="+(pageNum-1));
			}else{
				response.sendRedirect("board_main.jsp?pageNum="+pageNum);
			}
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