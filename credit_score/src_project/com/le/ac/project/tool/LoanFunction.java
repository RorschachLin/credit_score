package com.le.ac.project.tool;

import java.text.DecimalFormat;
import java.util.concurrent.ThreadLocalRandom;

/**
 * the criteria that the banks use to calculate the probability of giving loan
 * to a customer
 * 
 * @author Lin
 *
 */
public class LoanFunction {

	// set the output double format as 4 decimal places, no trailing zeroes
	DecimalFormat dFormat = new DecimalFormat("#.#####");

	/**
	 * The probability of getting the certain amount of loan based on the loan
	 * amount and repay probability
	 * 
	 * @param repayProbability
	 * @param loanAmount
	 * @return
	 * @author Lin
	 */
	public Double criteriaA(Double repayProbability, Double loanAmount) {
		Double loanProbability = null;
		Double earn = 0.1 * loanAmount * repayProbability;
		Double lose = (1 - repayProbability) * loanAmount;
		Double rate = earn / lose;
		if (0 <= rate && rate < 1) {
			loanProbability = rate;
		} else if (rate >= 1) {
			loanProbability = 0.99;
		}
		return Double.parseDouble(dFormat.format(loanProbability));
	}

	/**
	 * The probability of getting the loan based on the repay probability
	 * 
	 * @param repayProbability
	 * @param loanAmount
	 * @return
	 * @author Lin
	 */
	public Double criteriaB(Double repayProbability, Double loanAmount) {
		Double loanProbability = null;
		loanProbability = repayProbability * 0.9;
		return Double.parseDouble(dFormat.format(loanProbability));
	}

	/**
	 * The probability of getting the certain amount of loan based on the loan
	 * amount and repay probability
	 * 
	 * @param repayProbability
	 * @param loanAmount
	 * @return
	 * @author Lin
	 */
	public Double criteriaC(Double repayProbability, Double loanAmount) {
		Double loanProbability = null;
		Double earn = 0.1 * loanAmount * repayProbability;
		Double lose = (1 - repayProbability) * loanAmount;
		Double rate = earn / lose;
		if (0 <= rate && rate < 1) {
			loanProbability = rate * 0.9;
		} else if (rate >= 1) {
			loanProbability = 0.99;
		}
		return Double.parseDouble(dFormat.format(loanProbability));
	}

	public Double criteriaD(Double repayProbability, Double loanAmount) {
		Double loanProbability = null;
		Double earn = 0.1 * loanAmount * repayProbability;
		Double lose = (1 - repayProbability) * loanAmount;
		Double rate = earn / lose;
		if (0 <= rate && rate < 1) {
			loanProbability = rate * 0.96;
		} else if (rate >= 1) {
			loanProbability = 0.99;
		}
		return Double.parseDouble(dFormat.format(loanProbability));

	}
	

	public Double criteriaE(Double repayProbability, Double loanAmount) {
		Double loanProbability = null;
		Double earn = 0.1 * loanAmount * repayProbability;
		Double lose = (1 - repayProbability) * loanAmount;
		Double rate = earn / lose;
		if (0 <= rate && rate < 1) {
			loanProbability = rate * 0.95;
		} else if (rate >= 1) {
			loanProbability = 0.99;
		}
		return Double.parseDouble(dFormat.format(loanProbability));

	}

	public static void main(String[] args) {
		Double repayProbability = 0.4;
		Double loanAmount = 12345.0;
		LoanFunction lf = new LoanFunction();
		System.out.println(lf.criteriaA(repayProbability, loanAmount));
	}
}
