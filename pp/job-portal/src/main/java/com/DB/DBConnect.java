package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
    private static Connection conn = null;

    public static Connection getConn() {
        if (conn == null) {
            try {
                // Load MySQL JDBC Driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish Connection
                conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/job_portal", // Change database name if different
                    "root",  
                    "pp@shiv2005"  
                );
            } catch (ClassNotFoundException e) {
                System.out.println("JDBC Driver not found: " + e.getMessage());
                e.printStackTrace();
            } catch (SQLException e) {
                System.out.println("Database connection error: " + e.getMessage());
                e.printStackTrace();
            }
        }
        return conn;
    }
}
