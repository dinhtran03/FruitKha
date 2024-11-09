package com.example.fruitka.servlet;

import com.example.fruitka.conn.DbConnection;
import com.example.fruitka.entity.Product;
import com.example.fruitka.utils.ProductUtils;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import java.util.logging.Logger;

@WebServlet("/")
public class HomeServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(HomeServlet.class.getName());
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection conn = DbConnection.getMSSQLConnection();
            List<Product> products = ProductUtils.getAll(conn);
            request.setAttribute("products", products);
            conn.close();
        } catch (Exception e) {
            logger.severe(e.getMessage());
            request.setAttribute("error", e.getMessage());
        }
        request.getRequestDispatcher("/home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
