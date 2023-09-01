<%@page import="mk.category.categoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mk.category.categoryDao"%>
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
<%
	String[] pspec = {"SALE","NEW","BEST"};
	categoryDao cdao = categoryDao.getInstance();
	ArrayList<categoryBean> lists = cdao.allCategory();
	/* 모든 th에 m2 class 추가해라 */
%>
	<%@include file="top.jsp" %>
	 <article>
    	<h3 class="text-primary" align="center" style="padding: 10px;">상품등록</h3>
    	
		<div align="right" class="card bg-light col-md-6"
			style="float: none; margin: auto;">
			<div class="card-body" align="center">
			
			
		<form action="productProc.jsp" method="post" enctype="multipart/form-data">			
		<table width="500" class="table table-striped">
			<tr>
				<th>카테고리</th>
				<td>
				<select name="codename">
					<%
					if(lists.size() == 0){
					%>
						<option value=""> 카테고리 없음</option>
					<%
					} else{
					
						for(categoryBean cate : lists){
						%>
							<option value="<%=cate.getCode()%>"><%=cate.getCname()%>[<%=cate.getCode()%>]</option>
						<%
						}//for
					} // else
					%>
				</select>
			</td>
			</tr>
			
			<tr>
				<th>상품명</th>
				<td><input type="text" name="pname" placeholder="이름"></td>
			</tr>
			
			<tr>
				<th>상품코드</th>
				<td><input type="text" name="pcode" placeholder="이름"></td>
			</tr>
			
			<tr>
				<th>제조회사</th>
				<td><input type="text" name="pcompany" placeholder="이름"></td>
			</tr>
			
			<tr>
				<th>상품이미지</th>
				<td>
					<input type="file" name="pimage"><br>
				</td>
			</tr>
			
			<tr>
				<th>상품 수량</th>
				<td><input type="text" name="pqty" maxlength="5" placeholder="10"></td>
			</tr>
			
			<tr>
				<th>상품 가격</th>
				<td><input type="text" name="price" placeholder="10000"></td>
			</tr>
			
			<tr>
				<th>상품 스펙</th>
				<td>
					<select name="pspec">
						<%
						for(String s : pspec){
						%>
							<option value="<%=s%>"><%=s%></option>
						<%
						}
						%>
					</select>
				</td>
			</tr>
			
			<tr>
				<th>상품 소개</th>
				<td>
					<textarea rows="4" cols="50" name="pcontents" style="resize: none;"></textarea>
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
		<div class="p-3"></div>
	</article>	
	<%@include file="bottom.jsp" %>
</body>
</html>