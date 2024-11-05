/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.CategoryDAO;
import DAO.ProductDAO;
import Model.Category;
import Model.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "ListProductController", urlPatterns = {"/public/list-product"})
public class ListProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String pageParam = request.getParameter("page");
        String searchQuery = request.getParameter("searchQuery");
        String minPriceParam = request.getParameter("minPrice");
        String maxPriceParam = request.getParameter("maxPrice");
        String[] categoriesCheckBox = request.getParameterValues("category");
        String arrangePrice = request.getParameter("arrangePrice");
        String arrangeName = request.getParameter("arrangeName");
        String _categoriesCheckBox = "";

        double minPrice = 0;
        double maxPrice = 999999;
        int pageNumber = 1;
        int pageSize = 6;

        if (pageParam == null) {
            pageParam = "1";
        }
        if (searchQuery == null) {
            searchQuery = "";
        }
        if (arrangePrice == null) {
            arrangePrice = "ASC";
        }
        if (arrangeName == null) {
            arrangeName = "ASC";
        }
        if (minPriceParam != null && minPriceParam.trim().length() != 0) {
            minPrice = Double.parseDouble(minPriceParam);
        }
        if (maxPriceParam != null && maxPriceParam.trim().length() != 0) {
            maxPrice = Double.parseDouble(maxPriceParam);
        }
        if (pageParam != null && pageParam.trim().length() != 0) {
            pageNumber = Integer.parseInt(pageParam);
        }

        if (categoriesCheckBox != null && categoriesCheckBox.length != 0) {
            if (categoriesCheckBox.length == 1) {
                _categoriesCheckBox = categoriesCheckBox[0];
            } else {
                _categoriesCheckBox += categoriesCheckBox[0];
                for (String c : categoriesCheckBox) {
                    _categoriesCheckBox += (", " + c);
                }
            }
            request.setAttribute("categoriesCheckBox", Arrays.asList(categoriesCheckBox));
        }

        List<Product> products = new ProductDAO().listProductsPage(searchQuery, _categoriesCheckBox, minPrice, maxPrice, pageSize, pageNumber, arrangePrice, arrangeName);
        int total = new ProductDAO().countFilter(searchQuery, _categoriesCheckBox, minPrice, maxPrice);
        int endPage = (int) Math.ceil(1.0 * total / pageSize);
        List<Category> categories = new CategoryDAO().getCategories();

        request.setAttribute("products", products);
        request.setAttribute("endPage", endPage);
        request.setAttribute("page", pageNumber);
        request.setAttribute("categories", categories);
        request.setAttribute("arrangeName", arrangeName);
        request.setAttribute("searchQuery", searchQuery);
        request.setAttribute("arrangePrice", arrangePrice);
        request.setAttribute("minPrice", minPrice);
        request.setAttribute("maxPrice", maxPrice);

        request.getRequestDispatcher("/list-product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
