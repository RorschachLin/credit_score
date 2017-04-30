/**
 * get all the attribute of the FICO model, and count the credit score
 */
package com.le.ac.project.tool;

import org.springframework.beans.factory.config.YamlMapFactoryBean;

public class CreditScoreCounter {
	private final int constant = 670;
	private String employmentStatus;
	private String employmentTime;
	private String residentialStatus;
	private String currency;
	private String requestedLoan;
	private String income;
	private String isHomeOwner;
	private String mortgage;
	private String cardAmount;
	private String pastDue;
	private String bankrupt;

	public CreditScoreCounter() {
	}

	public CreditScoreCounter(String employmentStatus, String employmentTime, String residentialStatus, String currency,
			String requestedLoan, String income, String isHomeOwner, String mortgage, String cardAmount, String pastDue,
			String bankrupt) {
		this.employmentStatus = employmentStatus;
		this.employmentTime = employmentTime;
		this.residentialStatus = residentialStatus;
		this.currency = currency;
		this.requestedLoan = requestedLoan;
		this.income = income;
		this.isHomeOwner = isHomeOwner;
		this.mortgage = mortgage;
		this.cardAmount = cardAmount;
		this.pastDue = pastDue;
		this.bankrupt = bankrupt;
	}

	/**
	 * count the score of current object base on the attribute of this class
	 * 
	 * @return
	 * @author Lin
	 * @throws Exception
	 */
	public Integer countCreditScore() throws NumberFormatException {
		Integer creditScore = null;
		Integer employmentStatusScore = employmentStatusScore();
		Integer employmentTimeScore = employmentTimeScore();
		Integer residentialScore = residentialStatusScore();
		Integer cardAmountScore = cardAmountScore();
		Integer loanProportionScore = loanProportionScore();
		Integer mortgageScore = mortgageScore();
		Integer pastDueScore = pastDueScore();
		Integer bankruptScore = bankruptScore();
		creditScore = constant + employmentStatusScore + employmentTimeScore + residentialScore + bankruptScore
				+ cardAmountScore + loanProportionScore + mortgageScore + pastDueScore;
		return creditScore;
	}

	/**
	 * Given the credit score y = 40 * x + 460, then x = (y - 460) / 40; f (40 * x + 460) =
	 * 2 ^ (2x - 2) = 4 ^ (x - 1); Thus, f (y) = 4 ^ ((y - 460) / 40 - 1)
	 * Calculate score by odd based on the formula
	 * @param score
	 * @return
	 * @author Lin
	 */
	public Double score2Odd(Integer score) {
		Double exponential = (score.doubleValue() - 460) / 40 - 1;
		Double odd = Math.pow(4, exponential);
		return odd;
	}

	/**
	 * Calculate the probability by the odd
	 * @param odd
	 * @return
	 * @author Lin
	 */
	public Double odd2Probability(Double odd) {
		Double probability = odd / (odd + 1);

		return probability;
	}
	
	/**
	 * transform from score to odd then odd to probability
	 * @param score The Credit Score
	 * @return the probability of the credit score by FICO model
	 * @author Lin
	 */
	public Double score2Porbability(Integer score) {
		return odd2Probability(score2Odd(score));
		
	}

	/**
	 * calculate the score of employment status of current object
	 * 
	 * @return
	 * @author Lin
	 */
	public Integer employmentStatusScore() {
		Integer score = null;
		// String eString = employmentStatus;
		switch (employmentStatus) {
		case "full_time":
			score = 28;

			break;

		case "part_time":
			score = 7;

			break;

		case "homemaker":
			score = 0;

			break;

		case "retired":
			score = 15;

			break;

		case "student":
			score = -8;

			break;

		case "unemployed":
			score = -42;

			break;

		default:
			break;
		}
		return score;
	}

	/**
	 * Score of Time in current employment
	 * 
	 * @return
	 * @author Lin
	 */
	public Integer employmentTimeScore() {
		Integer score = null;
		if (this.employmentTime == null) {
			return score = 0;
		}
		Double et = Double.parseDouble(employmentTime);
		if (et < 1) {
			return score = -25;
		} else if (1 <= et && et < 3) {
			return score = -10;
		} else if (3 <= et && et <= 10) {
			return score = 0;
		} else if (et > 10) {
			return score = 31;
		}
		return score;
	}

	/**
	 * Score of Residential status
	 * 
	 * @return
	 * @author Lin
	 */
	public Integer residentialStatusScore() {
		Integer score = null;
		switch (residentialStatus) {
		case "home_owner":
			score = 26;

			break;

		case "renting":
			score = 0;

			break;

		case "living_with_parent":
			score = 0;

			break;

		default:
			break;
		}
		return score;
	}

	/**
	 * Score of Loan amount requested as proportion of annual income
	 * 
	 * @return
	 * @author Lin
	 */
	public Integer loanProportionScore() {
		Double loan = Double.parseDouble(requestedLoan);
		Double annualIncome = Double.parseDouble(income);
		Double proportion = loan / annualIncome;
		Integer score = null;
		if (proportion < 0.1) {
			return score = 43;
		} else if (0.1 <= proportion && proportion < 0.26) {
			return score = 22;
		} else if (0.26 <= proportion && proportion <= 0.6) {
			return score = 0;
		} else if (proportion >= 0.6) {
			return score = -28;
		}
		return score;
	}

