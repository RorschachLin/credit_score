<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
	<head>
		<meta charset="utf-8">
		<!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->

		<title> SmartAdmin </title>
		<meta name="description" content="">
		<meta name="author" content="">
			
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<!-- Basic Styles -->
		<link rel="stylesheet" type="text/css" media="screen" href="<%=basePath %>css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="<%=basePath %>css/font-awesome.min.css">

		<!-- SmartAdmin Styles : Caution! DO NOT change the order -->
		<link rel="stylesheet" type="text/css" media="screen" href="<%=basePath %>css/smartadmin-production-plugins.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="<%=basePath %>css/smartadmin-production.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="<%=basePath %>css/smartadmin-skins.min.css">

		
	</head>
	
	
	<style type="text/css">
	#main{
		margin:0;
	}
	</style>
	<body class="">

		<!-- MAIN PANEL -->
		<div id="main" role="main">

			<!-- MAIN CONTENT -->
			<div id="content">

<!-- widget grid -->
<section id="widget-grid" class="">


	<!-- START ROW -->

	<div class="row">

		<!-- NEW COL START -->
		<article class="col-sm-12 col-md-12 col-lg-6">
			
			<!-- Widget ID (each widget will need unique ID)-->
			<div class="jarviswidget" id="wid-id-8" data-widget-editbutton="false" data-widget-custombutton="false">
				<!-- widget options:
					usage: <div class="jarviswidget" id="wid-id-0" data-widget-editbutton="false">
					
					data-widget-colorbutton="false"	
					data-widget-editbutton="false"
					data-widget-togglebutton="false"
					data-widget-deletebutton="false"
					data-widget-fullscreenbutton="false"
					data-widget-custombutton="false"
					data-widget-collapsed="true" 
					data-widget-sortable="false"
					
				-->
				<header>
					<span class="widget-icon"> <i class="fa fa-edit"></i> </span>
					<h2>Update form </h2>				
					
				</header>

				<!-- widget div-->
				<div>
					
					<!-- widget edit box -->
					<div class="jarviswidget-editbox">
						<!-- This area used as dropdown edit box -->
						
					</div>
					<!-- end widget edit box -->
					
					<!-- widget content -->
					<div class="widget-body no-padding">
						
						<form action="<%=path %>/user/update_customer" method="post" id="contact-form" class="smart-form" target="_self">
							
							<header>Update form</header>
							<input type="hidden" name="customer_id" id="cid" value="${updateCust.customerId }">
							<fieldset>					
								<div class="row">
									<section class="col col-6">
										<label class="label">Username</label>
										<label class="input">
											<i class="icon-append fa fa-user"></i>
											<input type="text" name="username" id="username" value="${updateCust.username }">
										</label>
									</section>
									<section class="col col-6">
										<label class="label">Password</label>
										<label class="input">
											<i class="icon-append fa fa-envelope-o"></i>
											<input type=text name="password" id="password" value="${updateCust.password }">
										</label>
									</section>
								</div>
								
								<div class="row">
									<section class="col col-6">
										<label class="label">FirstName</label>
										<label class="input">
											<i class="icon-append fa fa-user"></i>
											<input type="text" name="first_name" id="first_name" value="${updateCust.firstName }">
										</label>
									</section>
									<section class="col col-6">
										<label class="label">SurName</label>
										<label class="input">
											<i class="icon-append fa fa-envelope-o"></i>
											<input type="text" name="last_name" id="last_name" value="${updateCust.lastName }">
										</label>
									</section>
								</div>
								
								<div class="row">
									<section class="col col-6">
										<label class="label">Role</label>
										<label class="input">
											<i class="icon-append fa fa-user"></i>
											<input type="text" name="role" id="role" value="${updateCust.roleId }">
										</label>
									</section>
									<section class="col col-6">
										<label class="label">Tel</label>
										<label class="input">
											<i class="icon-append fa fa-envelope-o"></i>
											<input type="text" name="tel" id="tel" value="${updateCust.mobileNum }">
										</label>
									</section>
								</div>
								
								<div class="row">
									<section class="col col-6">
										<label class="label">Address One</label>
										<label class="input">
											<i class="icon-append fa fa-user"></i>
											<input type="text" name="address_one" id="address_one" value="${updateCust.address.addressOne }">
										</label>
									</section>
									<section class="col col-6">
										<label class="label">Address Two</label>
										<label class="input">
											<i class="icon-append fa fa-envelope-o"></i>
											<input type="email" name="address_two" id="address_two" value="${updateCust.address.addressTwo }">
										</label>
									</section>
								</div>
								
								<div class="row">
									<section class="col col-6">
										<label class="label">Postcode</label>
										<label class="input">
											<i class="icon-append fa fa-user"></i>
											<input type="text" name="postcode" id="postcode" value="${updateCust.address.postcode }">
										</label>
									</section>
									<section class="col col-6">
										<label class="label">Birth Date (in format: yyyy-mm-dd)</label>
										<label class="input">
											<i class="icon-append fa fa-envelope-o"></i>
											<!-- <input type="text" placeholder="Date" id="date" class="form-control" /> -->
											<input class="form-control" type="text" name="birth_date" id="date" placeholder="yyyy-mm-dd" value="${updateCust.dateOfBirth }">
										</label>
									</section>
								</div>
								
								<section>
									<label class="label">email</label>
									<label class="input">
										<i class="icon-append fa fa-tag"></i>
										<input type="text" name="email" id="email" value="${updateCust.email }">
									</label>
								</section>
								
								
								
								<section>
									<label class="checkbox"><input type="checkbox" name="copy" id="copy"><i></i>Send a copy to my e-mail address</label>
								</section>
							</fieldset>
							
							<footer>
								<button type="submit" class="btn btn-primary">Confirm</button>
							</footer>
							
							<div class="message">
								<i class="fa fa-thumbs-up"></i>
								<p>Your message was successfully sent!</p>
							</div>
						</form>						
						
					</div>
					<!-- end widget content -->
					
				</div>
				<!-- end widget div -->
				
			</div>
			<!-- end widget -->

		</article>
		<!-- END COL -->		

	</div>

	<!-- END ROW -->

