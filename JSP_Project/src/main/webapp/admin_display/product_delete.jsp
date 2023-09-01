<%@page import="java.io.File"%>
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
	<%

	productDao pdao = productDao.getInstance();
	String pnum = request.getParameter("pnum");
	String pimage = request.getParameter("pimage"); 
	
	String configFolder = config.getServletContext().getRealPath("/");
	String delPath = configFolder+"images/";
	System.out.println("delPath:" + delPath);
	
	File delFile = null;
	File dir = new File(delPath);
	if(pimage != null){
		delFile = new File(dir,pimage);
		if(delFile.exists()){ // 
			if(delFile.delete()){ // 
				
		%>
				<script type="text/javascript">
					alert("이미지 파일 삭제 성공");
				</script>
		<%
			}//if
		}//if
	}//if
	
	int cnt = pdao.deleteProduct(pnum);   
	String msg = "";
	if(cnt > 0){
		msg = "상품 삭제 성공했습니다.";
	}else{
		msg = "상품 삭제 실패했습니다.";
	}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href="product_list.jsp";
</script>
</body>
</html>