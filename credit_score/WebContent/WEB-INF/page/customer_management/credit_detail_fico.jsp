<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html lang="en-us">
<head>
<meta charset="utf-8">
<!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->

<title>SmartAdmin</title>
<meta name="description" content="">
<meta name="author" content="">

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Basic Styles -->
<link rel="stylesheet" type="text/css" media="screen"
	href="<%=basePath%>css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="<%=basePath%>css/font-awesome.min.css">

<!-- SmartAdmin Styles : Caution! DO NOT change the order -->
<link rel="stylesheet" type="text/css" media="screen"
	href="<%=basePath%>css/smartadmin-production-plugins.min.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="<%=basePath%>css/smartadmin-production.min.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="<%=basePath%>css/smartadmin-skins.min.css">

<!-- SmartAdmin RTL Support -->
<link rel="stylesheet" type="text/css" media="screen"
	href="<%=basePath%>css/smartadmin-rtl.min.css">

<!-- We recommend you use "your_style.css" to override SmartAdmin 
		     specific styles this will also ensure you retrain your customization with each SmartAdmin update.-->
<link rel="stylesheet" type="text/css" media="screen"
	href="<%=basePath%>css/my_style.css">

<!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->
<link rel="stylesheet" type="text/css" media="screen"
	href="css/demo.min.css">

<!-- FAVICONS -->
<link rel="shortcut icon" href="img/favicon/favicon.ico"
	type="image/x-icon">
<link rel="icon" href="img/favicon/favicon.ico" type="image/x-icon">

<!-- GOOGLE FONT -->
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">



</head>


