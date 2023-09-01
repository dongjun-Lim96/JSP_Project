<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/kfonts2.css" rel="stylesheet">
    
    <script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="../js/bootstrap.min.js"></script>
    
	<style type="text/css">
	body{
		text-align: center;
	}
	
	table{
		margin: auto;
	}

</style>
	
    <!-- Bootstrap CSS -->
   <!--  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.rtl.min.css" integrity="sha384-T5m5WERuXcjgzF8DAb7tRkByEZQGcpraRTinjpywg37AO96WoYN9+hrhDVoM6CaT" crossorigin="anonymous"> -->
	
	<!-- <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script> -->

    
    <font size="6">마켓</font><br>
    <div align="right">
    <a href="<%=request.getContextPath()%>/main.jsp">회원가입</a>
    <a href="<%=request.getContextPath()%>/main.jsp">로그인</a>
    <a href="<%=request.getContextPath()%>/logout.jsp">로그아웃</a>
    </div>
    
    <br><br>
    <table border="0" width="800" height="400">
    	<tr height="40">
    		<td align="center" class="dropdown">
    			 <button data-toggle="dropdown" class="btn btn-default btn-primary">카테고리</button>
    			 <ul class="dropdown-menu" role="menu">
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="#">메뉴 1</a></li>
					<li role="presentation" class="disabled"><a role="menuitem"
						tabindex="-1" href="#">메뉴 2</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="#">메뉴 3</a></li>
				</ul>
    		</td>
    		<td align="center">
    			<a href="">신상품</a>
    		</td>
    		<td align="center">
    			<a href="">best상품</a>
    		</td>
    		<td align="center">
    			<a href="">행사 상품</a>
    		</td>
    		<td align="center">
    			<a href="">브랜드몰</a>
    		</td>
    		<td align="center">
    			<a href="">브랜드몰</a>
    		</td>
    	</tr>
    	
    	<tr height="300">