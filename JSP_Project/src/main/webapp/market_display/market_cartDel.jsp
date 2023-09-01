<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="mkCart" class="mk.cart.CartBean" scope="session"/> 
	<% 
		String pnum = request.getParameter("pnum");
		mkCart.removeProduct(pnum);
		response.sendRedirect("market_cartList.jsp");
	%>
</body>
</html>