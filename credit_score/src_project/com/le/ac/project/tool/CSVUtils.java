package com.le.ac.project.tool;

import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;

public class CSVUtils {

	private final String SEPARATOR = ",";

	/**
	 * if the element contains ",", quote the element, if there is single '
	 * "', change it to '""'
	 * 
	 * @param str
	 * @return
	 * @author Lin
	 */
	public String csvFormatHandler(String str) {
		// if the element contains ",", quote the element
		if (str.contains(",")) {
			// if there is single '"', change it to '""'
			if (str.contains("\"")) {
				str = str.replace("\"", "\"\"");
			}
			// quote the element
			str = "\"" + str + "\"";
		}
		return str;
	}

	/**
	 * default separator is comma
	 * 
	 * @param writer
	 *            FileWriter, a FileWriter need to be constructed before using
	 *            this function
	 * @param content
	 *            The dataset -- a list of String array, each array refers to a
	 *            row(instance) of the dataset, each element of the array refers
	 *            to the element of the corresponding instance
	 * @return
	 * @author Lin
	 * @throws IOException
	 */
	public boolean exportCSV(Writer writer, List<String[]> dataList) throws IOException {
		return exportCSV(writer, dataList, SEPARATOR);
	}

	/**
	 * Construct a CSV file using the dataset
	 * 
	 * @param writer
	 *            FileWriter, a FileWriter need to be constructed before using
	 *            this function
	 * @param content
	 *            The dataset -- a list of String array, each array refers to a
	 *            row(instance) of the dataset, each element of the array refers
	 *            to the element of the corresponding instance
	 * @param separator
	 *            seperator of the data content, like comma in CSV
	 * @return if the CSV file constructed successfully
	 * @throws IOException
	 * @author Lin
	 */
	public boolean exportCSV(Writer writer, List<String[]> dataList, String separator) throws IOException {
		// default separator
		if (separator == " ") {
			separator = SEPARATOR;
		}
		StringBuffer sb = new StringBuffer();
		for (String[] row : dataList) {
			sb.setLength(0);
			for (int i = 0; i < row.length; i++) {
				if (i == 0) {
					sb.append(csvFormatHandler(row[i]));
				} else {
					sb.append(SEPARATOR);
					sb.append(csvFormatHandler(row[i]));
				}
			}
			sb.append("\n");
			writer.append(sb.toString());
		}

		return true;
	}

	public static void main(String[] args) {
		// test and usage
		CSVUtils csvUtils = new CSVUtils();
		String teString = "/Users/Bingxiong/Desktop/finalProject/dataset/test_predict/testCSVUtil.csv";
		List<String[]> content = new ArrayList<>();
		String[] att = new String[3];
		att[0] = "nihao";
		att[1] = "hahah";
		att[2] = "im";
		String[] ele = { "3", "2", "111" };
		content.add(att);
		content.add(ele);
		FileWriter writer = null;
		try {
			writer = new FileWriter(teString);
			csvUtils.exportCSV(writer, content);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				writer.flush();
				writer.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}
}
