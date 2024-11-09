package com.example.fruitka.utils;

import com.example.fruitka.entity.Category;
import com.example.fruitka.entity.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class ProductUtils {
    public static List<Product> getAll(Connection conn) throws SQLException {
        String sql = "SELECT * FROM Products";
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        List<Product> list = new ArrayList<>();
        while (rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("name");
            String slug = rs.getString("slug");
            int price = rs.getInt("price");
            int salePrice = rs.getInt("sale_price");
            int quantity = rs.getInt("quantity");
            String description = rs.getString("description");
            String image = rs.getString("image");
            Category category = ProductCategoryUtils.getById(conn, rs.getInt("product_category_id"));
            Timestamp createdAtTimestamp = rs.getTimestamp("created_at");
            Date createdAt = new Date(createdAtTimestamp.getTime());
            Product product = new Product(id, name, slug, price, salePrice, quantity, description, image, category,
                    createdAt);
            list.add(product);
        }

        return list;
    }

    public static List<Product> getAllPagination(Connection conn, int limit, int offset, int categoryId, String search) throws SQLException {
        String sql = "SELECT * FROM Products WHERE name LIKE ?";

        if (categoryId > 0) {
            sql += " AND product_category_id = ?";
        }

        sql += " ORDER BY id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, "%" + search + "%");
        if (categoryId > 0) {
            statement.setInt(2, categoryId);
            statement.setInt(3, offset);
            statement.setInt(4, limit);
        } else {
            statement.setInt(2, offset);
            statement.setInt(3, limit);
        }
        ResultSet resultSet = statement.executeQuery();
        List<Product> list = new ArrayList<>();
        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String name = resultSet.getString("name");
            String slug = resultSet.getString("slug");
            int price = resultSet.getInt("price");
            int salePrice = resultSet.getInt("sale_price");
            int quantity = resultSet.getInt("quantity");
            String description = resultSet.getString("description");
            String image = resultSet.getString("image");
            Category category = ProductCategoryUtils.getById(conn, resultSet.getInt("product_category_id"));
            Timestamp createdAtTimestamp = resultSet.getTimestamp("created_at");
            Date createdAt = new Date(createdAtTimestamp.getTime());
            Product product = new Product(id, name, slug, price, salePrice, quantity, description, image, category, createdAt);
            list.add(product);
        }
        return list;
    }


    public static int getTotal(Connection conn, int categoryId, String search) throws SQLException {
        String sql = "SELECT COUNT(*) AS total FROM Products WHERE name LIKE ?";

        if (categoryId > 0) {
            sql += " AND product_category_id = ?";
        }

        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, "%" + search + "%");
        if (categoryId > 0) {
            statement.setInt(2, categoryId);
        }
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            return resultSet.getInt("total");
        }

        return 0;
    }

    public static void create(Connection conn, Product product, int categoryId) throws SQLException {
        String sql = "INSERT INTO Products(name, slug, price, sale_price, quantity, description, image, product_category_id) VALUES(?,?,?,?,?,?,?,?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, product.getName());
        pstm.setString(2, product.getSlug());
        pstm.setInt(3, product.getPrice());
        pstm.setInt(4, product.getSalePrice());
        pstm.setInt(5, product.getQuantity());
        pstm.setString(6, product.getDescription());
        pstm.setString(7, product.getImage());
        pstm.setInt(8, categoryId);
        pstm.executeUpdate();
    }

    public static void update(Connection conn, Product product, int categoryId) throws SQLException {
        String sql = "UPDATE Products SET name = ?, slug = ?, price = ?, sale_price = ?, quantity = ?, description = ?, image = ?, product_category_id = ? WHERE id = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, product.getName());
        pstm.setString(2, product.getSlug());
        pstm.setInt(3, product.getPrice());
        pstm.setInt(4, product.getSalePrice());
        pstm.setInt(5, product.getQuantity());
        pstm.setString(6, product.getDescription());
        pstm.setString(7, product.getImage());
        pstm.setInt(8, categoryId);
        pstm.setInt(9, product.getId());
        pstm.executeUpdate();
    }

    public static void updateQuantity(Connection conn, int id, int quantity) throws SQLException {
        String sql = "UPDATE Products SET quantity = ? WHERE id = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1,quantity);
        ps.setInt(2,id);
        ps.executeUpdate();
    }

    public static void delete(Connection conn, int id) throws SQLException {
        String sql = "DELETE FROM Products WHERE id = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.executeUpdate();
    }

    public static List<Product> getRelatedProducts(Connection conn, int id) throws SQLException {
        String sql = "SELECT * FROM Products WHERE NOT id = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        List<Product> list = new ArrayList<>();
        while (rs.next()) {
            int productId = rs.getInt("id");
            String name = rs.getString("name");
            String slug = rs.getString("slug");
            int price = rs.getInt("price");
            int salePrice = rs.getInt("sale_price");
            int quantity = rs.getInt("quantity");
            String description = rs.getString("description");
            String image = rs.getString("image");
            Category category = ProductCategoryUtils.getById(conn, rs.getInt("product_category_id"));
            Timestamp createdAtTimestamp = rs.getTimestamp("created_at");
            Date createdAt = new Date(createdAtTimestamp.getTime());
            Product product = new Product(productId, name, slug, price, salePrice, quantity, description, image, category, createdAt);
            list.add(product);
        }

        return list;
    }


    public static Product getById(Connection conn, int id) throws SQLException {
        String sql = "SELECT * FROM Products WHERE id = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            String name = rs.getString("name");
            String slug = rs.getString("slug");
            int price = rs.getInt("price");
            int salePrice = rs.getInt("sale_price");
            int quantity = rs.getInt("quantity");
            String description = rs.getString("description");
            String image = rs.getString("image");
            Category category = ProductCategoryUtils.getById(conn, rs.getInt("product_category_id"));
            Timestamp createdAtTimestamp = rs.getTimestamp("created_at");
            Date createdAt = new Date(createdAtTimestamp.getTime());
            return new Product(id, name, slug, price, salePrice, quantity, description, image, category, createdAt);
        }

        return null;
    }
}
