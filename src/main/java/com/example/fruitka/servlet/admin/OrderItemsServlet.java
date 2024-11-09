package com.example.fruitka.servlet.admin;

import com.example.fruitka.conn.DbConnection;
import com.example.fruitka.entity.OrderItem;
import com.example.fruitka.utils.OrderItemUtils;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import java.util.logging.Logger;

@WebServlet(name = "admin/orders/*", value = "/admin/orders/*")
public class OrderItemsServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(OrderItemsServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getPathInfo().substring(1));

        try {
            Connection conn = DbConnection.getMSSQLConnection();
            List<OrderItem> orderItems = OrderItemUtils.getByOrderId(conn, orderId);

            request.setAttribute("orderItems", orderItems);

            conn.close();
        } catch (Exception e) {
            logger.severe(e.getMessage());
            request.setAttribute("error", e.getMessage());
        }

        request.getRequestDispatcher("/admin/order_items.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
