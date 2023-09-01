<%@page import="java.util.ArrayList"%>
<%@page import="mk.product.productBean"%>
<%@page import="mk.product.productDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	td{
		text-align: center;
	}
</style>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%
	String pnum = request.getParameter("pnum");
	//System.out.println(pnum);
	
	productDao pdao = productDao.getInstance();
	productBean pb = pdao.getProductByPnum(pnum);  
	
%>
	<%@include file="top.jsp" %>
    	<h3 class="text-primary" align="center" style="padding: 10px;">상품상세 정보</h3>
		<div align="right" class="card bg-light col-md-6"
			style="float: none; margin: auto;">
			<div class="card-body" align="center">
			<div >
				<%if(pb.getPqty() <= 0){ %>
								<img src="<%=request.getContextPath()%>/images/soldout.jpg" width="650" height="600">
							<%}else{%>
							<img src="<%=request.getContextPath()%>/images/<%=pb.getPimage()%>" width="650" height="600">
							<%}%>
				<%-- <img src="<%=request.getContextPath()%>/images/<%=pb.getPimage()%>" width="650" height="600"> --%>
			</div>
			
			<div align="center">
			<form action="product_list.jsp">
				<table class="table">
					
					<tr>
						<th style="width: 30%;">카테고리</th>
						<td style="width: 70%;"><%=pb.getCodename() %></td>
					</tr>
						
					<tr>	
						<th>상품번호</th>
						<td><%=pb.getPnum() %></td>
					</tr>
					
					<tr>
						<th>상품명</th>
						<td><%=pb.getPname()%></td>
					</tr>	
					
					<tr>
						<th>제조회사</th>
						<td><%=pb.getPcompany() %></td>
					</tr>
					
					<tr>
						<th >상품 수량</th>
						<td><%=pb.getPqty()%></td>
					</tr>
					
					<tr>	
						<th>상품 가격</th>
						<td><%=pb.getPrice() %></td>
					</tr>
					
					<tr>
						<th>상품 스펙</th>
						<td><%=pb.getPspec()%></td>
					</tr>
					
					<%--  <tr>
						<th>상품 소개</th>
						<td>
							<textarea cols="30" rows="3" style="resize:none"><%=pb.getPcontents() %></textarea>
						</td>
					</tr> --%>
					<tr>
						<td colspan="4" align="center" height="40">
							<input type="submit" value="돌아가기">
							<!-- <input type="button" value="돌아가기" onClick="history.back()"> -->
						</td>
						</tr>
					
						</table>
					</form>		
			</div>
			</div>
		</div>
	<div class="p-3"></div>
<%@include file="bottom.jsp" %>
</body>
</html>