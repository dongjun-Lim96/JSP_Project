<%@page import="mk.member.MemberDao"%>
<%@page import="mk.member.MemberBean"%>
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
    	MemberDao mdao = MemberDao.getInstance();
    %>
    
    <jsp:useBean id="mb" class="mk.member.MemberBean"/>
    <jsp:setProperty property="*" name="mb"/>

    <%
    
    	int cnt = mdao.insertMember(mb);
    	
    	String msg= "";
    	String url = "";
    
    	if(cnt==1){
    		msg="가입 성공";
    		url = "login_form.jsp";
    	}else{
    		msg="가입 실패";
    		url ="register.jsp";
    	}
    %>
    	<script type="text/javascript">
    		alert("<%=msg%>");
    		location.href="<%=url%>";
    	</script>
</body>
</html>