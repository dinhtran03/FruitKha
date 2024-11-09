package com.example.fruitka.servlet.admin;

import com.example.fruitka.conn.DbConnection;
import com.example.fruitka.entity.Category;
import com.example.fruitka.entity.Product;
import com.example.fruitka.utils.ProductCategoryUtils;
import com.example.fruitka.utils.ProductUtils;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.Connection;
import java.text.Normalizer;
import java.util.List;
import java.util.Locale;
import java.util.logging.Logger;
import java.util.regex.Pattern;

@WebServlet(name = "products", value = "/admin/products")
public class ProductsServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(ProductsServlet.class.getName());

    private static final Pattern NONLATIN = Pattern.compile("[^\\w-]");
    private static final Pattern WHITESPACE = Pattern.compile("\\s");

    public static String toSlug(String input) {
        String noWhiteSpace = WHITESPACE.matcher(input).replaceAll("-");
        String normalized = Normalizer.normalize(noWhiteSpace, Normalizer.Form.NFD);
        String slug = NONLATIN.matcher(normalized).replaceAll("");
        return slug.toLowerCase(Locale.ENGLISH);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection conn = DbConnection.getMSSQLConnection();

            List<Product> products = ProductUtils.getAll(conn);
            List<Category> categories = ProductCategoryUtils.getAll(conn);

            request.setAttribute("products", products);
            request.setAttribute("categories", categories);

            conn.close();
        } catch (Exception e) {
            logger.severe(e.getMessage());
            request.setAttribute("error", e.getMessage());
        }

        request.getRequestDispatcher("/admin/products.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String name = request.getParameter("name");
        String slug = name != null ? toSlug(name) : "";
        int price = Integer.parseInt(request.getParameter("price") != null ? request.getParameter("price") : "0");
        int salePrice = Integer.parseInt(request.getParameter("salePrice") != null ? request.getParameter("salePrice") : "0");
        int quantity = Integer.parseInt(request.getParameter("quantity") != null ? request.getParameter("quantity") : "0");
        String description = request.getParameter("description");
        String image = request.getParameter("image");
        int categoryId = Integer.parseInt(request.getParameter("categoryId") != null ? request.getParameter("categoryId") : "0");


        try {
            Connection conn = DbConnection.getMSSQLConnection();
            switch (action) {
                case "add": {
                    Product product = new Product(0, name, slug, price, salePrice, quantity, description, image, null, null);
                    ProductUtils.create(conn, product, categoryId);
                    break;
                }
                case "edit": {
                    int id = Integer.parseInt(request.getParameter("id"));
                    Product product = new Product(id, name, slug, price, salePrice, quantity, description, image, null, null);
                    ProductUtils.update(conn, product, categoryId);
                    break;
                }
                case "delete": {
                    int id = Integer.parseInt(request.getParameter("id"));
                    ProductUtils.delete(conn, id);
                    break;
                }
            }

            response.sendRedirect(request.getContextPath() + "/admin/products");

            conn.close();
        } catch (Exception e) {
            logger.severe(e.getMessage());
            request.setAttribute("error", e.getMessage());
            doGet(request, response);
        }
    }
}
