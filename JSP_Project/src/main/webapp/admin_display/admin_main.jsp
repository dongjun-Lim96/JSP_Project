<%@page import="mk.product.productBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mk.product.productDao"%>
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
	<%
		request.setCharacterEncoding("UTF-8");
		String pname = request.getParameter("pname");
	%>
	<article>
		<h3 class="text-primary" align="center" style="padding: 10px;">상품
			검색</h3>
		<div align="right" class="card bg-light col-md-8"
			style="float: none; margin: auto;">
			<div class="card-body" align="center">
				<table class="table table-striped">
					<tr>
						<td colspan="8" align="center">
							<form action="admin_main.jsp" method="post">
								상품이름: <input type="text" name="pname"> <input
									type="submit" value="검색">
							</form>
						</td>
					</tr>

					<tr>
						<th style="text-align: center;">번호</th>
						<th style="text-align: center;">상품코드</th>
						<th style="text-align: center;">상품명</th>
						<th style="text-align: center;">이미지</th>
						<th style="text-align: center;">가격</th>
						<th style="text-align: center;">제조사</th>
						<th style="text-align: center;">수량</th>
					</tr>

					<%
					productDao dao = productDao.getInstance();
					ArrayList<productBean> list = dao.searchProduct(pname);
					if (list.size() == 0) {
						out.println("<tr><td colspan=8 align='center'>등록된 상품이 없습니다.</td></tr>");
					} else {

						for (productBean pb : list) {
								%>
					<tr>
						<td align="center"><%=pb.getPnum()%></td>
						<td align="center"><%=pb.getCodename()%></td>
						<td align="center"><%=pb.getPname()%></td>
						<td align="center"><a
							href="product_view.jsp?pnum=<%=pb.getPnum()%>"> <img alt="없음"
								src="<%=request.getContextPath()%>/images/<%=pb.getPimage()%>"
								width="40">
						</a></td>
						<td align="center"><%=pb.getPrice()%></td>
						<td align="center"><%=pb.getPcompany()%></td>
						<td align="center"><%=pb.getPqty()%></td>
					</tr>

					<%
								} //for
								} //else
								%>

				</table>
			</div>
		</div>
		<div class="p-3"></div>
	</article>
	<%@include file="bottom.jsp"%>
</body>
</html>