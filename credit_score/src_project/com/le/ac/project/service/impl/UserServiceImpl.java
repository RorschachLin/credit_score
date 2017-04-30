package com.le.ac.project.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.le.ac.core.dao.HibernateDao;
import com.le.ac.core.hibernate.SimpleHibernateDaoImpl;
import com.le.ac.project.model.CreditReport;
import com.le.ac.project.model.CreditReportMl;
import com.le.ac.project.model.Customer;
import com.le.ac.project.model.Lender;
import com.le.ac.project.model.Privilege;
import com.le.ac.project.model.ReportSuggestion;
import com.le.ac.project.model.RolePrivilege;
import com.le.ac.project.service.UserService;

@Transactional
@Component
public class UserServiceImpl<T> extends HibernateDao<T> implements UserService {

	@Override
	public Customer getCustomerByUEP(Customer customer) {
		String hql = "from Customer c where c.username=? and c.password=?";
		List list = super.find(hql.toString(), customer.getUsername(), customer.getPassword());
		if (list.size() == 0) {
			String hql2 = "from Customer c where c.email=? and c.password=?";
			list = super.find(hql2, customer.getUsername(), customer.getPassword());
		}
		Customer c = new Customer();
		if (list.size() == 1) {
			c = (Customer) list.get(0);
			return c;
		} else if (list.size() == 0) {
			System.out.println("customer not found");
			return null;
		} else {
			System.out.println("2 or more customers conflict");
			return null;
		}
	}

	// @Override
	// public Customer getCustomerByEP(Customer customer) {
	// String hql="from Customer c where c.email=? and c.password=?";
	// List list=super.find(hql, customer.getEmail(),customer.getPassword());
	// Customer c = new Customer();
	// try {
	// c = (Customer)list.get(0);
	// } catch (Exception e) {
	// System.out.println(e);
	// }
	// return c;
	// }

	@Override
	public Lender getLenderByEP(Lender lender) {
		String hql = "from Lender l where l.email=? and l.password=?";
		List list = super.find(hql, lender.getEmail(), lender.getPassword());
		Lender l = new Lender();
		if (list.size() == 1) {
			l = (Lender) list.get(0);
			if (l.getAuthorizedTime() == null) {
				System.out.println("not authorized");
				return null;
			}
			return l;
		} else if (list.size() == 0) {
			System.out.println("lender not found");
			return null;
		} else {
			System.out.println("2 or more lenders with the same email and password");
			return null;
		}
	}

	@Override
	public List getAllPrivilege() {
		String hql = "from Privilege";
		List list = super.find(hql);

		return list;
	}

	@Override
	public List getPrivilegeByRole(Integer role) {
		String hql = "from RolePrivilege rp left join fetch rp.privilege where rp.roleId = ?";
		List role_privileges = super.find(hql.toString(), role);
		List<Privilege> privileges = new ArrayList<Privilege>();
		for (Object object : role_privileges) {
			RolePrivilege rp = (RolePrivilege) object;
			Privilege privilege = rp.getPrivilege();
			privileges.add(privilege);
		}
		return privileges;
	}

	@Override
	public Customer getCustomerById(Customer customer) {
		Integer id = customer.getCustomerId();
		String hql = "from Customer c where c.customerId = ?";
		List customerList = super.find(hql, id);
		if (customerList.size() == 1) {
			Customer c = (Customer) customerList.get(0);
			return c;
		}
		return null;
	}

	@Override
	public Customer getCustomerByUname(Customer customer) {
		String uname = customer.getUsername();
		String hql = "from Customer c where c.username = ?";
		List customerList = super.find(hql, uname);
		if (customerList.size() == 1) {
			Customer c = (Customer) customerList.get(0);
			return c;
		}
		return null;
	}

	@Override
	public Lender getLenderById(Lender lender) {
		Integer id = lender.getLenderId();
		String hql = "from Lender l where l.lenderId = ?";
		List lenderList = super.find(hql, id);
		if (lenderList.size() == 1) {
			Lender lender2 = (Lender) lenderList.get(0);
			return lender2;
		}
		return null;
	}

	@Override
	public List getAllCustomers(Customer customer) throws Exception {

		List customerList = new ArrayList();
		if (customer.getRoleId() == 1) {
			// admin
			String hql = "from Customer c left join fetch c.address where c.isDeleted=0";
			customerList = super.find(hql);
		} else {
			// normal customer
			String hql = "from Customer c left join fetch c.address where c.isDeleted=0 and c.roleId=10";
			customerList = super.find(hql);
		}
		return customerList;
	}

	@Override
	public boolean addCustomer(Customer customer) {
		// if customer already exist in the database, return false
		if (existUsername(customer)) {
			System.out.println("customer already exist in database");
			return false;
		}
		// if not exist, add to database
		super.save(customer);
		// check if added successfully
		if (existUsername(customer)) {
			System.out.println("customer successfully added");
			return true;
		}
		return false;
	}

	@Override
	public boolean addLender(Lender lender) throws Exception {
		if (existLender(lender)) {
			System.out.println("already exist in database");
			return false;
		}
		super.save(lender);
		if (existLender(lender)) {
			System.out.println("successfully added");
			return true;
		}
		return false;
	}

	@Override
	public boolean addCreditReport(CreditReport report) throws Exception {
		if (report == null) {
			return false;
		}
		super.save(report);
		return true;
	}

	@Override
	public boolean addMlReport(CreditReportMl mlReport) {
		if (mlReport == null) {
			return false;
		}
		super.save(mlReport);
		return true;
	}

