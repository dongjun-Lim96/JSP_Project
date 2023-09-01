<%@page import="mk.member.MemberBean"%>
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
<%
	String id = (String)session.getAttribute("sid");
	System.out.println(id);
	
	MemberDao mdao = MemberDao.getInstance();
	MemberBean mb = mdao.memberinfo(id);
	
%>
	<jsp:include page="/market_display/top.jsp"/>
	<h3 class="text-primary" align="center" style="padding: 10px;">내 정보</h3>
		<div align="right" class="card bg-light col-md-5"
			style="float: none; margin: auto;">
			<div class="card-body" align="center">
			<div >
				<svg xmlns="http://www.w3.org/2000/svg" width="300" height="300" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
				  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
				  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
				</svg>
			</div>
			
			<div align="center" style="padding-top: 40px;">
			<form action="member_update.jsp">
				<table class="table" style="text-align: center;">
					
					<tr>
						<th >아이디</th>
						<td ><%=mb.getId()%></td>
					</tr>
						
					<tr>	
						<th>이름</th>
						<td><%=mb.getName()%></td>
					</tr>
					
					<tr>
						<th>생일</th>
						<td><%=mb.getBirth()%></td>
					</tr>	
					
					<tr>
						<th>이메일</th>
						<td><%=mb.getEmail() %></td>
					</tr>
					
					<tr>
						<th >전화번호</th>
						<td><%=mb.getTel()%></td>
					</tr>
					
					<tr>
						<td colspan="4" align="center" height="40">
							<input type="submit" value="수정하기">
						</td>
						</tr>
					
						</table>
					</form>		
			</div>
	</div>
</div>
<div class="p-3"></div>
<jsp:include page="/market_display/bottom.jsp"/>	
</body>
</html>