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
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "product", value = "/shop/*")
public class ProductServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(SignUpServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String id = request.getPathInfo().substring(1);
            Connection conn = DbConnection.getMSSQLConnection();
            Product product = ProductUtils.getById(conn, Integer.parseInt(id));
            request.setAttribute("product", product);
            if (product != null) {
                List<Product> products = ProductUtils.getRelatedProducts(conn,product.getId());
                request.setAttribute("products", products);
            }
            conn.close();
        } catch (Exception e) {
            logger.log(Level.SEVERE, e.getMessage());
            request.setAttribute("error", e.getMessage());
        }

        request.getRequestDispatcher("/product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
