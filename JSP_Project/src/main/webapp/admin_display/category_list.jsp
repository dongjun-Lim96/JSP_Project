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
	request.setCharacterEncoding("UTF-8");
	categoryDao cdao = categoryDao.getInstance();
	ArrayList<categoryBean> lists = cdao.allCategory();
	
%>
	<%@include file="top.jsp" %>
	 <article>
    	<h3 class="text-primary" align="center" style="padding: 10px;">카테고리 목록</h3>
		<div align="right" class="card bg-light col-md-8"
			style="float: none; margin: auto;">
			<div class="card-body" align="center">
					
		<form action="categoryProc.jsp" method="post">			
		<table width="500" class="table table-hover">
			<tr>
				<th style="text-align: center;">번호</th>
    			<th style="text-align: center;">카테고리 코드</th>
    			<th style="text-align: center;">카테고리 명</th>
    			<th style="text-align: center;">삭제</th>
			</tr>
			<%
    			if(lists.size() == 0){
    				out.println("<tr><td colspan=4 align='center'>등록된 카테고리가 없습니다. </td></tr>");
    			}
    			for(categoryBean cb : lists){ 
    			%>
	    		<tr>
	    			<td align="center"><%=cb.getCnum() %></td>
	    			<td align="center"><%=cb.getCode() %></td>
	  				<td align="center"><%=cb.getCname() %></td>
	  				<td align="center"><a href="category_delete.jsp?cnum=<%=cb.getCnum()%>">삭제</a></td>
    			</tr>
    			<%}%>
		</table>
		</form>
				</div>
			</div>
			<div class="p-3"></div>
	</article>	
	<%@include file="bottom.jsp" %>
</body>
</html>