package com.example.fruitka.servlet.admin;

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

@WebServlet(name = "admin/orders", value = "/admin/orders")
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

        request.getRequestDispatcher("/admin/orders.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        int id = Integer.parseInt(request.getParameter("id") != null ? request.getParameter("id") : "0");

        try {
            Connection conn = DbConnection.getMSSQLConnection();

            if (action.equals("edit")) {
                OrderStatus status = OrderStatus.getStatus(request.getParameter("status") != null ? request.getParameter("status") : "PENDING");
                OrderUtils.updateStatus(conn, id, status);
            }

            conn.close();
            response.sendRedirect(request.getContextPath() + "/admin/orders");
        } catch (Exception e) {
            logger.severe(e.getMessage());
            request.setAttribute("error", e.getMessage());
            doGet(request, response);
        }
    }
}
