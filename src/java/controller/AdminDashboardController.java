package controller;

import DAO.AdminDAO;
import DAO.CategoryDAO;
import DAO.UserDAO;
import Model.Category;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet(name = "AdminDashboard", urlPatterns = {"/admin/dashboard"})
public class AdminDashboardController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AdminDAO dao = new AdminDAO();
        
        List<Category> category = new CategoryDAO().getCategories();
        String cateString = "";
        String cateCost = "";
        
        for (Category c : category) {
            if (!cateString.isBlank()) cateString += ",";
            if (!cateCost.isBlank()) cateCost += ",";
            
            cateString += "'" + c.getCategoryName() + "'";
            cateCost += (int)Math.floor(dao.getTotalCostByCategory(c.getID()));
        }

        // Get the start date and end date from request parameters
        String startDateStr = request.getParameter("start_date");
        String endDateStr = request.getParameter("end_date");

        // Set default values if start date or end date are null
        LocalDateTime startDate = startDateStr != null ? LocalDateTime.parse(startDateStr + "T00:00:00") : LocalDateTime.now().minusDays(7);
        LocalDateTime endDate = endDateStr != null ? LocalDateTime.parse(endDateStr + "T00:00:00") : LocalDateTime.now();

        // Retrieve order counts based on status and date range
        int orderSuccess = 0;
        int orderCancel = 0;
        int orderPending = 0;
        orderPending += dao.getOrdersByStatus("Submitted").size();
        orderPending += dao.getOrdersByStatus("Approved").size();
        orderSuccess += dao.getOrdersByStatus("Shipped").size();
        orderCancel += dao.getOrdersByStatus("Expired").size();
        orderPending += dao.getOrdersByStatus("Delivering").size();
        orderPending += dao.getOrdersByStatus("Wait for pay").size();

        request.setAttribute("order_success", orderSuccess);
        request.setAttribute("order_cancel", orderCancel);
        request.setAttribute("order_pending", orderPending);

       

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
