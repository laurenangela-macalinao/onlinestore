/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cart;
import model.Product;

/**
 *
 * @author drawd
 */
public class ProductServlet extends HttpServlet {

    Connection conn;

    public void init(ServletConfig config) throws ServletException {
        super.init(config);

        try 
        {
            Class.forName(getServletContext().getInitParameter("jdbcClassName"));
            String username = getServletContext().getInitParameter("dbUserName");
            String password = getServletContext().getInitParameter("dbPassword");
            StringBuffer url = new StringBuffer(getServletContext().getInitParameter("jdbcDriverURL"))
                    .append("://")
                    .append(getServletContext().getInitParameter("dbHostName"))
                    .append(":")
                    .append(getServletContext().getInitParameter("dbPort"))
                    .append("/")
                    .append(getServletContext().getInitParameter("databaseName"));
            System.out.println(url.toString() + " - Try");
            conn = DriverManager.getConnection(url.toString(), username, password);
            System.out.println(url.toString() + " - Success");

        } 
        catch (SQLException sqle) 
        {
            System.out.println("SQLException error occured - "
                    + sqle.getMessage());
        } 
        catch (ClassNotFoundException nfe) 
        {
            System.out.println("ClassNotFoundException error occured - "
                    + nfe.getMessage());
        }
    }

    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            //-----------------------------------------------
            String userId = request.getParameter("userId");
            System.out.println("userId="+userId);
            request.setAttribute("userId", userId);
            //-----------------------------------------------
            String pageId = request.getParameter("pageId");
            System.out.println("pageId="+pageId);
            request.setAttribute("pageId", pageId);
            //----------------------------------------------------
            Product product = new Product(conn);
            List<Product> productList = product.getProductList(Integer.valueOf(pageId));
            request.setAttribute("productList", productList);
            //-------------------------------------------------
            Cart cart = new Cart(conn);
            String productId = request.getParameter("productId");
            if(productId != null)
            {
                System.out.println("Has cart parameter : " + productId);
                cart.addToCart(Integer.valueOf(userId), Integer.valueOf(productId));
            }
            List<Cart> cartList = cart.getCartList(Integer.valueOf(userId));
            request.setAttribute("cartList", cartList);
            
            request.getRequestDispatcher("reguser.jsp").forward(request, response);
            
            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet ProductServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet ProductServlet at " + request.getContextPath() + "</h1>");
//            out.println("<h1>Page = " + page + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
        } catch (SQLException ex) {
            Logger.getLogger(ProductServlet.class.getName()).log(Level.SEVERE, null, ex);
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
