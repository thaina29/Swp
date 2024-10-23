package DAO;

import DAO.DBContext;
import Model.Setting;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class SettingDAO extends  DBContext{

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public SettingDAO() {
        try {
            // Initialize the connection in the constructor
            conn = getConnection();
        } catch (Exception ex) {
            Logger.getLogger(SettingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Create
    public boolean addSetting(String type, String value, int order, String description) {
        String query = "INSERT INTO `swp-online-shop`.settings (Type, Value, `Order`, description) VALUES (?, ?, ?, ?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, type);
            ps.setString(2, value);
            ps.setInt(3, order);
            ps.setString(4, description);
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Read
    public Setting getSettingByID(int settingID) {
        String query = "SELECT * FROM `swp-online-shop`.settings WHERE ID = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, settingID);
            rs = ps.executeQuery();
            if (rs.next()) {
                Setting setting = new Setting(
                        rs.getInt("ID"),
                        rs.getString("Type"),
                        rs.getString("Value"),
                        rs.getInt("Order")
                );
                
                setting.setIsDeleted(rs.getBoolean("isDeleted"));
                setting.setDescription(rs.getString("description"));
                return setting;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Update
    public boolean updateSetting(Setting setting) {
        String query = "UPDATE `swp-online-shop`.settings SET Type=?, Value=?, Order=?, isDeleted=?, description=? WHERE ID=?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, setting.getType());
            ps.setString(2, setting.getValue());
            ps.setInt(3, setting.getOrder());
            ps.setBoolean(4, setting.getIsDeleted());
            ps.setString(5, setting.getDescription());
            ps.setInt(6, setting.getID());
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete
    public boolean deleteSetting(int settingID) {
        String query = "DELETE FROM `swp-online-shop`.settings WHERE ID=?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, settingID);
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get all settings
    public List<Setting> getAllSettings() {
        List<Setting> settingsList = new ArrayList<>();
        String query = "SELECT * FROM `swp-online-shop`.settings";
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Setting setting = new Setting();
                setting.setID(rs.getInt("ID"));
                setting.setType(rs.getString("Type"));
                setting.setValue(rs.getString("Value"));
                setting.setOrder(rs.getInt("Order"));
                setting.setIsDeleted(rs.getBoolean("isDeleted"));
                setting.setDescription(rs.getString("description"));
                settingsList.add(setting);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return settingsList;
    }

    // Get all settings with pagination
    public List<Setting> getAllSettings(int pageNumber, int pageSize) {
        List<Setting> settingsList = new ArrayList<>();
        String query = "SELECT * FROM (SELECT ROW_NUMBER() OVER (ORDER BY ID) AS RowNum, * FROM `swp-online-shop`.settings) AS SubQuery WHERE RowNum BETWEEN ? AND ?";
        int startIndex = (pageNumber - 1) * pageSize + 1;
        int endIndex = pageNumber * pageSize;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, startIndex);
            ps.setInt(2, endIndex);
            rs = ps.executeQuery();
            while (rs.next()) {
                Setting setting = new Setting();
                setting.setID(rs.getInt("ID"));
                setting.setType(rs.getString("Type"));
                setting.setValue(rs.getString("Value"));
                setting.setOrder(rs.getInt("Order"));
                setting.setIsDeleted(rs.getBoolean("isDeleted"));
                setting.setDescription(rs.getString("description"));
                settingsList.add(setting);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return settingsList;
    }

}
