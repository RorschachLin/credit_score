<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<frameset rows="50,*" frameborder="0" border="0" framespacing="0">
	<frame name="topNav" src="<%=path %>/header">
	<frameset cols="200,*" frameborder="0" border="0" framespacing="0">
		<frame name="menu" src="<%=path %>/left_panel" marginheight="0"
			marginwidth="0" scrolling="auto" noresize>
		<frame name="content" src="<%=path %>/user/bank_content" marginheight="0"
			marginwidth="0" scrolling="auto" noresize>

		
		<noframes>
			<p>This section (everything between the 'noframes' tags) will
				only be displayed if the users' browser doesn't support frames. You
				can provide a link to a non-frames version of the website here. Feel
				free to use HTML tags within this section.</p>
		</noframes>

	</frameset>
</frameset>
</html>