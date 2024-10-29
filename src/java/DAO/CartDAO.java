package DAO;

import Model.Cart;
import Model.ProductDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.Timestamp;
import java.util.Date;
import java.util.stream.Collectors;

/**
 *
 * @author Legion
 */
public class CartDAO {

    private Connection connection;
    private PreparedStatement stmt;
    private ResultSet rs;

    public CartDAO() {
        try {
            // Initialize the connection in the constructor
            connection = new DBContext().getConnection();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Cart> getAllCarts(int userId) {
        List<Cart> carts = new ArrayList<>();
        try {

            // SQL query to retrieve all cart items
            String query = "SELECT id, userId, productDetailId, quantity, isDeleted, createdAt, createdBy FROM `swp-online-shop`.`Cart` where userId = ?";

            // Prepare the statement
            stmt = connection.prepareStatement(query);
            stmt.setInt(1, userId);

            // Execute the query
            rs = stmt.executeQuery();

            // Process the result set
            while (rs.next()) {
                int id = rs.getInt("id");
                int productDetailId = rs.getInt("productDetailId");
                int quantity = rs.getInt("quantity");
                boolean isDeleted = rs.getBoolean("isDeleted");
                Timestamp createdAt = rs.getTimestamp("createdAt");
                int createdBy = rs.getInt("createdBy");

                // Create a Cart object and add it to the list
                Cart cart = new Cart(id, userId, productDetailId, quantity, isDeleted, new Date(createdAt.getTime()), createdBy);
                carts.add(cart);
            }
        } catch (SQLException e) {
            System.out.println("getAllCarts: " + e.getMessage());
        }
        return carts;
    }

    public List<Cart> getAllCarts(int userId, List<Integer> selectedIds) {
        List<Cart> carts = new ArrayList<>();
        try {
            // Xây dựng điều kiện lọc dựa trên danh sách ID sản phẩm đã chọn
            String selectedIdsCondition = "";
            if (selectedIds != null && !selectedIds.isEmpty()) {
                selectedIdsCondition = "AND productDetailId IN ("
                        + selectedIds.stream().map(String::valueOf).collect(Collectors.joining(",")) + ")";
            }

            // SQL query để lấy các cart dựa theo userId và danh sách productDetailId
            String query = "SELECT id, userId, productDetailId, quantity, isDeleted, createdAt, createdBy "
                    + "FROM `swp-online-shop`.`Cart` "
                    + "WHERE userId = ? " + selectedIdsCondition;

            // Chuẩn bị câu lệnh SQL
            stmt = connection.prepareStatement(query);
            stmt.setInt(1, userId);

            // Thực thi truy vấn
            rs = stmt.executeQuery();

            // Xử lý kết quả truy vấn
            while (rs.next()) {
                int id = rs.getInt("id");
                int productDetailId = rs.getInt("productDetailId");
                int quantity = rs.getInt("quantity");
                boolean isDeleted = rs.getBoolean("isDeleted");
                Timestamp createdAt = rs.getTimestamp("createdAt");
                int createdBy = rs.getInt("createdBy");

                // Tạo đối tượng Cart và thêm vào danh sách
                Cart cart = new Cart(id, userId, productDetailId, quantity, isDeleted, new Date(createdAt.getTime()), createdBy);
                carts.add(cart);
            }
        } catch (SQLException e) {
            System.out.println("getAllCarts: " + e.getMessage());
        }
        return carts;
    }

    public List<Cart> getAllCarts(int userId, int page, int pageSize, String searchQuery, String category) {
        List<Cart> carts = new ArrayList<>();
        int offset = (page - 1) * pageSize;

        try {
            if (category == null) {
                category = "";
            }
            if (searchQuery == null) {
                searchQuery = "";
            }
            // SQL query with pagination, search, and filter
            String query = "SELECT c.id, c.userId, c.productDetailId, c.quantity, c.isDeleted, c.createdAt, c.createdBy "
                    + "FROM `swp-online-shop`.`Cart` c "
                    + "JOIN `swp-online-shop`.`ProductDetail` pd ON c.ProductDetailID = pd.ID "
                    + "JOIN `swp-online-shop`.`Product` p ON p.ID = pd.ProductID "
                    + "JOIN `swp-online-shop`.`Category` cat ON p.CategoryID = cat.ID "
                    + "WHERE c.userId = ? "
                    + "AND cat.Name LIKE '%" + category + "%'"
                    + "AND p.Name LIKE '%" + searchQuery + "%'"
                    + "ORDER BY c.createdAt DESC "
                    + "LIMIT ?, ?";

            stmt = connection.prepareStatement(query);
            stmt.setInt(1, userId);
            stmt.setInt(2, offset);
            stmt.setInt(3, pageSize);

            rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                int productDetailId = rs.getInt("productDetailId");
                int quantity = rs.getInt("quantity");
                boolean isDeleted = rs.getBoolean("isDeleted");
                Timestamp createdAt = rs.getTimestamp("createdAt");
                int createdBy = rs.getInt("createdBy");

                Cart cart = new Cart(id, userId, productDetailId, quantity, isDeleted, new Date(createdAt.getTime()), createdBy);
                carts.add(cart);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return carts;
    }

    public List<Cart> getAllCarts2(int userId, int page, int pageSize, String searchQuery, String category, List<Integer> selectedIds) {
        List<Cart> carts = new ArrayList<>();
        int offset = (page - 1) * pageSize;

        try {
            if (category == null) {
                category = "";
            }
            if (searchQuery == null) {
                searchQuery = "";
            }

            // Xây dựng điều kiện lọc dựa trên danh sách ID sản phẩm đã chọn
            String selectedIdsCondition = "";
            if (selectedIds != null && !selectedIds.isEmpty()) {
                selectedIdsCondition = "AND c.productDetailId IN ("
                        + selectedIds.stream().map(String::valueOf).collect(Collectors.joining(",")) + ")";
            }

            // Câu truy vấn với điều kiện lọc theo danh sách ID, phân trang, tìm kiếm và lọc
            String query = "SELECT c.id, c.userId, c.productDetailId, c.quantity, c.isDeleted, c.createdAt, c.createdBy "
                    + "FROM `swp-online-shop`.`Cart` c "
                    + "JOIN `swp-online-shop`.`ProductDetail` pd ON c.ProductDetailID = pd.ID "
                    + "JOIN `swp-online-shop`.`Product` p ON p.ID = pd.ProductID "
                    + "JOIN `swp-online-shop`.`Category` cat ON p.CategoryID = cat.ID "
                    + "WHERE c.userId = ? "
                    + selectedIdsCondition + " "
                    + "AND cat.Name LIKE ? "
                    + "AND p.Name LIKE ? "
                    + "ORDER BY c.createdAt DESC "
                    + "LIMIT ?, ?";

            stmt = connection.prepareStatement(query);
            stmt.setInt(1, userId);
            stmt.setString(2, "%" + category + "%");
            stmt.setString(3, "%" + searchQuery + "%");
            stmt.setInt(4, offset);
            stmt.setInt(5, pageSize);

            rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                int productDetailId = rs.getInt("productDetailId");
                int quantity = rs.getInt("quantity");
                boolean isDeleted = rs.getBoolean("isDeleted");
                Timestamp createdAt = rs.getTimestamp("createdAt");
                int createdBy = rs.getInt("createdBy");

                Cart cart = new Cart(id, userId, productDetailId, quantity, isDeleted, new Date(createdAt.getTime()), createdBy);
                carts.add(cart);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return carts;
    }

    public int getCartCount(int userId, String searchQuery, String category) {
        int count = 0;

        try {
            if (category == null) {
                category = "";
            }
            if (searchQuery == null) {
                searchQuery = "";
            }
            String query = "SELECT COUNT(*) AS total "
                    + "FROM `swp-online-shop`.`Cart` c "
                    + "JOIN `swp-online-shop`.`ProductDetail` pd ON c.ProductDetailID = pd.ID "
                    + "JOIN `swp-online-shop`.`Product` p ON p.ID = pd.ProductID "
                    + "JOIN `swp-online-shop`.`Category` cat ON p.CategoryID = cat.ID "
                    + "WHERE c.userId = ? "
                    + "AND cat.Name LIKE '%" + category + "%'"
                    + "AND p.Name LIKE '%" + searchQuery + "%'";

            stmt = connection.prepareStatement(query);
            stmt.setInt(1, userId);

            rs = stmt.executeQuery();

            if (rs.next()) {
                count = rs.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    public int getCartCount(int userId, String searchQuery, String category, List<Integer> selectedIds) {
        int count = 0;

        try {
            if (category == null) {
                category = "";
            }
            if (searchQuery == null) {
                searchQuery = "";
            }

            // Xây dựng điều kiện lọc cho danh sách ID sản phẩm đã chọn
            String selectedIdsCondition = "";
            if (selectedIds != null && !selectedIds.isEmpty()) {
                selectedIdsCondition = "AND c.productDetailId IN ("
                        + selectedIds.stream().map(String::valueOf).collect(Collectors.joining(",")) + ")";
            }

            // Câu truy vấn SQL để đếm các giỏ hàng dựa trên userId, category, searchQuery, và selectedIds
            String query = "SELECT COUNT(*) AS total "
                    + "FROM `swp-online-shop`.`Cart` c "
                    + "JOIN `swp-online-shop`.`ProductDetail` pd ON c.ProductDetailID = pd.ID "
                    + "JOIN `swp-online-shop`.`Product` p ON p.ID = pd.ProductID "
                    + "JOIN `swp-online-shop`.`Category` cat ON p.CategoryID = cat.ID "
                    + "WHERE c.userId = ? "
                    + selectedIdsCondition + " "
                    + "AND cat.Name LIKE ? "
                    + "AND p.Name LIKE ?";

            stmt = connection.prepareStatement(query);
            stmt.setInt(1, userId);
            stmt.setString(2, "%" + category + "%");
            stmt.setString(3, "%" + searchQuery + "%");

            rs = stmt.executeQuery();

            if (rs.next()) {
                count = rs.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    public boolean updateCart(int quantity, int cartId) {
        try {
            String sql = "UPDATE `swp-online-shop`.`Cart` SET Quantity = ? WHERE ID = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, quantity);
            stmt.setInt(2, cartId);
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteCart(int cartId) {
        boolean isDeleted = false;

        try {
            String query = "DELETE FROM `swp-online-shop`.`Cart` WHERE id = ?";

            stmt = connection.prepareStatement(query);
            stmt.setInt(1, cartId);

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                isDeleted = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isDeleted;
    }

    public void addToCart(int userId, int productDetailId, int quantity) {
        try {
            // Check if the item already exists in the cart
            String selectSQL = "SELECT quantity FROM `swp-online-shop`.`Cart` WHERE userId = ? AND productDetailId = ? AND isDeleted = 0";
            PreparedStatement selectStmt = connection.prepareStatement(selectSQL);
            selectStmt.setInt(1, userId);
            selectStmt.setInt(2, productDetailId);
            rs = selectStmt.executeQuery();

            if (rs.next()) {
                // Item exists, update the quantity
                int currentQuantity = rs.getInt("quantity");
                int newQuantity = currentQuantity + quantity;

                ProductDetail productDetail = new ProductDAO().getProductDetailById(productDetailId);
                if (productDetail.getStock() >= newQuantity) {
                    String updateSQL = "UPDATE `swp-online-shop`.`Cart` SET quantity = ? WHERE userId = ? AND productDetailId = ? AND isDeleted = 0";
                    PreparedStatement updateStmt = connection.prepareStatement(updateSQL);
                    updateStmt.setInt(1, newQuantity);
                    updateStmt.setInt(2, userId);
                    updateStmt.setInt(3, productDetailId);
                    updateStmt.executeUpdate();
                }

            } else {
                // Item does not exist, insert a new record
                String insertSQL = "INSERT INTO `swp-online-shop`.`Cart` (userId, productDetailId, quantity, isDeleted, createdAt, createdBy) VALUES (?, ?, ?, 0, ?, ?)";
                PreparedStatement insertStmt = connection.prepareStatement(insertSQL);
                insertStmt.setInt(1, userId);
                insertStmt.setInt(2, productDetailId);
                insertStmt.setInt(3, quantity);
                insertStmt.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
                insertStmt.setInt(5, userId);  // Assuming userId is also the createdBy
                insertStmt.executeUpdate();
            }
        } catch (SQLException ex) {
            System.out.println("addToCart: " + ex.getMessage());
        }
    }

    public int getTotalProductCount(int userId) {
        int totalQuantity = 0;
        try {
            String query = "SELECT Count(*) AS totalQuantity FROM `swp-online-shop`.`Cart` WHERE UserID = ? AND isDeleted = 0";
            stmt = connection.prepareStatement(query);
            stmt.setInt(1, userId);
            rs = stmt.executeQuery();
            if (rs.next()) {
                totalQuantity = rs.getInt("totalQuantity");
            }
        } catch (SQLException e) {
            System.out.println("getTotalProductCount: " + e.getMessage());
        }
        return totalQuantity;
    }

    public void clearCart(int userId) {
        try {
            String query = "Delete from `swp-online-shop`.`Cart` where userid = ?";
            stmt = connection.prepareStatement(query);
            stmt.setInt(1, userId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("clearCart: " + e.getMessage());
        }
    }

    public void clearSelectedCartItems(int userId, List<Integer> selectedProductDetailIds) {
        if (selectedProductDetailIds == null || selectedProductDetailIds.isEmpty()) {
            return; // No items to delete
        }

        String placeholders = selectedProductDetailIds.stream()
                .map(id -> "?")
                .collect(Collectors.joining(", "));

        String query = "DELETE FROM `swp-online-shop`.`Cart` WHERE userId = ? AND productDetailId IN (" + placeholders + ")";
        try {
            stmt = connection.prepareStatement(query);
            stmt.setInt(1, userId);

            // Set each selectedProductDetailId as a parameter in the prepared statement
            for (int i = 0; i < selectedProductDetailIds.size(); i++) {
                stmt.setInt(i + 2, selectedProductDetailIds.get(i));
            }

            stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("clearSelectedCartItems: " + e.getMessage());
        }
    }

}
