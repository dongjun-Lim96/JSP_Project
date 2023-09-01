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
</head>
<body>
	<%
	String pnum = request.getParameter("pnum");
	String[] pspec = {"SALE","NEW","BEST"};
	productDao pdao = productDao.getInstance();
	productBean pb = pdao.getProductByPnum(pnum);
	/* 모든 th에 m2 class 추가해라 */
%>
	<%@include file="admin_top.jsp" %>
	 <article>
    	<div class="row">
			<div class="col-md-2">
				<table align="center">
					<tr> <td style="padding-bottom: 10px; border-bottom: 1px solid;">상품 메뉴</td> </tr>
					<tr> <td style="padding-bottom: 10px;"><a href="product_input.jsp">상품 등록</a></td> </tr>
					<tr> <td style="padding-bottom: 10px;"><a href="product_list.jsp">상품 목록</a></td> </tr>
				</table>
			</div>
			
			<div class="col-md-9  cont">
				<div class="col-md-11" align="center">
					<h3 class="text-primary">상품 수정</h3>
		<form action="productUpdateProc.jsp" method="post" enctype="multipart/form-data">			
		<table width="500" class="table table-striped">
			<tr>
				<th>카테고리</th>
				<td>
					<input type="text" name="codename" value="<%=pb.getCodename()%>" disabled>
				</td>
			</tr>
			
			<tr>
				<th>상품번호</th>
				<td>
				<%=pnum%> <!-- input에 쓰지 않으면 넘어가지 않는다. -->
				<input type="hidden" name="pnum" value="<%=pnum%>">
				</td> 
			</tr>
			
			<tr>
				<th>상품명</th>
				<td><input type="text" name="pname" value="<%=pb.getPname()%>" placeholder="이름"></td>
			</tr>
			
			<tr>
				<th>제조회사</th>
				<td><input type="text" name="pcompany" value="<%=pb.getPcompany()%>" placeholder="이름"></td>
			</tr>
			
			<tr>
				<th>상품이미지</th>
				<td>
					<img alt="없음" src="<%=request.getContextPath()%>/images/<%=pb.getPimage()%>" width="100">
					<input type="file" name="pimage"><br>
					<input type="text" name="pimageold" value="<%=pb.getPimage()%>">
				</td>
			</tr>
			
			<tr>
				<th>상품 수량</th>
				<td><input type="text" name="pqty" value="<%=pb.getPqty()%>" maxlength="5" placeholder="10"></td>
			</tr>
			
			<tr>
				<th>상품 가격</th>
				<td><input type="text" name="price" value="<%=pb.getPrice()%>" placeholder="10000"></td>
			</tr>
			
			<tr>
				<th>상품 스펙</th>
				<td>
					<select name="pspec">
						<%
						for(String s : pspec){
						%>
							<option value="<%=s%>"<%if(pb.getPspec().equals(s)){%>selected<%} %>><%=s%></option>
						<%
						}
						%>
					</select>
				</td>
			</tr>
			
			<tr>
				<th>상품 소개</th>
				<td>
					<textarea rows="4" cols="50" name="pcontents" style="resize: none;"><%=pb.getPcontents()%></textarea>
				</td>
			</tr>
			
			<tr>
			<td colspan="2" align="center">
				<input type="submit" value="상품 등록">
				<input type="reset" value="취소">
			</td>
		</tr>
		</table>
		</form>
				</div>
			</div>
		</div>
	<%@include file="admin_bottom.jsp" %>
</body>
</html>