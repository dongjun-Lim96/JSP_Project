<%@page import="mk.member.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mk.member.MemberDao"%>
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
		request.setCharacterEncoding("UTF-8");
		MemberDao mdao = MemberDao.getInstance();
		ArrayList<MemberBean> lists = null;
		String name = request.getParameter("name");
		System.out.println(name);
		if(name!=null){
			 lists = mdao.searchName(name);
		}
	%>
	
	<h3 class="text-primary" align="center" style="padding: 10px;">이용자 검색</h3>
	<div align="right" class="card bg-light col-md-8" style="float: none; margin: auto;">
		<div class="card-body" align="center">
			<table class="table table-striped">
				<tr>
				<td colspan="7" align="center"> 
					<form action="shopping_search.jsp" method="post">
						조회할 회원 이름 입력 : 
						<input type="text" name="name"> 
						<input type="submit" value="조회">
					</form>
				</td>
				</tr>
				
				<tr>
					<th style="text-align: center;">번호</th>
					<th style="text-align: center;">이름</th>
					<th style="text-align: center;">아이디</th>
					<th style="text-align: center;">패스워드</th>
					<th style="text-align: center;">생일</th>
					<th style="text-align: center;">이메일</th>
					<th style="text-align: center;">전화번호</th>
				</tr>
					
				<%
					if(lists != null){
						for(MemberBean mb : lists){
				%>
						<tr>
							<td align="center"><%=mb.getNo()%></td>
							<td align="center"><%=mb.getName() %></td>
							<td align="center"><%=mb.getId()%></td>
							<td align="center"><%=mb.getPassword() %></td>
							<td align="center"><%=mb.getBirth()%></td>
							<td align="center"><%=mb.getEmail()%></td>
							<td align="center"><%=mb.getTel()%></td>
						</tr>
				<%		
						}
					}
				%>
				
			</table>
		</div>
	</div>
	<div class="p-3"></div>
	<%@include file="bottom.jsp" %>
</body>
</html>