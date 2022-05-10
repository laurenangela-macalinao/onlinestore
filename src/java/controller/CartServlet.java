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

public class CartServlet extends HttpServlet {

    Connection conn;

    public void init(ServletConfig config) throws ServletException {
        super.init(config);

        try {
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
        } catch (SQLException sqle) {
            System.out.println("SQLException error occured - "
                    + sqle.getMessage());
        } catch (ClassNotFoundException nfe) {
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
            //this servet will allow the user to finalize the items from cart for payment
            
            //-----------------------------------------------
            String userId = request.getParameter("userId");
            System.out.println("userId="+userId);
            request.setAttribute("userId", userId);
            //-----------------------------------------------
            String pageId = request.getParameter("pageId");
            System.out.println("pageId="+pageId);
            request.setAttribute("pageId", pageId);
            //-----------------------------------------------
            Cart cart = new Cart(conn);
            
            List<Cart> cartInStockList = cart.getInStockCartList(Integer.valueOf(userId));
            request.setAttribute("cartInStockList", cartInStockList);
            
            List<Cart> cartNoStockList = cart.getNoStockCartList(Integer.valueOf(userId));
            request.setAttribute("cartNoStockList", cartNoStockList);
            
            request.getRequestDispatcher("cart.jsp").forward(request, response);
            
            //-----------------------------------------------

/*           
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CartServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartServlet at " + request.getContextPath() + "</h1>");

            float totalAmount = 0;
            int totalCount = 0;
            for(int i = 0; i < cartInStockList.size(); i++) {
                //out.println("<h1>[" +i + "].idcart = " + cartList.get(i).idcart + "</h1>");
                //out.println("<h1>[" +i + "].idproduct = " + cartList.get(i).idproduct + "</h1>");
                //out.println("<h1>[" +i + "].iduser = " + cartList.get(i).iduser + "</h1>");
                
                out.println("<h1>[" +i + "].title = " + cartInStockList.get(i).title + "</h1>");
                out.println("<h1>[" +i + "].amount = " + cartInStockList.get(i).amount + "</h1>");
                
                totalCount += 1;
                totalAmount += cartInStockList.get(i).amount;
                
                out.println("<br>");
            }
            out.println("<h1>Total Count = " + totalCount + "</h1>");
            out.println("<h1>Total Amount = " + totalAmount + "</h1>");
            
            //out.println("<a href=\"CheckoutServlet.do\"><button>Checkout</button></a>");
            out.println("<a href=\"payment.jsp\"><button>Payment</button></a>");
            

            out.println("</body>");
            out.println("</html>");
*/

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
