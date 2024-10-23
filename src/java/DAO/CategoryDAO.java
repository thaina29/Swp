/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Category;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Legion
 */
public class CategoryDAO extends DBContext{
    private Connection connection;

    public CategoryDAO() {
        try {
            this.connection = getConnection();
        } catch (Exception e) {
            System.out.println("Connect failed");
        }
    }
    
    public String getCategoryNameById(int categoryId) {
        // SQL query to retrieve category name by category ID
            String query = "SELECT Name FROM `swp-online-shop`.category WHERE ID = ?";
        try (PreparedStatement statement = connection.prepareStatement(query);){
            statement.setInt(1, categoryId);

            // Execute the query
            ResultSet rs = statement.executeQuery();

            // Check if result set is not empty
            if (rs.next()) {
                // Retrieve category name from result set
                return rs.getString("Name");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle SQLException
        }

        return null;
    }
    public List<Category> getCategories() {
        List<Category> categories = new ArrayList<>();

        String sql = "SELECT ID, Name FROM `swp-online-shop`.category WHERE IsDeleted = 0;";

        try (PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet rs = statement.executeQuery()) {

            while (rs.next()) {
                Category category = new Category(
                        rs.getInt("ID"),
                        rs.getString("Name")
                );
                categories.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categories;
    }
}
