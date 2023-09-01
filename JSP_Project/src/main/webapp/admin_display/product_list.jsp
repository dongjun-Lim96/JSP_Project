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
	<script type="text/javascript">
		function deleteCheck(pnum, pimage) {
			//alert(pnum+","+pimage);
			// 대화상자 :  alert confirm prompt
			var isDel = confirm("정말 삭제하시겠습니까?");
			//alert(isDel) // 확인:true 취소:false
			if (isDel) {
				location.href = "product_delete.jsp?pnum=" + pnum + "&pimage="
						+ pimage;
			}
		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<%@include file="top.jsp"%>
	<article>
	<%
	/*  */
	productDao pdao = productDao.getInstance();
	int pageSize = 10; 
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage-1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	//-----
	ArrayList<productBean> plists = null;
	int count = pdao.getAllProduct().size();
	if(count > 0) {
		plists = pdao.getProdArticles(startRow, endRow);
	}
	int number = count-(currentPage-1)*pageSize;
	/*  */
	%>

		<h3 class="text-primary" align="center" style="padding: 10px;">상품목록</h3>
		<div align="right" class="card bg-light col-md-8"
			style="float: none; margin: auto;">
			<div class="card-body" align="center">

				<table width="700" class="table table-hover">
					<tr>
						<th style="text-align: center;">번호</th>
						<th style="text-align: center;">상품코드</th>
						<th style="text-align: center;">상품명</th>
						<th style="text-align: center;">이미지</th>
						<th style="text-align: center;">가격</th>
						<th style="text-align: center;">제조사</th>
						<th style="text-align: center;">수량</th>
						<th style="text-align: center;">수정 | 삭제</th>
					</tr>

					<%
					//productDao dao = productDao.getInstance();
					//ArrayList<productBean> list = dao.getAllProduct();
					for(productBean pb : plists){
					if (plists.size() == 0) {
						out.println("<tr><td colspan=8 align='center'>등록된 상품이 없습니다.</td></tr>");
					} else {
					%>
					<tr>
						<td align="center"><%=pb.getPnum()%></td>
						<td align="center"><%=pb.getCodename()%></td>
						<td align="center"><%=pb.getPname()%></td>
						<td align="center">
						<a href="product_view.jsp?pnum=<%=pb.getPnum()%>"> 
							<%if(pb.getPqty() <= 0){ %>
								<img src="<%=request.getContextPath()%>/images/soldout.jpg" width="40">
							<%}else{%>
							<img src="<%=request.getContextPath()%>/images/<%=pb.getPimage()%>" width="40">
							<%}%>
						</a>
						</td>
						<td align="center"><%=pb.getPrice()%></td>
						<td align="center"><%=pb.getPcompany()%></td>
						<td align="right"><%=pb.getPqty()%></td>
						<td align="center"><a
							href="product_update.jsp?pnum=<%=pb.getPnum()%>">수정</a> | <a
							href="javascript:deleteCheck('<%=pb.getPnum()%>','<%=pb.getPimage()%>')">삭제</a>
						</td>
					</tr>
			
					<%
						} //for
					} //else
					if(count > 0){ // 23 / 5   => 4+1
						int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
					
						int pageBlock = 3;
						
						int startPage =  ((currentPage-1) / pageBlock * pageBlock)+1;
						int endPage = startPage + pageBlock - 1;
						
						if(pageCount < endPage){
							endPage = pageCount;
						}	
					%>
					
				</table>
				<ul class="pagination justify-content-center my-4">
		<%if(startPage > 3){ %>
		<li class="page-item"><a class="page-link"
			href="product_list.jsp?pageNum=<%=startPage-3%>">이전</a></li>
		<%
				}//if
				
				for(int i=startPage;i<=endPage;i++){
				%>
		<li class="page-item"><a class="page-link"
			href="product_list.jsp?pageNum=<%=i %>"><%=i %></a></li>
		<%
				}//for
				
				if(endPage < pageCount){
				%>
		<li class="page-item"><a class="page-link"
			href="product_list.jsp?pageNum=<%=startPage + 3%>">다음</a></li>
		<%			
				}
			}// if
		%>
	</ul>
			</div>
		</div>
		<div class="p-3"></div>
	</article>
	<%@include file="bottom.jsp"%>
</body>
</html>