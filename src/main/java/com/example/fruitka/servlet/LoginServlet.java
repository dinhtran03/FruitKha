package com.example.fruitka.servlet;

import com.example.fruitka.conn.DbConnection;
import com.example.fruitka.entity.User;
import com.example.fruitka.utils.AuthUtils;
import com.example.fruitka.utils.UserUtils;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.Connection;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "login", value = "/login")
public class LoginServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(LoginServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            Connection conn = DbConnection.getMSSQLConnection();
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            logger.log(Level.INFO, "email: " + email + " password: " + password);

            if (email.isEmpty() || password.isEmpty()) {
                throw new ServletException("Email and password are required");
            }

            User user = UserUtils.getUserByEmail(conn, email);

            if (user == null) {
                throw new ServletException("User does not exist");
            }

            if (!AuthUtils.verifyPassword(password, user.getPassword())) {
                throw new ServletException("Wrong password");
            }

            request.getSession().setAttribute("user", user);

            response.sendRedirect(request.getContextPath() + "/account");

            conn.close();
        } catch (Exception e) {
            logger.log(Level.SEVERE, e.getMessage());
            request.setAttribute("error", e.getMessage());
            doGet(request, response);
        }
    }
}
