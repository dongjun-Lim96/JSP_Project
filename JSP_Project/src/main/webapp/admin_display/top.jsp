<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
<title>fresh market</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="<%=request.getContextPath()%>/Resources/js/scripts.js"></script>
 <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="<%=request.getContextPath()%>/Resources/css/styles.css" rel="stylesheet" />        
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="admin_main.jsp"> <font style="font-family: fantasy;">admin page</font> </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">카테고리</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                               	<li style="text-align: center;">카테고리 메뉴<hr class="dropdown-divider" /></li>
                                <li style="text-align: center;"><a class="dropdown-item" href="category_input.jsp">카테고리 등록</a></li>
                                <li style="text-align: center;"><a class="dropdown-item" href="category_list.jsp">카테고리 목록</a></li>
                            </ul>
                        </li>
                        
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">상품</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                               	<li style="text-align: center;">상품 메뉴<hr class="dropdown-divider" /></li>
                                <li style="text-align: center;"><a class="dropdown-item" href="product_input.jsp">상품 등록</a></li>
                                <li style="text-align: center;"><a class="dropdown-item" href="product_list.jsp">상품 목록</a></li>
                            </ul>
                        </li>
                        
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">이용자</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                               	<li style="text-align: center;">이용자 메뉴<hr class="dropdown-divider" /></li>
                                <li style="text-align: center;"><a class="dropdown-item" href="shopping_search.jsp">이용자 검색</a></li>
                                <li style="text-align: center;"><a class="dropdown-item" href="shopping_user.jsp">이용자 목록</a></li>
                                <li style="text-align: center;"><a class="dropdown-item" href="shopping_list.jsp">이용자 내역</a></li>
                            </ul>
                        </li>
                        <!-- <li class="nav-item"><a class="nav-link" href="shopping_list.jsp">이용자 내역</a></li> -->
                        <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/market_display/main.jsp">Home</a></li>
                    </ul>
                    
                    <%-- <form class="d-flex" action="market_cartList.jsp" method="post">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill"><%=session.getAttribute("cart")%></span>
                        </button>
                    </form> --%>
                     <div class="card bg-light">
					<div align="center" style="padding: 6px;">
                    <table>
                    	<tr>
                    		<td>
                    			<span class="badge bg-dark text-white ms-1 rounded-pill"><%=session.getAttribute("sid")%>님</span> 
                    		</td>
	                    	<td>
	                    		<a class="nav-link" href="<%=request.getContextPath()%>/login/logout.jsp">로그아웃</a>
	                    	</td>
                    	</tr>
                      </table>
                    </div>
				</div>
                </div>
            </div>
        </nav>
</body>