	/**
	 * Score of Outstanding mortgage
	 * 
	 * @return
	 * @author Lin
	 */
	public Integer mortgageScore() {
		Integer score = null;
		if (isHomeOwner.equals("0")) {
			return score = 0;
		} else if (isHomeOwner.equals("1")) {
			/*
			 * use CurrencyExchange tool in com.le.ac.project.tool, which can
			 * get the current dynamic exchange rate from Fixer.io, then change
			 * the mortgage to US dollar to get the score
			 */
			CurrencyExchange cExchange = new CurrencyExchange();
			Double rate = null;
			// get the rate
			if (currency.equals("USD")) {
				rate = (double) 1;
			} else {
				rate = cExchange.getCurrencyRate("USD", currency);
			}
			Double usd = Double.parseDouble(mortgage) / rate;
			// calculate the score
			if (usd <= 40000) {
				return score = 11;
			} else if (40000 < usd && usd <= 60000) {
				return score = 0;
			} else if (60000 < usd && usd <= 100000) {
				return score = -9;
			} else if (100000 < usd && usd <= 150000) {
				return score = -12;
			} else if (150000 < usd && usd <= 250000) {
				return score = -16;
			} else if (usd > 250000) {
				return score = -19;
			}
		}
		return score;
	}

	/**
	 * Score of Number of credit cards
	 * 
	 * @return
	 * @author Lin
	 */
	public Integer cardAmountScore() throws NumberFormatException {
		Integer score = null;
		Integer ca = Integer.parseInt(this.cardAmount);
		if (ca == 0) {
			score = -17;
			return score;
		} else if (1 <= ca && ca <= 3) {
			score = 12;
			return score;
		} else if (4 <= ca && ca <= 8) {
			score = 0;
			return score;
		} else if (ca >= 9) {
			score = -18;
			return score;
		}
		return score;
	}

	/**
	 * Score of Number of days currently past due on existing credit agreements
	 * 
	 * @return
	 * @author Lin
	 */
	public Integer pastDueScore() {
		Integer score = null;
		Double dpd = Double.parseDouble(pastDue);
		if (dpd == 0) {
			return score = 14;
		} else if (1 < dpd && dpd < 31) {
			return score = 0;
		} else if (31 <= dpd && dpd <= 60) {
			return score = -29;
		} else if (dpd > 60) {
			return score = -41;
		}
		return score;
	}

	/**
	 * Score of whether Declared bankrupt within the last 5 years
	 * 
	 * @return
	 * @author Lin
	 */
	public Integer bankruptScore() {
		Integer score = null;
		if (bankrupt.equals("y")) {
			score = -51;
			return score;
		} else if (bankrupt.equals("n")) {
			score = 9;
			return score;
		} else if (bankrupt.equals("unknown")) {
			score = 0;
			return score;
		}
		return score;
	}

	public String getEmploymentStatus() {
		return employmentStatus;
	}

	public void setEmploymentStatus(String employmentStatus) {
		this.employmentStatus = employmentStatus;
	}

	public String getEmploymentTime() {
		return employmentTime;
	}

	public void setEmploymentTime(String employmentTime) {
		this.employmentTime = employmentTime;
	}

	public String getResidentialStatus() {
		return residentialStatus;
	}

	public void setResidentialStatus(String residentialStatus) {
		this.residentialStatus = residentialStatus;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public String getRequestedLoan() {
		return requestedLoan;
	}

	public void setRequestedLoan(String requestedLoan) {
		this.requestedLoan = requestedLoan;
	}

	public String getIncome() {
		return income;
	}

	public void setIncome(String income) {
		this.income = income;
	}

	public String getIsHomeOwner() {
		return isHomeOwner;
	}

	public void setIsHomeOwner(String isHomeOwner) {
		this.isHomeOwner = isHomeOwner;
	}

	public String getMortgage() {
		return mortgage;
	}

	public void setMortgage(String mortgage) {
		this.mortgage = mortgage;
	}

	public String getCardAmount() {
		return cardAmount;
	}

	public void setCardAmount(String cardAmount) {
		this.cardAmount = cardAmount;
	}

	public String getPastDue() {
		return pastDue;
	}

	public void setPastDue(String pastDue) {
		this.pastDue = pastDue;
	}

	public String getBankrupt() {
		return bankrupt;
	}

	public void setBankrupt(String bankrupt) {
		this.bankrupt = bankrupt;
	}

	public static void main(String[] args) {
		CreditScoreCounter creditScoreCounter = new CreditScoreCounter();
		Double odd = creditScoreCounter.score2Odd(520);
		Double probability  = creditScoreCounter.odd2Probability(odd);
		System.out.println(odd);
		System.out.println(probability);

		// System.out.println(creditScoreCounter.cardAmountScore());

	}
}
