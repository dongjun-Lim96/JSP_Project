<%@page import="java.text.DecimalFormat"%>
<%@page import="mk.product.productBean"%>
<%@page import="java.util.Vector"%>
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
	<%@include file="top.jsp"%>
	<jsp:useBean id="mkCart" class="mk.cart.CartBean" scope="session"/> 
	<%
		Vector<productBean> cv = mkCart.getAllProducts();
		session.setAttribute("cart", cv.size());
		DecimalFormat df = new DecimalFormat("###,###");
		int cartTotalPrice = 0;
	%>
		<h3 class="text-primary" align="center" style="margin-top: 20px;">장바구니</h3>
		<hr> 
		
		 <section class="py-1">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
					<table class="table table-striped" style="width: 700px;">
						<tr height="60">
							<th colspan="6" style="text-align: center;">장바구니 보기</th>
						</tr>
						
						<tr>
							<th width="10%">번호</th>
							<th width="20%">상품명</th>
							<th width="20%">수량</th>
							<th width="20%">단가</th>
							<th width="20%">금액</th>
							<th width="10%">삭제</th>
						</tr>
						
						<%
							if(cv.size() == 0){
								out.println("<tr><td colspan='6' align='center'>");
								out.println("장바구니에 담은 상품이 없습니다.");
								out.println("</td></tr></table>");
							} else{
								for( productBean pb : cv){
									String imgPath = request.getContextPath()+"/images/"+pb.getPimage();
						%>
								<tr>
									<td align="center" valign="middle"><%=pb.getPnum() %></td>
									<td align="center" valign="middle">
										<img src="<%=imgPath%>" width="50" height="50"><br>
										<%=pb.getPname() %>
									</td>
									<td align="center" valign="middle">
										<form name="f" method="post" action="market_cartEdit.jsp">
											<input type="text" size="1" name="oqty" value="<%=pb.getPqty() %>">개
											<input type="hidden" name="pnum" value="<%=pb.getPnum()%>">
											<input type="submit" value="수정">
										</form>
									</td>
									<td align="center" valign="middle">
										<b><%=df.format(pb.getPrice())%> 원</b><br>
									</td>
									<td align="right" valign="middle">
										<font color="red"><b><%=df.format(pb.getPrice() * pb.getPqty())%> 원</b></font><br>
									</td>
									<td align="center" valign="middle">
										<a href="market_cartDel.jsp?pnum=<%=pb.getPnum()%>">삭제</a>
									</td>
								</tr>
						<%			
									cartTotalPrice += pb.getPrice() * pb.getPqty();
								}//for
									
					%>
							<tr class="m1">
								<td colspan="4" align="left">
									<b>장바구니 총액</b> : <font color="red"><%=df.format(cartTotalPrice)%> 원</font><br>
								</td>
								<td colspan="2" align="left">
									<a href="market_order.jsp?pnum=00&oqty=00">[주문하기]</a> 
									<a href="javascript:history.go(-2)">[계속 쇼핑]</a> 
								</td>
							</tr>
							</table>
					<%			
							}//else
						%>
					
		     </div>
            </div>
        </section>	
	<%@include file="bottom.jsp"%>
</body>
</html>