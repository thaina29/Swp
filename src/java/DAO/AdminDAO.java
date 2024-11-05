package DAO;

import Model.Order;
import Model.OrderDetail;
import Model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.LocalTime;

public class AdminDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public AdminDAO() {
        try {
            // Initialize the connection in the constructor
            conn = new DBContext().getConnection();
        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Read (Get Orders by Status)
    public List<Order> getOrdersByStatus(String status) {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM `Order` WHERE LOWER(Status) = LOWER(?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, status);
            rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("ID"));
                order.setUserId(rs.getInt("UserID"));
                order.setCreatedAt(rs.getDate("CreatedAt"));
                order.setStatus(rs.getString("Status"));
                order.setFullname(rs.getString("Fullname"));
                order.setPhone(rs.getString("Phone"));
                order.setAddress(rs.getString("Address"));

                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public int countFeedback() {
        int count = 0;
        String query = "SELECT * FROM Feedback";
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                count++;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    // Get total cost of orders from the previous n years
    public double getTotalCostOfPreviousNYears(int n) {
        double totalCost = 0.0;
        LocalDateTime currentDate = LocalDateTime.now();
        LocalDateTime previousStartDate = null;
        LocalDateTime previousEndDate = null;

        if (n != -1) {
            previousStartDate = currentDate.minusYears(n).withDayOfYear(1).with(LocalTime.MIN);
            previousEndDate = currentDate.minusYears(n - 1).withDayOfYear(1).with(LocalTime.MIN).minusSeconds(1);
        }

        String query;
        if (n == -1) {
            query = "SELECT * FROM `Order`";
        } else {
            query = "SELECT * FROM `Order` WHERE CreatedAt >= ? AND CreatedAt <= ?";
        }

        try (PreparedStatement ps = conn.prepareStatement(query)) {
            if (n != -1) {
                ps.setTimestamp(1, Timestamp.valueOf(previousStartDate));
                ps.setTimestamp(2, Timestamp.valueOf(previousEndDate));
            }

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Order order = new Order();
                    order.setId(rs.getInt("ID"));
                    order.setUserId(rs.getInt("UserID"));
                    order.setCreatedAt(rs.getDate("CreatedAt"));
                    order.setStatus(rs.getString("Status"));
                    order.setFullname(rs.getString("Fullname"));
                    order.setPhone(rs.getString("Phone"));
                    order.setAddress(rs.getString("Address"));

                    totalCost += new OrderDAO().getTotal(order.getId());
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalCost;
    }

    public double getTotalCostByCategory(int id) {
        double totalCost = 0.0;

        String query = "SELECT ROUND(SUM(pd.price * od.quantity / 100 * (100 - pd.discount)), 2) AS TotalCost " +
                "FROM OrderDetail od, ProductDetail pd, Product p " +
                "WHERE od.ProductDetailID = pd.ID AND pd.ProductID = p.ID AND (? = -1 OR p.CategoryID = ?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.setInt(2, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                totalCost += rs.getDouble("TotalCost");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalCost;
    }

    public double getAverageFeedbackByCategoryId(int id) {
        double avg = 0.0;

        String query = "SELECT ROUND(SUM(Rating) / COUNT(*), 2) AS Average " +
                "FROM Feedback f, OrderDetail od, ProductDetail pd, Product p " +
                "WHERE f.OrderDetailID = od.ID AND od.ProductDetailID = pd.ID AND pd.ProductID = p.ID AND (? = -1 OR p.CategoryID = ?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.setInt(2, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                avg = rs.getDouble("Average");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return avg;
    }

    // Read (Get Orders by Status and Date Range)
    public List<Order> getOrdersByStatusAndDateRange(String status, LocalDateTime startDate, LocalDateTime endDate) {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM `Order` WHERE LOWER(Status) = LOWER(?) AND `CreatedAt` >= ? AND `CreatedAt` <= ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, status);
            ps.setTimestamp(2, Timestamp.valueOf(startDate));
            ps.setTimestamp(3, Timestamp.valueOf(endDate));
            rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("ID"));
                order.setUserId(rs.getInt("UserID"));
                order.setCreatedAt(rs.getDate("CreatedAt"));
                order.setStatus(rs.getString("Status"));
                order.setFullname(rs.getString("Fullname"));
                order.setPhone(rs.getString("Phone"));
                order.setAddress(rs.getString("Address"));

                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public List<Order> getOrdersByStatusAndDateRange(String status, LocalDateTime startDate, LocalDateTime endDate, String name) {
        if (name == null || name.trim().isBlank()) return getOrdersByStatusAndDateRange(status, startDate, endDate);

        List<Order> orders = new ArrayList<>();
        String query = "SELECT o.* FROM `Order` o, Staff s " +
                       "WHERE LOWER(o.Status) = LOWER(?) AND o.`CreatedAt` >= ? AND o.`CreatedAt` <= ? " +
                       "AND o.CreatedBy = s.id AND LOWER(s.Fullname) = LOWER(?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, status);
            ps.setTimestamp(2, Timestamp.valueOf(startDate));
            ps.setTimestamp(3, Timestamp.valueOf(endDate));
            ps.setString(4, name);
            rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("ID"));
                order.setUserId(rs.getInt("UserID"));
                order.setCreatedAt(rs.getDate("CreatedAt"));
                order.setStatus(rs.getString("Status"));
                order.setFullname(rs.getString("Fullname"));
                order.setPhone(rs.getString("Phone"));
                order.setAddress(rs.getString("Address"));

                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public User getLastOrderCustomer() {
        String sql = "SELECT * FROM `Order` ORDER BY ID DESC LIMIT 1";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {
                int userId = rs.getInt("UserID");
                return new UserDAO().getUserById(userId);
            }
        } catch (SQLException ex) {
            System.out.println("getLastOrderCustomer: " + ex.getMessage());
        }

        return new User();
    }
}
