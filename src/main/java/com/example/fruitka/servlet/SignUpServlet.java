package com.example.fruitka.servlet;

import com.example.fruitka.conn.DbConnection;
import com.example.fruitka.entity.User;
import com.example.fruitka.utils.AuthUtils;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.Connection;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "signup", value = "/signup")
public class SignUpServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(SignUpServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection conn = DbConnection.getMSSQLConnection();
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");

            if (name.isEmpty() || email.isEmpty() || phone.isEmpty() || password.isEmpty()) {
                throw new Exception("Invalid input");
            }

            if (!AuthUtils.validateEmail(email)) {
                throw new Exception("Invalid email");
            }

            boolean isExists = AuthUtils.checkUserExists(conn, email, phone);

            if (isExists) {
                throw new Exception("Email or phone already exists");
            }

            User user = new User();
            user.setName(name);
            user.setEmail(email);
            user.setPhone(phone);
            user.setPassword(AuthUtils.hashPassword(password));

            AuthUtils.signUp(conn,user);

            response.sendRedirect(request.getContextPath() + "/login");
            conn.close();
        } catch (Exception e) {
            logger.log(Level.SEVERE, e.getMessage());
            request.setAttribute("error", e.getMessage());
            doGet(request, response);
        }
    }
}
