package com.project.helper;

import java.sql.*;

public class ConnectionProvider {

    private static Connection con;

    public static Connection getConnection() {

        try {

            if (con == null) {
                //Driver class load
                Class.forName("com.mysql.cj.jdbc.Driver");

                //Create a connection
                con = DriverManager.getConnection("jdbc:mysql://52.66.103.84:3306/tourtravelsystem", "123", "123");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }
}