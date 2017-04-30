package com.le.ac.project.controller;

import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.le.ac.project.model.Address;
import com.le.ac.project.model.CreditReport;
import com.le.ac.project.model.CreditReportMl;
import com.le.ac.project.model.Customer;
import com.le.ac.project.model.Lender;
import com.le.ac.project.service.UserService;
import com.le.ac.project.tool.CSVUtils;
import com.le.ac.project.tool.CreditScoreCounter;
import com.le.ac.project.tool.DateTool;
import com.le.ac.project.tool.LoanFunction;
import com.le.ac.project.tool.Normalizer;
import com.le.ac.project.tool.Predictor;

import weka.classifiers.evaluation.Prediction;

@Controller
@RequestMapping("customer")
public class CustomerController {

	@Autowired
	UserService userService;

	/**
	 * display when customer login
	 * 
	 * @param request
	 * @return
	 * @author Lin
	 */
	@RequestMapping("customer_content")
	public String customerContent(HttpServletRequest request) {
		Customer customer = (Customer) request.getSession().getAttribute("customer");
		CreditReport cp = userService.getLatestReport(customer);
		if (cp == null) {
			return "customer_management/credit_detail_fico";
		}
		return creditReport(request);
	}

	@RequestMapping("to_credit_detail")
	public String toCreditDetail(HttpServletRequest request) {
		return "customer_management/credit_detail_fico";
	}

