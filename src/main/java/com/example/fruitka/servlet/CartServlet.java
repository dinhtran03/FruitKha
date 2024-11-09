package com.example.fruitka.servlet;

import com.example.fruitka.conn.DbConnection;
import com.example.fruitka.entity.Cart;
import com.example.fruitka.entity.CartItem;
import com.example.fruitka.entity.User;
import com.example.fruitka.utils.CartItemUtils;
import com.example.fruitka.utils.CartUtils;
import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.logging.Logger;

@WebServlet(name = "cart", value = "/cart")
public class CartServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(CartServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection conn = DbConnection.getMSSQLConnection();
            User user = (User) request.getSession().getAttribute("user");
            Cart cart = CartUtils.findOneOrCreate(conn, user.getId());
            request.setAttribute("cart", cart);
            conn.close();
        } catch (Exception e) {
            logger.severe(e.getMessage());
            request.setAttribute("error", e.getMessage());
        }
        request.getRequestDispatcher("/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();
        JSONObject json = new JSONObject();

        try {
            Connection conn = DbConnection.getMSSQLConnection();
            User user = (User) request.getSession().getAttribute("user");
            int productId = Integer.parseInt(request.getParameter("productId") == null ? "0" : request.getParameter("productId"));
            int quantity = Integer.parseInt(request.getParameter("quantity") == null ? "0" : request.getParameter("quantity"));
            String action = request.getParameter("action");
            int cartItemId = Integer.parseInt(request.getParameter("cartItemId") == null ? "0" : request.getParameter("cartItemId"));


            switch (action) {
                case "add": {
                    Cart cart = CartUtils.addProductToCart(conn, user.getId(), productId, quantity);
                    String cartJson = gson.toJson(cart);
                    out.println(cartJson);
                    break;
                }
                case "delete": {
                    CartItemUtils.delete(conn, cartItemId);
                    int subTotal = CartUtils.getSubTotal(conn, user.getId());
                    json.put("message", "Item removed from cart");
                    json.put("subTotal", subTotal);
                    out.println(json.toString());
                    break;
                }
                case "update":
                    CartItemUtils.update(conn, new CartItem(cartItemId, null, null, quantity));
                    int subTotal = CartUtils.getSubTotal(conn, user.getId());
                    json.put("message", "Cart updated");
                    json.put("subTotal", subTotal);
                    out.println(json.toString());
                    break;
                default:
                    throw new Exception("Invalid action");
            }

            conn.close();
        } catch (Exception e) {
            logger.severe(e.getMessage());
            json.put("error", e.getMessage());
            out.println(json.toString());
        } finally {
            out.close();
        }
    }
}
