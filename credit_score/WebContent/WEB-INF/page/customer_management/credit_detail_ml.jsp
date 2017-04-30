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
				<h2>Credit Score Wizard Form </h2>

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
								action="<%=path%>/customer/ml_report_detail"
								novalidate="novalidate" target="_self">
								<div id="bootstrap-wizard-1" class="col-sm-12">
									<div class="form-bootstrapWizard">
										<ul class="bootstrapWizard form-wizard">
											<li class="active" data-target="#step1"><a href="#tab1"
												data-toggle="tab"> <span class="step">1</span> <span
													class="title">Credit Information 1</span>
											</a></li>
											<li data-target="#step2"><a href="#tab2"
												data-toggle="tab"> <span class="step">2</span> <span
													class="title">Credit Information 2</span>
											</a></li>
											<li data-target="#step3"><a href="#tab3"
												data-toggle="tab"> <span class="step">3</span> <span
													class="title">Credit Information 3</span>
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
												<strong>Step 1 </strong> - Credit Information
											</h3>

											<div class="row">
												<div class="col-sm-6">
													<div class="form-group">
														<div class="input-group">
															<span class="input-group-addon" data-toggle="tooltip"
																title="Please select your Status of existing checking account"><i
																class="fa fa-flag fa-lg fa-fw"></i></span> <select
																id="account_status" name="account_status"
																class="form-control input-lg">
																<option value="" selected="selected">Select
																	Account Status</option>
																<option value="A11">... &lt; 0 DM</option>
																<option value="A12"> 0 &lt;= ... &lt; 200 DM</option>
																<option value="A13">... &gt;= 200 DM / salary assignments for at least 1 year</option>
																<option value="A14">no checking account</option>

															</select>
														</div>
													</div>
												</div>
												<div class="col-sm-6">
													<div class="form-group">
														<div class="input-group">
															<span class="input-group-addon" data-toggle="tooltip"
																title="Please enter the Duration of your checking account in month">
																<i class="fa fa-map-marker fa-lg fa-fw"></i>
															</span> <input id="duration"
																class="form-control input-lg"
																placeholder="Duration in month" type="number"
																name="duration">
														</div>
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-sm-6">
													<div class="form-group">
														<div class="input-group">
															<span class="input-group-addon" data-toggle="tooltip"
																title="Please select your Credit history"><i
																class="fa fa-flag fa-lg fa-fw"></i></span> <select
																id="credit_history" name="credit_history"
																class="form-control input-lg">
																<option value="" selected="selected">Select
																	Credit history</option>
																<option value="A30">no credits taken/ all credits paid back duly</option>
																<option value="A31">all credits at this bank paid back duly</option>
																<option value="A32">existing credits paid back duly till now</option>
																<option value="A33">delay in paying off in the past</option>
																<option value="A34"> critical account/ other credits existing (not at this bank)</option>

															</select>
														</div>
													</div>
												</div>
												<div class="col-sm-6">
													<div class="form-group">
														<div class="input-group">
															<span class="input-group-addon" data-toggle="tooltip"
																title="Please select your Purpose of applying the loan"><i
																class="fa fa-flag fa-lg fa-fw"></i></span> <select
																id="purpose" name="purpose"
																class="form-control input-lg">
																<option value="" selected="selected">Select
																	Purpose</option>
																<option value="A40">car (new)</option>
																<option value="A41">car (used)</option>
																<option value="A42">furniture/equipment</option>
																<option value="A43">radio/television</option>
																<option value="A44">domestic appliances</option>
																<option value="A45">repairs</option>
																<option value="A46">education</option>
																<option value="A47">(vacation - does not exist?)</option>
																<option value="A48">retraining</option>
																<option value="A49">business</option>
																<option value="A410">others</option>
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
																title="Please enter the Amount of credit">
																<i class="fa fa-map-marker fa-lg fa-fw"></i>
															</span> <input id="credit_amount"
																class="form-control input-lg"
																placeholder="Credit amount" type="number"
																name="credit_amount">
														</div>
													</div>
												</div>
												<div class="col-sm-6">
													<div class="form-group">
														<div class="input-group">
															<span class="input-group-addon" data-toggle="tooltip"
																title="Please select your Savings account/bonds"><i
																class="fa fa-flag fa-lg fa-fw"></i></span> <select
																id="savings" name="savings"
																class="form-control input-lg">
																<option value="" selected="selected">Select
																	Savings account/bonds</option>
																<option value="A61">... &gt; 100 DM</option>
																<option value="A62">100 &gt;= ... &gt; 500 DM</option>
																<option value="A63">500 &gt;= ... &gt; 1000 DM</option>
																<option value="A64">.. &lt;= 1000 DM</option>
																<option value="A65">unknown/ no savings account</option>
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
																title="Please select your Present employment status"><i
																class="fa fa-flag fa-lg fa-fw"></i></span> <select
																id="employment" name="employment"
																class="form-control input-lg">
																<option value="" selected="selected">Select
																	Present employment since</option>
																<option value="A71">unemployed</option>
																<option value="A72">... &lt; 1 year</option>
																<option value="A73">1 &lt;= ... &lt; 4 years</option>
																<option value="A74">4 &lt;= ... &lt; 7 years</option>
																<option value="A75">.. &gt;= 7 years</option>
															</select>
														</div>
													</div>
												</div>
												<div class="col-sm-6">
													<div class="form-group">
														<div class="input-group">
															<span class="input-group-addon" data-toggle="tooltip"
																title="Please enter installment rate of disposable income">
																<i class="fa fa-map-marker fa-lg fa-fw"></i>
															</span> <input id="installment_rate"
																class="form-control input-lg"
																placeholder="Installment rate" type="number"
																name="installment_rate">
														</div>
													</div>
												</div>
											</div>
											
											<div class="row">
												<div class="col-sm-6">
													<div class="form-group">
														<div class="input-group">
															<span class="input-group-addon" data-toggle="tooltip"
																title="Please select your Personal status and sex"><i
																class="fa fa-flag fa-lg fa-fw"></i></span> <select
																id="status_sex" name="status_sex"
																class="form-control input-lg">
																<option value="" selected="selected">Select
																	Personal status and sex</option>
																<option value="A91">male : divorced/separated</option>
																<option value="A92">female : divorced/separated/married</option>
																<option value="A93">male : single</option>
																<option value="A94">male : married/widowed</option>
																<option value="A95">female : single</option>

															</select>
														</div>
													</div>
												</div>
												<div class="col-sm-6">
													<div class="form-group">
														<div class="input-group">
															<span class="input-group-addon" data-toggle="tooltip"
																title="Please select other debtors / guarantors"><i
																class="fa fa-flag fa-lg fa-fw"></i></span> <select
																id="other_debtors_guarantors" name="other_debtors_guarantors"
																class="form-control input-lg">
																<option value="" selected="selected">Select
																	other debtors / guarantors</option>
																<option value="A101">none</option>
																<option value="A102">co-applicant</option>
																<option value="A103">guarantor</option>
															</select>
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
																title="Please enter present residence time in years">
																<i class="fa fa-map-marker fa-lg fa-fw"></i>
															</span> <input id="residence_time"
																class="form-control input-lg"
																placeholder="Present Residence Time in years" type="number"
																name="residence_time">
														</div>
													</div>
												</div>
												<div class="col-sm-6">
													<div class="form-group">
														<div class="input-group">
															<span class="input-group-addon" data-toggle="tooltip"
																title="Please select your Property"><i
																class="fa fa-flag fa-lg fa-fw"></i></span> <select
																id="property" name="property"
																class="form-control input-lg">
																<option value="" selected="selected">Select
																	Property</option>
																<option value="A121">real estate</option>
																<option value="A122">if not above option: building society savings agreement/ life insurance</option>
																<option value="A123">if not above options: car or other, not saving account</option>
																<option value="A124">unknown / no property</option>
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
																title="Please enter Age in years">
																<i class="fa fa-map-marker fa-lg fa-fw"></i>
															</span> <input id="age"
																class="form-control input-lg"
																placeholder="Age in years" type="number"
																name="age">
														</div>
													</div>
												</div>
												<div class="col-sm-6">
													<div class="form-group">
														<div class="input-group">
															<span class="input-group-addon" data-toggle="tooltip"
																title="Please select other installment plans"><i
																class="fa fa-flag fa-lg fa-fw"></i></span> <select
																id="other_installment" name="other_installment"
																class="form-control input-lg">
																<option value="" selected="selected">Select
																	Other installment plans</option>
																<option value="A141">bank</option>
																<option value="A142">stores</option>
																<option value="A143">none</option>
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
																title="Please select your Housing status"><i
																class="fa fa-flag fa-lg fa-fw"></i></span> <select
																id="housing" name="housing"
																class="form-control input-lg">
																<option value="" selected="selected">Select
																	Housing</option>
																<option value="A151">rent</option>
																<option value="A152">own</option>
																<option value="A153">for free</option>
															</select>
														</div>
													</div>
												</div>
												<div class="col-sm-6">
													<div class="form-group">
														<div class="input-group">
															<span class="input-group-addon" data-toggle="tooltip"
																title="Please enter Number of existing credits at this bank">
																<i class="fa fa-map-marker fa-lg fa-fw"></i>
															</span> <input id="existing_credits"
																class="form-control input-lg"
																placeholder="Existing Credits At Bank" type="number"
																name="existing_credits">
														</div>
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-sm-6">
													<div class="form-group">
														<div class="input-group">
															<span class="input-group-addon" data-toggle="tooltip"
																title="Please select your Job status"><i
																class="fa fa-flag fa-lg fa-fw"></i></span> <select
																id="job" name="job"
																class="form-control input-lg">
																<option value="" selected="selected">Select
																	Job</option>
																<option value="A171">unemployed/ unskilled - non-resident</option>
																<option value="A172">unskilled - resident</option>
																<option value="A173">skilled employee / official</option>
																<option value="A174">management/ self-employed/highly qualified employee/ officer</option>
															</select>
														</div>
													</div>
												</div>
												<div class="col-sm-6">
													<div class="form-group">
														<div class="input-group">
															<span class="input-group-addon" data-toggle="tooltip"
																title="Please enter how many people being liable to provide maintenance for">
																<i class="fa fa-map-marker fa-lg fa-fw"></i>
															</span> <input id="number_dependents"
																class="form-control input-lg"
																placeholder="Number of people being liable to provide maintenance for" type="number"
																name="number_dependents">
														</div>
													</div>
												</div>
											</div>
											
											<div class="row">
												<div class="col-sm-6">
													<div class="form-group">
														<div class="input-group">
															<span class="input-group-addon" data-toggle="tooltip"
																title="Please select your Telephone status"><i
																class="fa fa-flag fa-lg fa-fw"></i></span> <select
																id="telephone" name="telephone"
																class="form-control input-lg">
																<option value="" selected="selected">Select
																	Telephone</option>
																<option value="A191">none</option>
																<option value="A192">yes, registered under the customers name</option>
															</select>
														</div>
													</div>
												</div>
												<div class="col-sm-6">
													<div class="form-group">
														<div class="input-group">
															<span class="input-group-addon" data-toggle="tooltip"
																title="Please select if you are a foreign worker"><i
																class="fa fa-flag fa-lg fa-fw"></i></span> <select
																id="foreign_worker" name="foreign_worker"
																class="form-control input-lg">
																<option value="" selected="selected">Foreign
																	Worker?</option>
																<option value="A201">yes</option>
																<option value="A202">no</option>
															</select>
														</div>
													</div>
												</div>
											</div>

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
													account_status : {
														required : true,
														//minlength : 2
													},
													duration : {
														required : true
													},
													credit_history : {
														required : true
													},
													purpose : {
														required : true
													},
													credit_amount : {
														required : true
													},
													savings : {
														required : true

													},
													employment : {
														required : true

													},
													installment_rate : {
														required : true,
													},
													status_sex : {
														required : true

													},
													other_debtors_guarantors : {
														required : true,
														//maxlength : 5,
														
													},
													residence_time : {
														required : true

													},
													property : {
														required : true

													},
													age : {
														required : true
													},
													other_installment : {
														required : true
													},
													housing : {
														required : true
													},
													existing_credits : {
														required : true
													},
													job : {
														required : true
													},
													number_dependents : {
														required : true
													},
													telephone : {
														required : true
													},
													foreign_worker : {
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
							/* $('#ho_selector').change(function() {
								var ho_selector = $('#ho_selector').val();
								if (ho_selector == '0' || ho_selector == '') {
									$('#ho_input').prop('disabled', true);
								} else {
									$('#ho_input').prop('disabled', false);
								}
							}).trigger('change'); */

							//validate if the employment time needed to input a value
							/* $('#employment_status').change(
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
									}).trigger('change'); */

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