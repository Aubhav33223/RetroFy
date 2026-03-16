package com.cashify.servlet_cashify_project.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class CashifyConnection {

    // Database URL, , password
    private static final String URL = "jdbc:mysql://localhost:3306/cashify?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWORD = "root";

    public static Connection getCashifyConnection() {
        try {
            // Optional for modern MySQL, ensures driver is loaded
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Return the connection
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL JDBC Driver not found!");
            e.printStackTrace();
            return null;
        } catch (SQLException e) {
            System.err.println("Failed to connect to the database!");
            e.printStackTrace();
            return null;
        }
    }
}