	/**
	 * deal with the credit information after the credit detail form submitted
	 * 
	 * @param request
	 * @return
	 * @author Lin
	 */
	@RequestMapping("credit_detail")
	public String creditDetail(HttpServletRequest request) {

		String email = request.getParameter("email");
		String employmentStatus = request.getParameter("employment_status");
		String employmentTime = request.getParameter("employment_time");
		String residentialStatus = request.getParameter("residential_status");
		String currency = request.getParameter("currency");
		String requestedLoan = request.getParameter("req_loan");
		String income = request.getParameter("income");
		String isHomeOwner = request.getParameter("ho_select");
		String mortgage = request.getParameter("mortgage");
		String cardAmount = request.getParameter("card_amount");
		String pastDue = request.getParameter("past_due");
		String bankrupt = request.getParameter("bankrupt");
		// set the details to credit score counter by constructor
		CreditScoreCounter scoreCounter = new CreditScoreCounter(employmentStatus, employmentTime, residentialStatus,
				currency, requestedLoan, income, isHomeOwner, mortgage, cardAmount, pastDue, bankrupt);
		// result of all the score of corresponding details

		Integer employmentStatusScore = scoreCounter.employmentStatusScore();
		Integer employmentTimeScore = scoreCounter.employmentTimeScore();
		Integer residentialScore = scoreCounter.residentialStatusScore();
		Integer loanProportionScore = scoreCounter.loanProportionScore();
		Integer mortgageScore = scoreCounter.mortgageScore();
		Integer pastDueScore = scoreCounter.pastDueScore();
		Integer bankruptScore = scoreCounter.bankruptScore();
		Integer cardAmountScore;
		Integer creditScore;
		try {
			cardAmountScore = scoreCounter.cardAmountScore();
			creditScore = scoreCounter.countCreditScore();
		} catch (NumberFormatException e) {
			// TODO: handle exception
			String error = "Please enter a valid number, the number of card cannot be decimals";
			request.setAttribute("error", error);
			return "error";
		}
		Double odd = scoreCounter.score2Odd(creditScore);
		Double ficoRepayProbability = scoreCounter.odd2Probability(odd);

		request.setAttribute("credit_score", creditScore);
		request.setAttribute("employmentStatusScore", employmentStatusScore);
		request.setAttribute("employmentTimeScore", employmentTimeScore);
		request.setAttribute("residentialScore", residentialScore);
		request.setAttribute("cardAmountScore", cardAmountScore);
		request.setAttribute("loanProportionScore", loanProportionScore);
		request.setAttribute("mortgageScore", mortgageScore);
		request.setAttribute("pastDueScore", pastDueScore);
		request.setAttribute("bankruptScore", bankruptScore);

		/*
		 * put the credit record to the Credit report
		 */
		CreditReport creditReport = new CreditReport();
		creditReport.setEmploymentStatus(employmentStatus);
		if (employmentTime != null) {
			creditReport.setEmploymentTime(Integer.parseInt(employmentTime));
		}
		creditReport.setResidentialStatus(residentialStatus);
		creditReport.setCurrency(currency);
		creditReport.setLoanAmount(Integer.parseInt(requestedLoan));
		creditReport.setAnnualIncomes(Integer.parseInt(income));
		creditReport.setIsHomeOwner(Integer.parseInt(isHomeOwner));
		if (mortgage != null) {
			creditReport.setMortgage(Integer.parseInt(mortgage));
		}
		creditReport.setCreditCardAmount(Integer.parseInt(cardAmount));
		creditReport.setDaysPastDue(Integer.parseInt(pastDue));
		creditReport.setIsBankrupt(bankrupt);
		Customer customer = (Customer) request.getSession().getAttribute("customer");
		creditReport.setCustomer(customer);
		creditReport.setIsDeleted(0);
		creditReport.setReportTime(new Date());
		creditReport.setCreditScore(creditScore);
		creditReport.setEmploymentStatusScore(employmentStatusScore);
		creditReport.setEmploymentTimeScore(employmentTimeScore);
		creditReport.setResidentialScore(residentialScore);
		creditReport.setCardAmountScore(cardAmountScore);
		creditReport.setLoanProportionScore(loanProportionScore);
		creditReport.setMortgageScore(mortgageScore);
		creditReport.setPastDueScore(pastDueScore);
		creditReport.setBankruptScore(bankruptScore);
		creditReport.setRepayProbability(ficoRepayProbability);
		try {
			userService.addCreditReport(creditReport);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "customer_management/credit_score";
	}

	/**
	 * set request attribute to "report_id" and "ml_report_id" if want to
	 * display specified reports
	 * 
	 * @param request
	 * @return
	 * @author Lin
	 */
	@RequestMapping("credit_report")
	public String creditReport(HttpServletRequest request) {
		Customer customer = (Customer) request.getSession().getAttribute("customer");

		List reportList = new ArrayList<>();
		List mlReportList = new ArrayList<>();
		try {
			// not yet consider one list is null
			reportList = userService.getReportsByCust(customer);
			mlReportList = userService.getMlReportsByCust(customer);
		} catch (NullPointerException e) {
			// when it throws java.lang.NullPointerException, return error
			String error = "session expired, please log in again";
			request.setAttribute("error", error);
			return "error";
		}
		if (reportList == null || mlReportList == null) {
			return "customer_management/credit_report";
		}
		request.setAttribute("creditReportList", reportList);
		request.setAttribute("mlReportList", mlReportList);
		String reportId = request.getParameter("report_id");
		String mlReportId = request.getParameter("ml_report_id");
		CreditReport cr = new CreditReport();
		CreditReportMl mr = new CreditReportMl();
		if (reportId == null || reportId.equals("")) {
			cr = (CreditReport) reportList.get(0);
			request.setAttribute("report_id", cr.getReportId());
		} else {
			cr = userService.getReportById(Integer.parseInt(reportId));
			request.setAttribute("report_id", reportId);
		}
		if (mlReportId == null || mlReportId.equals("")) {
			mr = (CreditReportMl) mlReportList.get(0);
			request.setAttribute("ml_report_id", mr.getMlReportId());
		} else {
			mr = userService.getMlReportById(Integer.parseInt(mlReportId));
			request.setAttribute("ml_report_id", mlReportId);
		}

		request.setAttribute("currentMlReport", mr);
		request.setAttribute("currentCreditReport", cr);
		Double ficoRepayProbability = null;
		if (cr.getRepayProbability() == null) {
			CreditScoreCounter counter = new CreditScoreCounter();
			ficoRepayProbability = counter.score2Porbability(cr.getCreditScore());
		} else {
			ficoRepayProbability = cr.getRepayProbability();
		}
		Double mlRepayProbability = mr.getRepayProbability();

		LoanFunction lf = new LoanFunction();
		// Double prA = lf.criteriaA(repayProbability,
		// cr.getLoanAmount().doubleValue()) * 100;
		// Double prB = lf.criteriaB(repayProbability,
		// cr.getLoanAmount().doubleValue()) * 100;
		// Double prC = lf.criteriaC(repayProbability,
		// cr.getLoanAmount().doubleValue()) * 100;
		// Double prD = lf.criteriaD(repayProbability,
		// cr.getLoanAmount().doubleValue()) * 100;
		// Double prE = lf.criteriaE(repayProbability,
		// cr.getLoanAmount().doubleValue()) * 100;
		// request.setAttribute("probabilityA", prA);
		// request.setAttribute("probabilityB", prB);
		// request.setAttribute("probabilityC", prC);
		// request.setAttribute("probabilityD", prD);
		List lenderList = userService.getValidatedLender();

		Map<String, Double> bankPr = new HashMap<>();
		Map<String, Double> bankMlPr = new HashMap<>();
		for (Object object : lenderList) {
			Lender lender = (Lender) object;

			if (lender.getCriteria().equals("a")) {
				Double prA = lf.criteriaA(ficoRepayProbability, cr.getLoanAmount().doubleValue()) * 100;
				bankPr.put(lender.getName(), prA);
			} else if (lender.getCriteria().equals("b")) {
				Double prB = lf.criteriaB(ficoRepayProbability, cr.getLoanAmount().doubleValue()) * 100;
				bankPr.put(lender.getName(), prB);
			} else if (lender.getCriteria().equals("c")) {
				Double prC = lf.criteriaC(ficoRepayProbability, cr.getLoanAmount().doubleValue()) * 100;
				bankPr.put(lender.getName(), prC);
			} else if (lender.getCriteria().equals("d")) {
				Double prD = lf.criteriaD(ficoRepayProbability, cr.getLoanAmount().doubleValue()) * 100;
				bankPr.put(lender.getName(), prD);
			} else if (lender.getCriteria().equals("e")) {
				Double prE = lf.criteriaE(ficoRepayProbability, cr.getLoanAmount().doubleValue()) * 100;
				bankPr.put(lender.getName(), prE);
			}

			if (lender.getCriteria().equals("a")) {
				Double prA = lf.criteriaA(mlRepayProbability, mr.getCreditAmount()) * 100;
				bankMlPr.put(lender.getName(), prA);
			} else if (lender.getCriteria().equals("b")) {
				Double prB = lf.criteriaB(mlRepayProbability, mr.getCreditAmount()) * 100;
				bankMlPr.put(lender.getName(), prB);
			} else if (lender.getCriteria().equals("c")) {
				Double prC = lf.criteriaC(mlRepayProbability, mr.getCreditAmount()) * 100;
				bankMlPr.put(lender.getName(), prC);
			} else if (lender.getCriteria().equals("d")) {
				Double prD = lf.criteriaD(mlRepayProbability, mr.getCreditAmount()) * 100;
				bankMlPr.put(lender.getName(), prD);
			} else if (lender.getCriteria().equals("e")) {
				Double prE = lf.criteriaE(mlRepayProbability, mr.getCreditAmount()) * 100;
				bankMlPr.put(lender.getName(), prE);
			}
		}

		request.setAttribute("bankProbability", bankPr);
		request.setAttribute("bankMlProbability", bankMlPr);
		return "customer_management/credit_report";
	}

	@RequestMapping("to_ml_report_detail")
	public String toMlReportDetail(HttpServletRequest request) {
		return "customer_management/credit_detail_ml";
	}

	@RequestMapping("ml_report_detail")
	public String mlReportDetail(HttpServletRequest request) {
		Customer customer = (Customer) request.getSession().getAttribute("customer");
		String basePath = request.getSession().getServletContext().getRealPath("/");
		// get the attributes from front JSP
		String accountStatus = request.getParameter("account_status");
		String duration = request.getParameter("duration");
		String creditHistory = request.getParameter("credit_history");
		String purpose = request.getParameter("purpose");
		String creditAmount = request.getParameter("credit_amount");
		String savings = request.getParameter("savings");
		String employment = request.getParameter("employment");
		String installmentRate = request.getParameter("installment_rate");
		String statusSex = request.getParameter("status_sex");
		String otherDebtorsGuarantors = request.getParameter("other_debtors_guarantors");
		String residenceTime = request.getParameter("residence_time");
		String property = request.getParameter("property");
		String age = request.getParameter("age");
		String otherInstallment = request.getParameter("other_installment");
		String housing = request.getParameter("housing");
		String existingCredits = request.getParameter("existing_credits");
		String job = request.getParameter("job");
		String numberDependents = request.getParameter("number_dependents");
		String telephone = request.getParameter("telephone");
		String foreignWorker = request.getParameter("foreign_worker");
		/*
		 * normalize the numerical attributes
		 */
		Normalizer normalizer = new Normalizer();
		String nDuration = String.valueOf(normalizer.norDuration(Double.parseDouble(duration)));
		String nCreditAmount = String.valueOf(normalizer.norCreditAm(Double.parseDouble(creditAmount)));
		String nInstallmentRate = String.valueOf(normalizer.norInstRate(Double.parseDouble(installmentRate)));
		String nResidence = String.valueOf(normalizer.norResidence(Double.parseDouble(residenceTime)));
		String nAge = String.valueOf(normalizer.norAge(Double.parseDouble(age)));
		String nExistCredit = String.valueOf(normalizer.norBankCredit(Double.parseDouble(existingCredits)));
		String nNumberDependents = String.valueOf(normalizer.norNumDep(Double.parseDouble(numberDependents)));

		/*
		 * Set the data of current customer, of which need to be predicted.
		 */
		String[] header = { "CheckingAcctStat", "Duration", "CreditHistory", "Purpose", "CreditAmount", "Savings",
				"Employment", "InstallmentRatePecnt", "SexAndStatus", "OtherDetorsGuarantors", "PresentResidenceTime",
				"Property", "Age", "OtherInstalments", "Housing", "ExistingCreditsAtBank", "Job", "NumberDependents",
				"Telephone", "ForeignWorker", "CreditStatus" };
		String[] data1 = { accountStatus, nDuration, creditHistory, purpose, nCreditAmount, savings, employment,
				nInstallmentRate, statusSex, otherDebtorsGuarantors, nResidence, property, nAge, otherInstallment,
				housing, nExistCredit, job, nNumberDependents, telephone, foreignWorker, "0" };
		List<String[]> dataList = new ArrayList<>();
		dataList.add(header);
		dataList.add(data1);
		CSVUtils csvUtils = new CSVUtils();
		String suppliedPath = basePath + "dataset/csv_files/" + customer.getCustomerId() + ".csv";
		FileWriter writer = null;
		try {
			writer = new FileWriter(suppliedPath);
			csvUtils.exportCSV(writer, dataList);
			writer.flush();
			writer.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String trainCSVPath = basePath + "dataset/csv_files/credit_scores.csv";
		String trainArffPath = basePath + "dataset/arff_files/credit_scores.arff";
		String pctCSVPath = suppliedPath;
		String pctArffPath = basePath + "dataset/arff_files/" + customer.getCustomerId() + ".arff";
		Predictor predictor = new Predictor();
		List<Prediction> predictions = new ArrayList<>();
		/*
		 * set the number of attribute column that need to be removed when
		 * processing. The setting will not remove attributes from the original
		 * dataset, which the original dataset will stay the same.
		 */
		List<Integer> removeAttsNums = new ArrayList<>(Arrays.asList());
		try {
			predictions = predictor.calLogisticPctByCSV(trainCSVPath, pctCSVPath, trainArffPath, pctArffPath,
					removeAttsNums);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Double[] pr = predictor.getPr(predictions);
		Double predicted = pr[0];
		Double probability = pr[1];

		try {
			// delete the generated csv and arff files
			Files.deleteIfExists(Paths.get(pctCSVPath));
			Files.deleteIfExists(Paths.get(pctArffPath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// set the details of machine learning report to database
		CreditReportMl mlReport = new CreditReportMl();
		mlReport.setIsDeleted(0);
		mlReport.setReportTime(new Date());
		mlReport.setCustomer(customer);
		mlReport.setAccountStatus(accountStatus);
		mlReport.setDurationMonth(Double.parseDouble(duration));
		mlReport.setCreditHistory(creditHistory);
		mlReport.setPurpose(purpose);
		mlReport.setCreditAmount(Double.parseDouble(creditAmount));
		mlReport.setSavingAccount(savings);
		mlReport.setEmployment(employment);
		mlReport.setInstallmentRatePecnt(Double.parseDouble(installmentRate));
		mlReport.setSexAndStatus(statusSex);
		mlReport.setOtherDebtorsGuarantors(otherDebtorsGuarantors);
		mlReport.setPresentResidenceTime(Double.parseDouble(residenceTime));
		mlReport.setProperty(property);
		mlReport.setAge(Double.parseDouble(age));
		mlReport.setOtherInstalments(otherInstallment);
		mlReport.setHousing(housing);
		mlReport.setExistingCreditsAtBank(Double.parseDouble(existingCredits));
		mlReport.setJob(job);
		mlReport.setNumberDependents(Integer.parseInt(numberDependents));
		mlReport.setTelephone(telephone);
		mlReport.setForeignWorker(foreignWorker);
		mlReport.setStatusPrediction(predicted.intValue());
		mlReport.setRepayProbability(probability);
		userService.addMlReport(mlReport);
		return creditReport(request);
	}

	@RequestMapping("other_loan_amount_fico")
	public String otherLoanAmount(HttpServletRequest request) {
		String reportId = request.getParameter("report_id");
		String mlReportId = request.getParameter("ml_report_id");
		String loanAmount = request.getParameter("amount_loan");
		CreditReport cr = new CreditReport();
		if (reportId != null && !reportId.equals("")) {
			cr = userService.getReportById(Integer.parseInt(reportId));
		}
		String employmentStatus = cr.getEmploymentStatus();
		String employmentTime = String.valueOf(cr.getEmploymentTime());
		String residentialStatus = cr.getResidentialStatus();
		String currency = cr.getCurrency();
		String requestedLoan = String.valueOf(cr.getLoanAmount());
		String income = String.valueOf(cr.getAnnualIncomes());
		String isHomeOwner = String.valueOf(cr.getIsHomeOwner());
		String mortgage = String.valueOf(cr.getMortgage());
		String cardAmount = String.valueOf(cr.getCreditCardAmount());
		String pastDue = String.valueOf(cr.getDaysPastDue());
		String bankrupt = cr.getIsBankrupt();
		// set the details to credit score counter by constructor
		CreditScoreCounter scoreCounter = new CreditScoreCounter(employmentStatus, employmentTime, residentialStatus,
				currency, requestedLoan, income, isHomeOwner, mortgage, cardAmount, pastDue, bankrupt);
		// result of all the score of corresponding details

		Integer employmentStatusScore = scoreCounter.employmentStatusScore();
		Integer employmentTimeScore = scoreCounter.employmentTimeScore();
		Integer residentialScore = scoreCounter.residentialStatusScore();
		Integer loanProportionScore = scoreCounter.loanProportionScore();
		Integer mortgageScore = scoreCounter.mortgageScore();
		Integer pastDueScore = scoreCounter.pastDueScore();
		Integer bankruptScore = scoreCounter.bankruptScore();
		Integer cardAmountScore;
		Integer creditScore;
		try {
			cardAmountScore = scoreCounter.cardAmountScore();
			creditScore = scoreCounter.countCreditScore();
		} catch (NumberFormatException e) {
			// TODO: handle exception
			String error = "Please enter a valid number, the number of card cannot be decimals";
			request.setAttribute("error", error);
			return "error";
		}
		Double odd = scoreCounter.score2Odd(creditScore);
		Double ficoRepayProbability = scoreCounter.odd2Probability(odd);

//		request.setAttribute("credit_score", creditScore);
//		request.setAttribute("employmentStatusScore", employmentStatusScore);
//		request.setAttribute("employmentTimeScore", employmentTimeScore);
//		request.setAttribute("residentialScore", residentialScore);
//		request.setAttribute("cardAmountScore", cardAmountScore);
//		request.setAttribute("loanProportionScore", loanProportionScore);
//		request.setAttribute("mortgageScore", mortgageScore);
//		request.setAttribute("pastDueScore", pastDueScore);
//		request.setAttribute("bankruptScore", bankruptScore);

		/*
		 * put the credit record to the Credit report
		 */
		CreditReport creditReport = new CreditReport();
		creditReport.setEmploymentStatus(employmentStatus);
		if (employmentTime != null) {
			creditReport.setEmploymentTime(Integer.parseInt(employmentTime));
		}
		creditReport.setResidentialStatus(residentialStatus);
		creditReport.setCurrency(currency);
		creditReport.setLoanAmount(Integer.parseInt(requestedLoan));
		creditReport.setAnnualIncomes(Integer.parseInt(income));
		creditReport.setIsHomeOwner(Integer.parseInt(isHomeOwner));
		if (mortgage != null) {
			creditReport.setMortgage(Integer.parseInt(mortgage));
		}
		creditReport.setCreditCardAmount(Integer.parseInt(cardAmount));
		creditReport.setDaysPastDue(Integer.parseInt(pastDue));
		creditReport.setIsBankrupt(bankrupt);
		Customer customer = (Customer) request.getSession().getAttribute("customer");
		creditReport.setCustomer(customer);
		creditReport.setIsDeleted(0);
		creditReport.setReportTime(new Date());
		creditReport.setCreditScore(creditScore);
		creditReport.setEmploymentStatusScore(employmentStatusScore);
		creditReport.setEmploymentTimeScore(employmentTimeScore);
		creditReport.setResidentialScore(residentialScore);
		creditReport.setCardAmountScore(cardAmountScore);
		creditReport.setLoanProportionScore(loanProportionScore);
		creditReport.setMortgageScore(mortgageScore);
		creditReport.setPastDueScore(pastDueScore);
		creditReport.setBankruptScore(bankruptScore);
		creditReport.setRepayProbability(ficoRepayProbability);
		try {
			userService.addCreditReport(creditReport);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return creditReport(request);
	}

	@RequestMapping("personal_detail")
	public String personalDetail(HttpServletRequest request) {
		Customer customer = (Customer) request.getSession().getAttribute("customer");
		String addOne = null;
		String addTwo = null;
		String postCode = null;
		String city = null;
		String county = null;
		String country = null;
		Integer add = null;
		if (customer.getAddress() != null) {
			add = 1;
			Address address = customer.getAddress();
			if (address.getAddressOne() != null && address.getAddressOne() != "") {
				addOne = address.getAddressOne();
			} else {
				addOne = "Address one is not valid";
			}
			if (address.getAddressTwo() != null && address.getAddressTwo() != "") {
				addTwo = address.getAddressTwo();
			} else {
				addTwo = "Address two is not valid";
			}
			if (address.getPostcode() != null && address.getPostcode() != "") {
				postCode = address.getPostcode();
			} else {
				postCode = "Postcode is not valid";
			}
			if (address.getCity() != null && address.getCity() != "") {
				city = address.getCity();
			} else {
				city = "City is not valid";
			}
			if (address.getCounty() != null && address.getCounty() != "") {
				county = address.getCounty();
			} else {
				city = "County is not valid";
			}
			if (address.getCountry() != null && address.getCountry() != "") {
				country = address.getCountry();
			} else {
				country = "Country is not valid";
			}
		} else {
			add = 0;
		}

		String email = null;
		String gender = null;
		String firstName = null;
		String lastName = null;
		String mobileNumber = null;
		String birthday = null;
		String nationality = null;
		String intro = null;
		if (customer.getEmail() != null && customer.getEmail() != "") {
			email = customer.getEmail();
		} else {
			email = "email is not valid";
		}
		if (customer.getGender() != null && customer.getGender() != "") {
			gender = customer.getGender();
		} else {
			gender = "Gender is not valid";
		}
		if (customer.getFirstName() != null && customer.getFirstName() != "") {
			firstName = customer.getFirstName();
		} else {
			firstName = "First name is not valid";
		}
		if (customer.getLastName() != null && customer.getLastName() != "") {
			lastName = customer.getLastName();
		} else {
			lastName = "Last name is not valid";
		}
		if (customer.getMobileNum() != null && customer.getMobileNum() != "") {
			mobileNumber = customer.getMobileNum();
		} else {
			mobileNumber = "Mobile number is not valid";
		}
		if (customer.getDateOfBirth() != null) {
			Date bir = customer.getDateOfBirth();
			birthday = bir.toString();
		} else {
			birthday = "Birthday is not valid";
		}
		if (customer.getNationality() != null && customer.getNationality() != "") {
			nationality = customer.getNationality();
		} else {
			nationality = "Nationality is not valid";
		}
		if (customer.getIntro() != null && customer.getNationality() != "") {
			intro = customer.getIntro();
		} else {
			intro = "Personal introduction is not valid";
		}

		request.setAttribute("add", add);
		request.setAttribute("addressOne", addOne);
		request.setAttribute("addressTwo", addTwo);
		request.setAttribute("postcode", postCode);
		request.setAttribute("city", city);
		request.setAttribute("county", county);
		request.setAttribute("country", country);
		request.setAttribute("email", email);
		request.setAttribute("gender", gender);
		request.setAttribute("firstName", firstName);
		request.setAttribute("lastName", lastName);
		request.setAttribute("mobileNumber", mobileNumber);
		request.setAttribute("birthday", birthday);
		request.setAttribute("nationality", nationality);
		request.setAttribute("intro", intro);
		return "customer_management/personal_details";
	}

	@RequestMapping("to_edit")
	public String toEdit(HttpServletRequest request) {
		Customer customer = (Customer) request.getSession().getAttribute("customer");
		String addOne = customer.getAddress().getAddressOne();
		String addTwo = customer.getAddress().getAddressTwo();
		String postcode = customer.getAddress().getPostcode();
		String city = customer.getAddress().getCity();
		String county = customer.getAddress().getCounty();
		String country = customer.getAddress().getCountry();
		String gender = customer.getGender();
		String fname = customer.getFirstName();
		String lname = customer.getLastName();
		String email = customer.getEmail();
		String mobile = customer.getMobileNum();
		Date birthday = customer.getDateOfBirth();
		String nationality = customer.getNationality();

		request.setAttribute("add_one", addOne);
		request.setAttribute("add_two", addTwo);
		request.setAttribute("postcode", postcode);
		request.setAttribute("city", city);
		request.setAttribute("county", county);
		request.setAttribute("country", country);
		request.setAttribute("gender", gender);
		request.setAttribute("fname", fname);
		request.setAttribute("lname", lname);
		request.setAttribute("email", email);
		request.setAttribute("mobile", mobile);
		request.setAttribute("birthday", birthday.toString());
		request.setAttribute("nationality", nationality);

		return "customer_management/edit_profile";
	}

	@RequestMapping("edit")
	public String edit(HttpServletRequest request) {
		Customer customer = (Customer) request.getSession().getAttribute("customer");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String mobile = request.getParameter("mobile");
		String birthday = request.getParameter("birthday");
		String nationality = request.getParameter("nationality");
		String addOne = request.getParameter("add_one");
		String addTwo = request.getParameter("add_two");
		String postcode = request.getParameter("postcode");
		String city = request.getParameter("city");
		String county = request.getParameter("county");
		String country = request.getParameter("country");
		String intro = request.getParameter("intro");
		if (intro != null && intro != "") {
			customer.setIntro(intro);
		}
		customer.setIntro(intro);
		customer.setFirstName(fname);
		customer.setLastName(lname);
		customer.setEmail(email);
		customer.setGender(gender);
		customer.setMobileNum(mobile);
		Date dateOfBirth = new DateTool().strToDate(birthday);
		customer.setDateOfBirth(dateOfBirth);
		customer.setNationality(nationality);
		Address address = new Address();
		if (customer.getAddress() != null) {
			address = customer.getAddress();
		}
		address.setAddressOne(addOne);
		address.setAddressTwo(addTwo);
		address.setPostcode(postcode);
		address.setCity(city);
		address.setCounty(county);
		address.setCountry(country);
		address.setAddressType("customer");
		customer.setAddress(address);
		userService.updateCustomer(customer);
		request.getSession().setAttribute("customer", customer);
		return personalDetail(request);
	}

	@RequestMapping("to_password")
	public String toPassword(HttpServletRequest request) {

		return "customer_management/password";
	}

	@RequestMapping("password")
	public String password(HttpServletRequest request) {
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		if (!password.equals(confirmPassword)) {
			String error = "Password and confirm password are not matched, please input again";
			request.setAttribute("error", error);
			return "error";
		}
		Customer customer = (Customer) request.getSession().getAttribute("customer");
		customer.setPassword(password);
		boolean flag = userService.updateCustomer(customer);
		if (!flag) {
			String error = "update customer fail";
			request.setAttribute("error", error);
			return "error";
		}
		String success = "Password Successfully Chnged";
		String target = "customer/customer_content";
		request.setAttribute("success", success);
		request.setAttribute("target", target);
		return "success";
	}

}
