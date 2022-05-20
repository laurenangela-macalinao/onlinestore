package controller;

import com.itextpdf.text.Chunk;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DBConnectionModel;
import model.SecurityModel;
import nl.captcha.Captcha;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.draw.LineSeparator;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.Date;

/**
 *
 * @author Benedict Balancio
 */
public class LoginServlet extends HttpServlet {
    
    Connection conn;
    DBConnectionModel userdb;
    
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        
        userdb = new DBConnectionModel(config.getInitParameter("jdbcClassName"), config.getInitParameter("dbUserName"),
        config.getInitParameter("dbPassword"), config.getInitParameter("jdbcDriverURL"));
        conn = userdb.getConnection();
    }
     
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try
        {
            String action = request.getParameter("action");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String username2 = request.getParameter("username2");
            String password2 = request.getParameter("password2");
            String confirmpassword = request.getParameter("confirm-password");
            String role = request.getParameter("role");
            String encrypted = "";
            String decrypted = "";
            String error = "";
            String jsp = "";
            HttpSession session = request.getSession();
            
            Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
            request.setCharacterEncoding("UTF-8"); // Do this so we can capture non-Latin chars

            if (conn != null) 
            {
                if ("FirstAction".equals(action)) // Log-In 
                {
                    userdb.setUserName(username);
                    
                    String code = (String) request.getParameter("code");
                    
                    //Check if Captcha is Correct
                    if (captcha.isCorrect(code)) 
                    {
                        //Check if Username is in the Database
                        if (userdb.checkUserName().next()) 
                        {
                            decrypted = SecurityModel.decrypt(userdb.getPassword());

                            //Check if Password is the same
                            if (decrypted.equals(password)) 
                            {
                                if(userdb.getRole().equals("User"))
                                {
                                    HttpSession session2 = request.getSession();
                                    session2.setAttribute("username", username);
                                    response.sendRedirect("success.jsp");
                                }
                                else 
                                {
                                    HttpSession session3 = request.getSession();
                                    session3.setAttribute("username", username);
                                    response.sendRedirect("success_admin.jsp");
                                }
                            } 
                            else 
                            {
                                //Password is WRONG
                                error = "Password";

                                request.setAttribute("error", error);
                                request.getRequestDispatcher("error.jsp").forward(request, response);
                            }
                        } 
                        else 
                        {
                            //Username NOT FOUND
                            error = "Username";

                            request.setAttribute("error", error);
                            request.getRequestDispatcher("error.jsp").forward(request, response);
                        }
                    } 
                    else 
                    {
                        //Captcha is WRONG
                        error = "Captcha";

                        request.setAttribute("error", error);
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    }
                } 
                else if ("SecondAction".equals(action)) // Go to Sign Up Page
                {
                    response.sendRedirect("sign_up.jsp");
                }
                else if ("ThirdAction".equals(action)) // Sign Up
                {
                    //Sign Up
                    String code = (String) request.getParameter("code2");
                    
                    //Check if Captcha is Correct
                    if (captcha.isCorrect(code))  
                    {
                        userdb.setUserName(username2);
                    
                        //Check if Username is Unique
                        if (!userdb.checkUserName().next()) 
                        {
                            //Compare Password vs Confirm Password
                            if(password2.equals(confirmpassword))
                            {
                                //Encrypt and Save Password to DB
                                encrypted = SecurityModel.encrypt(password2);
                                userdb.insertUserRecord(username2, encrypted, role);
                                
                                response.sendRedirect("register_success.jsp");
                            }
                            else //Password is Not the Same
                            {
                                error = "Password";

                                request.setAttribute("error", error);
                                request.getRequestDispatcher("sign_up.jsp").forward(request, response);
                            }
                        }
                        else //Username is Not Unique
                        {
                            error = "Username";

                            request.setAttribute("error", error);
                            request.getRequestDispatcher("sign_up.jsp").forward(request, response);
                        }
                          
                    }
                    else //Captcha is Incorrect
                    {
                        error = "Captcha";
                        
                        request.setAttribute("error", error);
                        request.getRequestDispatcher("sign_up.jsp").forward(request, response);
                    }
                    
                }
                else if ("FourthAction".equals(action)) // Generate User PDF
                {   
                    Document document = new Document();
                    response.setContentType("application/pdf");
                    String fileName = "MyAccountDetails.pdf";
                    response.addHeader("Content-Disposition", "inline; filename=" + fileName);
                    
                    try 
                    {
                        PdfWriter.getInstance(document, response.getOutputStream());
                        document.open();
                        Font font = new Font(Font.FontFamily.HELVETICA, 15, Font.UNDERLINE | Font.BOLD);
                        document.add(new Paragraph("MY ACCOUNT DETAILS", font));
                        document.add(new Paragraph("Generated: " + new Date().toString()));
                        LineSeparator ls = new LineSeparator();
                        document.add(new Chunk(ls));
                        document.add(new Paragraph("User Name: " + userdb.getUserName()));
                        document.add(new Paragraph("Role: " + userdb.getRole()));
                        
                        //File Attributes
                        document.addTitle("My Account Details");
                        document.addAuthor(userdb.getUserName());
                        document.addSubject("A generated report about my username and role.");
                        document.addKeywords("own,username,role");
                        document.addCreationDate();
                        document.addCreator("iTextPDF Library");
                        
                    } 
                    catch(DocumentException | FileNotFoundException e) 
                    {
                        e.printStackTrace();
                    }
                    
                    document.close();
                }
                else if ("FifthAction".equals(action)) // Generate Admin PDF
                {
                    Document document = new Document();
                    response.setContentType("application/pdf");
                    String fileName = "UserList.pdf";
                    response.addHeader("Content-Disposition", "inline; filename=" + fileName);
                    
                    try 
                    {
                        PdfWriter.getInstance(document, response.getOutputStream());
                        document.open();
                        Font font = new Font(Font.FontFamily.HELVETICA, 15, Font.UNDERLINE | Font.BOLD);
                        document.add(new Paragraph("LIST OF ALL USERS", font));
                        document.add(new Paragraph("Admin: " + userdb.getUserName()));
                        document.add(new Paragraph("Generated: " + new Date().toString()));
                        LineSeparator ls = new LineSeparator();
                        document.add(new Chunk(ls));
                        
                        //Create Table object, Here 3 specify the no. of columns
                        PdfPTable pdfPTable = new PdfPTable(2);
                                    
                        ResultSet results = userdb.getAllRecords();
                        
                        PdfPCell pdfPCell1 = new PdfPCell(new Paragraph("Username"));
                        PdfPCell pdfPCell2 = new PdfPCell(new Paragraph("Role"));
                        PdfPCell pdfPCell3 = new PdfPCell(new Paragraph(""));
                        PdfPCell pdfPCell4 = new PdfPCell(new Paragraph(""));
                        pdfPCell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                        pdfPCell2.setHorizontalAlignment(Element.ALIGN_CENTER);
                        pdfPCell3.setHorizontalAlignment(Element.ALIGN_CENTER);
                        
                        //Add cells to table
                        pdfPTable.addCell(pdfPCell1);
                        pdfPTable.addCell(pdfPCell2);
                        
                        while (results.next()) 
                        {
                            pdfPCell3 = new PdfPCell(new Paragraph(results.getString("USERNAME")));
                            pdfPCell4 = new PdfPCell(new Paragraph(results.getString("USER_ROLE")));
                            pdfPTable.addCell(pdfPCell3);
                            pdfPTable.addCell(pdfPCell4);
                        }

                        //Add content to the document using Table objects.
                        document.add(pdfPTable);
                        
                        //File Attributes
                        document.addTitle("List of All Users");
                        document.addAuthor(userdb.getUserName());
                        document.addSubject("A generated report about the username and role of all users.");
                        document.addKeywords("all,username,role");
                        document.addCreationDate();
                        document.addCreator("iTextPDF Library");
                    } 
                    catch(DocumentException | FileNotFoundException e) 
                    {
                        e.printStackTrace();
                    }
                    
                    document.close();
                }
            }
            else
            {
                response.sendRedirect("error_connection.jsp");
            }
        }
        catch (SQLException sqle) 
        {
            response.sendRedirect("error.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
