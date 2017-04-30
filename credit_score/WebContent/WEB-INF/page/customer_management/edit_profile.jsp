<!DOCTYPE html>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html lang="en-us">
	<head>
		<meta charset="utf-8">
		<title> CreditScore </title>
		<meta name="description" content="">
		<meta name="author" content="">
			
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		
		<!-- #CSS Links -->
		<!-- Basic Styles -->
		<link rel="stylesheet" type="text/css" media="screen" href="<%=basePath%>css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="<%=basePath%>css/font-awesome.min.css">

		<!-- SmartAdmin Styles : Caution! DO NOT change the order -->
		<link rel="stylesheet" type="text/css" media="screen" href="<%=basePath%>css/smartadmin-production-plugins.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="<%=basePath%>css/smartadmin-production.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="<%=basePath%>css/smartadmin-skins.min.css">

		

		<!-- #FAVICONS -->
		<link rel="shortcut icon" href="img/favicon/favicon.ico" type="image/x-icon">
		<link rel="icon" href="img/favicon/favicon.ico" type="image/x-icon">

		<!-- #GOOGLE FONT -->
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">

		

	</head>

	
	<body class="">

	
				
	<!-- widget grid -->
	<section id="widget-grid" class="">

		<!-- Widget ID (each widget will need unique ID)-->
		<div class="jarviswidget" id="wid-id-0" data-widget-colorbutton="false"	data-widget-editbutton="false" data-widget-deletebutton="false" data-widget-sortable="false">
					
			<header>
				<h2>Personal Profile </h2>
			</header>

			<!-- widget div-->

			<div>
				<!-- widget edit box -->
				<div class="jarviswidget-editbox">
					<!-- This area used as dropdown edit box -->
					<input class="form-control" type="text">
				</div>
				<!-- end widget edit box -->

				<!-- widget content -->
				<div class="widget-body">

					<form id="movieForm" method="post" action="<%=path %>/customer/edit">
						
						
						<fieldset>
							<legend>
								Personal Information
							</legend>
							<div class="form-group">
								<div class="row">
									<div class="col-md-6">
										<label class="control-label">First Name</label>
										<input type="text" class="form-control" name="fname" value="${fname }"/>
									</div>

									<div class="col-md-6 selectContainer">
										<label class="control-label">Surname</label>
										<input type="text" class="form-control" name="lname" value="${lname }"/>
									</div>
								</div>
							</div>
						</fieldset>
						
						<fieldset>
							<div class="form-group">
								<div class="row">
									<div class="col-sm-12 col-md-4">
										<label class="control-label">Email</label>
										<input type="email" class="form-control" name="email" value="${email }"/>
									</div>

									<div class="col-sm-12 col-md-4">
										<label class="control-label">Gender</label>
										<select id="gender" name="gender" class="form-control">
											<option value="" selected="selected">Select Gender</option>
											<option value="male">Male</option>
											<option value="female">Female</option>

										</select>
										
									</div>
									

									<div class="col-sm-12 col-md-4">
										<label class="control-label">Mobile Number</label>
										<input type="text" class="form-control" name="mobile" value="${mobile }"/>
									</div>
								</div>
							</div>
						</fieldset>
						
						
						
						<fieldset>
							
							<div class="form-group">
								<div class="row">
									<div class="col-md-6">
										<label class="control-label">Birthday</label>
										<input type="text" placeholder="Birth date" class="form-control datepicker" name="birthday" value="${birthday }" data-dateformat='yy-mm-dd'/>
									</div>

									<div class="col-md-6 selectContainer">
										<label class="control-label">Nationality</label>
										<input type="text" class="form-control" name="nationality" value="${nationality }"/>
									</div>
								</div>
							</div>
						</fieldset>
						
						<fieldset>
							<legend>
								Address
							</legend>
							<div class="form-group">
								<div class="row">
									<div class="col-md-6">
										<label class="control-label">Address One</label>
										<input type="text" class="form-control" name="add_one" value="${add_one }"/>
									</div>

									<div class="col-md-6 selectContainer">
										<label class="control-label">Address Two</label>
										<input type="text" class="form-control" name="add_two" value="${add_two }"/>
									</div>
								</div>
							</div>
						</fieldset>

						<fieldset>
							<div class="form-group">
								<div class="row">
									<div class="col-sm-12 col-md-4">
										<label class="control-label">Post Code</label>
										<input type="text" class="form-control" name="postcode" value="${postcode }"/>
									</div>

									<div class="col-sm-12 col-md-4">
										<label class="control-label">City</label>
										<input type="text" class="form-control" name="city" value="${city }"/>
									</div>

									<div class="col-sm-12 col-md-4">
										<label class="control-label">County</label>
										<input type="text" class="form-control" name="county" value="${county }"/>
									</div>
								</div>
							</div>
						</fieldset>
						
						<fieldset>
							<div class="form-group">
								<div class="row">
									<div class="col-sm-12 col-md-12">
										<label class="control-label">Country</label>
										<input type="text" class="form-control" name="country" value="${country }"/>
									</div>
								</div>
							</div>
						</fieldset>

						

						<fieldset>
						<legend>
								Introduction
						</legend>
							<div class="form-group">
								<label class="control-label">Personal Intro</label>
								<textarea class="form-control" name="intro" rows="8" maxlength="300"></textarea>
							</div>
						</fieldset>

						

						<div class="form-actions">
							<div class="row">
								<div class="col-md-12">
									<button class="btn btn-default" type="submit">
										<i class="fa fa-eye"></i>
										Submit
									</button>
								</div>
							</div>
						</div>

					</form>

				</div>
				<!-- end widget content -->

			</div>
			<!-- end widget div -->

		</div>
		<!-- end widget -->

				

			

			

		

	</section>
	<!-- end widget grid -->

			

		

		

		

		<!--================================================== -->

		<!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
		<script data-pace-options='{ "restartOnRequestAfter": true }' src="<%=basePath%>js/plugin/pace/pace.min.js"></script>

		<!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
		<script>
			if (!window.jQuery) {
				document.write('<script src="<%=basePath%>js/libs/jquery-2.1.1.min.js"><\/script>');
			}
		</script>

		<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
		<script>
			if (!window.jQuery.ui) {
				document.write('<script src="<%=basePath%>js/libs/jquery-ui-1.10.3.min.js"><\/script>');
			}
		</script>

		<!-- IMPORTANT: APP CONFIG -->
		<script src="<%=basePath%>js/app.config.js"></script>

		<!-- JS TOUCH : include this plugin for mobile drag / drop touch events-->
		<script src="<%=basePath%>js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> 

		<!-- BOOTSTRAP JS -->
		<script src="<%=basePath%>js/bootstrap/bootstrap.min.js"></script>

		<!-- CUSTOM NOTIFICATION -->
		<script src="<%=basePath%>js/notification/SmartNotification.min.js"></script>

		<!-- JARVIS WIDGETS -->
		<script src="<%=basePath%>js/smartwidgets/jarvis.widget.min.js"></script>

		<!-- EASY PIE CHARTS -->
		<script src="<%=basePath%>js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>

		<!-- SPARKLINES -->
		<script src="<%=basePath%>js/plugin/sparkline/jquery.sparkline.min.js"></script>

		<!-- JQUERY VALIDATE -->
		<script src="<%=basePath%>js/plugin/jquery-validate/jquery.validate.min.js"></script>

		<!-- JQUERY MASKED INPUT -->
		<script src="<%=basePath%>js/plugin/masked-input/jquery.maskedinput.min.js"></script>

		<!-- JQUERY SELECT2 INPUT -->
		<script src="<%=basePath%>js/plugin/select2/select2.min.js"></script>

		<!-- JQUERY UI + Bootstrap Slider -->
		<script src="<%=basePath%>js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>

		<!-- browser msie issue fix -->
		<script src="<%=basePath%>js/plugin/msie-fix/jquery.mb.browser.min.js"></script>

		<!-- FastClick: For mobile devices -->
		<script src="<%=basePath%>js/plugin/fastclick/fastclick.min.js"></script>

		<!--[if IE 8]>

		<h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>

		<![endif]-->

		

		<!-- MAIN APP JS FILE -->
		<script src="<%=basePath%>js/app.min.js"></script>

		

		<!-- SmartChat UI : plugin -->
		<script src="<%=basePath%>js/smart-chat-ui/smart.chat.ui.min.js"></script>
		<script src="<%=basePath%>js/smart-chat-ui/smart.chat.manager.min.js"></script>

		

		<script src="<%=basePath%>js/plugin/bootstrapvalidator/bootstrapValidator.min.js"></script>

		<script type="text/javascript">

			$(document).ready(function() {

				//jquery ui datepicker setting for the birthday input
				$( ".datepicker" ).datepicker({
			 	changeYear: true,
			 	changeMonth: true,
			 	yearRange: "1900:",
			 	dateFormat: "yy-mm-dd"
				});
				
				//set default gender in gender selector
				var g = "${gender}";
				$('#gender').val(g);
					
				/* DO NOT REMOVE : GLOBAL FUNCTIONS!
				 *
				 * pageSetUp(); WILL CALL THE FOLLOWING FUNCTIONS
				 *
				 * // activate tooltips
				 * $("[rel=tooltip]").tooltip();
				 *
				 * // activate popovers
				 * $("[rel=popover]").popover();
				 *
				 * // activate popovers with hover states
				 * $("[rel=popover-hover]").popover({ trigger: "hover" });
				 *
				 * // activate inline charts
				 * runAllCharts();
				 *
				 * // setup widgets
				 * setup_widgets_desktop();
				 *
				 * // run form elements
				 * runAllForms();
				 *
				 ********************************
				 *
				 * pageSetUp() is needed whenever you load a page.
				 * It initializes and checks for all basic elements of the page
				 * and makes rendering easier.
				 *
				 */
				
				 pageSetUp();
				 
				/*
				 * ALL PAGE RELATED SCRIPTS CAN GO BELOW HERE
				 * eg alert("my home function");
				 * 
				 * var pagefunction = function() {
				 *   ...
				 * }
				 * loadScript("js/plugin/_PLUGIN_NAME_.js", pagefunction);
				 * 
				 * TO LOAD A SCRIPT:
				 * var pagefunction = function (){ 
				 *  loadScript(".../plugin.js", run_after_loaded);	
				 * }
				 * 
				 * OR
				 * 
				 * loadScript(".../plugin.js", run_after_loaded);
				 */

				// pagefunction

				// clears the variable if left blank

				// movie form
				$('#movieForm').bootstrapValidator({
					feedbackIcons : {
						valid : 'glyphicon glyphicon-ok',
						invalid : 'glyphicon glyphicon-remove',
						validating : 'glyphicon glyphicon-refresh'
					},
					fields : {
						title : {
							group : '.col-md-8',
							validators : {
								notEmpty : {
									message : 'The title is required'
								},
								stringLength : {
									max : 200,
									message : 'The title must be less than 200 characters long'
								}
							}
						},
						genre : {
							group : '.col-md-4',
							validators : {
								notEmpty : {
									message : 'The genre is required'
								}
							}
						},
						director : {
							group : '.col-md-4',
							validators : {
								notEmpty : {
									message : 'The director name is required'
								},
								stringLength : {
									max : 80,
									message : 'The director name must be less than 80 characters long'
								}
							}
						},
						writer : {
							group : '.col-md-4',
							validators : {
								notEmpty : {
									message : 'The writer name is required'
								},
								stringLength : {
									max : 80,
									message : 'The writer name must be less than 80 characters long'
								}
							}
						},
						producer : {
							group : '.col-md-4',
							validators : {
								notEmpty : {
									message : 'The producer name is required'
								},
								stringLength : {
									max : 80,
									message : 'The producer name must be less than 80 characters long'
								}
							}
						},
						website : {
							group : '.col-md-6',
							validators : {
								notEmpty : {
									message : 'The website address is required'
								},
								uri : {
									message : 'The website address is not valid'
								}
							}
						},
						trailer : {
							group : '.col-md-6',
							validators : {
								notEmpty : {
									message : 'The trailer link is required'
								},
								uri : {
									message : 'The trailer link is not valid'
								}
							}
						},
						review : {
							// The group will be set as default (.form-group)
							validators : {
								stringLength : {
									max : 500,
									message : 'The review must be less than 500 characters long'
								}
							}
						},
						rating : {
							// The group will be set as default (.form-group)
							validators : {
								notEmpty : {
									message : 'The rating is required'
								}
							}
						}
					}
				});
				// end movie form

				
					
				
			})
		
		</script>

		

	</body>

</html>