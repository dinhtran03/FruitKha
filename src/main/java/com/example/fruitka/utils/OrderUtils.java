package com.example.fruitka.utils;

import com.example.fruitka.entity.Order;
import com.example.fruitka.enums.OrderStatus;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderUtils {
    public static int create(Connection conn, Order order) throws SQLException {
        String sql = "INSERT INTO Orders (customer_id, shipping_address_id, payment_method, total_price, status, note) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        statement.setInt(1, order.getCustomer().getId());
        statement.setInt(2, order.getShippingAddress().getId());
        statement.setString(3, order.getPaymentMethod());
        statement.setDouble(4, order.getTotalPrice());
        statement.setString(5, order.getStatus().name());
        statement.setString(6, order.getNote());
        statement.executeUpdate();

        int orderId = -1;

        try (var resultSet = statement.getGeneratedKeys()) {
            if (resultSet.next()) {
                orderId = resultSet.getInt(1);
            }
        }

        return orderId;
    }

    public static void updateStatus(Connection conn, int id, OrderStatus status) throws SQLException {
        String sql = "UPDATE Orders SET status = ? WHERE id = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, status.name());
        ps.setInt(2, id);
        ps.executeUpdate();
    }

    public static List<Order> getAll(Connection conn) throws SQLException {
        String sql = "SELECT * FROM Orders";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        List<Order> orders = new ArrayList<>();
        while (rs.next()) {
            Order order = new Order();
            order.setId(rs.getInt("id"));
            order.setCustomer(UserUtils.getUserById(conn, rs.getInt("customer_id")));
            order.setShippingAddress(ShippingAddressUtils.getById(conn, rs.getInt("shipping_address_id")));
            order.setPaymentMethod(rs.getString("payment_method"));
            order.setTotalPrice(rs.getInt("total_price"));
            order.setStatus(OrderStatus.getStatus(rs.getString("status")));
            order.setNote(rs.getString("note"));
            order.setCreatedAt(new Date(rs.getTimestamp("created_at").getTime()));
            orders.add(order);
        }

        return orders;
    }

    public static Order getById(Connection conn, int id) throws SQLException {
        String sql = "SELECT * FROM Orders WHERE id = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            Order order = new Order();
            order.setId(rs.getInt("id"));
            order.setCustomer(UserUtils.getUserById(conn, rs.getInt("customer_id")));
            order.setShippingAddress(ShippingAddressUtils.getById(conn, rs.getInt("shipping_address_id")));
            order.setPaymentMethod(rs.getString("payment_method"));
            order.setTotalPrice(rs.getInt("total_price"));
            order.setStatus(OrderStatus.getStatus(rs.getString("status")));
            order.setNote(rs.getString("note"));
            order.setCreatedAt(new Date(rs.getTimestamp("created_at").getTime()));
            return order;
        }

        return null;
    }


}
