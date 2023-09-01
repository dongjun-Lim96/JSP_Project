<%@page import="mk.category.categoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mk.category.categoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<%
	categoryDao cdao = categoryDao.getInstance(); 
	ArrayList<categoryBean> lists = cdao.allCategory();
	String sid = (String)session.getAttribute("sid"); 
%> 
<nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="<%=request.getContextPath()%>/market_display/main.jsp"> <font style="font-family: fantasy;"> food market</font> </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <!-- <li class="nav-item"><a class="nav-link active" aria-current="page" href="market_newList.jsp">신상품</a></li> -->
                        <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/market_display/market_newList.jsp">신상품</a></li>
                        <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/market_display/market_bestList.jsp">인기상품</a></li>
                        <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/market_display/market_saleList.jsp">행사상품</a></li>
                        <!-- <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">상품</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="market_newList.jsp">신상품</a></li>
                                <li><a class="dropdown-item" href="market_bestList.jsp">인기상품</a></li>
                                <li><a class="dropdown-item" href="market_saleList.jsp">행사상품</a></li>
                            </ul>
                        </li> -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">카테고리</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <%for(categoryBean cb : lists) {%>
                                	<li><a class="dropdown-item" href="<%=request.getContextPath()%>/market_display/market_cgList.jsp?code=<%=cb.getCode()%>&cname=<%=cb.getCname()%>"><%=cb.getCname()%>[<%=cb.getCode()%>]</a></li>
                                <%}%>
                                
                               <!--  <li><hr class="dropdown-divider" /></li> -->
                                <!-- <li><a class="dropdown-item" href="#!">수산</a></li>
                                <li><a class="dropdown-item" href="#!">채소</a></li>
                                <li><a class="dropdown-item" href="#!">과일</a></li>
                                <li><a class="dropdown-item" href="#!">견과</a></li>
                                <li><a class="dropdown-item" href="#!">건강</a></li> -->
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/market_display/board_main.jsp">커뮤니티</a></li>
                       <%--  <%if(session.getAttribute("login")=="logon") {%>
                        	<%if(session.getAttribute("sid").equals("admin")){ %>
                        	<li class="nav-item" >
                        		<a class="nav-link" href="<%=request.getContextPath()%>/admin_display/admin_main.jsp"> <font size="1">관리자홈</font></a>
                        	</li>
                        	<%}%>
                        	<li class="nav-item" style="padding-top: 7px;">
                        		<span class="badge bg-dark text-white ms-1 rounded-pill"><%=session.getAttribute("sid")%>님</span> 
                        	</li>
                        	<li class="nav-item" >
                        		<a class="nav-link" href="<%=request.getContextPath()%>/login/logout.jsp">로그아웃</a>
                        	</li>
                         <%}else{ %>
                       	 	<li class="nav-item" ><a class="nav-link" href="<%=request.getContextPath()%>/login/login_form.jsp">로그인</a></li>
                         <%}%> --%>
                    </ul>
                    
                    <form class="d-flex" action="market_cartList.jsp" method="post">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill"><%=session.getAttribute("cart")%></span>
                        </button>
                    </form>
                    
                    <div>&nbsp</div>
                    <div class="card bg-light">
					<div align="center" style="padding: 6px;">
                    <table>
                    	<tr>
                    		<%if(session.getAttribute("login")=="logon") {%>
                    			<%if(session.getAttribute("sid").equals("admin")){ %>
		                    		<td>
		                    			<a class="nav-link" href="<%=request.getContextPath()%>/admin_display/admin_main.jsp"> <font size="1">관리자홈</font></a>
		                    		</td>
                    			<%}else if(!session.getAttribute("sid").equals("admin")){%>
                    				<td>
		                    			<%-- <a class="nav-link" href="<%=request.getContextPath()%>/admin_display/admin_main.jsp"> <font size="1">마이페이지</font></a> --%>
		                    			<a class="nav-link" href="<%=request.getContextPath()%>/login/mypage.jsp"><i class="bi bi-person-circle me-1"></i></a>
		                    		</td>
                    			<%}%>
                    				<td>
                    					<span class="badge bg-dark text-white ms-1 rounded-pill"><%=session.getAttribute("sid")%>님</span> 
                    				</td>
                    				<td>
                    					<a class="nav-link" href="<%=request.getContextPath()%>/login/logout.jsp">로그아웃</a>
                    				</td>
                    			<%}else{ %>
                    				<td>
                    					<a class="nav-link" href="<%=request.getContextPath()%>/login/login_form.jsp">로그인</a>
                    				</td>
	                         <%}%>	
                    	</tr>
                    </table>
                    </div>
				</div>
                </div>
            </div>
        </nav>
</body>
</html>