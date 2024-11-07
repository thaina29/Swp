/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.AdminDAO;
import DAO.SaleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;

/**
 *
 * @author Legion
 */
@WebServlet(name = "SaleDashBoardController", urlPatterns = {"/sale/dashboard"})
public class SaleDashBoardController extends HttpServlet {

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
            out.println("<title>Servlet SaleDashBoardController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SaleDashBoardController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AdminDAO dao = new AdminDAO();
        
        // Get the start date and end date from request parameters
        String startDateStr = request.getParameter("start_date");
        String endDateStr = request.getParameter("end_date");
        String sale = request.getParameter("sale");

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
        orderPending += dao.getOrdersByStatus("Delivering").size();
        orderPending += dao.getOrdersByStatus("Wait for pay").size();
        orderCancel += dao.getOrdersByStatus("Expired").size();
        
        request.setAttribute("order_success", orderSuccess);
        request.setAttribute("order_cancel", orderCancel);
        request.setAttribute("order_pending", orderPending);

        int orderSuccessFilter = 0;
        int orderCancelFilter = 0;
        int orderPendingFilter = 0;
        
        orderPendingFilter += dao.getOrdersByStatusAndDateRange("Submitted", startDate, endDate, sale).size();
        orderPendingFilter += dao.getOrdersByStatusAndDateRange("Approved", startDate, endDate, sale).size();
        orderPendingFilter += dao.getOrdersByStatusAndDateRange("Delivering", startDate, endDate, sale).size();
        orderPendingFilter += dao.getOrdersByStatusAndDateRange("Wait for pay", startDate, endDate, sale).size();
        orderCancelFilter += dao.getOrdersByStatusAndDateRange("Expired", startDate, endDate, sale).size();
        orderSuccessFilter += dao.getOrdersByStatusAndDateRange("Shipped", startDate, endDate, sale).size();
        
        request.setAttribute("order_success_filter", orderSuccessFilter);
        request.setAttribute("order_cancel_filter", orderCancelFilter);
        request.setAttribute("order_pending_filter", orderPendingFilter);

        // Retrieve total cost of orders from previous years
        request.setAttribute("total_now", new SaleDAO().getTotalCostOfPreviousNYears(0));
        request.setAttribute("total_prev", new SaleDAO().getTotalCostOfPreviousNYears(1));

        // Set start and end dates
        request.setAttribute("startDate", startDate.toString().substring(0, 10));
        request.setAttribute("endDate", endDate.toString().substring(0, 10));
        request.setAttribute("sale", sale);


        request.getRequestDispatcher("../sale-dashboard.jsp").forward(request, response);
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
