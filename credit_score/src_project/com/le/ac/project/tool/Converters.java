package com.le.ac.project.tool;

import weka.core.Instances;
import weka.core.converters.ArffSaver;
import weka.core.converters.CSVLoader;

import java.io.File;
import java.io.IOException;

public class Converters {

	/**
	 * convert from .csv file to .arff file
	 * 
	 * @param csvPath
	 *            The path of .csv file that needed to convert, including the
	 *            file name
	 * @param arffPath
	 *            The path of .arff file
	 * @throws IOException
	 * @author Lin
	 */
	public void convertCSV2Arff(String csvPath, String arffPath) throws IOException {
		// load CSV
		CSVLoader loader = new CSVLoader();
		loader.setSource(new File(csvPath));
		Instances data = loader.getDataSet();

		// save ARFF
		ArffSaver saver = new ArffSaver();
		saver.setInstances(data);
		saver.setFile(new File(arffPath));
		saver.setDestination(new File(arffPath));
		saver.writeBatch();
	}

	/**
	 * takes 2 arguments: - CSV input file - ARFF output file
	 */
	public static void main(String[] args) throws Exception {
		// the .csv file path that needed to convert, including the file name
//		String testpath1 = "dataset/arff_files/credit_scores1.arff";
		String csvPath = "dataset/csv_files/credit_scores.csv";
		// the target .arff file path
		String arffPath = "dataset/arff_files/credit_scores.arff";

		// System.out.println(testF.getAbsolutePath());
		 Converters converter = new Converters();
		 converter.convertCSV2Arff(csvPath, arffPath);

	}
}