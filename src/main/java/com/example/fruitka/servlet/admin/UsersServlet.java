package com.example.fruitka.servlet.admin;

import com.example.fruitka.conn.DbConnection;
import com.example.fruitka.entity.User;
import com.example.fruitka.enums.Role;
import com.example.fruitka.utils.UserUtils;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import java.util.logging.Logger;

@WebServlet(name = "users", value = "/admin/users")
public class UsersServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(UsersServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection conn = DbConnection.getMSSQLConnection();

            List<User> users = UserUtils.getAll(conn);

            request.setAttribute("users", users);

            conn.close();
        } catch (Exception e) {
            logger.severe(e.getMessage());
            request.setAttribute("error", e.getMessage());
        }

        request.getRequestDispatcher("/admin/users.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String roleStr = request.getParameter("role");
        Role role = Role.getRole(roleStr);

        try {
            Connection conn = DbConnection.getMSSQLConnection();

            switch (action) {
                case "add": {
                    User user = new User(0, name, email, new User().hashPassword(password), phone, role, null);
                    UserUtils.create(conn, user);
                    break;
                }
                case "edit": {
                    int id = Integer.parseInt(request.getParameter("id"));
                    User user = new User();
                    user.setId(id);
                    user.setName(name);
                    user.setEmail(email);
                    user.setPhone(phone);
                    user.setRole(role);
                    if (password != null && !password.isEmpty()) {
                        user.setPassword(user.hashPassword(password));
                    }

                    UserUtils.update(conn, user);
                    break;
                }
                case "delete": {
                    int id = Integer.parseInt(request.getParameter("id"));
                    UserUtils.delete(conn, id);
                    break;
                }
            }

            response.sendRedirect(request.getContextPath() + "/admin/users");

            conn.close();
        } catch (Exception e) {
            logger.severe(e.getMessage());
            request.setAttribute("error", e.getMessage());
            doGet(request, response);
        }

    }
}
