package com.le.ac.project.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.property.IndexPropertyAccessor.IndexGetter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.le.ac.project.model.CreditReport;
import com.le.ac.project.model.CreditReportMl;
import com.le.ac.project.model.Customer;
import com.le.ac.project.model.Greeting;
import com.le.ac.project.model.ReportSuggestion;
import com.le.ac.project.service.UserService;
import com.le.ac.project.tool.RestError;

@RestController
@RequestMapping("rest")
public class RestfulController {

	@Autowired
	UserService userService;

	private static final String template = "Hello, %s!";
	private final AtomicLong counter = new AtomicLong();
	
	/**
	 * testing
	 * @param name
	 * @param request
	 * @return
	 */
	@RequestMapping("greeting")
	public Greeting greeting(@RequestParam(value = "name", defaultValue = "World") String name,
			HttpServletRequest request) {
		String username = request.getParameter("username");
		return new Greeting(counter.incrementAndGet(), String.format(template, name));

	}

	@RequestMapping("find_customer")
	public Object findCustomer(HttpServletRequest request) {
		String username = request.getParameter("username");
		Customer c = new Customer();
		c.setUsername(username);
		Customer customer = userService.getCustomerByUname(c);
		if (customer == null) {
			RestError error = new RestError();
			error.setError("customer not found");
			return error;
		}
		return customer;
	}

	/**
	 * Get the fico reports of customer named hahah Usage:
	 * http://localhost:8080/creditscoresys/rest/find_fico_report?username=hahah
	 * 
	 * @param request
	 * @return an object and the object will transform to a json object by Jackson 
	 */
	@RequestMapping("find_fico_report")
	public Object ficoReport(HttpServletRequest request) {
		String username = request.getParameter("username");
		if (username == null || username.equals("")) {
			RestError error = new RestError();
			error.setError("Input url is not valid, Please input in format: http://localhost:8080/creditscoresys/rest/find_fico_report?username=<username>");
			return error;
		}
		Customer c = new Customer();
		c.setUsername(username);
		Customer customer = userService.getCustomerByUname(c);
		if (customer == null) {
			RestError error = new RestError();
			error.setError("customer not found");
			return error;
		}
		CreditReport cr = new CreditReport();
		List crList = userService.getReportsByCust(customer);
		if (crList == null) {
			RestError error = new RestError();
			error.setError("no fico report related to this customer");
			return error;
		}
		return crList;
	}

	/**
	 * Get the ml reports of customer named hahah Usage:
	 * http://localhost:8080/creditscoresys/rest/find_ml_report?username=hahah
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("find_ml_report")
	public Object mlReport(HttpServletRequest request) {
		String username = request.getParameter("username");
		if (username == null || username.equals("")) {
			RestError error = new RestError();
			error.setError("Input url is not valid, Please input in format: http://localhost:8080/creditscoresys/rest/find_ml_report?username=<username>");
			return error;
		}
		Customer c = new Customer();
		c.setUsername(username);
		Customer customer = userService.getCustomerByUname(c);
		if (customer == null) {
			RestError error = new RestError();
			error.setError("customer not found");
			return error;
		}
		CreditReportMl mr = new CreditReportMl();
		List mrList = userService.getMlReportsByCust(customer);
		if (mrList == null) {
			RestError error = new RestError();
			error.setError("no ml report related to this customer");
			return error;
		}

		return mrList;
	}

	/**
	 * Get the ml reports which repay probability is greater than 0.7
	 * http://localhost:8080/creditscoresys/rest/ml_probability_higher?probability=0.7
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("ml_probability_higher")
	public Object mlProbabilityH(HttpServletRequest request) {
		String probability = request.getParameter("probability");
		if (probability == null || probability.equals("")) {
			RestError error = new RestError();
			error.setError("Input url is not valid, Please input in format: http://localhost:8080/creditscoresys/rest/ml_probability_higher?probability=<probability>");
			return error;
		}
		List<CreditReportMl> mlReportList = new ArrayList<>();
		mlReportList = userService.getMlReportByProH(Double.parseDouble(probability));
		if (mlReportList == null) {
			RestError error = new RestError();
			error.setError("no such report found");
			return error;
		}
		return mlReportList;
	}
	
	/**
	 * Get the fico reports which repay probability is greater than 0.7
	 * http://localhost:8080/creditscoresys/rest/fico_probability_higher?probability=0.7
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("fico_probability_higher")
	public Object ficoProbabilityH(HttpServletRequest request) {
		String probability = request.getParameter("probability");
		if (probability == null || probability.equals("")) {
			RestError error = new RestError();
			error.setError("Input url is not valid, Please input in format: http://localhost:8080/creditscoresys/rest/fico_probability_higher?probability=<probability>");
			return error;
		}
		List<CreditReportMl> ficoReportList = new ArrayList<>();
		ficoReportList = userService.getFicoReportByProH(Double.parseDouble(probability));
		if (ficoReportList == null) {
			RestError error = new RestError();
			error.setError("no such report found");
			return error;
		}
		return ficoReportList;
	}
	
	/**
	 * Get the fico reports which repay probability is greater than 0.7
	 * http://localhost:8080/creditscoresys/rest/creditscore_higher?score=<CreditScore>
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("creditscore_higher")
	public Object creditScoreH(HttpServletRequest request) {
		String score = request.getParameter("score");
		if (score == null || score.equals("")) {
			RestError error = new RestError();
			error.setError("Input url is not valid, Please input in format: http://localhost:8080/creditscoresys/rest/creditscore_higher?score=<CreditScore>");
			return error;
		}
		List<CreditReportMl> ficoReportList = new ArrayList<>();
		ficoReportList = userService.getFicoReportByCSH(Integer.parseInt(score));
		if (ficoReportList == null) {
			RestError error = new RestError();
			error.setError("no such report found");
			return error;
		}
		return ficoReportList;
	}
	

}
