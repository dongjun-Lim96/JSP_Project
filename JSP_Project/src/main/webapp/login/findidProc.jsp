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
	MemberDao md = MemberDao.getInstance();
	%>

	<jsp:useBean id="mb" class="mk.member.MemberBean" />
	<jsp:setProperty property="*" name="mb" />

	<%
	MemberBean member = md.findId(mb); 
	System.out.println(member);
	String msg, url;
	if (member != null) {
		msg = member.getId();
	} else {
		msg = "없는 회원";
	}
	url = "login_form.jsp";
	%>

	<script type="text/javascript">
		alert("회원님의 ID는 [ <%=msg%> ] 입니다.");
		location.href="<%=url%>";
	</script>
</body>
</html>