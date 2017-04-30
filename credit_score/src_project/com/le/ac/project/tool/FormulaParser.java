/**
 * http://mathparser.org/
 * mxParser is a multiple platform library that can parse mathematical formula string to mathematical expression
 */
package com.le.ac.project.tool;

import org.mariuszgromada.math.mxparser.Expression;
import org.mariuszgromada.math.mxparser.mXparser;

/**
 * 
 * @author Lin
 *
 */
public class FormulaParser {
	// basic example, for testing
	public void cal() {
		Expression expression = new Expression("2^3+2^(-3)+2^3^(-4)");
		mXparser.consolePrintln("Res: " + expression.getExpressionString() + " = " + expression.calculate());
	}

	/**
	 * 
	 * Certain input format string: 
	 * "+,-,*,/": basic operator; 
	 * "^": exponentiation; 
	 * "int(f(),x,-1,1)": calculus-- continuous real-valued function f() for all x belongs to [-1,1]; 
	 * "sum(n, 1, 100, 1/n^2)" : summation operator (sigma) -- n from 1-100, f()=1/n^2; 
	 * "C(n,k): binomial coefficient. 
	 * PS. If the "^" doesn't work, try to change the input source to U.S.
	 * More format in http://mathparser.org/
	 * 
	 * @param formula
	 *            as a string in a certain format
	 * @return the result refer to the string formula
	 * @author Lin
	 */
	public Double evaluate(String formula) {
		Expression exp = new Expression(formula);
		Double result = exp.calculate();
		return result;
	}

	public static void main(String args[]) {
		// for testing
		FormulaParser parser = new FormulaParser();
		String formula = "5^6";
		System.out.println(parser.evaluate(formula));
		String s = "4.12";
		System.out.println(Integer.parseInt(s));
	}
}
