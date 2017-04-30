<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<!-- Basic Styles -->
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
<c:if test="${empty creditReportList }">
	<p>The system can not find your details. Please <a href="<%=path %>/customer/to_credit_detail">enter your personal credit details</a> to get the credit score and the probability of getting the loan</p>
</c:if>
<c:if test="${not empty creditReportList }">
<h4>Generated Time: <fmt:formatDate value="${currentCreditReport.reportTime }" pattern="yyyy-MM-dd HH:mm:ss" /></h4>
<div style="padding-left:2px;" class="dropdown">
  <button class="btn btn-default" type="button" data-toggle="dropdown">
    Select Report
    <span class="caret"></span>
  </button>
 
<ul class="dropdown-menu" role="menu">
	<c:forEach var="creditReport" items="${creditReportList }">
  		<li><a tabindex="0" href="<%=path %>/customer/credit_report?report_id=${creditReport.reportId }&ml_report_id=${ml_report_id}" target="_self"><fmt:formatDate value="${creditReport.reportTime }" pattern="yyyy-MM-dd HH:mm:ss" /></a></li>
  	</c:forEach>
</ul>

</div>
<h1>Credit Score: ${currentCreditReport.creditScore }</h1>
<h2>Details of the scores: </h2>
<%-- <ul>
<li>employmentStatusScore: ${currentCreditReport.employmentStatusScore }</li>
<li>employmentTimeScore: ${currentCreditReport.employmentTimeScore }</li>
<li>residentialScore: ${currentCreditReport.residentialScore }</li>
<li>cardAmountScore: ${currentCreditReport.cardAmountScore }</li>
<li>loanProportionScore: ${currentCreditReport.loanProportionScore }</li>
<li>mortgageScore: ${currentCreditReport.mortgageScore }</li>
<li>pastDueScore: ${currentCreditReport.pastDueScore }</li>
<li>bankruptScore: ${currentCreditReport.bankruptScore }</li>
</ul> --%>
<div class="widget-body">
	<canvas id="radarChart" width="-500" height="-500" style="border:1px"></canvas>
</div>
<%-- <h2>The probability of getting loan from BankA: ${probabilityA }%</h2>
<h2>The probability of getting loan from BankB: ${probabilityB }%</h2>
<h2>The probability of getting loan from BankC: ${probabilityC }%</h2>
<h2>The probability of getting loan from BankD: ${probabilityD }%</h2> --%>

<%-- <c:forEach items="${bankProbability }" var="entry">
	<h3>The probability of getting loan from ${entry.key }: ${entry.value }%</h3>
	
</c:forEach> --%>
<br /><br /><br /><br />
<h2>Probability of each bank by FICO:</h2>
<!---------------------------------------- table 1 -------------------------->
		<section id="widget-grid" class="">

					<!-- row -->
					<div class="row">

						<!-- NEW WIDGET START -->
						<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

							<!-- Widget ID (each widget will need unique ID)-->
							<div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-0" data-widget-editbutton="false">
								
								<header>
									<span class="widget-icon"> <i class="fa fa-table"></i> </span>
									<h2>The probability of getting loan</h2>

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
	<div>
		<p>Probability is too low? Try enter another credit amount and see what you can get</p>

	</div>

	<form action="<%=path %>/customer/other_loan_amount_fico">
		<div class="col-xs-2"><!-- change the input group size -->
			<div class="input-group">
				<input class="form-control" placeholder="Another loan amount" type="number" name="amount_loan" style="width: 300px;" /> 
				<span class="input-group-btn">
					<button type="submit" class="btn btn-default">Submit</button>
				</span>
			</div>
			<!-- /input-group -->
		</div>
		<input type="hidden" name="report_id" value="${report_id}">
		<input type="hidden" name="ml_report_id" value="${ml_report_id}">
	</form>	

	</c:if>

<div>
<br/> <br/>

<c:if test="empty currentMlReport">
	<p>Want to get more accurate probability? Click <a href="<%=path %>/customer/to_ml_report_detail">here</a></p>
</c:if>
<c:if test="${not empty currentMlReport }">
<h2>Probability of each bank by Machine Learning:</h2>
	<h4>Generated Time: <fmt:formatDate value="${currentMlReport.reportTime }" pattern="yyyy-MM-dd HH:mm:ss" /></h4>
	<div style="padding-left:2px;" class="dropdown">
  		<button class="btn btn-default" type="button" data-toggle="dropdown">
    Select Report
    			<span class="caret"></span>
  		</button>
 
		<ul class="dropdown-menu" role="menu">
			<c:forEach var="mlReport" items="${mlReportList }">
  				<li><a tabindex="0" href="<%=path %>/customer/credit_report?ml_report_id=${mlReport.mlReportId }&report_id=${report_id}" target="_self"><fmt:formatDate value="${mlReport.reportTime }" pattern="yyyy-MM-dd HH:mm:ss" /></a></li>
  			</c:forEach>
		</ul>

	</div>
	<br/>
	<!---------------------------------------- table 2 -------------------------->
		<section id="widget-grid" class="">

					<!-- row -->
					<div class="row">

						<!-- NEW WIDGET START -->
						<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

							<!-- Widget ID (each widget will need unique ID)-->
							<div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-1" data-widget-editbutton="false">
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
									<span class="widget-icon"> <i class="fa fa-table"></i> </span>
									<h2>The probability of getting loan</h2>

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
														<th>Probability by ML</th>
													</tr>
												</thead>
												<tbody>
	<c:forEach items="${bankMlProbability }" var="entry">
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
	<!----------------------------------- end table 2 ------------------------>
	
</c:if>
</div>

<%-- <c:forEach items="${bankMlProbability }" var="entry">
	<h3>The probability of getting loan from ${entry.key }: ${entry.value }%</h3>
</c:forEach> --%>


<!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
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

<script>
//radar chart

var employmentStatusScore = ${currentCreditReport.employmentStatusScore};
var employmentTimeScore = ${currentCreditReport.employmentTimeScore};
var residentialScore = ${currentCreditReport.residentialScore};
var cardAmountScore = ${currentCreditReport.cardAmountScore};
var loanProportionScore = ${currentCreditReport.loanProportionScore};
var mortgageScore = ${currentCreditReport.mortgageScore};
var pastDueScore = ${currentCreditReport.pastDueScore};
var bankruptScore = ${currentCreditReport.bankruptScore};
var ctx = document.getElementById("radarChart");

var myChart = new Chart(ctx, {
    type: 'radar',
			        data: {
			            labels: ["employmentStatus", "employmentTime", "residential", "cardAmount", "loanProportion", "mortgage", "pastDue", "bankrupt"],
			            datasets: [{
			                label: "Detail Score",
			                backgroundColor: "rgba(220,220,220,0.2)",
			                pointBackgroundColor: "rgba(220,220,220,1)",
			                data: [employmentStatusScore, employmentTimeScore, residentialScore, cardAmountScore, loanProportionScore, mortgageScore, pastDueScore, bankruptScore]
			            },]
			        },
			        options: {
			            //legend: {
			                //position: 'top',
			            //}, 
			            
			            scale: {
			              //reverse: false,
			              ticks: {
			            	  
			            	  beginAtZero: false,
			            	  min: -50,
			            	  max: 50,
			            	  fixedStepSize: 20
			              }
			            }
			        }
});
</script>



		

		<script type="text/javascript">
		// DO NOT REMOVE : GLOBAL FUNCTIONS!
		$(document).ready(function() {
			pageSetUp();
		})
	
		</script>
		
</body>
</html>