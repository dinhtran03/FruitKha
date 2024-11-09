package com.example.fruitka.servlet;

import com.example.fruitka.conn.DbConnection;
import com.example.fruitka.entity.Category;
import com.example.fruitka.entity.Product;
import com.example.fruitka.utils.ProductCategoryUtils;
import com.example.fruitka.utils.ProductUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "shop", value = "/shop")
public class ShopServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(ShopServlet.class.getName());


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int categoryId = Integer.parseInt(request.getParameter("categoryId") == null ? "0" : request.getParameter("categoryId"));
            int page = Integer.parseInt(request.getParameter("page") == null ? "1" : request.getParameter("page"));
            String search = request.getParameter("search") == null ? "" : request.getParameter("search");
            int limit = 6;
            int offset = (page - 1) * limit;

            Connection conn = DbConnection.getMSSQLConnection();
            List<Category> categories = ProductCategoryUtils.getAll(conn);
            List<Product> products = ProductUtils.getAllPagination(conn, limit, offset, categoryId, search);
            int total = ProductUtils.getTotal(conn, categoryId, search);

            int totalPage = (int) Math.ceil((double) total / limit);

            int pageRange = totalPage > 2 ? 3 : totalPage;

            int[] pages = new int[pageRange];

            int startPage = Math.max(1, Math.min(page, totalPage - 2));
            for (int i = 0; i < pageRange; i++) {
                pages[i] = startPage + i;
            }

            request.setAttribute("categories", categories);
            request.setAttribute("products", products);
            request.setAttribute("total", total);
            request.setAttribute("page", page);
            request.setAttribute("totalPage", totalPage);
            request.setAttribute("pages", pages);

            conn.close();
        } catch (Exception e) {
            logger.log(Level.SEVERE, e.getMessage());
            request.setAttribute("error", e.getMessage());
        }
        request.getRequestDispatcher("/shop.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
