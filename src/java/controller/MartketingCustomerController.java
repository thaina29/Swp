/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.UserDAO;
import Model.Staff;
import Model.User;
import Utils.EmailService;
import Utils.SessionUserInfo;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author anhdu
 */
@WebServlet(name = "MartketingCustomerController", urlPatterns = {"/marketing/user"})
public class MartketingCustomerController extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        userDAO = new UserDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Pagination parameters
        int pageNumber = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
        int pageSize = 5;

        // Filter parameters
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        String statusString = request.getParameter("status");
        Boolean status = (statusString==null || statusString.isEmpty()) ? null : Boolean.parseBoolean(statusString);

        // Perform filtering based on the provided parameters
        List<User> filteredUserList = userDAO.getFilteredUsers(fullName, email, phone, gender, status, pageNumber, pageSize);

        // Get total number of users matching the filter criteria
        int totalUsers = userDAO.getFilteredUsers(fullName, email, gender, status).size();

        // Calculate total number of pages
        int totalPages = (int) Math.ceil((double) totalUsers / pageSize);

        // Forward the filtered user list and pagination parameters to the JSP
        request.setAttribute("userList", filteredUserList);
        request.setAttribute("currentPage", pageNumber);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("fullName", fullName);
        request.setAttribute("email", email);
        request.setAttribute("phone", phone);
        request.setAttribute("gender", gender);
        request.setAttribute("statusString", statusString);

        request.getRequestDispatcher("../marketing-customer.jsp").forward(request, response);
    }

   

}
