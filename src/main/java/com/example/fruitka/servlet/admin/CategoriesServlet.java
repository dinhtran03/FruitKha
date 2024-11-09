package com.example.fruitka.servlet.admin;

import com.example.fruitka.conn.DbConnection;
import com.example.fruitka.entity.Category;
import com.example.fruitka.utils.ProductCategoryUtils;
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

@WebServlet(name = "categories", value = "/admin/categories")
public class CategoriesServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(CategoriesServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection conn = DbConnection.getMSSQLConnection();
            List<Category> categories = ProductCategoryUtils.getAll(conn);
            request.setAttribute("categories", categories);
            conn.close();
        } catch (Exception e) {
            logger.severe(e.getMessage());
            request.setAttribute("error", e.getMessage());
        }

        request.getRequestDispatcher("/admin/categories.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String name = request.getParameter("name");


        try {
            Connection conn = DbConnection.getMSSQLConnection();
            switch (action) {
                case "add":
                    ProductCategoryUtils.add(conn, name);
                    break;
                case "edit": {
                    int id = Integer.parseInt(request.getParameter("id"));
                    ProductCategoryUtils.edit(conn, id, name);
                    break;
                }
                case "delete": {
                    int id = Integer.parseInt(request.getParameter("id"));
                    ProductCategoryUtils.delete(conn, id);
                    break;
                }
            }
            conn.close();

            response.sendRedirect(request.getContextPath() + "/admin/categories");
        } catch (Exception e) {
            logger.severe(e.getMessage());
            request.setAttribute("error", e.getMessage());
            doGet(request, response);
        }
    }
}
