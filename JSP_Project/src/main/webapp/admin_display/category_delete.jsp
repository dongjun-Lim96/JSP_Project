<%@page import="mk.category.categoryDao"%>
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
    	request.setCharacterEncoding("UTF-8");
    
    	String cnum = request.getParameter("cnum");
    	System.out.println(cnum);
    	
    	categoryDao cdao = categoryDao.getInstance();
    	
    	int cnt = cdao.deleteCategory(cnum);
    	String result;
    	
    	if(cnt == 1){
    		result = "성공";
    	}else{
    		result = "실패";
    	}
    %>
    
    <script type="text/javascript">
		alert("<%=result%>");
		location.href="category_list.jsp";
	</script>
</body>
</html>