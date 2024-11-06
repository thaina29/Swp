package controller;

import DAO.MarketingDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.text.ParseException;
import java.util.Calendar;

@WebServlet(name = "MarketingDashboardController", urlPatterns = {"/marketing/dashboard"})
public class MarketingDashboardController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String startDateParam = request.getParameter("startDate");
        String endDateParam = request.getParameter("endDate");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String startDate = null;
        String endDate = null;

        if (startDateParam != null && endDateParam != null) {
            try {
                // Validate dates by parsing
                Date start = sdf.parse(startDateParam);
                Date end = sdf.parse(endDateParam);
                startDate = sdf.format(start);
                endDate = sdf.format(end);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        } else {
            // Calculate today's date
            Date today = new Date();
            endDate = sdf.format(today);

            // Calculate the date 7 days ago
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(today);
            calendar.add(Calendar.DAY_OF_YEAR, -7);
            Date sevenDaysAgo = calendar.getTime();
            startDate = sdf.format(sevenDaysAgo);
        }

        MarketingDAO dao = new MarketingDAO();

        request.setAttribute("label", dao.getStatisticTrend(startDate, endDate));
        request.setAttribute("post", dao.getStatisticTrend("Post", startDate, endDate));
        request.setAttribute("product", dao.getStatisticTrend("Product", startDate, endDate));
        request.setAttribute("user", dao.getStatisticTrend("User", startDate, endDate));

        request.getRequestDispatcher("../marketing-dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    } 
}
