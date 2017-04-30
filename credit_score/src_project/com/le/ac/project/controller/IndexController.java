package com.le.ac.project.controller;


import java.util.Date;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;

import org.apache.taglibs.standard.extra.spath.TokenMgrError;
import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.le.ac.project.model.Address;
import com.le.ac.project.model.Customer;
import com.le.ac.project.model.Lender;
import com.le.ac.project.service.UserService;
import com.le.ac.project.tool.DateTool;

@Controller
@RequestMapping("/")
public class IndexController {
	@Autowired
	UserService userService;

	@RequestMapping("/")
	public String index(HttpServletRequest request) {
		return "login";
	}
	
	@RequestMapping("to_error")
	public String toError(HttpServletRequest request){
		return "error";
	}

	@RequestMapping("login")
	public String login(HttpServletRequest request) {
		//clean the session before login
		request.getSession().invalidate();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Customer customer = new Customer();
		customer.setUsername(username);
		customer.setPassword(password);
		// get corresponding customer from database by username and pasword
		Customer c = userService.getCustomerByUEP(customer);

		// if can not find the customer, find lender from lender table
		if (c == null ) {
			Lender lender = new Lender();
			lender.setEmail(username);
			lender.setPassword(password);
			Lender l = userService.getLenderByEP(lender);
			/*
			 * set lender to http session, so that we can get the user through
			 * the website lifecycle
			 */
			if (l != null) {
				request.getSession().setAttribute("lender", l);
				return "index_frameset/bank_frameset";
			}
			String error = "password is invalid or not existed user";
			request.setAttribute("error", error);
			return "error";
		}
		if (c.getCustomerId() != null) {
			if (c.getRoleId() == 10) {
				// set customer to session
				request.getSession().setAttribute("customer", c);
				return "index_frameset/customer_frameset";
			}else if (c.getRoleId() == 1) {
				// set customer to session
				request.getSession().setAttribute("customer", c);
				return "index_frameset/admin_frameset";
			}else {
				String error3 = "customer role is invalid";
				request.setAttribute("error", error3);
				return "error";
			}
			
		}

		System.out.println("fail!");
		String error2 = "customer not found";
		request.setAttribute("error", error2);
		return "error";
	}

	@RequestMapping("header")
	public String header(HttpServletRequest request) {

		return "index_frameset/header";
	}

	@RequestMapping("left_panel")
	public String menu(HttpServletRequest request) {
		//get customer from session
		Customer customer = (Customer) request.getSession().getAttribute("customer");
		if (customer != null) {
			//if there is a customer, get its privileges then pass them to front end
			List privileges = userService.getPrivilegeByRole(customer.getRoleId());
			request.setAttribute("privileges", privileges);
			Integer role = customer.getRoleId();
			request.setAttribute("role", role);
			return "index_frameset/left";
		} else {
			//if there is no customer, get lender from session
			Lender lender = (Lender) request.getSession().getAttribute("lender");
			if (lender != null) {
				//if there is a lender, get its privileges then pass them to front end
				List privileges = userService.getPrivilegeByRole(lender.getRoleId());
				request.setAttribute("privileges", privileges);
				Integer role = lender.getRoleId();
				request.setAttribute("role", role);
				return "index_frameset/left";
			} else {
				String error = "session is invalid, please log in again";
				request.setAttribute("error", error);
				return "error";
			}
		}
	}

//	@RequestMapping("customer_content")
//	public String customerContent(HttpServletRequest request) {
//
//		return "index_frameset/customer_content";
//	}
//
//	@RequestMapping("bank_content")
//	public String bankContent(HttpServletRequest request) {
//
//		return "index_frameset/bank_content";
//	}

//	@RequestMapping("admin_content")
//	public String adminContent(HttpServletRequest request)  {
//		Customer customer = (Customer) request.getSession().getAttribute("customer");
//		List customerList = null;
//		if (customer != null) {
//			try {
//				customerList= userService.getAllCustomers(customer);
//			} catch (Exception e) {
//				e.printStackTrace();
//				
//			}
//			 
//			if (customerList.isEmpty()) {
//				String error = "no customer found";
//				return "error";
//			}
//			request.setAttribute("customerList", customerList);
//			return "index_frameset/admin_content";
//		} else {
//			return "login";
//		}
//	}

	@RequestMapping("to_register")
	public String toRegister(HttpServletRequest request) {
		return "register";
	}

	@RequestMapping("to_bank_register")
	public String toBankRegister(HttpServletRequest request) {
		return "register_bank";
	}

	@RequestMapping("add_customer")
	public String addCustomer(HttpServletRequest request) {
		// get info from front end
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String cPassword = request.getParameter("passwordConfirm");
		String firstName = request.getParameter("firstname");
		String lastName = request.getParameter("lastname");
		String gender = request.getParameter("gender");
		String bir = request.getParameter("birthday");
		Integer role = 10;
		Date birthday = new DateTool().strToDate(bir);
		if (password.equals(cPassword)) {
			Customer c = new Customer();
			c.setUsername(username);
			c.setEmail(email);
			c.setPassword(cPassword);
			c.setRoleId(role);
			c.setFirstName(firstName);
			c.setLastName(lastName);
			Integer g = Integer.parseInt(gender);
			if (g == 1) {
				c.setGender("male");
			} else if (g == 2) {
				c.setGender("female");
			}
			c.setRegisterTime(new Date());
			c.setDateOfBirth(birthday);
			boolean flag = false;
			try {
				flag = userService.addCustomer(c);
			} catch (Exception e) {
				e.printStackTrace();
			}
			if (flag == true) {
				// if successfully added customer to database
				request.getSession().setAttribute("customer", c);
				return "index_frameset/customer_frameset";
			} else {
				// if not successfully added
				String error = "fail to add customer";
				request.setAttribute("error", error);
				return "error";
			}
		} else {
			// if password is not equels to confirmPassword
			String error2 = "password is not the same as confirm password";
			request.setAttribute("error", error2);
			return "error";
		}
	}

	@RequestMapping("add_bank")
	public String addBank(HttpServletRequest request) {
		String bankname = request.getParameter("bankname");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String cPassword = request.getParameter("passwordConfirm");
		String address_1 = request.getParameter("address_1");
		String address_2 = request.getParameter("address_2");
		String postcode = request.getParameter("postcode");
		String principal = request.getParameter("principal");
		String tel = request.getParameter("tel");
		Integer role = 20;
		if (password !=null && password.equals(cPassword)) {
			// add customer, can be extracted to userService
			Lender lender = new Lender();
			lender.setName(bankname);
			lender.setEmail(email);
			lender.setPassword(password);
			lender.setType("bank");
			Address address = new Address();
			address.setAddressOne(address_1);
			address.setAddressTwo(address_2);
			address.setPostcode(postcode);
			lender.setPrincipal(principal);
			lender.setTel(tel);
			lender.setRoleId(role);
			lender.setApplyingTime(new Date());
			try {
				boolean flag = userService.addLender(lender);
				if (flag) {
					return "login";
				} else {
					return "error";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 		
		// if password is not equels to confirmPassword
		return "error";
	}
	
	@RequestMapping("access_management")
	public String accessManagement(HttpServletRequest request){
		
		return null;
	}
	
}
