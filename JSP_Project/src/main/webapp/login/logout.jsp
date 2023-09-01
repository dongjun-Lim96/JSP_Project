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
	session.setAttribute("login", "logout");
    	session.invalidate(); //세션 전부 해제
    %>
    <script type="text/javascript">
    	location.href="<%=request.getContextPath()%>/market_display/main.jsp";
	</script>
</body>
</html>