package com.le.ac.project.tool;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateTool {

	/**
	 * string to date with format yyyy-mm-dd
	 * 
	 * @param date
	 * @return
	 * @author Lin
	 */
	public Date strToDate(String date) {
		if (date != "" || date != null) {
			String[] part = date.split("-");
			Integer year = Integer.parseInt(part[0]);
			Integer month = Integer.parseInt(part[1]) - 1;
			Integer day = Integer.parseInt(part[2]);
			Calendar cal = Calendar.getInstance();
			cal.set(year, month, day);
			Date d = cal.getTime();
			// Date d = new Date(year, month,day);
			return d;
		}
		return null;
	}

	/**
	 * string to date with format yyyy-MM-dd HH:mm:ss
	 * 
	 * @param date
	 * @return
	 * @author Lin
	 * @throws ParseException
	 */
	public Date strToTimestamp(String date) throws ParseException {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date parsedDate = simpleDateFormat.parse(date);
		return parsedDate;
	}
	
	/**
	 * convert date format to yyyy-MM-dd HH:mm:ss
	 * @param date
	 * @return
	 * @throws ParseException
	 * @author Lin
	 */
	public Date convertDateFormat(Date date) throws ParseException {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateStr = simpleDateFormat.format(date);
		Date parsedDate = simpleDateFormat.parse(dateStr);
		return parsedDate;
	}

}
