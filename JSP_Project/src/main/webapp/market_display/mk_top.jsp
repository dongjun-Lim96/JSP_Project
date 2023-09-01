<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>마켓</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <style>
     p { margin:20px 0px; }
      
    .logo{
      	border-radius: 30%;
     }
     .input{
     	border-radius: 10px;
     }
    body{
		text-align: center;
	}
		
	.table{
		margin: auto;
	}
    .right{
		float : right;
	} 
      
    </style>
  </head>
  <body>
    <div class="container">
      <div class="row">
        <div class="col">
          <a><img alt="" src="<%=request.getContextPath()%>/images/supermarket.png" width="150" height="80" class="logo"></a>
		<br><br>         
          <table border="0" width="900" height="400">
          <!-- <tr height="40" align="center"> -->
          <tr class="nav nav-tabs space table" >
            <td class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">카테고리</a>
              <div class="dropdown-menu">
                <a class="dropdown-item" href="#">수산</a>
                <a class="dropdown-item" href="#">육류</a>
                <a class="dropdown-item" href="#">채소</a>
              </div>
            </td>
            <td class="nav-item">
              <a class="nav-link" href="#">신상품</a>
            </td>
            <td class="nav-item">
              <a class="nav-link" href="#">best상품</a>
            </td>
            <td class="nav-item">
              <a class="nav-link " href="#">행사 상품</a>
            </td>
            <td class="nav-item">
              <a class="nav-link " href="#">브랜드몰</a>
            </td>
            <td class="nav-item" >
              <a class="nav-link " href="#">로그인</a>
            </td>
            <td class="nav-item" >
              <a class="nav-link " href="#">회원가입</a>
            </td>
            <td class="nav-item">
            
            </td>
          </tr>
        </div>
      </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
 	<tr height="300">
  </body>
</html>
	