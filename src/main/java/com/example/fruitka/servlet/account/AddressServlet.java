package com.example.fruitka.servlet.account;

import com.example.fruitka.conn.DbConnection;
import com.example.fruitka.entity.ShippingAddress;
import com.example.fruitka.entity.User;
import com.example.fruitka.utils.ShippingAddressUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Logger;

@WebServlet(name = "account/address", value = "/account/address")
public class AddressServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(AddressServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            User user = (User) request.getSession().getAttribute("user");
            Connection conn = DbConnection.getMSSQLConnection();
            List<ShippingAddress> addresses = ShippingAddressUtils.getByUserId(conn, user.getId());

            request.setAttribute("addresses", addresses);
            conn.close();
        } catch (Exception e) {
            logger.severe(e.getMessage());
            request.setAttribute("error", e.getMessage());
        }

        request.getRequestDispatcher("/account/address.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String action = request.getParameter("action");
            Connection conn = DbConnection.getMSSQLConnection();

            switch (action) {
                case "add": {
                    ShippingAddress address = this.getShippingAddress(request, conn, 0);
                    ShippingAddressUtils.add(conn, address);
                    break;
                }
                case "edit": {
                    int id = Integer.parseInt(request.getParameter("id"));
                    ShippingAddress address = this.getShippingAddress(request, conn, id);
                    ShippingAddressUtils.update(conn, address);
                    break;
                }
                case "delete":
                    int id = Integer.parseInt(request.getParameter("id"));
                    ShippingAddressUtils.delete(conn, id);
                    break;
            }

            conn.close();
            response.sendRedirect(request.getContextPath() + "/account/address");
        } catch (Exception e) {
            logger.severe(e.getMessage());
            request.setAttribute("error", e.getMessage());
            doGet(request, response);
        }
    }

    private void updateDefault(Connection conn, boolean isDefault, User user) throws SQLException {
        List<ShippingAddress> addresses = ShippingAddressUtils.getByUserId(conn, user.getId());

        if (isDefault) {
            for (ShippingAddress address : addresses) {
                if (address.getIsDefault()) {
                    ShippingAddressUtils.updateIsDefault(conn, address.getId(), false);
                }
            }
        }
    }

    private ShippingAddress getShippingAddress(HttpServletRequest request, Connection conn, int id) throws SQLException {
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String isDefaultStr = request.getParameter("isDefault");
        boolean isDefault = isDefaultStr != null && isDefaultStr.equals("on");

        User user = (User) request.getSession().getAttribute("user");

        this.updateDefault(conn, isDefault, user);

        return new ShippingAddress(id, name, phone, address, user, isDefault, false);
    }
}
