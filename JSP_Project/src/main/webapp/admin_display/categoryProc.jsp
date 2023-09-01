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
	categoryDao cdao = categoryDao.getInstance();
	//CategoryBean cb = new CategoryBean();
%>

<jsp:useBean id="cb" class="mk.category.categoryBean"/>
<jsp:setProperty property="*" name="cb"/>

<%	
	String message = null;
	String url = null;
	
	int cnt = cdao.insertCategory(cb);  
	if(cnt != -1){
		message = "등록 성공";
		url = "category_list.jsp";
	}
	else{
		message = "등록 실패";
		url = "category_input.jsp";
	}
	
%> 

<script type="text/javascript">
	alert("<%= message %> "); 
	location.href= '<%= url %>'; 
</script>
</body>
</html>