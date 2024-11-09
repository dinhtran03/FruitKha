package com.example.fruitka.conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {
    public static Connection getMSSQLConnection() throws ClassNotFoundException, SQLException {
        String dbName = "Fruitka";
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String connectionUrl = String.format("jdbc:sqlserver://localhost;databaseName=%s;encrypt=true;integratedSecurity=true;trustServerCertificate=true", dbName);
        return DriverManager.getConnection(connectionUrl);
    }
}
