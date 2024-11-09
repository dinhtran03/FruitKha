package com.example.fruitka.servlet;

import com.example.fruitka.conn.DbConnection;
import com.example.fruitka.entity.*;
import com.example.fruitka.enums.OrderStatus;
import com.example.fruitka.utils.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

@WebServlet(name = "checkout", value = "/checkout")
public class CheckoutServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(CheckoutServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            User user = (User) request.getSession().getAttribute("user");
            Connection conn = DbConnection.getMSSQLConnection();
            List<ShippingAddress> shippingAddresses = ShippingAddressUtils.getByUserId(conn, user.getId());
            Cart cart = CartUtils.findOneOrCreate(conn, user.getId());


            if (shippingAddresses.isEmpty()) {
                request.setAttribute("error", "No shipping address found");
                request.getRequestDispatcher("/account/address").forward(request, response);
                return;
            }

            if (cart.getCartItems().isEmpty()) {
                request.setAttribute("error", "Cart is empty");
                request.getRequestDispatcher("/cart").forward(request, response);
                return;
            }

            request.setAttribute("addresses", shippingAddresses);
            request.setAttribute("cart", cart);

            conn.close();
        } catch (Exception e) {
            logger.severe(e.getMessage());
            request.setAttribute("error", e.getMessage());
        }

        request.getRequestDispatcher("/checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int shippingAddressId = Integer.parseInt(request.getParameter("shippingAddressId") != null ? request.getParameter("shippingAddressId") : "0");
        String paymentMethod = request.getParameter("paymentMethod");
        int totalPrice = Integer.parseInt(request.getParameter("totalPrice") != null ? request.getParameter("totalPrice") : "0");
        String note = request.getParameter("note");
        OrderStatus status = OrderStatus.PENDING;
        User user = (User) request.getSession().getAttribute("user");
        int userId = user.getId();
        ShippingAddress shippingAddress = new ShippingAddress();
        shippingAddress.setId(shippingAddressId);

        try {
            Connection conn = DbConnection.getMSSQLConnection();
            Order order = new Order(0, paymentMethod, totalPrice, note, status, user, shippingAddress, new Date());
            int orderId = OrderUtils.create(conn, order);
            Cart cart = CartUtils.findOneOrCreate(conn, userId);

            for (CartItem cartItem : cart.getCartItems()) {
                OrderItemUtils.create(conn, orderId, cartItem);
                CartItemUtils.delete(conn, cartItem.getId());

                int newQuantity = cartItem.getProduct().getQuantity() - cartItem.getQuantity();
                ProductUtils.updateQuantity(conn, cartItem.getProduct().getId(), newQuantity);
            }

            response.sendRedirect(request.getContextPath() + "/");
            conn.close();
        } catch (Exception e) {
            logger.severe(e.getMessage());
            request.setAttribute("error", e.getMessage());
            doGet(request, response);
        }
    }
}
