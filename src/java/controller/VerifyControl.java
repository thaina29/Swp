/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.UserDAO;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Utils.Config;

/**
 *
 * @author Anh Phuong Le
 */
@WebServlet(name = "VerifyControl", urlPatterns = {"/verify"})
public class VerifyControl extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet VerifyControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VerifyControl at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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

        String email = (String) request.getParameter("email");
        String otp = (String) request.getParameter("otp");

        String checkOtp = (String) request.getSession().getAttribute("verify_otp_" + email);

        if (otp.equals(checkOtp)) {

            User user = (User) request.getSession().getAttribute("verify_" + email);

            boolean registrationSuccessful = new UserDAO().registerUser(user);
            
            if (registrationSuccessful) {
                // Registration successful
                request.setAttribute("errorMessage", "Register success");
                request.getRequestDispatcher("Login.jsp").forward(request, response);

            } else {

                // Registration fail
                request.setAttribute("errorMessage", "Register fail");
                request.getRequestDispatcher("Register.jsp").forward(request, response);

            }

        } else {

            // Wrong otp
            request.setAttribute("errorMessage", "Wrong OTP");
            request.getRequestDispatcher("Register.jsp").forward(request, response);

        }

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
<<<<<<< HEAD:src/java/controller/AddPostController.java
<<<<<<< HEAD:src/java/controller/AddPostController.java
    throws ServletException, IOException {
        // Get the form data
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String category = request.getParameter("category");
        String imgURL = request.getParameter("imgURL");
        // Assuming you have a way to get the current user ID
        //int createdBy = ((User) request.getSession().getAttribute("user")).getId();
        int createdBy = 1; //need delete
        boolean isSuccess = new PostDAO().createPost(title, content, category, createdBy, imgURL);
        response.sendRedirect("list-post?isSuccess=" + isSuccess);
=======
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String MD5_Password = Config.md5(password);

        UserDAO userDAO = new UserDAO();
        User user = userDAO.loginUser(email, MD5_Password);

        if (user != null) {
            // save user info to session
            request.getSession().setAttribute("user", user); 
            
            response.sendRedirect("home");
        } else {
            // Login failed
            request.setAttribute("errorMessage", "Invalid email or password");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
>>>>>>> thaina:src/java/controller/LoginControl.java
=======
            throws ServletException, IOException {
        processRequest(request, response);
>>>>>>> b305f618666c370e1f3d33d2188b7100cdb19a24:src/java/controller/VerifyControl.java
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
