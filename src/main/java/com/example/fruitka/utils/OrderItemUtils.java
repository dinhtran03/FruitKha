package com.example.fruitka.utils;

import com.example.fruitka.entity.CartItem;
import com.example.fruitka.entity.Order;
import com.example.fruitka.entity.OrderItem;
import com.example.fruitka.entity.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OrderItemUtils {
    public static void create(Connection conn, int orderId, CartItem cartItem) throws SQLException {
        String sql = "INSERT INTO OrderItem (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, orderId);
        ps.setInt(2, cartItem.getProduct().getId());
        ps.setInt(3, cartItem.getQuantity());
        ps.setDouble(4, cartItem.getProduct().getPrice());
        ps.executeUpdate();
    }

    public static List<OrderItem> getByOrderId(Connection conn, int orderId) throws SQLException {
        String sql = "SELECT * FROM OrderItem WHERE order_id = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, orderId);
        ResultSet rs = ps.executeQuery();

        List<OrderItem> cartItems = new ArrayList<>();

        while (rs.next()) {
            int id = rs.getInt("id");
            int productId = rs.getInt("product_id");
            int quantity = rs.getInt("quantity");
            int price = rs.getInt("price");
            Product product = ProductUtils.getById(conn, productId);
            Order order = new Order();
            order.setId(orderId);

            OrderItem orderItem = new OrderItem(id, quantity, price, product, order);

            cartItems.add(orderItem);
        }

        return cartItems;
    }
}
