/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.CartDAO;
import DAO.PostDAO;
import DAO.ProductDAO;
import DAO.SettingDAO;
import Model.Cart;
import Model.Category;
import Model.Product;
import Model.Setting;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author Legion
 */
@WebServlet(name = "CartContactController", urlPatterns = {"/public/cart-contact"})
public class CartContactController extends HttpServlet {

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
            out.println("<title>Servlet CartContactController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartContactController at " + request.getContextPath() + "</h1>");
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
        User user = (User) request.getSession().getAttribute("user");
        int userId = user.getId();
        int page = 1;
        int PAGE_SIZE = 5;
        String searchQuery = request.getParameter("searchQuery");
        String category = request.getParameter("category");
        String[] productID = request.getParameterValues("id");

        // Chuyển đổi mảng String thành List<Integer>
        List<Integer> selectedIdsList  = Arrays.stream(productID)
                .map(Integer::parseInt)
                .collect(Collectors.toList());
        
        String selectedIds = selectedIdsList.stream()
        .map(String::valueOf)
        .collect(Collectors.joining(","));

        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        CartDAO cartDAO = new CartDAO();
        ProductDAO productDAO = new ProductDAO();

        List<Cart> cartItemsFull = cartDAO.getAllCarts(userId, selectedIdsList );
        List<Cart> cartItems = cartDAO.getAllCarts2(userId, page, PAGE_SIZE, searchQuery, category, selectedIdsList );
        List<Category> categories = new PostDAO().getUniqueCategories();

        int totalCartItems = cartDAO.getCartCount(userId, searchQuery, category,selectedIdsList );
        int totalPages = (int) Math.ceil((double) totalCartItems / PAGE_SIZE);

        request.setAttribute("cartItemsFull", cartItemsFull);
        request.setAttribute("cartItems", cartItems);
        request.setAttribute("categories", categories);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("isSuccess", request.getParameter("isSuccess"));
        request.setAttribute("selectedIds", selectedIds);
        request.getRequestDispatcher("/cart-contact.jsp").forward(request, response);
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
