<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Success</title>
<link rel="stylesheet" type="text/css" media="screen" href="<%=basePath %>css/bootstrap.min.css">
<style>body{padding-top: 20px}</style>
</head>
<body>
<h1 class="text-center">${success }</h1>
<br/><br/>

<a href="<%=path %>/customer/customer_content" class="btn btn-default btn-lg" style="margin: 0 auto; display:block; width: 300px">Return to main page</a>

</body>
</html>