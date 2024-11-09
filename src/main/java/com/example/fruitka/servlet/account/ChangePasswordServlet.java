package com.example.fruitka.servlet.account;

import com.example.fruitka.conn.DbConnection;
import com.example.fruitka.entity.User;
import com.example.fruitka.utils.AuthUtils;
import com.example.fruitka.utils.UserUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.util.logging.Logger;

@WebServlet(name = "account/change-password", value = "/account/change-password")
public class ChangePasswordServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(ChangePasswordServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/account/change_password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String currentPassword = request.getParameter("currentPassword");
            String newPassword = request.getParameter("newPassword");
            String confirmPassword = request.getParameter("confirmPassword");

            if (currentPassword == null || newPassword == null || confirmPassword == null) {
                throw new ServletException("All fields are required");
            }

            if (!newPassword.equals(confirmPassword)) {
                throw new ServletException("Passwords do not match");
            }

            Connection conn = DbConnection.getMSSQLConnection();
            User userSession = (User) request.getSession().getAttribute("user");
            User user = UserUtils.getUserById(conn, userSession.getId());

            if (user == null) {
                throw new ServletException("User does not exist");
            }

            boolean isPasswordMatch = AuthUtils.verifyPassword(currentPassword, user.getPassword());

            if (!isPasswordMatch) {
                throw new ServletException("Current password is wrong");
            }

            UserUtils.updatePassword(conn, user.getId(), AuthUtils.hashPassword(newPassword));

            request.setAttribute("success", "Password changed successfully");
            conn.close();
        } catch (Exception e) {
            logger.severe(e.getMessage());
            request.setAttribute("error", e.getMessage());
        }
        doGet(request, response);
    }
}
