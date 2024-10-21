/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import DAO.ProductDAO;
import Model.Product;
import Model.ProductDetail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Legion
 */
@WebServlet(name="ProductDetailController", urlPatterns={"/public/product-detail"})
public class ProductDetailController extends HttpServlet {
   

    private static final int PAGE_SIZE = 10;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        Product product = new ProductDAO().getProductById(id);
        if(request.getParameter("pdid") != null) {
            int pdid = Integer.parseInt(request.getParameter("pdid"));
            product.setProductDetail(new ProductDAO().getProductDetailById(pdid));
        }
        
        

        List<ProductDetail> listDetails = new ProductDAO().getProductDetailsByProductId(id);
        request.setAttribute("product", product);
        request.setAttribute("listDetails", listDetails);
        request.getRequestDispatcher("/product-detail.jsp").forward(request, response);
    } 

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    }


}