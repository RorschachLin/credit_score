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
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" media="screen" href="<%=basePath %>css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=basePath %>css/password.css">
	
	
	
</head>
<body>
<div class="container">

      <form class="form-signin" id="pform" action="<%=path %>/customer/password">
        <h2 class="form-signin-heading">Change Password</h2>
        <label for="inputPassword" class="sr-only">New Password</label>
        <input type="password" name="password" id="password" class="form-control" placeholder="New Password" required autofocus>
        <label for="inputPassword" class="sr-only">Confirm Password</label>
        <input type="password" name="confirmPassword" class="form-control" placeholder="Confirm Password" required>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
      </form>

</div> <!-- /container -->


	<!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
		<script src="js/plugin/pace/pace.min.js"></script>

	    <!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
	    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
		<script> if (!window.jQuery) { document.write('<%=basePath %><script src="js/libs/jquery-2.1.1.min.js"><\/script>');} </script>

	    
		<!-- IMPORTANT: APP CONFIG -->
		<script src="js/app.config.js"></script>

		<!-- JS TOUCH : include this plugin for mobile drag / drop touch events 		
		<script src="js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> -->

		<!-- BOOTSTRAP JS -->		
		<script src="<%=basePath %>js/bootstrap/bootstrap.min.js"></script>

		<!-- JQUERY VALIDATE -->
		<script src="<%=basePath %>js/plugin/jquery-validate/jquery.validate.min.js"></script>
		
		<!-- JQUERY MASKED INPUT -->
		<script src="<%=basePath %>js/plugin/masked-input/jquery.maskedinput.min.js"></script>
	

		<!-- MAIN APP JS FILE -->
		<script src="<%=basePath %>js/app.min.js"></script>
	
	
	<script type="text/javascript">
		// Validation
			$(function() {
				$("#pform").validate({

					// Rules for form validation
					rules : {
						password : {
							required : true,
							minlength : 3,
							maxlength : 20
						},
						confirmPassword : {
							required : true,
							minlength : 3,
							maxlength : 20,
							equalTo : '#password'
						},
					},

					// Messages for form validation
					messages : {
						password : {
							required : 'Please enter your password',
						},
						passwordConfirm : {
							required : 'Please enter your password one more time',
							equalTo : 'Please enter the same password as above',
						}
					}
				});	
			});
</script>
</body>
</html>