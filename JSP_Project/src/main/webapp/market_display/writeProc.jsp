<%@page import="java.sql.Timestamp"%>
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
	
		BoardDao bdao = BoardDao.getInstance(); 
	%>
	<jsp:useBean id="bb" class="mk.board.BoardBean"/>
	<jsp:setProperty property="*" name="bb"/>
	<%
		bb.setReg_date(new Timestamp(System.currentTimeMillis()));
		bb.setIp(request.getRemoteAddr());
		
		int cnt = bdao.insertArticle(bb);
	 
		String msg = "작성 실패";
		String url = "board_write.jsp";
		
		if(cnt == 1){
			msg = "작성 성공";
			url = "board_main.jsp";
	}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>
</body>
</html>