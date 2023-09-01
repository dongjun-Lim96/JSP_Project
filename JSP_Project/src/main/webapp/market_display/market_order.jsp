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
</head>
<body>
	<%@include file="top.jsp"%>
	<jsp:useBean id="mkCart" class="mk.cart.CartBean" scope="session"/>
		<%
		//상세보기 flag = true
		boolean flag = (boolean)application.getAttribute("flag"); //true
		String pnum = request.getParameter("pnum");
		String oqty = request.getParameter("oqty");
		System.out.println(pnum+", "+ oqty);
		if(!pnum.equals("00") && !oqty.equals("00")){ // 상품상세보기에서 즉시구매하기
		//	return;
			if(flag == true){
				mkCart.addProduct(pnum, oqty); //새로고침하면 다음부터는 flag값이 false다 상세보기로 가면 다시 true로 바뀜
			}
		}
		
		Vector<productBean> clist = mkCart.getAllProducts();
		DecimalFormat df = new DecimalFormat("###,###");
	%>
	
	<h3 class="text-primary" align="center" style="margin-top: 20px;">결제하기</h3>
	<hr> 

					<table class="table table-striped" style="width: 600px; margin: auto;">
						<tr height="60">
							<th colspan="6" style="text-align: center;">결제 내역서</th>
						</tr>
						
						<tr>
							<th width="20%" style="text-align: center;">상품명</th>
							<th width="10%" style="text-align: right;">수량</th>
							<th width="10%" style="text-align: right;">금액</th>
						</tr>
						
						<%
							int totalPrice=0;
							for( productBean pb : clist){
						%>
								<tr>
									<td style="text-align: center;"><%=pb.getPname() %></td>
									<td align="right"><%=pb.getPqty() %>개</td>
									<td align="right"><%=pb.getPrice()*pb.getPqty() %>원</td>
								</tr>
						<%			
								totalPrice +=pb.getPrice()*pb.getPqty(); 
							}//for
						%>
						<tr>
							<td colspan="3" align="center"><b>결제하실 총액은</b>:
								<font color="red"><%=df.format(totalPrice) %>원</font>
							</td>
						</tr>
					</table>
					
					<br>
					<div align="center">
					 <button class="btn btn-outline-dark" type="button" onClick="location.href='market_calculate.jsp'">
                            <i class="bi-cart-fill me-1"></i>
                            결제하기
                     </button>
		   			</div>
	<%@include file="bottom.jsp"%>
</body>
</html>