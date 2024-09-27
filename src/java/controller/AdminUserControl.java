/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.StaffDAO;
import Model.Staff;
import Utils.EmailService;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.List;

@WebServlet(name = "AdminStaffControl", urlPatterns = {"/admin/user"})
public class AdminUserControl extends HttpServlet {

    private StaffDAO staffDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        staffDAO = new StaffDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Pagination parameters
        int pageNumber = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
        int pageSize = 5;

        // Filter parameters
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String roleString = request.getParameter("role");
        int role = (roleString==null || roleString.isEmpty()) ? -1 : Integer.parseInt(roleString);
        String gender = request.getParameter("gender");
        String statusString = request.getParameter("status");
        Boolean status = (statusString==null || statusString.isEmpty()) ? null : Boolean.parseBoolean(statusString);

        // Perform filtering based on the provided parameters
        List<Staff> filteredStaffList = staffDAO.getFilteredStaff(fullName, email, phone, role, gender, status, pageNumber, pageSize);

        // Get total number of staffs matching the filter criteria
        int totalStaffs = staffDAO.getFilteredStaff(fullName, email, role, gender, status).size();

        // Calculate total number of pages
        int totalPages = (int) Math.ceil((double) totalStaffs / pageSize);

        // Forward the filtered staff list and pagination parameters to the JSP
        request.setAttribute("userList", filteredStaffList);
        request.setAttribute("currentPage", pageNumber);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("totalPages", totalPages);

        request.getRequestDispatcher("../user-list.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Determine action (add or update)
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "add":
                    addStaff(request, response);
                    break;
                case "update":
                    updateStaff(request, response);
                    break;
            }
        } else {
            // Handle missing action parameter
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

    private void addStaff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve staff data from request parameters
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        int role = Integer.parseInt(request.getParameter("role"));
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String avatar = request.getParameter("imageUrl");

        boolean success = false;

        Staff staff = staffDAO.getStaffByEmail(email);

        if (staff == null) {
            // Register the staff
            Staff newStaff = new Staff();
            newStaff.setEmail(email);
            newStaff.setPassword(password);
            newStaff.setFullname(fullName);
            newStaff.setGender(gender ? "Male" : "Female");
            newStaff.setAddress(address);
            newStaff.setPhone(phone);
            newStaff.setRole(role);
            newStaff.setAvatar(avatar);

            success = staffDAO.registerStaff(newStaff);

            EmailService.sendEmail(email, "Account created", "Your password: " + password);
        }

        if (success) {
            // Redirect to staff list page after successful addition
            response.sendRedirect("user?success");
        } else {
            response.sendRedirect("user?fail");
        }
    }

    private void updateStaff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve staff data from request parameters
        int staffId = Integer.parseInt(request.getParameter("userId"));
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        int role = Integer.parseInt(request.getParameter("role"));
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        boolean status = Boolean.parseBoolean(request.getParameter("status"));
        String avatar = request.getParameter("imageUrl");

        // Create a Staff object with the updated data
        Staff staff = new StaffDAO().getStaffById(staffId);
        staff.setId(staffId);
        staff.setFullname(fullName);
        staff.setEmail(email);
        staff.setRole(role);
        staff.setGender(gender ? "Male" : "Female");
        staff.setAddress(address);
        staff.setPhone(phone);
        staff.setIsDeleted(status);
        staff.setAvatar(avatar);

        // Update the staff
        boolean success = staffDAO.updateStaff(staff);
        if (success) {
            // Redirect to staff list page after successful update
            response.sendRedirect("user?success");
        } else {
            // Handle update failure
            response.sendRedirect("user?fail");
        }
    }

}