	@Override
	public boolean addOrUpdateCustomer(Customer customer) {
		if (customer.getCustomerId() == null || customer == null) {

			return false;
		}
		super.saveOrUpdate(customer);
		return true;
	}

	/**
	 * check if the username/email of the lender exist
	 * 
	 * @param lender
	 * @return
	 * @author Lin
	 */
	public boolean existLender(Lender lender) {
		String hql = "from Lender l where l.email =?";
		List list = super.find(hql, lender.getEmail());
		// if lender email does not exist in Lender table
		if (list.size() == 0) {
			String hql2 = "from Customer c where c.email = ? or c.username = ?";
			List list2 = super.find(hql2, lender.getEmail(), lender.getEmail());
			// if lender email does not exist in customer username/email
			if (list2.size() == 0) {
				return false;
			} else {
				return true;
			}
		}
		return true;
	}

	/**
	 * check if the username of the customer exist
	 */
	public boolean existUsername(Customer customer) {
		String hql = "from Customer c where c.username =?";
		List list = super.find(hql, customer.getUsername());
		// if username exist, return true
		if (list.size() == 0) {
			String hql3 = "from Lender l where l.email=?";
			List list2 = super.find(hql3, customer.getUsername());
			// if
			if (list2.size() == 0) {

				return false;
			}
			return true;
		}
		return true;
	}

	@Override
	public boolean deleteCustomerById(Customer customer) {
		Integer id = customer.getCustomerId();
		String hql = "from Customer c where c.customerId = ?";
		List cList = super.find(hql, id);
		if (cList.size() == 1) {
			Customer c = (Customer) cList.get(0);
			c.setIsDeleted(1);
			super.update(c);
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean deleteLenderById(Lender lender) {
		Integer id = lender.getLenderId();
		String hql = "from Lender l where l.lenderId = ?";
		List lList = super.find(hql, id);
		if (lList.size() == 1) {
			Lender l = (Lender) lList.get(0);
			l.setIsDeleted(1);
			super.update(l);
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean updateCustomer(Customer customer) {
		if (customer.getCustomerId() != null) {
			super.update(customer);
			return true;
		}

		return false;
	}

	@Override
	public boolean updateLender(Lender lender) {
		if (lender.getLenderId() != null) {
			super.update(lender);
			return true;
		}

		return false;
	}

	@Override
	public List getAllLender(Customer admin) {
		if (admin.getRoleId() != 1) {
			System.out.println("no authority to access");
			return null;
		}

		List lenderList = new ArrayList<>();
		String hql = "from Lender l left join fetch l.address where l.isDeleted = 0";
		lenderList = super.find(hql);

		return lenderList;
	}

	@Override
	public CreditReport getLatestReport(Customer customer) throws NullPointerException {
		String hql = "from CreditReport cr where cr.customer.customerId = ? order by cr.reportTime desc";
		// find the first element in the query, usually used with hql statement
		// "order by"
		List latestReportList = super.findFirst(hql, customer.getCustomerId());
		if (latestReportList.isEmpty()) {
			return null;
		}
		CreditReport cp = (CreditReport) latestReportList.get(0);
		return cp;
	}

	@Override
	public List getReportsByCust(Customer customer) throws NullPointerException {
		String hql = "from CreditReport cr where cr.customer.customerId = ? order by cr.reportTime desc";
		List reportList = super.find(hql, customer.getCustomerId());
		if (reportList.isEmpty()) {
			return null;
		}
		return reportList;
	}
	
	@Override
	public List getAllFicoReports() {
		String hql = "from CreditReport cr where cr.isDelete = 0";
		List reportList = super.find(hql);
		if (reportList.isEmpty()) {
			return null;
		}
		return reportList;
	}

	@Override
	public List getMlReportsByCust(Customer customer) {
		String hql = "from CreditReportMl crm where crm.customer.customerId = ? order by crm.reportTime desc";
		List mlReportList = super.find(hql, customer.getCustomerId());
		if (mlReportList.isEmpty()) {
			return null;
		}
		return mlReportList;
	}

	@Override
	public CreditReport getReportById(Integer reportId) {
		String hql = "from CreditReport cr where cr.reportId = ?";
		List report = super.find(hql, reportId);
		if (report.isEmpty()) {
			return null;
		}
		return (CreditReport) report.get(0);
	}

	@Override
	public CreditReportMl getMlReportById(Integer mlReportId) {
		String hql = "from CreditReportMl crm where crm.mlReportId = ?";
		List report = super.find(hql, mlReportId);
		if (report.isEmpty()) {
			return null;
		}
		return (CreditReportMl) report.get(0);
	}

	@Override
	public List getValidatedLender() {
		String hql = "from Lender l  where l.authorizedTime is not null";
		List lenderList = super.find(hql);
		if (lenderList.isEmpty()) {
			return null;
		}
		return lenderList;
	}

	@Override
	public List getMlReportByProH(Double probability) {

		String hql = "from CreditReportMl mr where mr.repayProbability > ?";
		List mlReports = super.find(hql, probability);
		if (mlReports == null) {
			return null;
		}
		return mlReports;
	}

	@Override
	public List getFicoReportByProH(Double probability) {
		String hql = "from CreditReport cr where cr.repayProbability > ?";
		List ficoReportList = super.find(hql, probability);
		if (ficoReportList == null) {
			return null;
		}
		return ficoReportList;
	}

	@Override
	public List getFicoReportByCSH(Integer cScore) {
		String hql = "from CreditReport cr where cr.creditScore > ?";
		List ficoReportList = super.find(hql, cScore);
		if (ficoReportList == null) {
			return null;
		}
		return ficoReportList;
	}

	

}
