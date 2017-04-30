package com.le.ac.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.le.ac.project.model.CreditReport;
import com.le.ac.project.model.Lender;
import com.le.ac.project.service.UserService;

@Controller
@RequestMapping("lender")
public class LenderController {

	@Autowired
	UserService userService;
	
	@RequestMapping("bank_content")
	public String bankContent(HttpServletRequest request) {
		
		return "";
	}
	
	@RequestMapping("all_reports")
	public String reportsDis(HttpServletRequest request){
		List fReportList = userService.getAllFicoReports();
		if (fReportList == null) {
			String error = "no fico report found";
			request.setAttribute("error", error);
			return "error";
		}
		return null;
	}
	
}
