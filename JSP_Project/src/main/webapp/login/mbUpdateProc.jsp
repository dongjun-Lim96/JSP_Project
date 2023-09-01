<%@page import="mk.member.MemberDao"%>
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
		String id = request.getParameter("id");
		System.out.println(id);
    %>
    
    <jsp:useBean id="mb" class="mk.member.MemberBean"/>
    <jsp:setProperty property="*" name="mb"/>
    
    <%
    	MemberDao mdao = MemberDao.getInstance();
	
		int cnt = mdao.updatemember(mb, id); 
		String msg = "";
		System.out.println(cnt);
		
		response.sendRedirect("mypage.jsp");
    %>
		
</body>
</html>