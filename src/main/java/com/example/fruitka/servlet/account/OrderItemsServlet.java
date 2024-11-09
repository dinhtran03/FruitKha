package com.example.fruitka.servlet.account;

import com.example.fruitka.conn.DbConnection;
import com.example.fruitka.entity.OrderItem;
import com.example.fruitka.utils.OrderItemUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet(name = "account/orders/*", value = "/account/orders/*")
public class OrderItemsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int orderId = Integer.parseInt(request.getPathInfo().substring(1));
            Connection conn = DbConnection.getMSSQLConnection();

            List<OrderItem> orderItems = OrderItemUtils.getByOrderId(conn, orderId);

            request.setAttribute("orderItems", orderItems);

            conn.close();
            request.getRequestDispatcher("/account/order_items.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/not-found");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
