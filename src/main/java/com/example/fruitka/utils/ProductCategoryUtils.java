package com.example.fruitka.utils;


import com.example.fruitka.entity.Category;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;

public class ProductCategoryUtils {
    public static List<Category> getAll(Connection conn) throws SQLException {
        String sql = "SELECT * FROM ProductCategory";
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        List<Category> list = new ArrayList<>();
        while (rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("name");
            Timestamp createdAtTimestamp = rs.getTimestamp("created_at");
            Date createdAt = new Date(createdAtTimestamp.getTime());
            Category category = new Category(id, name, createdAt);
            list.add(category);
        }

        return list;
    }


    public static void add(Connection conn, String name) throws SQLException {
        String sql = "INSERT INTO ProductCategory(name) VALUES (?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, name);
        pstm.executeUpdate();
    }

    public static void edit(Connection conn, int id, String name) throws SQLException {
        String sql = "UPDATE ProductCategory SET name = ? WHERE id = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, name);
        pstm.setInt(2, id);
        pstm.executeUpdate();
    }

    public static void delete(Connection conn, int id) throws SQLException {
        String sql = "DELETE FROM ProductCategory WHERE id = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.executeUpdate();
    }

    public static Category getById(Connection conn, int id) throws SQLException {
        String sql = "SELECT * FROM ProductCategory WHERE id = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            String name = rs.getString("name");
            Timestamp createdAtTimestamp = rs.getTimestamp("created_at");
            Date createdAt = new Date(createdAtTimestamp.getTime());
            return new Category(id, name, createdAt);
        }
        return null;
    }

}
