package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Security;
import model.User;
import nl.captcha.Captcha;

public class SignupServlet extends HttpServlet {

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

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String password2 = request.getParameter("password2");
        String userrole = request.getParameter("userrole");
        String email = request.getParameter("email");
        String phonenum = request.getParameter("phonenum");
        String address = request.getParameter("address");
        String answer = request.getParameter("answer");
        
        response.setContentType("text/html;charset=UTF-8");
        Captcha captcha = (Captcha) request.getSession().getAttribute(Captcha.NAME);
        if(!captcha.isCorrect(answer)) {
            
            //retain all values
            request.getSession().setAttribute("username",username);
            request.getSession().setAttribute("password",password);
            request.getSession().setAttribute("password2",password2);
            request.getSession().setAttribute("userrole",userrole);
            request.getSession().setAttribute("email",email);
            request.getSession().setAttribute("phonenum",phonenum);
            request.getSession().setAttribute("address",address);
 
            String message = "Wrong Captcha.";
            request.setAttribute("message", message);            
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
        User user = new User(conn);
        try {
            if (user.isExits(username)){
                String message = "Account Already Exists";
                //retain all values
                request.getSession().setAttribute("username",username);
                request.getSession().setAttribute("password",password);
                request.getSession().setAttribute("password2",password2);
                request.getSession().setAttribute("userrole",userrole);
                request.getSession().setAttribute("email",email);
                request.getSession().setAttribute("phonenum",phonenum);
                request.getSession().setAttribute("address",address);
                
                request.setAttribute("message", message);            
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            }
            if (!password.equals(password2)) {
                String message = "Password does not match.";
                //retain all values
                request.getSession().setAttribute("username",username);
                request.getSession().setAttribute("password",password);
                request.getSession().setAttribute("password2",password2);
                request.getSession().setAttribute("userrole",userrole);
                request.getSession().setAttribute("email",email);
                request.getSession().setAttribute("phonenum",phonenum);
                request.getSession().setAttribute("address",address);
                
                request.setAttribute("message", message);            
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            }
            
            String securedPassword = Security.encrypt(password);
            
            user.saveUser(username, securedPassword, userrole, email, phonenum, address);

            //cleanup session attributes
            request.getSession().removeAttribute("username");
            request.getSession().removeAttribute("password");
            request.getSession().removeAttribute("password2");
            request.getSession().removeAttribute("userrole");
            request.getSession().removeAttribute("email");
            request.getSession().removeAttribute("phonenum");
            request.getSession().removeAttribute("address");
            
            String message = "Signup Successful.";
            request.setAttribute("message", message);            
            request.getRequestDispatcher("signup.jsp").forward(request, response);

        } catch (SQLException ex) {
            request.getSession().removeAttribute("username");
            request.getSession().removeAttribute("password");
            request.getSession().removeAttribute("password2");
            request.getSession().removeAttribute("userrole");
            request.getSession().removeAttribute("email");
            request.getSession().removeAttribute("phonenum");
            request.getSession().removeAttribute("address");

            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("signup.jsp");
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
