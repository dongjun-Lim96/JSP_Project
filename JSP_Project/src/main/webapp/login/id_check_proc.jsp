<%@page import="mk.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//idCheckProc.jsp<br>
	String userid = request.getParameter("userid");
	System.out.println("userid " + userid);
	
	MemberDao mdao = MemberDao.getInstance();
	boolean result = mdao.searchId(userid);
	
	System.out.println("result "+result);
	
	if(result){
		out.print("NO");
	} else{
		out.print("YES");
	}
	
%>