<!doctype html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="ko-kr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <!-- Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/kfonts2.css" rel="stylesheet">
    <style>
        body { padding-top: 70px; }
		
		@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

	footer {
		font-family: 'Nanum Gothic', sans-serif;
		text-align: center;
	}
	
	li{
		text-align: center;
	}
	
	footer {
		border: 1px dotted blue;
	}
    </style>
  </head>
<body>
<div class="container">  
    <nav class="navbar navbar-default navbar-fixed-top " role="navigation">
    
   
      <div class="container">  
     
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="admin_main.jsp"> 관리자 페이지 </a>
      </div>
     
      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse navbar-ex1-collapse">
        <ul class="nav navbar-nav">
          <li><a href="category_input.jsp">카테고리</a></li>
          <li><a href="product_input.jsp">상품</a></li>
          <li><a href="shopping_list.jsp">이용자 내역</a></li>
          <li><a href="<%=request.getContextPath()%>/market_display/main.jsp">home</a></li>
        </ul>
        <form class="navbar-form navbar-right" role="search">
          <div class="form-group">
            <input type="text" class="form-control" placeholder="검색">
          </div>
          <button type="submit" class="btn btn-default">Submit</button>
        </form>

      </div>
      </div>
    </nav>
   
			

		