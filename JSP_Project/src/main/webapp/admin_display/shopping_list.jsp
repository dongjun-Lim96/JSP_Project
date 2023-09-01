<%@page import="mk.order.OrdersBean"%>
<%@page import="java.util.Vector"%>
<%@page import="mk.order.OrdersDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<%@include file="top.jsp" %>
	
	<%
		DecimalFormat df = new DecimalFormat();
		OrdersDao odao = OrdersDao.getInstance();
		Vector<OrdersBean> lists = null;
		String memid = request.getParameter("memid");
		System.out.println("memid:"+memid);
		if(memid!=null){
			 lists = odao.getOrderList(memid);
		}
	%>
	
	<h3 class="text-primary" align="center" style="padding: 10px;">이용자 내역</h3>
	<div align="right" class="card bg-light col-md-8" style="float: none; margin: auto;">
		<div class="card-body" align="center">
			<table class="table table-striped">
				<tr>
				<td colspan="5" align="center"> 
					<form action="shopping_list.jsp" method="post">
						조회할 회원 아이디 입력 : 
						<input type="text" name="memid"> 
						<input type="submit" value="조회">
					</form>
				</td>
				</tr>
				
				<tr>
					<th style="text-align: center;">고객명</th>
					<th style="text-align: center;">아이디</th>
					<th style="text-align: center;">상품명</th>
					<th style="text-align: right;">수량</th>
					<th style="text-align: right;">금액</th>
				</tr>
					
				<%
					int list_total = 0;
					if(lists != null){
						for(OrdersBean ob : lists){
				%>
						<tr>
							<td align="center"><%=ob.getMname() %></td>
							<td align="center"><%=ob.getMid() %></td>
							<td align="center"><%=ob.getPname() %></td>
							<td align="right"><%=ob.getQty() %></td>
							<td align="right">&#8361;<%=ob.getAmount() %></td>
						</tr>
				<%		
						list_total += ob.getAmount();
						}
					}
				%>
				<tr>
					<td colspan="4" align="center">총합</td>
					<td align="right">&#8361;<%=df.format(list_total)%></td>
				</tr>
				
			</table>
		</div>
	</div>
	<div class="p-3"></div>
	<%@include file="bottom.jsp" %>
</body>
</html>