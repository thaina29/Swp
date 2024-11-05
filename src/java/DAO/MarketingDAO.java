package DAO;

import Model.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
<<<<<<< HEAD
=======
import java.util.concurrent.TimeUnit;
>>>>>>> thaina

public class MarketingDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public MarketingDAO() {
        try {
            // Initialize the connection in the constructor
            conn = new DBContext().getConnection();
        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String getStatisticTrend(String table) {
        StringBuilder result = new StringBuilder();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar = Calendar.getInstance();

        for (int i = 0; i < 7; i++) {
            Date currentDate = calendar.getTime();
            String formattedDate = dateFormat.format(currentDate);

            String query = "SELECT COUNT(*) AS Count FROM " + table + " WHERE CAST(CreatedAt AS DATE) = ?";
            try {
                ps = conn.prepareStatement(query);
                ps.setString(1, formattedDate);
                rs = ps.executeQuery();
                if (rs.next()) {
                    int userCount = rs.getInt("Count");
                    if (i > 0) {
                        result.append(",");
                    }
                    result.append(userCount);
                }
            } catch (SQLException e) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
            }

            // Move calendar to previous day
            calendar.add(Calendar.DATE, -1);
        }

        return result.toString();
    }

    public String getStatisticTrend(String table, Date startDate) {
        StringBuilder result = new StringBuilder();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(startDate);

        for (int i = 0; i < 7; i++) {
            Date currentDate = calendar.getTime();
            String formattedDate = dateFormat.format(currentDate);

            String query = "SELECT COUNT(*) AS UserCount FROM " + table + " WHERE CAST(CreatedAt AS DATE) = ?";
            try {
                ps = conn.prepareStatement(query);
                ps.setString(1, formattedDate);
                rs = ps.executeQuery();
                if (rs.next()) {
                    int userCount = rs.getInt("UserCount");
                    if (i > 0) {
                        result.append(",");
                    }
                    result.append(userCount);
                }
            } catch (SQLException e) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
            } finally {
                try {
                    if (rs != null) {
                        rs.close();
                    }
                    if (ps != null) {
                        ps.close();
                    }
                } catch (SQLException e) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
                }
            }

            // Move calendar to previous day
            calendar.add(Calendar.DATE, -1);
        }

        return result.toString();
    }

    public String getStatisticTrend(String table, String startDate, String endDate) {
        StringBuilder result = new StringBuilder();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar = Calendar.getInstance();

        try {
            Date start = dateFormat.parse(startDate);
            Date end = dateFormat.parse(endDate);

            // Ensure the range is no more than 14 days
            calendar.setTime(start);
            calendar.add(Calendar.DATE, 14);
            Date maxEndDate = calendar.getTime();
            if (end.after(maxEndDate)) {
                end = maxEndDate;
            }

            calendar.setTime(start);
            while (!calendar.getTime().after(end)) {
                Date currentDate = calendar.getTime();
                String formattedDate = dateFormat.format(currentDate);

                String query = "SELECT COUNT(*) AS Count FROM " + table + " WHERE CAST(CreatedAt AS DATE) = ?";
                try (PreparedStatement ps = conn.prepareStatement(query)) {
                    ps.setString(1, formattedDate);
                    try (ResultSet rs = ps.executeQuery()) {
                        if (rs.next()) {
                            int userCount = rs.getInt("Count");
                            if (result.length() > 0) {
                                result.append(",");
                            }
                            result.append(userCount);
                        }
                    }
                } catch (SQLException e) {
                    Logger.getLogger(MarketingDAO.class.getName()).log(Level.SEVERE, null, e);
                }

                // Move calendar to next day
                calendar.add(Calendar.DATE, 1);
            }

        } catch (ParseException e) {
            Logger.getLogger(MarketingDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return result.toString();
    }

    public String getStatisticTrend(String startDate, String endDate) {
        StringBuilder result = new StringBuilder();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar = Calendar.getInstance();

        try {
            Date start = dateFormat.parse(startDate);
            Date end = dateFormat.parse(endDate);
<<<<<<< HEAD

            // Ensure the range is no more than 14 days
            calendar.setTime(start);
            calendar.add(Calendar.DATE, 14);
=======
            
            
            long differenceInMillis = Math.abs(end.getTime() - start.getTime());
            
            int dif = (int) TimeUnit.DAYS.convert(differenceInMillis, TimeUnit.MILLISECONDS);

            // Ensure the range is no more than 14 days
            calendar.setTime(start);
            calendar.add(Calendar.DATE, dif);
>>>>>>> thaina
            Date maxEndDate = calendar.getTime();
            if (end.after(maxEndDate)) {
                end = maxEndDate;
            }

            calendar.setTime(start);
            while (!calendar.getTime().after(end)) {
                Date currentDate = calendar.getTime();
                String formattedDate = dateFormat.format(currentDate);

                if (result.length() > 0) {
                    result.append(",");
                }
                result.append("'" + formattedDate + "'");

                // Move calendar to next day
                calendar.add(Calendar.DATE, 1);
            }

        } catch (ParseException e) {
            Logger.getLogger(MarketingDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return result.toString();
    }

<<<<<<< HEAD
}
=======
}
>>>>>>> thaina
