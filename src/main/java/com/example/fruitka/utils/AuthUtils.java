package com.example.fruitka.utils;


import at.favre.lib.crypto.bcrypt.BCrypt;
import com.example.fruitka.entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class AuthUtils {
    public static void signUp(Connection conn, User user) throws SQLException {
        String sql = "INSERT INTO Users (name, email, password, phone) VALUES (?, ?, ?, ?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, user.getName());
        pstm.setString(2, user.getEmail());
        pstm.setString(3, user.getPassword());
        pstm.setString(4, user.getPhone());
        pstm.executeUpdate();
    }

    public static boolean validateEmail(String email) {
        String regex = "^[A-Za-z0-9+_.-]+@(.+)$";
        return email.matches(regex);
    }

    public static boolean checkUserExists(Connection conn, String email, String phone) throws SQLException {
        String sql = "SELECT * FROM Users WHERE email = ? OR phone = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, email);
        pstm.setString(2, phone);
        return pstm.executeQuery().next();
    }

    public static String hashPassword(String password) {
        return BCrypt.withDefaults().hashToString(12, password.toCharArray());
    }

    public static boolean verifyPassword(String password, String hashedPassword) {
        BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), hashedPassword);
        return result.verified;
    }
}
