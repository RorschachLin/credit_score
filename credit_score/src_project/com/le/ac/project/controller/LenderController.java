package com.le.ac.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.le.ac.project.service.UserService;

@Controller
@RequestMapping("lender")
public class LenderController {

	@Autowired
	UserService userService;
	
	
}