</section>
<!-- end widget grid -->


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title">
					<img src="img/logo.png" width="150" alt="SmartAdmin">
				</h4>
			</div>
			<div class="modal-body no-padding">

				<form id="login-form" class="smart-form">

							<fieldset>
								<section>
									<div class="row">
										<label class="label col col-2">Username</label>
										<div class="col col-10">
											<label class="input"> <i class="icon-append fa fa-user"></i>
												<input type="email" name="email">
											</label>
										</div>
									</div>
								</section>

								<section>
									<div class="row">
										<label class="label col col-2">Password</label>
										<div class="col col-10">
											<label class="input"> <i class="icon-append fa fa-lock"></i>
												<input type="password" name="password">
											</label>
											<div class="note">
												<a href="javascript:void(0)">Forgot password?</a>
											</div>
										</div>
									</div>
								</section>

								<section>
									<div class="row">
										<div class="col col-2"></div>
										<div class="col col-10">
											<label class="checkbox">
												<input type="checkbox" name="remember" checked="">
												<i></i>Keep me logged in</label>
										</div>
									</div>
								</section>
							</fieldset>
							
							<footer>
								<button type="submit" class="btn btn-primary">
									Sign in
								</button>
								<button type="button" class="btn btn-default" data-dismiss="modal">
									Cancel
								</button>

							</footer>
						</form>						
						

			</div>

		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->


			</div>
			<!-- END MAIN CONTENT -->

		</div>
		<!-- END MAIN PANEL -->

		<!-- PAGE FOOTER -->
		<div class="page-footer">
			<div class="row">
				<div class="col-xs-12 col-sm-6">
					<span class="txt-color-white">SmartAdmin 1.8.2 <span class="hidden-xs"> - Web Application Framework</span> © 2014-2015</span>
				</div>

				<div class="col-xs-6 col-sm-6 text-right hidden-xs">
					<div class="txt-color-white inline-block">
						<i class="txt-color-blueLight hidden-mobile">Last account activity <i class="fa fa-clock-o"></i> <strong>52 mins ago &nbsp;</strong> </i>
						<div class="btn-group dropup">
							<button class="btn btn-xs dropdown-toggle bg-color-blue txt-color-white" data-toggle="dropdown">
								<i class="fa fa-link"></i> <span class="caret"></span>
							</button>
							<ul class="dropdown-menu pull-right text-left">
								<li>
									<div class="padding-5">
										<p class="txt-color-darken font-sm no-margin">Download Progress</p>
										<div class="progress progress-micro no-margin">
											<div class="progress-bar progress-bar-success" style="width: 50%;"></div>
										</div>
									</div>
								</li>
								<li class="divider"></li>
								<li>
									<div class="padding-5">
										<p class="txt-color-darken font-sm no-margin">Server Load</p>
										<div class="progress progress-micro no-margin">
											<div class="progress-bar progress-bar-success" style="width: 20%;"></div>
										</div>
									</div>
								</li>
								<li class="divider"></li>
								<li>
									<div class="padding-5">
										<p class="txt-color-darken font-sm no-margin">Memory Load <span class="text-danger">*critical*</span></p>
										<div class="progress progress-micro no-margin">
											<div class="progress-bar progress-bar-danger" style="width: 70%;"></div>
										</div>
									</div>
								</li>
								<li class="divider"></li>
								<li>
									<div class="padding-5">
										<button class="btn btn-block btn-default">refresh</button>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- END PAGE FOOTER -->

		<!-- SHORTCUT AREA : With large tiles (activated via clicking user name tag)
		Note: These tiles are completely responsive,
		you can add as many as you like
		-->
		<div id="shortcut">
			<ul>
				<li>
					<a href="inbox.html" class="jarvismetro-tile big-cubes bg-color-blue"> <span class="iconbox"> <i class="fa fa-envelope fa-4x"></i> <span>Mail <span class="label pull-right bg-color-darken">14</span></span> </span> </a>
				</li>
				<li>
					<a href="calendar.html" class="jarvismetro-tile big-cubes bg-color-orangeDark"> <span class="iconbox"> <i class="fa fa-calendar fa-4x"></i> <span>Calendar</span> </span> </a>
				</li>
				<li>
					<a href="gmap-xml.html" class="jarvismetro-tile big-cubes bg-color-purple"> <span class="iconbox"> <i class="fa fa-map-marker fa-4x"></i> <span>Maps</span> </span> </a>
				</li>
				<li>
					<a href="invoice.html" class="jarvismetro-tile big-cubes bg-color-blueDark"> <span class="iconbox"> <i class="fa fa-book fa-4x"></i> <span>Invoice <span class="label pull-right bg-color-darken">99</span></span> </span> </a>
				</li>
				<li>
					<a href="gallery.html" class="jarvismetro-tile big-cubes bg-color-greenLight"> <span class="iconbox"> <i class="fa fa-picture-o fa-4x"></i> <span>Gallery </span> </span> </a>
				</li>
				<li>
					<a href="profile.html" class="jarvismetro-tile big-cubes selected bg-color-pinkDark"> <span class="iconbox"> <i class="fa fa-user fa-4x"></i> <span>My Profile </span> </span> </a>
				</li>
			</ul>
		</div>
		<!-- END SHORTCUT AREA -->

		<!--================================================== -->

		<!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
		<script data-pace-options='{ "restartOnRequestAfter": true }' src="js/plugin/pace/pace.min.js"></script>

		<!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
		<script>
			if (!window.jQuery) {
				document.write('<script src="js/libs/jquery-2.1.1.min.js"><\/script>');
			}
		</script>

		<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
		<script>
			if (!window.jQuery.ui) {
				document.write('<script src="js/libs/jquery-ui-1.10.3.min.js"><\/script>');
			}
		</script>

		<!-- IMPORTANT: APP CONFIG -->
		<script src="js/app.config.js"></script>
		
		<!-- JQUERY MIGRATE -->
		<script src="<%=basePath %>js/plugin/masked-input/jquery-migrate-1.2.1.min.js"></script>
		
		<!-- JS TOUCH : include this plugin for mobile drag / drop touch events-->
		<script src="js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> 

		<!-- BOOTSTRAP JS -->
		<script src="js/bootstrap/bootstrap.min.js"></script>

		<!-- CUSTOM NOTIFICATION -->
		<script src="js/notification/SmartNotification.min.js"></script>

		<!-- JARVIS WIDGETS -->
		<script src="js/smartwidgets/jarvis.widget.min.js"></script>

		<!-- EASY PIE CHARTS -->
		<script src="js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>

		<!-- SPARKLINES -->
		<script src="<%=basePath %>js/plugin/sparkline/jquery.sparkline.min.js"></script>
		
		<!-- toogles -->
		<script src="<%=basePath %>js/plugin/masked-input/toogles.min.js"></script>
		
		
		
		<!-- JQUERY VALIDATE -->
		<script src="js/plugin/jquery-validate/jquery.validate.min.js"></script>
	
		<!-- JQUERY COOKIES -->
		<script src="<%=basePath %>js/plugin/masked-input/jquery.cookies.js"></script>
		
		<!-- JQUERY MASKED INPUT -->
		<script src="<%=basePath %>js/plugin/masked-input/jquery.maskedinput.min.js"></script>

		<!-- JQUERY SELECT2 INPUT -->
		<script src="js/plugin/select2/select2.min.js"></script>

		<!-- JQUERY UI + Bootstrap Slider -->
		<script src="js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>

		<!-- browser msie issue fix -->
		<script src="js/plugin/msie-fix/jquery.mb.browser.min.js"></script>

		<!-- FastClick: For mobile devices -->
		<script src="js/plugin/fastclick/fastclick.min.js"></script>

		<!--[if IE 8]>

		<h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>

		<![endif]-->

		<!-- Demo purpose only -->
		<script src="js/demo.min.js"></script>

		<!-- MAIN APP JS FILE -->
		<script src="js/app.min.js"></script>

		<!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
		<!-- Voice command : plugin -->
		<script src="js/speech/voicecommand.min.js"></script>

		<!-- SmartChat UI : plugin -->
		<script src="js/smart-chat-ui/smart.chat.ui.min.js"></script>
		<script src="js/smart-chat-ui/smart.chat.manager.min.js"></script>

		<!-- PAGE RELATED PLUGIN(S) -->
		<script src="js/plugin/jquery-form/jquery-form.min.js"></script>
		

		<script type="text/javascript">

		jQuery(document).ready(function(){
			jQuery("#date").mask("9999-99-99");
		});
		// DO NOT REMOVE : GLOBAL FUNCTIONS!
		
		

		</script>




		<!-- Your GOOGLE ANALYTICS CODE Below -->
		<script type="text/javascript">
			var _gaq = _gaq || [];
				_gaq.push(['_setAccount', 'UA-XXXXXXXX-X']);
				_gaq.push(['_trackPageview']);
			
			(function() {
				var ga = document.createElement('script');
				ga.type = 'text/javascript';
				ga.async = true;
				ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
				var s = document.getElementsByTagName('script')[0];
				s.parentNode.insertBefore(ga, s);
			})();

			
		</script>


		
	</body>

</html>