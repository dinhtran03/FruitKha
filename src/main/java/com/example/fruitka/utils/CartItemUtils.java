package com.example.fruitka.utils;

import com.example.fruitka.entity.Cart;
import com.example.fruitka.entity.CartItem;
import com.example.fruitka.entity.Category;
import com.example.fruitka.entity.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;

public class CartItemUtils {
    public static List<CartItem> getAll(Connection conn, int cartId) throws SQLException {
        String sql = "EXEC SelectAllCartItems @CartId = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, cartId);
        ResultSet rs = ps.executeQuery();

        List<CartItem> cartItems = new ArrayList<>();

        while (rs.next()) {
            int id = rs.getInt("id");

            int productId = rs.getInt("product_id");
            String productName = rs.getString("product_name");
            String productSlug = rs.getString("product_slug");
            int productPrice = rs.getInt("product_price");
            int productSalePrice = rs.getInt("product_sale_price");
            int productQuantity = rs.getInt("product_quantity");
            String productDescription = rs.getString("product_description");
            String productImage = rs.getString("product_image");
            Category productCategory = ProductCategoryUtils.getById(conn, rs.getInt("product_category_id"));
            Timestamp productCreatedAtTimestamp = rs.getTimestamp("product_created_at");
            Date productCreatedAt = new Date(productCreatedAtTimestamp.getTime());

            Product product = new Product(productId, productName, productSlug, productPrice, productSalePrice, productQuantity, productDescription, productImage, productCategory, productCreatedAt);
            int quantity = rs.getInt("quantity");
            Cart cart = new Cart();
            cart.setId(cartId);

            CartItem cartItem = new CartItem(id, cart, product, quantity);
            cartItems.add(cartItem);
        }

        return cartItems;
    }

    public static CartItem findOneOrCreate(Connection conn, int cartId, int productId) throws SQLException {
        String sql = "EXEC SelectCartItem @CartId = ?, @ProductId = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, cartId);
        ps.setInt(2, productId);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            int id = rs.getInt("id");

            int product_id = rs.getInt("product_id");
            String product_name = rs.getString("product_name");
            String product_slug = rs.getString("product_slug");
            int product_price = rs.getInt("product_price");
            int product_sale_price = rs.getInt("product_sale_price");
            int product_quantity = rs.getInt("product_quantity");
            String product_description = rs.getString("product_description");
            String product_image = rs.getString("product_image");
            Category product_category = ProductCategoryUtils.getById(conn, rs.getInt("product_category_id"));
            Timestamp product_created_at_timestamp = rs.getTimestamp("product_created_at");
            Date product_created_at = new Date(product_created_at_timestamp.getTime());

            Product product = new Product(product_id, product_name, product_slug, product_price, product_sale_price, product_quantity, product_description, product_image, product_category, product_created_at);
            int quantity = rs.getInt("quantity");
            Cart cart = new Cart();
            cart.setId(cartId);

            return new CartItem(id, cart, product, quantity);
        }

        String sqlInsert = "INSERT INTO CartItem (cart_id, product_id, quantity) VALUES (?, ?, ?)";
        PreparedStatement psInsert = conn.prepareStatement(sqlInsert, Statement.RETURN_GENERATED_KEYS);
        psInsert.setInt(1, cartId);
        psInsert.setInt(2, productId);
        psInsert.setInt(3, 0);
        psInsert.executeUpdate();

        ResultSet rsInsert = psInsert.getGeneratedKeys();
        rsInsert.next();
        int id = rsInsert.getInt(1);
        Product product = new Product();
        Cart cart = new Cart();
        cart.setId(cartId);

        return new CartItem(id, cart, product, 0);
    }

    public static void update(Connection conn, CartItem cartItem) throws SQLException {
        String sql = "UPDATE CartItem SET quantity = ? WHERE id = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, cartItem.getQuantity());
        ps.setInt(2, cartItem.getId());
        ps.executeUpdate();
    }

    public static void delete(Connection conn, int id) throws SQLException {
        String sql = "DELETE FROM CartItem WHERE id = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);
        ps.executeUpdate();
    }
}
