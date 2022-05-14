package controller;

import java.io.IOException;
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

public class LoginServlet extends HttpServlet {

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
  
        HttpSession session = request.getSession(true);
 
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String answer = request.getParameter("answer");
        
        response.setContentType("text/html;charset=UTF-8");
        Captcha captcha = (Captcha) request.getSession().getAttribute(Captcha.NAME);
        if(!captcha.isCorrect(answer)) {
            //retain all values
            //request.getSession().setAttribute("username",username);
            //request.getSession().setAttribute("password",password);
 
            String message = "Wrong Captcha.";
            request.setAttribute("message", message);
            System.out.println("here1");
            //request.getRequestDispatcher("login.jsp").forward(request, response);
            response.sendRedirect("login.jsp");
        }
        User user = new User(conn);
        try {
            if (!user.isExits(username)){
                String message = "Invalid username/password";
                //request.getSession().setAttribute("username",username);
                //request.getSession().setAttribute("password",password);
                request.setAttribute("message", message);
                System.out.println("here2");
                //request.getRequestDispatcher("login.jsp").forward(request, response);
                response.sendRedirect("login.jsp");
            }
            String savedPassword = user.getPassword(username);
            System.out.println("savedPassword = " + savedPassword);
            String plainPassword = Security.decrypt(savedPassword);
            System.out.println("plainPassword = "+ plainPassword);
            System.out.println("input Password = "+ password);
            if (!plainPassword.equals(password)) {
                String message = "Invalid username/password";
                //request.getSession().setAttribute("username",username);
                //request.getSession().setAttribute("password",password);
                request.setAttribute("message", message);            
                System.out.println("here3");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                //response.sendRedirect("login.jsp");
            }
            //request.getSession().setAttribute("user", user.getUserInfo(username));

            //cleanup session attributes
            //request.getSession().removeAttribute("username");
            //request.getSession().removeAttribute("password");
            if(user.getRole(username).equals("admin")) {
                //session.setAttribute("pageid", 1);
                //request.setAttribute("userId", user.getUserId(username));            
                //request.setAttribute("pageid", 1);            
                response.sendRedirect("/OnlineStore/admin.jsp");
            } else {
                //session.setAttribute("pageid", 1);
                //request.setAttribute("userId", user.getUserId(username));            
                //request.setAttribute("pageid", 1);            
                response.sendRedirect("/OnlineStore/reguser.jsp");
            }
        } catch (SQLException ex) {
            //request.getSession().removeAttribute("username");
            //request.getSession().removeAttribute("password");
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
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
