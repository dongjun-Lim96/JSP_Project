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
	request.setCharacterEncoding("UTF-8");
	productDao pdao = productDao.getInstance();
	String pnum = request.getParameter("pnum");
	productBean pb = pdao.getProductByPnum(pnum); 
%>
	<jsp:useBean id="mkCart" class="mk.cart.CartBean" scope="session"/>
	<%
		//String pnum = request.getParameter("pnum");
		String oqty = request.getParameter("oqty");
		
		if(Integer.parseInt(oqty) <= 0 || Integer.parseInt(oqty) > pb.getPqty()){
		%>	
			<script type="text/javascript">
				alert('수정실패.');
				location.href="market_cartList.jsp";
			</script>
		<%	
			return;
		}
		
		mkCart.setEdit(pnum,oqty); // 장바구니에서 주문수량 수정
	%>
	<script type="text/javascript">
		alert('수정되었습니다.');
		location.href="market_cartList.jsp";
	</script>
</body>
</html>