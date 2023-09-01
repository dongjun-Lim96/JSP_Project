<%@page import="mk.member.MemberBean"%>
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
    	String password = request.getParameter("password");
    	/* System.out.println(id+" ");
    	System.out.println(password); */
    	
    	MemberDao mdao = MemberDao.getInstance();
    	MemberBean member = mdao.getMemberInfo(id,password);
    	String viewPage = null;
    	String login = "logoff";
    	
    	if(member != null){
    		String id2 = member.getId();
    		int no = member.getNo();
    		if(id2.equals("admin")){
    			viewPage = request.getContextPath()+"/admin_display/admin_main.jsp";
    			login = "logon";
    		}else{
    			viewPage = request.getContextPath()+"/market_display/main.jsp";
    			login = "logon";
    		}
    		//여러 다른페이지에서도 쓸수 있게 세션설정
    		session.setAttribute("sid", id2); //sid = hong,admin
    		session.setAttribute("sno", no); //
    		session.setAttribute("login", login);
    		
    	}else{//없으면
    		viewPage = "login_form.jsp";
    %>
    	<script type="text/javascript">
			alert("가입하지 않은 회원입니다.");
		</script>
    <%		
    	}
    %>
    
    <script type="text/javascript">
		location.href="<%=viewPage%>";
	</script>

</body>
</html>