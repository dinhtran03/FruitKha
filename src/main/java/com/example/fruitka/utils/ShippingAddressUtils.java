package com.example.fruitka.utils;

import com.example.fruitka.entity.ShippingAddress;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ShippingAddressUtils {
    public static List<ShippingAddress> getByUserId(Connection conn, int userId) throws SQLException {
        String sql = "SELECT * FROM ShippingAddress WHERE user_id = ? AND is_deleted = 0";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, userId);
        ResultSet rs = ps.executeQuery();
        List<ShippingAddress> shippingAddresses = new ArrayList<>();
        while (rs.next()) {
            int id = rs.getInt("id");
            String address = rs.getString("address");
            String name = rs.getString("name");
            String phone = rs.getString("phone");
            boolean isDefault = rs.getBoolean("is_default");
            boolean isDeleted = rs.getBoolean("is_deleted");
            ShippingAddress shippingAddress = new ShippingAddress(id, name, phone, address, null, isDefault, isDeleted);
            shippingAddresses.add(shippingAddress);
        }
        return shippingAddresses;
    }

    public static ShippingAddress getById(Connection conn, int id) throws SQLException {
        String sql = "SELECT * FROM ShippingAddress WHERE id = ? AND is_deleted = 0";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            String address = rs.getString("address");
            String name = rs.getString("name");
            String phone = rs.getString("phone");
            boolean isDefault = rs.getBoolean("is_default");
            boolean isDeleted = rs.getBoolean("is_deleted");
            return new ShippingAddress(id, name, phone, address, null, isDefault, isDeleted);
        }
        return null;
    }

    public static void add(Connection conn, ShippingAddress address) throws SQLException {
        String sql = "INSERT INTO ShippingAddress (name, phone, address, user_id, is_default) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, address.getName());
        ps.setString(2, address.getPhone());
        ps.setString(3, address.getAddress());
        ps.setInt(4, address.getUser().getId());
        ps.setBoolean(5, address.getIsDefault());
        ps.executeUpdate();
    }

    public static void update(Connection conn, ShippingAddress address) throws SQLException {
        String sql = "UPDATE ShippingAddress SET name = ?, phone = ?, address = ?, is_default = ? WHERE id = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, address.getName());
        ps.setString(2, address.getPhone());
        ps.setString(3, address.getAddress());
        ps.setBoolean(4, address.getIsDefault());
        ps.setInt(5, address.getId());
        ps.executeUpdate();
    }

    public static void updateIsDefault(Connection conn, int id, boolean isDefault) throws SQLException {
        String sql = "UPDATE ShippingAddress SET is_default = ? WHERE id = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setBoolean(1, isDefault);
        ps.setInt(2, id);
        ps.executeUpdate();
    }

    public static void delete(Connection conn, int id) throws SQLException {
        String sql = "UPDATE ShippingAddress SET is_deleted = 1 WHERE id = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);
        ps.executeUpdate();
    }
}
