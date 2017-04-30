<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" media="screen" href="<%=basePath%>css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="<%=basePath%>css/font-awesome.min.css">

	<!-- SmartAdmin Styles : Caution! DO NOT change the order -->
	<link rel="stylesheet" type="text/css" media="screen" href="<%=basePath%>css/smartadmin-production-plugins.min.css">
	<link rel="stylesheet" type="text/css" media="screen" href="<%=basePath%>css/smartadmin-production.min.css">
	<link rel="stylesheet" type="text/css" media="screen" href="<%=basePath%>css/smartadmin-skins.min.css">
	<link rel="stylesheet" type="text/css" media="screen" href="<%=basePath%>css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=basePath%>css/bootstrap-submenu.min.css">
</head>
<body>
	<br/><br/>
	<h2>FICO Report:</h2>
	<section id="widget-grid" class="">

			<!-- row -->
			<div class="row">

				<!-- NEW WIDGET START -->
				<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

					<div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-0" data-widget-editbutton="false">
						
						<header>
							<span class="widget-icon"> <i class="fa fa-table"></i> </span>
							<h2>The FICO Reports</h2>

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
								
								
								<div class="table-responsive">
								
									<table class="table table-bordered">
										<thead>
											<tr>
												<th>Bank</th>
												<th>Probability by FICO</th>
											</tr>
										</thead>
										<tbody>
<c:forEach items="${bankProbability }" var="entry">
<%-- <h3>The probability of getting loan from ${entry.key }: ${entry.value }%</h3> --%>
	<tr>
		<td>${entry.key }</td>
		<td>${entry.value }%</td>
	</tr>
</c:forEach>

										</tbody>
									</table>
									
								</div>
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


		</section>
		<!-- end widget grid -->
	<!----------------------------------- end table 1 ------------------------>





	<script data-pace-options='{ "restartOnRequestAfter": true }' src="<%=basePath%>js/plugin/pace/pace.min.js"></script>

	<!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script>
		if (!window.jQuery) {
			document.write('<script src="<%=basePath%>js/libs/jquery-2.1.1.min.js"><\/script>');
		}
	</script>


	<!-- IMPORTANT: APP CONFIG -->
	<script src="<%=basePath%>js/app.config.js"></script>

	<!-- BOOTSTRAP JS -->
	<script src="<%=basePath%>js/bootstrap/bootstrap.min.js"></script>

	<!-- JARVIS WIDGETS -->
	<script src="<%=basePath%>js/smartwidgets/jarvis.widget.min.js"></script>

	<!-- MAIN APP JS FILE -->
	<script src="<%=basePath%>js/app.min.js"></script>
	
	<script src="<%=basePath %>js/bootstrap-submenu.min.js"></script>
	<script src="<%=basePath%>js/plugin/chartjs/chart.min.js"></script>

	<script type="text/javascript">
		// DO NOT REMOVE : GLOBAL FUNCTIONS!
		$(document).ready(function() {
			pageSetUp();
		})
	
	</script>
</body>
</html>