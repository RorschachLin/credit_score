<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.ArrayList"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="en-us">
<head>
<meta charset="utf-8">
<!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->

<title>SmartAdmin</title>


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
<%-- <link rel="stylesheet" type="text/css" media="screen"
	href="<%=basePath%>css/smartadmin-rtl.min.css"> --%>

<!-- We recommend you use "your_style.css" to override SmartAdmin
		     specific styles this will also ensure you retrain your customization with each SmartAdmin update.-->
<link rel="stylesheet" type="text/css" media="screen"
	href="<%=basePath%>css/my_style.css">



<!-- FAVICONS -->
<link rel="shortcut icon" href="<%=basePath%>img/favicon/favicon.ico"
	type="image/x-icon">
<link rel="icon" href="<%=basePath%>img/favicon/favicon.ico"
	type="image/x-icon">

<!-- GOOGLE FONT -->
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">




</head>

<!--

	TABLE OF CONTENTS.
	
	Use search to find needed section.
	
	===================================================================
	
	|  01. #CSS Links                |  all CSS links and file paths  |
	|  02. #FAVICONS                 |  Favicon links and file paths  |
	|  03. #GOOGLE FONT              |  Google font link              |
	|  04. #APP SCREEN / ICONS       |  app icons, screen backdrops   |
	|  05. #BODY                     |  body tag                      |
	|  06. #HEADER                   |  header tag                    |
	|  07. #PROJECTS                 |  project lists                 |
	|  08. #TOGGLE LAYOUT BUTTONS    |  layout buttons and actions    |
	|  09. #MOBILE                   |  mobile view dropdown          |
	|  10. #SEARCH                   |  search field                  |
	|  11. #NAVIGATION               |  left panel & navigation       |
	|  12. #RIGHT PANEL              |  right panel userlist          |
	|  13. #MAIN PANEL               |  main panel                    |
	|  14. #MAIN CONTENT             |  content holder                |
	|  15. #PAGE FOOTER              |  page footer                   |
	|  16. #SHORTCUT AREA            |  dropdown shortcuts area       |
	|  17. #PLUGINS                  |  all scripts and plugins       |
	
	===================================================================
	
	-->

<!-- #BODY -->
<!-- Possible Classes

		* 'smart-style-{SKIN#}'
		* 'smart-rtl'         - Switch theme mode to RTL
		* 'menu-on-top'       - Switch to top navigation (no DOM change required)
		* 'no-menu'			  - Hides the menu completely
		* 'hidden-menu'       - Hides the main menu but still accessable by hovering over left edge
		* 'fixed-header'      - Fixes the header
		* 'fixed-navigation'  - Fixes the main menu
		* 'fixed-ribbon'      - Fixes breadcrumb
		* 'fixed-page-footer' - Fixes footer
		* 'container'         - boxed layout mode (non-responsive: will not work with fixed-navigation & fixed-ribbon)
	-->
