package com.example.fruitka.servlet.account;

import com.example.fruitka.conn.DbConnection;
import com.example.fruitka.entity.Order;
import com.example.fruitka.enums.OrderStatus;
import com.example.fruitka.utils.OrderUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import java.util.logging.Logger;

@WebServlet(name = "account/orders", value = "/account/orders")
public class OrdersServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(OrdersServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection conn = DbConnection.getMSSQLConnection();
            List<Order> orders = OrderUtils.getAll(conn);

            request.setAttribute("orders", orders);
            conn.close();
        } catch (Exception e) {
            logger.severe(e.getMessage());
            request.setAttribute("error", e.getMessage());
        }

        request.getRequestDispatcher("/account/orders.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id") != null ? request.getParameter("id") : "0");
            Connection conn = DbConnection.getMSSQLConnection();

            Order order = OrderUtils.getById(conn, id);

            if (order == null) {
                throw new Exception("Order not found");
            }

            if (!(order.getStatus().equals(OrderStatus.PENDING) || order.getStatus().equals(OrderStatus.PROCESSING))) {
                throw new Exception("Order cannot be cancelled");
            }
            OrderUtils.updateStatus(conn, id, OrderStatus.CANCELLED);
            response.sendRedirect(request.getContextPath() + "/account/orders");
            conn.close();
        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
            doGet(request, response);
        }
    }
}
