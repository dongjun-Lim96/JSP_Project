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
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<!-- product_update.jsp(입력, 기존이미지:pimageold) => productUpdateProc.jsp -->
 

<%
 int maxSize = 1024*1024*5;
 String configFolder = config.getServletContext().getRealPath("/images/"); 

 MultipartRequest mr = new MultipartRequest(request, 
		 									configFolder, 
		 									maxSize, 
		 									"UTF-8",
		 									new DefaultFileRenamePolicy());
 
 String pname = mr.getParameter("pname");
 out.println("pname: "+pname+"<br>");
 
 String codename = mr.getParameter("codename");
 out.println("codename: "+codename+"<br>");
 
 String pnum = mr.getParameter("pnum");
 out.println("pnum: "+pnum+"<br>");
 
 String pimageold = mr.getParameter("pimageold");//기존이미지.jpg
 String pimage = mr.getFilesystemName("pimage"); // 새이미지
 
 String img = null;
 if(pimageold == null){
	 if(pimage != null){ // 기존이미지X, 새이미지O
		 img = pimage;
	 }
 }else if(pimageold != null){
	 if(pimage == null){ // 기존이미지 o, 새이미지 x
		 img = pimageold;
	 
	 }else{ // 기존 이미지 O, 새로운 이미지 O
		img = pimage;
	 	
		File delFile = new File(configFolder,pimageold);
		delFile.delete();
	 }
 }
 
 	productDao pdao = productDao.getInstance();
	int cnt = pdao.updateProduct(mr, img); 
	if(cnt==1){
		%>
			<script>
				alert('수정성공');
				location.href="product_list.jsp";
			</script>	
		<%
	}else{
	%>
		<script>
			alert('수정실패');
			history.go(-1); 
		</script>	
	<%
	}
%>
</body>
</html>