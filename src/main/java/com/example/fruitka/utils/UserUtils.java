package com.example.fruitka.utils;


import com.example.fruitka.entity.User;
import com.example.fruitka.enums.Role;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class UserUtils {
    public static List<User> getAll(Connection conn) throws SQLException {
        String sql = "SELECT * FROM Users";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        List<User> users = new ArrayList<>();
        while (rs.next()) {
            User user = new User();
            user.setId(rs.getInt("id"));
            user.setName(rs.getString("name"));
            user.setEmail(rs.getString("email"));
            user.setPhone(rs.getString("phone"));
            user.setPassword(rs.getString("password"));
            user.setRole(Role.getRole(rs.getString("role")));
            user.setCreatedAt(new Date(rs.getTimestamp("created_at").getTime()));
            users.add(user);
        }
        return users;
    }

    public static void create(Connection conn, User user) throws SQLException {
        String sql = "INSERT INTO Users(name, email, password, phone, role) VALUES(?, ?, ?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, user.getName());
        ps.setString(2, user.getEmail());
        ps.setString(3, user.getPassword());
        ps.setString(4, user.getPhone());
        ps.setString(5, user.getRole().name());
        ps.executeUpdate();
    }


    public static void update(Connection conn, User user) throws SQLException {
        String sql = "UPDATE Users SET name = ?, email = ?, password = ?, phone = ?, role = ? WHERE id = ?";

        if (user.getPassword() == null) {
            sql = "UPDATE Users SET name = ?, email = ?, phone = ?, role = ? WHERE id = ?";
        }

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, user.getName());
        ps.setString(2, user.getEmail());
        if (user.getPassword() != null) {
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getRole().name());
            ps.setInt(6, user.getId());
        } else {
            ps.setString(3, user.getPhone());
            ps.setString(4, user.getRole().name());
            ps.setInt(5, user.getId());
        }

        ps.executeUpdate();

    }

    public static void delete(Connection conn, int id) throws SQLException {
        String sql = "DELETE FROM Users WHERE id = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);
        ps.executeUpdate();
    }


    public static User getUserById(Connection conn, int id) throws SQLException {
        String sql = "SELECT * FROM Users WHERE id = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            User user = new User();
            user.setId(rs.getInt("id"));
            user.setName(rs.getString("name"));
            user.setEmail(rs.getString("email"));
            user.setPhone(rs.getString("phone"));
            user.setPassword(rs.getString("password"));
            user.setRole(Role.getRole(rs.getString("role")));
            user.setCreatedAt(new Date(rs.getTimestamp("created_at").getTime()));
            return user;
        }
        return null;
    }

    public static User getUserByEmail(Connection conn, String email) throws SQLException {
        String sql = "SELECT * FROM Users WHERE email = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, email);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            User user = new User();
            user.setId(rs.getInt("id"));
            user.setName(rs.getString("name"));
            user.setEmail(rs.getString("email"));
            user.setPhone(rs.getString("phone"));
            user.setPassword(rs.getString("password"));
            user.setRole(Role.getRole(rs.getString("role")));
            user.setCreatedAt(new Date(rs.getTimestamp("created_at").getTime()));
            return user;
        }
        return null;
    }


    public static void updatePassword(Connection conn, int id, String password) throws SQLException {
        String sql = "UPDATE Users SET password = ? WHERE id = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, password);
        pstm.setInt(2, id);
        pstm.executeUpdate();
    }
}
