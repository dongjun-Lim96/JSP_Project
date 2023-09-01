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
	 <article>
    	<h3 class="text-primary" align="center" style="padding: 10px;">카테고리 등록</h3>
		<div align="right" class="card bg-light col-md-4"
			style="float: none; margin: auto;">
			<div class="card-body" align="center">
			
		<form action="categoryProc.jsp" method="post">			
		<table width="300">
			<tr>
				<th style="padding-bottom: 20px;"> <label for="code">카테고리 코드: </label> </th>
				<td style="padding-bottom: 20px;"> <input type="text" name="code" id="code"> </td>
			</tr>
			
			<tr>
				<th style="padding-bottom: 20px;"><label for="cname">카테고리 이름: </label></th>
				<td style="padding-bottom: 20px;"> <input type="text" name="cname" id="cname"> </td>
			</tr>
			
			<tr>
				<td colspan="2" align="center"> 
					<input type="submit" value="등록"> 
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