<body class="">



	<!-- MAIN CONTENT -->
	<div id="content">

		<div class="row">
			<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
				<h1 class="page-title txt-color-blueDark">
					<i class="fa fa-pencil-square-o fa-fw "></i> Forms <span>>
						Wizards </span>
				</h1>
			</div>
			<div class="col-xs-12 col-sm-5 col-md-5 col-lg-8">
				<ul id="sparks" class="">
					<li class="sparks-info">
						<h5>
							My Income <span class="txt-color-blue">$47,171</span>
						</h5>
						<div
							class="sparkline txt-color-blue hidden-mobile hidden-md hidden-sm">
							1300, 1877, 2500, 2577, 2000, 2100, 3000, 2700, 3631, 2471, 2700,
							3631, 2471</div>
					</li>
					<li class="sparks-info">
						<h5>
							Site Traffic <span class="txt-color-purple"><i
								class="fa fa-arrow-circle-up" data-rel="bootstrap-tooltip"
								title="Increased"></i>&nbsp;45%</span>
						</h5>
						<div
							class="sparkline txt-color-purple hidden-mobile hidden-md hidden-sm">
							110,150,300,130,400,240,220,310,220,300, 270, 210</div>
					</li>
					<li class="sparks-info">
						<h5>
							Site Orders <span class="txt-color-greenDark"><i
								class="fa fa-shopping-cart"></i>&nbsp;2447</span>
						</h5>
						<div
							class="sparkline txt-color-greenDark hidden-mobile hidden-md hidden-sm">
							110,150,300,130,400,240,220,310,220,300, 270, 210</div>
					</li>
				</ul>
			</div>
		</div>

		<!-- widget grid -->
		<section id="widget-grid" class=""> <!-- row -->
		<div class="row">

			<!-- NEW WIDGET START -->
			<article class="col-sm-12 col-md-12 col-lg-12"> <!-- Widget ID (each widget will need unique ID)-->
			<div class="jarviswidget jarviswidget-color-darken" id="wid-id-0"
				data-widget-editbutton="false" data-widget-deletebutton="false">
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
				<header> <span class="widget-icon"> <i
					class="fa fa-check"></i>
				</span>
				<h2>Credit Score Wizard Form</h2>

				</header>

				<!-- widget div-->
				<div>

					<!-- widget edit box -->
					<div class="jarviswidget-editbox">
						<!-- This area used as dropdown edit box -->

					</div>
					<!-- end widget edit box -->

					<!-- widget content -->
					<div class="widget-body">

						<div class="row">
							<form id="wizard-1" name="credit_detail"
								action="<%=path%>/customer/credit_detail"
								novalidate="novalidate" target="_self">
								<div id="bootstrap-wizard-1" class="col-sm-12">
									<div class="form-bootstrapWizard">
										<ul class="bootstrapWizard form-wizard">
											<li class="active" data-target="#step1"><a href="#tab1"
												data-toggle="tab"> <span class="step">1</span> <span
													class="title">Address information</span>
											</a></li>
											<li data-target="#step2"><a href="#tab2"
												data-toggle="tab"> <span class="step">2</span> <span
													class="title">Credit information</span>
											</a></li>
											<li data-target="#step3"><a href="#tab3"
												data-toggle="tab"> <span class="step">3</span> <span
													class="title">Domain Setup</span>
											</a></li>
											<li data-target="#step4"><a href="#tab4"
												data-toggle="tab"> <span class="step">4</span> <span
													class="title">Save Form</span>
											</a></li>
										</ul>
										<div class="clearfix"></div>
									</div>
									<div class="tab-content">
										<div class="tab-pane active" id="tab1">
											<br>
											<h3>
												<strong>Step 1 </strong> - Address Information (optional).
												If you want to compare with your neighbours, please finish
												this form. Otherwise, skip this form.
											</h3>

											<div class="row">

												<div class="col-sm-12">
													<div class="form-group">
														<div class="input-group">
															<span class="input-group-addon" data-toggle="tooltip"
																title="Please enter your Firstname"><i
																class="fa fa-envelope fa-lg fa-fw"></i></span> <input
																class="form-control input-lg"
																placeholder="email@address.com" type="text" name="email"
																id="email">

														</div>
													</div>

												</div>

											</div>

											<div class="row">
												<div class="col-sm-6">
													<div class="form-group">
														<div class="input-group">
															<span class="input-group-addon" data-toggle="tooltip"
																title="Please enter your Firstname"><i
																class="fa fa-user fa-lg fa-fw"></i></span> <input
																class="form-control input-lg" placeholder="First Name"
																type="text" name="fname" id="fname">

														</div>
													</div>
												</div>
												<div class="col-sm-6">
													<div class="form-group">
														<div class="input-group">
															<span class="input-group-addon" data-toggle="tooltip"
																title="Please enter your Firstname"><i
																class="fa fa-user fa-lg fa-fw"></i></span> <input
																class="form-control input-lg" placeholder="Last Name"
																type="text" name="lname" id="lname">

														</div>
													</div>
												</div>
											</div>

										</div>
										<div class="tab-pane" id="tab2">
											<br>
											<h3>
												<strong>Step 2</strong> - Credit Information
											</h3>

											<div class="row">
												<div class="col-sm-6">
													<div class="form-group">
														<div class="input-group">
															<span class="input-group-addon" data-toggle="tooltip"
																title="Please select your employment status"><i
																class="fa fa-flag fa-lg fa-fw"></i></span> <select
																id="employment_status" name="employment_status"
																class="form-control input-lg">
																<option value="" selected="selected">Select
																	Employment Status</option>
																<option value="full_time">Full-time</option>
																<option value="part_time">Part-time</option>
																<option value="homemaker">Homemaker</option>
																<option value="retired">Retired</option>
																<option value="student">Student</option>
																<option value="unemployed">Unemployed</option>

															</select>
														</div>
													</div>
												</div>
												<div class="col-sm-6">
													<div class="form-group">
														<div class="input-group">
															<span class="input-group-addon" data-toggle="tooltip"
																title="Please enter how many years that you have employed currently. Skip if not employed">
																<i class="fa fa-map-marker fa-lg fa-fw"></i>
															</span> <input id="employment_time"
																class="form-control input-lg"
																placeholder="Years in current employment" type="number"
																name="employment_time">
														</div>
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-sm-6">
													<div class="form-group">
														<div class="input-group">
															<span class="input-group-addon" data-toggle="tooltip"
																title="Please select your residential status"><i
																class="fa fa-flag fa-lg fa-fw"></i></span> <select
																name="residential_status" class="form-control input-lg">
																<option value="" selected="selected">Select
																	Residential status</option>
																<option value="home_owner">Home owner</option>
																<option value="renting">Renting</option>
																<option value="living_with_parent">Living with
																	parent</option>
															</select>
														</div>
													</div>
												</div>
												<div class="col-sm-6">
													<div class="form-group">
														<div class="input-group">
															<span class="input-group-addon" data-toggle="tooltip"
																title="Please select the currency you are using"><i
																class="fa fa-flag fa-lg fa-fw"></i></span> <select
																name="currency" class="form-control input-lg">
																<option value="" selected="selected">Select
																	Currency</option>
																<option value="GBP">Great British Pound</option>
																<option value="USD">United State Dollar</option>
																<option value="EUR">Euro</option>
																<option value="CNY">Chinese Yuan</option>
																<option value="HKD">Hong Kong Dollar</option>
																<option value="JPY">Japanese Yen</option>
															</select>
														</div>
													</div>
												</div>

											</div>

											<div class="row">
												<div class="col-sm-6">
													<div class="form-group">
														<div class="input-group">
															<span class="input-group-addon" data-toggle="tooltip"
																title="Please enter your requested loan amount"><i
																class="fa fa-flag fa-lg fa-fw"></i></span> <input
																class="form-control input-lg"
																placeholder="Loan Amount Requested" type="number"
																name="req_loan" id="req_loan">
														</div>
													</div>
												</div>
												<div class="col-sm-6">
													<div class="form-group">
														<div class="input-group">
															<span class="input-group-addon" data-toggle="tooltip"
																title="Please enter your annual income"><i
																class="fa fa-map-marker fa-lg fa-fw"></i></span> <input
																class="form-control input-lg"
																placeholder="Annual Income" type="number" name="income"
																id="income">
														</div>
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-sm-6">
													<div class="form-group">
														<div class="input-group">
															
															<span class="input-group-addon" data-toggle="tooltip"
																title="Please select whether you're a home owner. If yes, enter your outstanding mortgage"><i
																class="fa fa-flag fa-lg fa-fw"></i> </span>
															
																<div class="col-sm-3 nopadding">
																	<select id="ho_selector" class="form-control input-lg"
																		name="ho_select">
																		<option value="" selected="selected">Select
																			accommodation status</option>
																		<option value="0">Not a home owner</option>
																		<option value="1">Home owner</option>
																	</select>
																</div>
																<div class="col-sm-9 nopadding">
																	<input id="ho_input" class="form-control input-lg"
																		placeholder="Outstanding mortgage" type="number"
																		name="mortgage">
																</div>
															
														</div>
													</div>
												</div>
												<div class="col-sm-6">
													<div class="form-group">
														<div class="input-group">
															<span class="input-group-addon" data-toggle="tooltip"
																title="Please enter how many credit cards do you have, not your card number"><i
																class="fa fa-flag fa-lg fa-fw"></i></span> <input
																class="form-control input-lg"
																placeholder="Number of credit cards" type="number"
																name="card_amount">
															<!-- <select class="form-control input-lg" name="card_amount">
																<option value="" selected="selected">Select
																	Number of credit cards</option>
																<option value="0">0</option>
																<option value="1_to_3">1-3</option>
																<option value="4_to_8">4-8</option>
																<option value="more_than_9">9+</option>
															</select> -->
														</div>
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-sm-6">
													<div class="form-group">
														<div class="input-group">
															<span class="input-group-addon" data-toggle="tooltip"
																title="Please enter the number of days currently past due on existing credit agreements. 0 refers to All accounts up to date"><i
																class="fa fa-flag fa-lg fa-fw"></i></span> 
															<input
																class="form-control input-lg"
																placeholder="Days that Past Due on existing Credit Agreements" type="number"
																name="past_due">
															<!-- <select name="past_due" class="form-control input-lg">
																<option value="" selected="selected">Select
																	Past Due on existing Credit Agreementss</option>
																<option value="0">0 (All accounts up to date)</option>
																<option value="1_to_30">1-30 days past due</option>
																<option value="31_to_60">31-60 days past due</option>
																<option value="more_than_60">>60 days past due</option>
															</select> -->
														</div>
													</div>
												</div>
												<div class="col-sm-6">
													<div class="form-group">
														<div class="input-group">
															<span class="input-group-addon" data-toggle="tooltip"
																title="Please select whether you declared bankrupt within the last 5 years"><i
																class="fa fa-map-marker fa-lg fa-fw"></i></span> <select
																class="form-control input-lg" name="bankrupt">
																<option value="" selected="selected">Declared
																	bankrupt within the last 5 years?</option>
																<option value="y">Yes</option>
																<option value="n">No</option>
																<option value="unknown">Unknown</option>
															</select>
														</div>
													</div>
												</div>
											</div>

											<!-- <div class="row">
																<div class="col-sm-6">
																	<div class="form-group">
																		<div class="input-group">
																			<span class="input-group-addon" data-toggle="tooltip" title="Please enter your Firstname"><i class="fa fa-phone fa-lg fa-fw"></i></span>
																			<input class="form-control input-lg" data-mask="+99 (999) 999-9999" data-mask-placeholder= "X" placeholder="+1" type="text" name="wphone" id="wphone">
																		</div>
																	</div>
																</div>
																<div class="col-sm-6">
																	<div class="form-group">
																		<div class="input-group">
																			<span class="input-group-addon"><i class="fa fa-mobile fa-lg fa-fw"></i></span>
																			<input class="form-control input-lg" data-mask="+99 (999) 999-9999" data-mask-placeholder= "X" placeholder="+01" type="text" name="hphone" id="hphone">
																		</div>
																	</div>
																</div>
															</div> -->
										</div>
										<div class="tab-pane" id="tab3">
											<br>
											<h3>
												<strong>Step 3</strong> - Domain Setup
											</h3>
											<div class="alert alert-info fade in">
												<button class="close" data-dismiss="alert">×</button>
												<i class="fa-fw fa fa-info"></i> <strong>Info!</strong>
												Place an info message box if you wish.
											</div>
											<div class="form-group">
												<label>This is a label</label> <input
													class="form-control input-lg"
													placeholder="Another input box here..." type="text"
													name="etc" id="etc">
											</div>
										</div>
										<div class="tab-pane" id="tab4">
											<br>
											<h3>
												<strong>Step 4</strong> - Save Form
											</h3>
											<br>
											<h1 class="text-center text-success">
												<strong><i class="fa fa-check fa-lg"></i> Complete</strong>
											</h1>
											<h4 class="text-center">Click next to finish</h4>
											<br> <br>
										</div>

										<div class="form-actions">
											<div class="row">
												<div class="col-sm-12">
													<ul class="pager wizard no-margin">
														<!--<li class="previous first disabled">
																		<a href="javascript:void(0);" class="btn btn-lg btn-default"> First </a>
																		</li>-->
														<li class="previous disabled"><a
															href="javascript:void(0);" class="btn btn-lg btn-default">
																Previous </a></li>
														<!--<li class="next last">
																		<a href="javascript:void(0);" class="btn btn-lg btn-primary"> Last </a>
																		</li>-->
														<li class="next"><a href="javascript:void(0);"
															class="btn btn-lg txt-color-darken"> Next </a></li>
														<li class="finish"><a href="#" id="finish_submit"
															class="btn btn-lg txt-color-darken">Finish</a></li>
													</ul>
												</div>
											</div>
										</div>

									</div>
								</div>
							</form>
						</div>

					</div>
					<!-- end widget content -->

				</div>
				<!-- end widget div -->

			</div>
			<!-- end widget --> </article>
			<!-- WIDGET END -->



		</div>

		<!-- end row --> </section>
		<!-- end widget grid -->

	</div>
	<!-- END MAIN CONTENT -->

	</div>
	<!-- END MAIN PANEL -->

	<!-- PAGE FOOTER -->
	<div class="page-footer">
		<div class="row">
			<div class="col-xs-12 col-sm-6">
				<span class="txt-color-white">SmartAdmin 1.8.2 <span
					class="hidden-xs"> - Web Application Framework</span> © 2014-2015
				</span>
			</div>

			<div class="col-xs-6 col-sm-6 text-right hidden-xs">
				<div class="txt-color-white inline-block">
					<i class="txt-color-blueLight hidden-mobile">Last account
						activity <i class="fa fa-clock-o"></i> <strong>52 mins
							ago &nbsp;</strong>
					</i>
					<div class="btn-group dropup">
						<button
							class="btn btn-xs dropdown-toggle bg-color-blue txt-color-white"
							data-toggle="dropdown">
							<i class="fa fa-link"></i> <span class="caret"></span>
						</button>
						<ul class="dropdown-menu pull-right text-left">
							<li>
								<div class="padding-5">
									<p class="txt-color-darken font-sm no-margin">Download
										Progress</p>
									<div class="progress progress-micro no-margin">
										<div class="progress-bar progress-bar-success"
											style="width: 50%;"></div>
									</div>
								</div>
							</li>
							<li class="divider"></li>
							<li>
								<div class="padding-5">
									<p class="txt-color-darken font-sm no-margin">Server Load</p>
									<div class="progress progress-micro no-margin">
										<div class="progress-bar progress-bar-success"
											style="width: 20%;"></div>
									</div>
								</div>
							</li>
							<li class="divider"></li>
							<li>
								<div class="padding-5">
									<p class="txt-color-darken font-sm no-margin">
										Memory Load <span class="text-danger">*critical*</span>
									</p>
									<div class="progress progress-micro no-margin">
										<div class="progress-bar progress-bar-danger"
											style="width: 70%;"></div>
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
			<li><a href="inbox.html"
				class="jarvismetro-tile big-cubes bg-color-blue"> <span
					class="iconbox"> <i class="fa fa-envelope fa-4x"></i> <span>Mail
							<span class="label pull-right bg-color-darken">14</span>
					</span>
				</span>
			</a></li>
			<li><a href="calendar.html"
				class="jarvismetro-tile big-cubes bg-color-orangeDark"> <span
					class="iconbox"> <i class="fa fa-calendar fa-4x"></i> <span>Calendar</span>
				</span>
			</a></li>
			<li><a href="gmap-xml.html"
				class="jarvismetro-tile big-cubes bg-color-purple"> <span
					class="iconbox"> <i class="fa fa-map-marker fa-4x"></i> <span>Maps</span>
				</span>
			</a></li>
			<li><a href="invoice.html"
				class="jarvismetro-tile big-cubes bg-color-blueDark"> <span
					class="iconbox"> <i class="fa fa-book fa-4x"></i> <span>Invoice
							<span class="label pull-right bg-color-darken">99</span>
					</span>
				</span>
			</a></li>
			<li><a href="gallery.html"
				class="jarvismetro-tile big-cubes bg-color-greenLight"> <span
					class="iconbox"> <i class="fa fa-picture-o fa-4x"></i> <span>Gallery
					</span>
				</span>
			</a></li>
			<li><a href="profile.html"
				class="jarvismetro-tile big-cubes selected bg-color-pinkDark"> <span
					class="iconbox"> <i class="fa fa-user fa-4x"></i> <span>My
							Profile </span>
				</span>
			</a></li>
		</ul>
	</div>
	<!-- END SHORTCUT AREA -->

	<!--================================================== -->

	<!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
	<script data-pace-options='{ "restartOnRequestAfter": true }'
		src="js/plugin/pace/pace.min.js"></script>

	<!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script>
		if (!window.jQuery) {
			document
					.write('<script src="js/libs/jquery-2.1.1.min.js"><\/script>');
		}
	</script>

	<script
		src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
	<script>
		if (!window.jQuery.ui) {
			document
					.write('<script src="js/libs/jquery-ui-1.10.3.min.js"><\/script>');
		}
	</script>

	<!-- IMPORTANT: APP CONFIG required===========-->
	<script src="<%=basePath%>js/app.config.js"></script>

	<!-- JS TOUCH : include this plugin for mobile drag / drop touch events-->
	<script src="js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script>

	<!-- BOOTSTRAP JS -->
	<script src="<%=basePath%>js/bootstrap/bootstrap.min.js"></script>

	<!-- CUSTOM NOTIFICATION -->
	<!-- <script src="js/notification/SmartNotification.min.js"></script> -->

	<!-- JARVIS WIDGETS -->
	<script src="<%=basePath%>js/smartwidgets/jarvis.widget.min.js"></script>

	<!-- EASY PIE CHARTS -->
	<!-- <script src="js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script> -->

	<!-- SPARKLINES -->
	<script src="<%=basePath%>js/plugin/sparkline/jquery.sparkline.min.js"></script>

	<!-- JQUERY VALIDATE required to turn the page=========-->
	<script
		src="<%=basePath%>js/plugin/jquery-validate/jquery.validate.min.js"></script>

	<!-- JQUERY MASKED INPUT required to mask============-->
	<script
		src="<%=basePath%>js/plugin/masked-input/jquery.maskedinput.min.js"></script>

	<!-- JQUERY SELECT2 INPUT -->
	<!-- <script src="js/plugin/select2/select2.min.js"></script> -->

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
	<!-- <script src="js/demo.min.js"></script> -->

	<!-- MAIN APP JS FILE required============= -->
	<script src="<%=basePath%>js/app.min.js"></script>

	<!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
	<!-- Voice command : plugin -->
	<!-- <script src="js/speech/voicecommand.min.js"></script> -->

	<!-- SmartChat UI : plugin -->
	<!-- <script src="js/smart-chat-ui/smart.chat.ui.min.js"></script> -->
	<!-- <script src="js/smart-chat-ui/smart.chat.manager.min.js"></script> -->

	<!-- PAGE RELATED PLUGIN(S) =============-->
	<script
		src="<%=basePath%>js/plugin/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
	<script src="<%=basePath%>js/plugin/fuelux/wizard/wizard.min.js"></script>


	<script type="text/javascript">
		// DO NOT REMOVE : GLOBAL FUNCTIONS!

		$(document)
				.ready(
						function() {
							/* -------------tooltip--------------- */
							$('[data-toggle="tooltip"]').tooltip();

							pageSetUp();

							//Bootstrap Wizard Validations
							//required jquery.validate.min.js
							var $validator = $("#wizard-1")
									.validate(
											{

												rules : {
													//base on the name of the tag, not id
													address_one : {
														required : false,
														minlength : 2
													},
													fname : {
														required : false
													},
													lname : {
														required : false
													},
													employment_status : {
														required : true
													},
													employment_time : {
														required : true
													},
													residential_status : {
														required : true

													},
													currency : {
														required : true

													},
													req_loan : {
														required : true,
													},
													income : {
														required : true

													},
													card_amount : {
														required : true,
														maxlength : 5,
														
													},
													past_due : {
														required : true

													},
													bankrupt : {
														required : true

													},
													ho_select : {
														required : true
													}
												},

												messages : {
													fname : "Please specify your First name",
													lname : "Please specify your Last name",
													card_amount : {
														maxlength : "Please enter how many credit cards you get, not your card number",
														
													}
													
												},

												highlight : function(element) {
													$(element)
															.closest(
																	'.form-group')
															.removeClass(
																	'has-success')
															.addClass(
																	'has-error');
												},
												unhighlight : function(element) {
													$(element)
															.closest(
																	'.form-group')
															.removeClass(
																	'has-error')
															.addClass(
																	'has-success');
												},
												errorElement : 'span',
												errorClass : 'help-block',
												errorPlacement : function(
														error, element) {
													if (element
															.parent('.input-group').length) {
														error
																.insertAfter(element
																		.parent());
													} else {
														error
																.insertAfter(element);
													}
												}
											});

							$('#bootstrap-wizard-1')
									.bootstrapWizard(
											{
												'tabClass' : 'form-wizard',
												'onNext' : function(tab,
														navigation, index) {
													var $valid = $("#wizard-1")
															.valid();
													if (!$valid) {
														$validator
																.focusInvalid();
														return false;
													} else {
														$('#bootstrap-wizard-1')
																.find(
																		'.form-wizard')
																.children('li')
																.eq(index - 1)
																.addClass(
																		'complete');
														$('#bootstrap-wizard-1')
																.find(
																		'.form-wizard')
																.children('li')
																.eq(index - 1)
																.find('.step')
																.html(
																		'<i class="fa fa-check"></i>');
													}
												}
											});
							$('#bootstrap-wizard-1 .finish').click(function() {
								document.credit_detail.submit();
								//alert('Finished!, Starting over!');
								//$('#rootwizard').find("a[href*='tab1']").trigger('click');
							});

							// fuelux wizard
							var wizard = $('.wizard').wizard();

							wizard
									.on(
											'finished',
											function(e, data) {

												//console.log("submitted!");
												// alert("baba");
												$
														.smallBox({
															title : "Congratulations! Your form was submitted",
															content : "<i class='fa fa-clock-o'></i> <i>1 seconds ago...</i>",
															color : "#5F895F",
															iconSmall : "fa fa-check bounce animated",
															timeout : 4000
														});

											});

							/* ------------ home owner validation ---------- */
							//validate if the outstanding mortgage needed to input a value
							$('#ho_selector').change(function() {
								var ho_selector = $('#ho_selector').val();
								if (ho_selector == '0' || ho_selector == '') {
									$('#ho_input').prop('disabled', true);
								} else {
									$('#ho_input').prop('disabled', false);
								}
							}).trigger('change');

							//validate if the employment time needed to input a value
							$('#employment_status').change(
									function() {
										var es = $('#employment_status').val();
										if (es == 'full_time'
												|| es == 'part_time') {
											$('#employment_time').prop(
													'disabled', false);
										} else {
											$('#employment_time').prop(
													'disabled', true);
										}
									}).trigger('change');

						})
	</script>

	<!-- Your GOOGLE ANALYTICS CODE Below -->
	<!-- <script type="text/javascript">
			var _gaq = _gaq || [];
				_gaq.push(['_setAccount', 'UA-XXXXXXXX-X']);
				_gaq.push(['_trackPageview']);
			// alert("hhhhh");
			(function() {
				var ga = document.createElement('script');
				ga.type = 'text/javascript';
				ga.async = true;
				ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
				var s = document.getElementsByTagName('script')[0];
				s.parentNode.insertBefore(ga, s);
				// alert("lalala");
			})();

		</script> -->

</body>

</html>