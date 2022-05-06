package model;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 */
public class Report {
    public Report(){
        
    }
    //7. Report Sales
    public String createSalesReport(String basePath){
        Document docs = new Document();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMdd");  
        LocalDateTime now = LocalDateTime.now();  
        String filename = "assets/" + dtf.format(now) + "_SalesReport.pdf";
        System.out.println(filename);  
        try {
            File file = new File(basePath + filename);
            if(file.exists() && !file.isDirectory()) { 
                file.delete();
            }
            PdfWriter.getInstance(docs, new FileOutputStream(basePath + filename));
            docs.open();
            docs.add(new Paragraph("Sales Report"));
            docs.close();
        } catch (FileNotFoundException ex) {
            System.out.println(ex.toString());
        } catch (DocumentException ex) {
            System.out.println(ex.toString());
        }
        return filename;
    }
    
    //8. Inventory of Books
    public String createInventoryReport(String basePath){
        Document docs = new Document();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMdd");  
        LocalDateTime now = LocalDateTime.now();  
        String filename = "assets/" + dtf.format(now) + "_InventoryReport.pdf";
        System.out.println(filename);  
        try {
            File file = new File(basePath + filename);
            if(file.exists() && !file.isDirectory()) { 
                file.delete();
            }
            PdfWriter.getInstance(docs, new FileOutputStream(basePath + filename));
            docs.open();
            docs.add(new Paragraph("Inventory Report"));
            docs.close();
        } catch (FileNotFoundException ex) {
            System.out.println(ex.toString());
        } catch (DocumentException ex) {
            System.out.println(ex.toString());
        }
        return filename;
    }
    
}
