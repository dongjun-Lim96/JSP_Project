<%@page import="mk.product.productBean"%>
<%@page import="mk.product.productDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String code = request.getParameter("code");
		String cname = request.getParameter("cname");
		/* out.println(code + "/" + cname); */
		
		DecimalFormat df = new DecimalFormat("###,###"); 
		productDao pdao = productDao.getInstance();
		
		ArrayList<productBean> plists = pdao.getProductByPspec("SALE");	
	%>
	<%@include file="top.jsp"%>
	<h3 align="center" style="margin-top: 20px;">행사상품</h3>
	<hr> 

	<section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
	<%
		
		if(plists.size()==0){
		%>
			<div align="center"><b>상품 준비중 입니다.</b></div>
		<%	
		}else{
			for(productBean pb : plists){
				String imgPath = request.getContextPath()+"/images/"+pb.getPimage();
	%>
				<div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                             <%if(pb.getPqty() <= 0){ %>
								<img src="<%=request.getContextPath()%>/images/soldout.jpg" class="card-img-top" width="450" height="200">
							<%}else{%>
								<a
									href="market_prodView.jsp?pnum=<%=pb.getPnum()%>&codename=<%=pb.getCodename()%>">
									<img class="card-img-top" src="<%=imgPath%>" alt="..."
									width="450" height="200">
								</a>
							<%}%>
                           <%--  <a href="market_prodView.jsp?pnum=<%=pb.getPnum()%>&codename=<%=pb.getCodename()%>">
                            	<img class="card-img-top" src="<%=imgPath%>" alt="..."  width="450" height="200">
                            </a> --%>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder"><%=pb.getPname()%></h5>
                                    <!-- Product price-->
                                    <%=pb.getPqty()%>개 남음 - <%=df.format(pb.getPrice())%>원
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                <%if(pb.getPqty() <= 0){ %>
									<a class="btn btn-outline-dark mt-auto"
										href="#" >View
										options</a>
								<%}else{%>
									<a class="btn btn-outline-dark mt-auto"
										href="market_prodView.jsp?pnum=<%=pb.getPnum()%>&codename=<%=pb.getCodename()%>">View
										options</a>
								<%}%>
                                <%-- <a class="btn btn-outline-dark mt-auto" href="market_prodView.jsp?pnum=<%=pb.getPnum()%>&codename=<%=pb.getCodename()%>">View options</a> --%>
                                </div>
                            </div>
                        </div>
                    </div>
	<%
		}	
	}
	%>
	    </div>
            </div>
        </section>
	
	<%@include file="bottom.jsp"%>
</body>
</html>