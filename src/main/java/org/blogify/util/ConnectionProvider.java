package org.blogify.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
    private static Connection con;

    private static final String URL = "jdbc:mysql://localhost:3306/blogifyDB";
    private static final String USER = "root";
    private static final String PASSWORD = "root";

    public static Connection getConnection() {

        try {
            if(con == null) {
                // load mysql driver
                Class.forName("com.mysql.jdbc.Driver");
                // create connection
                con = DriverManager.getConnection(URL, USER, PASSWORD);
            }
        } catch(Exception e) {
            e.printStackTrace();
        }

        return con;
    }
}
