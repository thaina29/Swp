package controller;

import DAO.SettingDAO;
import Model.Setting;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet(name = "AdminSettingControl", urlPatterns = {"/admin/setting"})
public class AdminSettingControl extends HttpServlet {

    private SettingDAO settingDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        settingDAO = new SettingDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String pageString = request.getParameter("page");

        int pageNumber = pageString == null ? 1 : Integer.parseInt(pageString);
        int pageSize = 5;

        // List settings with pagination
        List<Setting> settingList = settingDAO.getAllSettings();

        // Get total number of settings
        int totalSettings = settingDAO.getAllSettings().size();

        // Calculate total number of pages
        int totalPages = (int) Math.ceil((double) totalSettings / pageSize);

        // Forward setting list and pagination parameters to JSP
        request.setAttribute("settingList", settingList);
        request.setAttribute("currentPage", pageNumber);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("totalPages", totalPages);

        request.getRequestDispatcher("../setting-list.jsp").forward(request, response);
    }

}