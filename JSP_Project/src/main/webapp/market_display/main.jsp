<%@page import="mk.product.productBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="mk.product.productDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath()%>/Resources/js/scripts.js"></script>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<link href="<%=request.getContextPath()%>/Resources/css/styles.css"
	rel="stylesheet" />

<title>Insert title here</title>

<!-- <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script> -->


</head>
<body>
	<%@include file="top.jsp"%>
	<header>
		<div id="carouselExampleControls" class="carousel slide"
			data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="<%=request.getContextPath()%>/images/fishset.jpg"
						class="d-block w-100" alt="..." style="height: 300px;">
				</div>
				<div class="carousel-item">
					<img src="<%=request.getContextPath()%>/images/meatset.jpg"
						class="d-block w-100" alt="..." style="height: 300px;">
				</div>
				<div class="carousel-item">
					<img src="<%=request.getContextPath()%>/images/fruitset.jpg"
						class="d-block w-100" alt="..." style="height: 300px;">
				</div>
				<div class="carousel-item">
					<img src="<%=request.getContextPath()%>/images/nutsset.jpg"
						class="d-block w-100" alt="..." style="height: 300px;">
				</div>
				<div class="carousel-item">
					<img src="<%=request.getContextPath()%>/images/oilset.jpg"
						class="d-block w-100" alt="..." style="height: 300px;">
				</div>
				<div class="carousel-item">
					<img src="<%=request.getContextPath()%>/images/healthset.jpg"
						class="d-block w-100" alt="..." style="height: 300px;">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleControls" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleControls" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</header>

	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

				<%	
	DecimalFormat df = new DecimalFormat("###,###"); //1,234  123,456,789,123
	productDao pdao = productDao.getInstance();
	/*  */
	int pageSize = 8; 
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage-1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	
	/*  */
	
	
	ArrayList<productBean> plists = null;
	int count = pdao.getAllProduct().size();
	if(count > 0) {
		plists = pdao.getProdArticles(startRow, endRow);
	}
	int number = count-(currentPage-1)*pageSize;
		
		
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
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder"><%=pb.getPname()%></h5>
								<!-- Product price-->
								<%=pb.getPqty()%>개 남음 -
								<%=df.format(pb.getPrice())%>원
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
							</div>
						</div>
					</div>
				</div>
				<%	
				}//for
			if(count > 0){ // 23 / 5   => 4+1
				int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
			
				int pageBlock = 3;
				
				int startPage =  ((currentPage-1) / pageBlock * pageBlock)+1;
				int endPage = startPage + pageBlock - 1;
				
				if(pageCount < endPage){
					endPage = pageCount;
				}
				
				
			%>
			</div>
		</div>
	</section>
	<ul class="pagination justify-content-center my-4">
		<%if(startPage > 3){ %>
		<li class="page-item"><a class="page-link"
			href="main.jsp?pageNum=<%=startPage-3%>">이전</a></li>
		<%
				}//if
				
				for(int i=startPage;i<=endPage;i++){
				%>
		<li class="page-item"><a class="page-link"
			href="main.jsp?pageNum=<%=i %>"><%=i %></a></li>
		<%
				}//for
				
				if(endPage < pageCount){
				%>
		<li class="page-item"><a class="page-link"
			href="main.jsp?pageNum=<%=startPage + 3%>">다음</a></li>
		<%			
				}
			}// if
		%>
	</ul>

	<%@include file="bottom.jsp"%>
</body>
</html>