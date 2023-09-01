<%@page import="mk.product.productBean"%>
<%@page import="mk.product.productDao"%>
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
		String pnum = request.getParameter("pnum");
		String oqty = request.getParameter("oqty");
		
		System.out.println("pnum : " + pnum + ", oqty : " + oqty);
	%>
	<jsp:useBean id="mkCart" class="mk.cart.CartBean" scope="session"/>
	<%
		productDao pdao = productDao.getInstance();
		productBean pb = pdao.getProductByPnum(pnum);
		
		mkCart.addProduct(pnum,oqty);
		response.sendRedirect("market_cartList.jsp");
	%>
</body>
</html>