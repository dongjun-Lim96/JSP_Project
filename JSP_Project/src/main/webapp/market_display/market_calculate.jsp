<%@page import="mk.order.OrdersDao"%>
<%@page import="mk.product.productBean"%>
<%@page import="java.util.Vector"%>
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
		try{
		Vector<productBean> clist = mkCart.getAllProducts();
		int sno = (Integer)session.getAttribute("sno");
		OrdersDao odao = OrdersDao.getInstance();
		int cnt = odao.insertOrder(sno,clist); // 회원번호, 장바구니
		
		String msg = "",url="";
		if(cnt >= 0){
			msg = "주문 완료했습니다.";
			url = "main.jsp";
			mkCart.removeAllProduct();
		%>
			<script type="text/javascript">
				alert("<%=msg%>");
				location.href="main.jsp";
			</script>
		<%	
		}else{
			msg = "주문 실패했습니다.";
			url = "main.jsp";
		}
	%>
	<script type="text/javascript">
		alert("<%=msg%>");
		location.href="<%=url%>";
	</script>
	
	<% 
		}catch(NullPointerException e){
	%>
			<script type="text/javascript">
				alert("로그인 후 사용가능");
				location.href="main.jsp";
			</script>
	<%		
		}
	%>
</body>
</html>