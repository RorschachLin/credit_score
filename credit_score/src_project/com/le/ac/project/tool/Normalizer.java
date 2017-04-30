package com.le.ac.project.tool;

/**
 * normalizer the numerical data, if the value inputed is bigger than max value,
 * it will return one, the max value will not change for the follow-up
 * prediction data, because the max and min number is only related to the
 * training set.
 * 
 * @author Lin
 *
 */
public class Normalizer {
	
	public Double norDuration(Double durationMonth) {
		Double result = null;
		Double min = 0.0;
		Double max = 900.0;
		if (durationMonth > max) {
			max = durationMonth;
		}
		result = (durationMonth - min) / (max - min);
		return result;
	}

	public Double norCreditAm(Double creditAmount) {
		Double result = null;
		Double min = 0.0;
		Double max = 1000000.0;
		if (creditAmount > max) {
			max = creditAmount;
		}
		result = (creditAmount - min) / (max - min);
		return result;
	}

	/**
	 * the installment percentage of income after tax
	 * 
	 * @param installmentRate
	 * @return
	 * @author Lin
	 */
	public Double norInstRate(Double installmentRate) {
		Double result = null;
		Double min = 0.0;
		Double max = 1.0;
		if (installmentRate > max) {
			max = installmentRate;
		}
		result = (installmentRate - min) / (max - min);
		return result;
	}

	public Double norResidence(Double residence) {
		Double result = null;
		Double min = 0.0;
		Double max = 80.0;
		if (residence > max) {
			max = residence;
		}
		result = (residence - min) / (max - min);
		return result;
	}

	public Double norAge(Double age) {
		Double result = null;
		Double min = 0.0;
		Double max = 120.0;
		if (age > max) {
			max = age;
		}
		result = (age - min) / (max - min);
		return result;
	}

	public Double norBankCredit(Double creditAtBank) {
		Double result = null;
		Double min = 0.0;
		Double max = 5.0;
		if (creditAtBank > max) {
			max = creditAtBank;
		}
		result = (creditAtBank - min) / (max - min);
		return result;
	}

	public Double norNumDep(Double numberDependents) {
		Double result = null;
		Double min = 0.0;
		Double max = 10.0;
		if (numberDependents > max) {
			max = numberDependents;
		}
		result = (numberDependents - min) / (max - min);
		return result;
	}
}
