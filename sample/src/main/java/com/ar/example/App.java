package com.ar.example;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.nio.charset.Charset;
import java.util.Date;
import java.util.Scanner;

import javax.xml.transform.TransformerException;

import org.apache.fop.apps.MimeConstants;
import org.xml.sax.SAXException;

import com.ar.example.fo.PdfGenerator;
import com.ar.example.joda.DatesUtility;
import com.ar.example.nio.NIOUtility;
import com.ar.example.supercsv.CSVFileReaderBank;
import com.ar.example.supercsv.CSVFiletoDatabase;


/**
 * Hello world!
 *
 */
public class App 
{
    private static Scanner scanner;
    
	public static final String RESOURCES_DIR;
	public static final String OUTPUT_DIR;
	
	static {
		RESOURCES_DIR = "src//main//resources//";
		OUTPUT_DIR = "src//main//resources//output//";
	}

	public static void main( String[] args ) {
		
		scanner = new Scanner(System.in);
		do{
			String className = "com.ar.example.App";
	        Class<?> appClass = null;
			try {
				appClass = Class.forName(className);
			} catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} 
	        try {
				Object app = appClass.newInstance();
		    	System.out.println("Enter Method Name");
				String methodName = scanner.nextLine();
		        Method method = null;
				try {
					method = app.getClass().getMethod(methodName);
				} catch (NoSuchMethodException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SecurityException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		        try {
					method.invoke(app);
				} catch (IllegalArgumentException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} // explicit cast

			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	        
	    	System.out.println("press \"continue\" to proceed");
		}while(scanner.nextLine().equalsIgnoreCase("continue"));
        
    }
    
    public static void testJoda(){
    	System.out.println("Enter Date in Format in MM/dd/yyyy ");
    	String endDate = scanner.nextLine();
        System.out.println( DatesUtility.daysBtnDates(DatesUtility.tomorrowsDate(), endDate, "MM/dd/yyyy") );
    }
    
    public static void testSuperCsv() throws Exception{
    	CSVFileReaderBank.readWithCsvBeanReader();
    }
    
    public static void testSuperCsvDB() throws Exception{
    	CSVFiletoDatabase.readWithCsvBeanReader();
    }
    
    public static void testSuperCsvDBPerf() throws Exception{
    	CSVFiletoDatabase.readWithCsvBeanReaderPerf();
    }
    
    
    public static void testNIO(){
    	try {
			System.out.println(NIOUtility.readFile(RESOURCES_DIR + "//apacheCanada.xml",Charset.defaultCharset()));
		} catch (IOException e) {
			e.printStackTrace();
		}        
    }
    
    public static void testApacheFO(){
		try {
			PdfGenerator.generateDocument(NIOUtility.readFile(RESOURCES_DIR + "//apacheCanada.xml",Charset.defaultCharset()), RESOURCES_DIR + "//confirmation_letter_ca_English.xsl", MimeConstants.MIME_PDF, OUTPUT_DIR, "confirmation_letter_ca_English.pdf", ".pdf");
		} catch (SAXException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (TransformerException e) {
			e.printStackTrace();
		}
    }
    
    public static void testUtilDates(){
    	try {
    		Date dateInstance = new Date(scanner.nextLine());
    		Date when = new Date(scanner.nextLine());
			System.out.println("after "+dateInstance.after(when));
			System.out.println("before "+dateInstance.after(when));
			System.out.println("compareTo "+dateInstance.compareTo(when));
		} catch (Exception e) {
			e.printStackTrace();
		}        
    }
    
    public static void testVariableLengthArray(){
    	variableLengthArray(1,"",1);
    }
    
    public static void variableLengthArray(int i, Object... objects){
    	System.out.println("Empty Array");
    }
    
    
}
