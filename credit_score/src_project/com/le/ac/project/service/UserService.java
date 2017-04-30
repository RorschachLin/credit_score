package com.le.ac.project.service;

import java.util.List;

import org.springframework.security.core.userdetails.User;

import com.le.ac.project.model.CreditReport;
import com.le.ac.project.model.CreditReportMl;
import com.le.ac.project.model.Customer;
import com.le.ac.project.model.Lender;
import com.le.ac.project.model.Privilege;

public interface UserService {
	
	
//	public Customer getCustomerByEP(Customer customer);
	
	/**
	 * get customer by username/email and password
	 * @param customer
	 * @return
	 * @author	Lin
	 */
	public Customer getCustomerByUEP(Customer customer); 
	
	/**
	 * get all privilege
	 * @return
	 * @author	Lin
	 */
	public List<Privilege> getAllPrivilege();
	
	public List getPrivilegeByRole(Integer role);
	
	public Customer getCustomerById(Customer customer);
	
	public Lender getLenderById(Lender lender);
	
	public List getAllCustomers(Customer customer) throws Exception;
	
	public Customer getCustomerByUname(Customer customer);
	
	public boolean addCustomer(Customer customer) throws Exception;
	
	public boolean addCreditReport(CreditReport report) throws Exception;
	
	public boolean addMlReport(CreditReportMl mlReport); 
	
	public boolean addOrUpdateCustomer(Customer customer);
	
	
	
	public boolean existUsername(Customer customer);
	
//	public Integer getAge(Customer customer);
	
	/**
	 * change date with yyyy-mm-dd format to Date()
	 * @param date
	 * @return
	 * @author	Lin
	 */
//	public Date strToDate(String date);
	
	
	public boolean addLender(Lender lender) throws Exception;
	
	/**
	 * get lender by email and password
	 * @param lender
	 * @return
	 * @throws Exception
	 * @author Lin
	 */
	public Lender getLenderByEP(Lender lender);
	
	/**
	 * get all lender that validated
	 * @return
	 * @author Lin
	 */
	public List getValidatedLender();
	
	/**
	 * set/update lender.isDeleted as 1
	 * @param lender
	 * @return
	 * @author Lin
	 */
	public boolean deleteLenderById(Lender lender);
	
	/**
	 * set/update customer.isDeleted as 1
	 * @param customer
	 * @return
	 * @author Lin
	 */
	public boolean deleteCustomerById(Customer customer);
	
	public boolean updateCustomer(Customer customer);
	
	public boolean updateLender(Lender lender);
	
	/**
	 * get all lenders from database
	 * @return list of lender objects
	 * @author Lin
	 */
	public List getAllLender(Customer admin);
	
	/**
	 * find the latest report of the customer
	 * @param customer
	 * @return
	 * @throws NullPointerException
	 * @author Lin
	 */
	public CreditReport getLatestReport(Customer customer) throws NullPointerException;
	
	/**
	 * find all the reports of a certain customer
	 * @param customer
	 * @return
	 * @throws NullPointerException
	 * @author Lin
	 */
	public List getReportsByCust(Customer customer) throws NullPointerException;
	
	public CreditReport getReportById(Integer reportId);
	
	public List getAllFicoReports();
	
	public CreditReportMl getMlReportById(Integer mlReportId);
	
	public List getMlReportsByCust(Customer customer);
	
	/**
	 * get the ml reports which repay probabilities are higher than parameter
	 * @param probability
	 * @return
	 */
	public List getMlReportByProH(Double probability);
	
	/**
	 * get the ml reports which repay probabilities are higher than parameter
	 * @param probability
	 * @return
	 */
	public List getFicoReportByProH(Double probability);
	
	public List getFicoReportByCSH (Integer cScore);
	
//	public boolean deleteCustomerListById(List<Customer> customerList);
}
