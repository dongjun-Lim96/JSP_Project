<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="mk.product.productBean"%>
<%@page import="mk.product.productDao"%>
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
	productDao pdao = productDao.getInstance();
	String pnum = request.getParameter("pnum");
	String codename = request.getParameter("codename");

	productBean pb = pdao.getProductByPnum(pnum); 
	ArrayList<productBean> list = pdao.getProductByCategory(codename);
	
	String imgPath = request.getContextPath()+"/images/"+pb.getPimage();
	DecimalFormat df = new DecimalFormat("###,###"); 
%>
	<%@include file="top.jsp"%>
	<%
	application.setAttribute("flag", true); 
%>
	<script type="text/javascript">
	function goCart(pnum){
		//alert(pnum);
		
		oqty = document.f.oqty.value;
		
		if (oqty > <%=pb.getPqty()%>) {
			alert('주문수량이 재고보다 작아야 합니다.');
			location.href="main.jsp";
			return;
		}
		
		
		if(oqty < 1){
			//alert(oqty);
			alert('주문수량은 1보다 크거나 같아야 합니다.');
			location.href="main.jsp";
			return;
		}
		location.href="market_cartAdd.jsp?pnum="+pnum+"&oqty="+oqty;
	}//goCart
	
	function goOrder(pnum){ 
		
oqty = document.f.oqty.value;
		
		if (oqty > <%=pb.getPqty()%>) {
			alert('주문수량이 재고보다 작아야 합니다.');
			location.href="main.jsp";
			return;
		}
		
		if(oqty < 1){
			alert('주문수량은 1보다 크거나 같아야 합니다.');
			location.href="main.jsp";
			return;
		}
		
		document.f.action="market_order.jsp?pnum="+pnum; // pnum, oqty 넘어간다.
		document.f.submit();
		
	}//goOrder()
</script>

	<section class="py-5">
	<form name="f" method="post">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
				<div class="col-md-6">
					<img class="card-img-top mb-5 mb-md-0" src="<%=imgPath%>" alt="..."
						height="400" />
				</div>
				<div class="col-md-6">
					<div class="small mb-1">
						상품번호
						<%=pb.getPnum()%></div>
					<h1 class="display-5 fw-bolder"><%=pb.getPname()%></h1>
					<div class="fs-5">
						<span>재고: <%=pb.getPqty()%></span>
					</div>
					<div class="fs-5 mb-5">
						<span class="text-decoration-line-through"><%=pb.getPrice()*1.2%></span>
						<span><%=pb.getPrice()%></span>
					</div>
					<p class="lead"><%=pb.getPcontents()%></p>
					<div class="d-flex">
						<input class="form-control text-center me-3" id="inputQuantity"
							type="num" name="oqty" value="1" style="max-width: 3rem" />
						
						<button class="btn btn-outline-dark flex-shrink-0" type="button" onclick="goCart('<%=pnum%>')">
							<i class="bi-cart-fill me-1"></i> Add to cart
						</button>
						<div>&nbsp</div> 
						<button class="btn btn-outline-dark flex-shrink-0" type="button" onclick="goOrder('<%=pnum%>')">
							<i class="bi-cart-fill me-1"></i> Buy
						</button>
						
					</div>
				</div>
			</div>
		</div>
	</form>	
	</section>
	<!-- Related items section-->
	<section class="py-5 bg-light">
		<div class="container px-4 px-lg-5 mt-5">
			<h2 class="fw-bolder mb-4">Related products</h2>
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

				<%
                	int cnt = 0;
                   for(productBean pb2 : list){
       				String imgPath2 = request.getContextPath()+"/images/"+pb2.getPimage();
       				cnt++;
       			%>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<a
							href="market_prodView.jsp?pnum=<%=pb2.getPnum()%>&codename=<%=pb2.getCodename()%>">
							<img class="card-img-top" src="<%=imgPath2%>" alt="..."
							width="450" height="200">
						</a>
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder"><%=pb2.getPname()%></h5>
								<!-- Product price-->
								<%=pb2.getPqty()%>개 남음 -
								<%=df.format(pb2.getPrice())%>원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto"
									href="market_prodView.jsp?pnum=<%=pb2.getPnum()%>&codename=<%=pb.getCodename()%>">View options</a>
							</div>
						</div>
					</div>
				</div>
				<%
			       			if(cnt>=3){
			       				break;
			       			}
			       		}	
			       	%>

			</div>
		</div>
	</section>

	<%@include file="bottom.jsp"%>
</body>
</html>