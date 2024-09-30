package DAO;

import Model.Product;
import Model.ProductDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProductDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public ProductDAO() {
        try {
            // Initialize the connection in the constructor
            conn = new DBContext().getConnection();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Product> homePage() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT \n"
                + "    p.*, \n"
                + "    pd.*\n"
                + "FROM \n"
                + "    product p\n"
                + "INNER JOIN (\n"
                + "    SELECT \n"
                + "        ProductID, \n"
                + "        MIN(Price) AS MinPrice\n"
                + "    FROM \n"
                + "        productDetail\n"
                + "    WHERE \n"
                + "        isDeleted = 0\n"
                + "    GROUP BY \n"
                + "        ProductID\n"
                + ") AS MinPrices ON p.ID = MinPrices.ProductID\n"
                + "INNER JOIN productDetail pd ON p.ID = pd.ProductID AND pd.Price = MinPrices.MinPrice\n"
                + "WHERE \n"
                + "    p.isDeleted = 0\n"
                + "ORDER BY \n"
                + "    p.CreatedAt DESC\n"
                + "LIMIT 12;";
        try {
            ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                ProductDetail productDetail = new ProductDetail();
                
                product.setProductID(rs.getInt("ID"));
                product.setProductName(rs.getString("Name"));
                product.setDescription(rs.getString("description"));
                
                productDetail.setPrice(rs.getDouble("price"));
                productDetail.setImageURL(rs.getString("ImageURL"));
                productDetail.setDiscount(rs.getDouble("discount"));
                
                product.setProductDetail(productDetail);
                
                products.add(product);
            }
            return products;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return products;
    }

    public static void main(String[] args) {
        for (Product p : new ProductDAO().homePage()) {
            System.out.println(p);
        }
    }

}
