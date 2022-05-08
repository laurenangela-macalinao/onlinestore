package model;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 */
public class Report {
    
    private Connection conn;
    
    public Report(Connection conn){
        this.conn = conn;
    }
    
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
            Font font = new Font(FontFamily.COURIER, 12, Font.BOLDITALIC, new BaseColor(0, 0, 255));
            docs.add(new Paragraph("Sales Report",font));
            docs.add(new Paragraph("Date         Product                    Customer             Amount", font));
            docs.add(new Paragraph("-----------  -------------------------  -----------------    --------", font));
            docs.add(new Paragraph("2022/05/06   Book1                      Firstname Surname    P1000.00", font));
            docs.add(new Paragraph("2022/05/06   Book2                      Firstname Surname    P 800.00", font));
            docs.add(new Paragraph("2022/05/06   Book3                      Firstname Surname    P 200.00", font));
            docs.add(new Paragraph("2022/05/06   Book4                      Firstname Surname    P1000.00", font));
            docs.add(new Paragraph("2022/05/06   Book5                      Firstname Surname    P1000.00", font));
            docs.add(new Paragraph("2022/05/06   Book1                      Firstname Surname    P1000.00", font));
            
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
            
              
            // Setting font of the text       
      
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