<body class="">





	<!-- RIBBON -->

	<div id="ribbon">

		<span class="ribbon-button-alignment"> <span id="refresh"
			class="btn btn-ribbon" data-action="resetWidgets"
			data-title="refresh" rel="tooltip" data-placement="bottom"
			data-original-title="<i class='text-warning fa fa-warning'></i> Warning! This will reset all your widget settings."
			data-html="true"> <i class="fa fa-refresh"></i>
		</span>
		</span>

		<!-- breadcrumb -->
		<ol class="breadcrumb">
			<li>Home</li>
			<li>Tables</li>
			<li>Data Tables</li>
		</ol>
		<!-- end breadcrumb -->

		<!-- You can also add more buttons to the
				ribbon for further usability

				Example below:

				<span class="ribbon-button-alignment pull-right">
				<span id="search" class="btn btn-ribbon hidden-xs" data-title="search"><i class="fa-grid"></i> Change Grid</span>
				<span id="add" class="btn btn-ribbon hidden-xs" data-title="add"><i class="fa-plus"></i> Add</span>
				<span id="search" class="btn btn-ribbon" data-title="search"><i class="fa-search"></i> <span class="hidden-mobile">Search</span></span>
				</span> -->

	</div>
	<!-- END RIBBON -->

	<!-- MAIN CONTENT -->
	<div id="content">

		<div class="row">
			
		</div>

		<!-- widget grid -->
		<section id="widget-grid" class="">

			<!-- row -->
			<div class="row">

				<!-- NEW WIDGET START -->
				<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">


					<!-- Widget ID (each widget will need unique ID)-->
					<div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-1"
						data-widget-editbutton="false">
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
							<span class="widget-icon"> <i class="fa fa-table"></i>
							</span>
							<h2>Column Filters</h2>

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

								<script type="text/javascript">
									//-----------table sorter------------
									function sortTable(n) {
										var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
										table = document
												.getElementById("datatable_fixed_column");

										switching = true;
										//Set the sorting direction to ascending:
										dir = "asc";

										/*Make a loop that will continue until
										no switching has been done:*/
										while (switching) {
											//start by saying: no switching is done:
											switching = false;
											rows = table
													.getElementsByTagName("tr");
											/*Loop through all table rows (except the
											first, which contains table headers):*/
											for (i = 2; i < (rows.length - 1); i++) {
												//start by saying there should be no switching:

												shouldSwitch = false;
												/*Get the two elements you want to compare,
												one from current row and one from the next:*/
												x = rows[i]
														.getElementsByTagName("td")[n];
												y = rows[i + 1]
														.getElementsByTagName("td")[n];
												/* window.alert(x); */
												/*check if the two rows should switch place,
												based on the direction, asc or desc:*/
												if (dir == "asc") {
													if (x.innerHTML
															.toLowerCase() > y.innerHTML
															.toLowerCase()) {
														//if so, mark as a switch and break the loop:
														shouldSwitch = true;
														break;
													}
												} else if (dir == "desc") {
													if (x.innerHTML
															.toLowerCase() < y.innerHTML
															.toLowerCase()) {
														//if so, mark as a switch and break the loop:
														shouldSwitch = true;
														break;
													}
												}
											}
											if (shouldSwitch) {
												/*If a switch has been marked, make the switch
												and mark that a switch has been done:*/
												rows[i].parentNode
														.insertBefore(
																rows[i + 1],
																rows[i]);
												switching = true;
												//Each time a switch is done, increase this count by 1:
												switchcount++;
											} else {
												/*If no switching has been done AND the direction is "asc",
												set the direction to "desc" and run the while loop again.*/
												if (switchcount == 0
														&& dir == "asc") {
													dir = "desc";
													switching = true;
												}
											}
										}
									}
								</script>
								<form action="<%=path%>/user/delete_customer_list" method="post"
									target="_top">

									<!-- -----------------main table--------------- -->
									<table id="datatable_fixed_column"
										class="table table-striped table-bordered" width="100%">

										<thead>

											<tr>
												<th class="center"><button type="submit" class="btn btn-danger"
														data-toggle="modal" data-target="#confirm-delete">
														<i class="glyphicon glyphicon-trash"></i>
													</button></th>
												<th class="hasinput" type="checkbox"></th>
												<th class="hasinput" style="width: 10%"><input
													type="text" class="form-control" placeholder="Filter Role" />
												</th>
												<th class="hasinput" style="width: 10%"><input
													id="filter_name" onkeyup="filterName()" type="text"
													class="form-control" placeholder="Filter Name" /></th>
												<th class="hasinput" style="width: 8%"><input
													type="text" class="form-control"
													placeholder="Filter Postcode" /></th>
												<th class="hasinput" style="width: 5%"><input
													type="text" class="form-control" placeholder="Filter Age" />
												</th>
												<th class="hasinput" style="width: 10%"><input
													type="text" class="form-control" placeholder="Filter " /></th>
												<th class="hasinput" style="width: 10%"><input
													type="text" class="form-control"
													placeholder="Filter Salary" /></th>
											</tr>
											<tr>
												<th class="center"><input type="checkbox"
													name="delCust" value="all" onclick="toogle(this)"></th>
												<th onclick="sortTable(0)" data-hide="phone">Role</th>
												<th onclick="sortTable(1)" data-class="expand">Username</th>
												<th onclick="sortTable(2)">Address</th>
												<th onclick="sortTable(3)" data-hide="phone">Postcode</th>
												<th onclick="sortTable(4)" data-hide="phone,tablet">birthday</th>
												<th onclick="sortTable(5)" data-hide="phone,tablet">FirstName</th>
												<th onclick="sortTable(6)" data-hide="phone,tablet">Surname</th>
												<th onclick="sortTable(7)" data-hide="phone,tablet">Email</th>
												<th onclick="sortTable(8)" data-hide="phone,tablet">Tel</th>
												<th onclick="sortTable(9)" data-hide="phone,tablet">AddTime</th>
												<th onclick="sortTable(10)" data-hide="phone">age</th>
												<th data-hide="phone"></th>
											</tr>
										</thead>

										<tbody>

											<c:forEach var="customer" items="${customerList }">
												<tr>
								 					<td class="center"><input type="checkbox"
														name="deleteCustomer" value="${customer.customerId }"></td>
													<td>${customer.roleId }</td>
													<td>${customer.username }</td>
													<td>${customer.address.addressOne }&nbsp;${customer.address.addressTwo }</td>
													<td>${customer.address.postcode }</td>
													<td>${customer.dateOfBirth }</td>
													<td>${customer.firstName }</td>
													<td>${customer.lastName }</td>
													<td>${customer.email }</td>
													<td>${customer.mobileNum }</td>
													<td>${customer.registerTime }</td>

													<td><script>
														var bir = "${customer.dateOfBirth}";
														if (bir != "") {
															var part = bir
																	.split('-');
															var birthday = new Date(
																	part[0],
																	part[1] - 1,
																	part[2]);

															function getAge(
																	birthday) {
																var today = new Date();
																var age = today
																		.getFullYear()
																		- birthday
																				.getFullYear();
																var m = today
																		.getMonth()
																		- birthday
																				.getMonth();
																if (m < 0
																		|| (m === 0 && today
																				.getDate() < birthday
																				.getDate())) {
																	age--;
																}
																return age;
															}
															var age = getAge(birthday);
															document.write(age);
														}
													</script></td>
													<td>
													<div class="column">
													<a href="#"
														data-href="<%=path %>/user/delete_customer?customerId=${customer.customerId }"
														data-toggle="modal" data-target="#confirm-delete"
														target="_top"> <span class="glyphicon glyphicon-trash"></span>
													</a>
													<a href="<%=path%>/user/to_update_customer?customerId=${customer.customerId }" target="_self"> <span class=""><i
															class="glyphicon glyphicon-info-sign"></i></span>
													</a>
													</div>
													</td>
													
												</tr>


											</c:forEach>

										</tbody>

									</table>

									<!-- ------------------table end -------------------- -->
								</form>

								<!-- ----------delete confirm pop up----------- -->
								<div class="modal fade" id="confirm-delete" tabindex="-1"
									role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">

											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">&times;</button>
												<h4 class="modal-title" id="myModalLabel">Confirm
													Delete</h4>
											</div>

											<div class="modal-body">
												<p>You are about to delete one track, this procedure is
													irreversible.</p>
												<p>Do you want to proceed?</p>
												<p class="debug-url"></p>
											</div>

											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">Cancel</button>
												<a class="btn btn-danger btn-ok">Delete</a>
											</div>
										</div>
									</div>
								</div>

								<!-- ----------delete confirm pop up----------- -->

							</div>
							<!-- end widget content -->

						</div>
						<!-- end widget div -->

					</div>
					<!-- end widget -->





				</article>
				<!-- WIDGET END -->

			</div>

			<!-- end row -->

			<!-- end row -->

		</section>
		<!-- end widget grid -->

	</div>
	<!-- END MAIN CONTENT -->

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
	<!-- <script data-pace-options='{ "restartOnRequestAfter": true }'
		src="../s/plugin/pace/pace.min.js"></script> -->

	<!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
	<script src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
	<!-- <script>
		if (!window.jQuery) {
			document
					.write('<script src="../js/libs/jquery-2.1.1.min.js"><\/script>');
		}
	</script>

	<script
		src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
	<script>
		if (!window.jQuery.ui) {
			document
					.write('<script src="../js/libs/jquery-ui-1.10.3.min.js"><\/script>');
		}
	</script> -->


	<!-- IMPORTANT: APP CONFIG -->
	<script src="js/app.config.js"></script>

	<!-- JS TOUCH : include this plugin for mobile drag / drop touch events-->
	<script src="js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script>

	<!-- BOOTSTRAP JS -->
	<script src="<%=basePath%>js/bootstrap/bootstrap.min.js"></script>

	<!-- CUSTOM NOTIFICATION -->
	<script src="js/notification/SmartNotification.min.js"></script>

	<!-- JARVIS WIDGETS -->
	<script src="js/smartwidgets/jarvis.widget.min.js"></script>

	<!-- EASY PIE CHARTS -->
	<script src="js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>






	<!--[if IE 8]>

		<h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>

		<![endif]-->



	<!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
	<!-- Voice command : plugin -->
	<script src="../js/speech/voicecommand.min.js"></script>

	<!-- SmartChat UI : plugin -->
	<script src="../js/smart-chat-ui/smart.chat.ui.min.js"></script>
	<script src="../js/smart-chat-ui/smart.chat.manager.min.js"></script>

	<!-- PAGE RELATED PLUGIN(S) -->
	<script src="js/plugin/datatables/jquery.dataTables.min.js"></script>
	<script src="../js/plugin/datatables/dataTables.colVis.min.js"></script>
	<script src="../js/plugin/datatables/dataTables.tableTools.min.js"></script>
	<script src="../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
	<script
		src="../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>

	<script>
	//select all button
	function toogle(source) {
		//get all checkbox named deleteCustomer
		  var checkboxes = document.getElementsByName('deleteCustomer');
		  //check all of them
		  for(var i=0, n=checkboxes.length;i<n;i++) {
		    checkboxes[i].checked = source.checked;
		  }
		}

	
		$('#confirm-delete').on(
				'show.bs.modal',
				function(e) {
					//alert("delete");
					$(this).find('.btn-ok').attr('href',
							$(e.relatedTarget).data('href'));
					$(this).find('.btn-ok').attr('target', "_top");
					//alert($(e.relatedTarget).data('href'));
					//$('.debug-url').html('Delete URL: <strong>' + $(this).find('.btn-ok').attr('href') + '</strong>');
				});
	</script>

	<script type="text/javascript">
		/* -----------filters------------ */
		function filterFunction(input, table) {
			// Declare variables 
			var filter, tr, td, i;
			// input = document.getElementById("filter_namee");
			//alert(input);
			filter = input.value.toUpperCase();
			// table = document.getElementById("datatable_fixed_column");
			tr = table.getElementsByTagName("tr");

			// Loop through all table rows, and hide those who don't match the search query
			for (i = 0; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td")[0];
				if (td) {
					if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}
		}
		function filterName() {
			var table = document.getElementById("datatable_fixed_column");
			var input = document.getElementById("filter_name");
			//alert(input);
			filterFunction(input, table);
		}
	</script>
</body>

</html>