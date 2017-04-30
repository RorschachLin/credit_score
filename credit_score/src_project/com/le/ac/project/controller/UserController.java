package com.le.ac.project.controller;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.le.ac.project.model.Address;
import com.le.ac.project.model.Customer;
import com.le.ac.project.model.Lender;
import com.le.ac.project.service.UserService;
import com.le.ac.project.tool.DateTool;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	UserService userService;

	@RequestMapping("register")
	public String register(HttpServletRequest request) {
		return "register";
	}

	@RequestMapping("admin_content")
	public String adminContent(HttpServletRequest request) {
		Customer customer = (Customer) request.getSession().getAttribute("customer");
		List customerList = null;
		if (customer != null) {
			try {
				customerList = userService.getAllCustomers(customer);
			} catch (Exception e) {
				e.printStackTrace();

			}

			if (customerList.isEmpty()) {
				String error = "no customer found";
				request.setAttribute("error", error);
				return "error";
			}
			request.setAttribute("customerList", customerList);
			return "index_frameset/admin_content";
		} else {
			String error = "session expired, please log in again";
			request.setAttribute("error", error);
			return "error";
		}
	}

	@RequestMapping("lender_management")
	public String lenderManagement(HttpServletRequest request) {
		Customer customer = (Customer) request.getSession().getAttribute("customer");
		if (customer == null) {
			String error2 = "session expired, please log in again";
			request.setAttribute("error", error2);
			return "error";
		}else {
			if (customer.getRoleId() != 1) {
				String error = "you do not have authority to access this page";
				request.setAttribute("error", error);
				return "error";
			}else {
				List lenderList = userService.getAllLender(customer);
				if (lenderList.isEmpty()) {
					System.out.println("no lender found");
					String error = "no lender found: no authority or no lender in database";
					request.setAttribute("error", error);
					return "error";
				}
				request.setAttribute("lenderList", lenderList);
				return "user_management/lender_management";
			}
		}
	}

	@RequestMapping("customer_content")
	public String customerContent(HttpServletRequest request) {
		
		return "index_frameset/customer_content";
	}

	@RequestMapping("bank_content")
	public String bankContent(HttpServletRequest request) {

		return "index_frameset/bank_content";
	}

	@RequestMapping("delete_customer")
	public String deleteCustomer(HttpServletRequest request) {
		String customerId = request.getParameter("customerId");
		Integer id = Integer.parseInt(customerId);
		Customer customer = new Customer();
		customer.setCustomerId(id);
		boolean flag = userService.deleteCustomerById(customer);
		if (flag) {
			return "index_frameset/admin_frameset";
		}
		String error = "customer is not deleted";
		request.setAttribute("error", error);
		return "error";
	}

	@RequestMapping("delete_lender")
	public String deleteLender(HttpServletRequest request) {
		String lenderId = request.getParameter("lenderId");
		Integer id = Integer.parseInt(lenderId);
		Lender lender = new Lender();
		lender.setLenderId(id);
		boolean flag = userService.deleteLenderById(lender);
		if (flag) {
			return lenderManagement(request);
		}
		String error = "lender is not deleted";
		request.setAttribute("error", error);
		return "error";
	}

	/**
	 * batch remove (list)
	 * 
	 * @param request
	 * @return
	 * @author Lin
	 */
	@RequestMapping("delete_customer_list")
	public String deleteCustomerList(HttpServletRequest request) {
		// get the set of customers that need to be deleted
		String[] customerArray = request.getParameterValues("deleteCustomer");
		// if null, return error
		if (customerArray == null || customerArray.length == 0) {
			String error = "no customer selected";
			request.setAttribute("error", error);
			return "error";
		}
		// if not null, invoke function of delete customer by id
		for (String string : customerArray) {
			Customer customer = new Customer();
			customer.setCustomerId(Integer.parseInt(string));
			boolean flag = userService.deleteCustomerById(customer);
			if (!flag) {
				System.out.println("customer delete fail");
				String error = "fail to delete customer";
				request.setAttribute("error", error);
				return "error";
			}
		}
		return "index_frameset/admin_frameset";
	}

	/**
	 * batch remove
	 * 
	 * @param request
	 * @return
	 * @author Lin
	 */
	@RequestMapping("delete_lender_list")
	public String deleteLenderList(HttpServletRequest request) {
		// get the set of customers that need to be deleted
		String[] lenderArray = request.getParameterValues("deleteLender");
		// if null, return error
		if (lenderArray.length == 0) {
			String error = "no lender selected";
			request.setAttribute("error", error);
			return "error";
		}
		// if not null, invoke function of delete customer by id
		for (String string : lenderArray) {
			Lender lender = new Lender();
			lender.setLenderId(Integer.parseInt(string));
			boolean flag = userService.deleteLenderById(lender);
			if (!flag) {
				String error = "fail to delete lender";
				request.setAttribute("error", error);
				return "error";
			}
		}
		return lenderManagement(request);
	}

	/**
	 * from user table to customer updating page
	 * 
	 * @param request
	 * @return
	 * @author Lin
	 */
	@RequestMapping("to_update_customer")
	public String toUpdateCustomer(HttpServletRequest request) {
		String id = request.getParameter("customerId");
		Customer c = new Customer();
		c.setCustomerId(Integer.parseInt(id));
		Customer customer = userService.getCustomerById(c);
		if (customer != null) {
			request.setAttribute("updateCust", customer);
			return "user_management/update_customer";
		}
		System.out.println("customer not found");
		String error = "customer not found";
		request.setAttribute("error", error);
		return "error";
	}
	
	/**
	 * from user table to customer updating page
	 * 
	 * @param request
	 * @return
	 * @author Lin
	 */
	@RequestMapping("to_update_lender")
	public String toUpdateLender(HttpServletRequest request) {
		String id = request.getParameter("lenderId");
		Lender l = new Lender();
		l.setLenderId(Integer.parseInt(id));
		Lender lender = userService.getLenderById(l);
		if (lender != null) {
			request.setAttribute("updateLender", lender);
			return "user_management/update_lender";
		}
		String error = "lender not found";
		request.setAttribute("error", error);
		return "error";
	}

	@RequestMapping("update_customer")
	public String updateCustomer(HttpServletRequest request) {
		// get parameters from update form
		Integer cid = Integer.parseInt(request.getParameter("customer_id"));
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String firstName = request.getParameter("first_name");
		String lastName = request.getParameter("last_name");
		String role = request.getParameter("role");
		String tel = request.getParameter("tel");
		String addressOne = request.getParameter("address_one");
		String addressTwo = request.getParameter("address_two");
		String postcode = request.getParameter("postcode");
		String birthDate = request.getParameter("birth_date");
		Date birthday = new DateTool().strToDate(birthDate);
		String email = request.getParameter("email");
		//find the corresponding customer from database
		Customer c = new Customer();
		c.setCustomerId(cid);
		Customer customer = userService.getCustomerById(c);
		//reset the changed attribute of the customer
		customer.setUsername(username);
		customer.setPassword(password);
		customer.setFirstName(firstName);
		customer.setLastName(lastName);
		customer.setRoleId(Integer.parseInt(role));
		customer.setMobileNum(tel);
		//get the address then update the changes 
		Address address = customer.getAddress();
		if (address != null) {
			address.setAddressOne(addressOne);
			address.setAddressTwo(addressTwo);
			address.setPostcode(postcode);
			customer.setAddress(address);
		}
		customer.setDateOfBirth(birthday);
		customer.setEmail(email);
		customer.setUpdateTime(new Date());
		//update the changed customer. 
		boolean flag = userService.updateCustomer(customer);
		if (flag) {
			//If success, go back to customer management page
			return adminContent(request);
		}
		String error = "update fail";
		request.setAttribute("error", error);
		return "error";
	}
	
	@RequestMapping("update_lender")
	public String updateLender(HttpServletRequest request) {
		// get parameters from update form
		Integer lid = Integer.parseInt(request.getParameter("lender_id"));
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String role = request.getParameter("role");
		String tel = request.getParameter("tel");
		String addressOne = request.getParameter("address_one");
		String addressTwo = request.getParameter("address_two");
		String postcode = request.getParameter("postcode");
		String appTime = request.getParameter("applying_time");
		Date applyingTime = null;
		Date authorizedTime = null;
		try {
			applyingTime = new DateTool().strToTimestamp(appTime);
			String autTime = request.getParameter("authorized_time");
			authorizedTime = new DateTool().strToTimestamp(autTime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//find the corresponding lender from database
		Lender l = new Lender();
		l.setLenderId(lid);
		Lender lender = userService.getLenderById(l);
		//reset the changed attribute of the lender
		lender.setEmail(email);
		lender.setPassword(password);
		lender.setName(name);
		lender.setRoleId(Integer.parseInt(role));
		lender.setTel(tel);
		//get the address then update the changes 
		Address address = lender.getAddress();
		if (address != null) {
			address.setAddressOne(addressOne);
			address.setAddressTwo(addressTwo);
			address.setPostcode(postcode);
			lender.setAddress(address);
		}
		lender.setApplyingTime(applyingTime);
		lender.setAuthorizedTime(authorizedTime);
		lender.setUpdateTime(new Date());
		//update the changed lender. 
		boolean flag = userService.updateLender(lender);
		if (flag) {
			//If success, go back to lender management page
			return lenderManagement(request);
		}
		String error = "update fail";
		request.setAttribute("error", error);
		return "error";
	}

	@RequestMapping("authorize_lender")
	public String authorizeLender(HttpServletRequest request) {
		String id = request.getParameter("lenderId");
		// if id can be passed from front end to back end
		if (id != "" || id != null) {
			Integer lenderId = Integer.parseInt(id);
			Lender l = new Lender();
			l.setLenderId(lenderId);
			// find the corresponding lender from database
			Lender lender = userService.getLenderById(l);
			//if lender is valid
			if (lender != null) {
				//and if lender is not authorized, return error
				if (lender.getAuthorizedTime() != null) {
					String error = "lender is authorized already";
					request.setAttribute("error", error);
					return "error";
				}else {
					// set now as the authorized time
					lender.setAuthorizedTime(new Date());
					userService.updateLender(lender);
					// if update success, go back to the lender management page
					// through lender management controller
					return lenderManagement(request);
				}
				
			} else {
				String error2 = "lender not found in database";
				request.setAttribute("error", error2);
				return "error";
			}
		}
		String error = "no lender id";
		request.setAttribute("error", error);
		return "error";
	}

	
	
}
