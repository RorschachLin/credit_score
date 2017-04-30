<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Personal Details</title>
<link rel="stylesheet" type="text/css" media="screen" href="<%=basePath %>css/bootstrap.min.css">
<style>body{padding-top: 20px}</style>
</head>
<body>
<a href="<%=path %>/customer/to_password" class="btn btn-primary btn-lg">Change Password</a>
<br/><br/>
<c:if test="${add == 0}"><h3>Your address is not valid, you can enter the address by clicking <a href="<%=path%>/customer/to_address" class="btn btn-primary btn-default">here</a></h3></c:if>
<c:if test="${add == 1}">
	<a href="<%=path%>/customer/to_edit" class="btn btn-primary btn-lg">Edit your profile</a>
	<h3>Address One: ${addressOne }</h3>
	<h3>Address Two: ${addressTwo }</h3>
	<h3>Post code: ${postcode }</h3>
	<h3>City: ${city }</h3>
	<h3>County: ${county }</h3>
	<h3>Country: ${country }</h3>
	<a href="<%=path%>/customer/to_edit" class="btn btn-primary btn-lg">Edit your profile</a>

</c:if>
	<h3>Email: ${email }</h3>
	<h3>Gender: ${gender }</h3>
	<h3>FirstName: ${firstName }</h3>
	<h3>LastName: ${lastName }</h3>
	<h3>MobileNumber: ${mobileNumber }</h3>
	<h3>Birthday: ${birthday }</h3>
	<h3>Nationality: ${nationality }</h3>
	<h3>Intro: ${intro }</h3>
</body>
</html>