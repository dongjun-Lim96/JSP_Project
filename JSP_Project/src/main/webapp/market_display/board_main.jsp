<%@page import="mk.board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mk.board.BoardDao"%>
<%@page import="java.text.SimpleDateFormat"%>
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
</head>
<body>
	<jsp:include page="/market_display/top.jsp" />
	<jsp:useBean id="mkCart" class="mk.cart.CartBean" scope="session" />
	<%      
		int pageSize = 10; // 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
		String pageNum = request.getParameter("pageNum"); //pageNum:내가 선택한 페이지번호
		System.out.println("pageNum : " + pageNum);
		if(pageNum == null){
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1) * pageSize + 1;
		int endRow = currentPage * pageSize;	
		
		BoardDao bdao=BoardDao.getInstance();
		ArrayList<BoardBean> boardlists = null; 
		int count = bdao.getArticleCount(); 
		if(count > 0) {
			boardlists = bdao.getArticles(startRow,endRow);  
		}
		int number = count-(currentPage-1)*pageSize;
	%>

	<h3 class="text-primary" align="center" style="padding: 10px;">글목록</h3>
	
	<div align="right" class="card bg-light col-md-8" style="float: none; margin: auto;">
		<div class="card-body" align="center">

			<div align="right"><a href="board_write.jsp">글쓰기</a></div>

			<%
		if(count == 0){
	%>
			<table align="center">
				<tr>
					<td align="center">게시판에 저장된 글이 없습니다.</td>
				</tr>
			</table>
			<%		
		}else{
	%>
			<table class="table table-striped">
				<tr height="30" align="center">
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회</th>
					<th>IP</th>
				</tr>
				<%for(BoardBean bb : boardlists){ %>
				<tr height="30" align="center">
					<td><%=number-- %></td>
					<td align="center">
						<%
								int wid = 20;
								if(bb.getRe_level() > 0){ // 답글, 답답,답답답
									wid = 20 * bb.getRe_level(); // 1:20, 2:40, 3:60
							%> 
							<img src="<%=request.getContextPath()%>/images/level.gif" width="<%=wid %>" height="15"> 
							<img src="<%=request.getContextPath()%>/images/re.gif"> 
							<%
								}
							%>
							<a href="board_content.jsp?num=<%=bb.getNum() %>&pageNum=<%=pageNum%>"><%=bb.getSubject()%></a>
						<%
								if(bb.getReadcount()>=10){
							%> <img src="<%=request.getContextPath()%>/images/hot.gif"
						height="15"> <%		
								}
							%> <!-- content.jsp?num=20&pageNum=2 -->
					</td>
					<td><%=bb.getWriter() %></td>
					<td><%=sdf.format(bb.getReg_date()) %></td>
					<td><%=bb.getReadcount() %></td>
					<td><%=bb.getIp() %></td>
				</tr>
				<%}//for %>
			</table>
			<% 
		}//else
			
		// 페이지 설정
		if(count > 0){ // 23 / 5   => 4+1
			int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
		
			int pageBlock = 3;
			
			int startPage =  ((currentPage-1) / pageBlock * pageBlock)+1;
			int endPage = startPage + pageBlock - 1;
			
			if(pageCount < endPage){
				endPage = pageCount;
			}
			
			
		%>
		
			<ul class="pagination justify-content-center my-4 ">
			<%if(startPage > 3){ %>
				  <li class="page-item">
				  	<a class="page-link" href="board_main.jsp?pageNum=<%=startPage-3%>">이전</a>
				  </li>		
			<%
			}//if
			
			for(int i=startPage;i<=endPage;i++){
			%>
			<li class="page-item">
				<a class="page-link" href="board_main.jsp?pageNum=<%=i %>"><%=i %></a>
			</li>
			<%
			}//for
			
			if(endPage < pageCount){
			%>
			<li class="page-item">
				<a class="page-link" href="board_main.jsp?pageNum=<%=startPage + 3%>">다음</a>
			</li>
			<%			
			}
		}// if
	%>
		 </ul>
		</div>
	</div>
	<div class="p-3"></div>
	<jsp:include page="/market_display/bottom.jsp" />
</body>
</html>