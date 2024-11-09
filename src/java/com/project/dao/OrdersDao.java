package com.project.dao;

import java.sql.*;
import com.project.entities.Orders;

public class OrdersDao {

    private Connection con;

    public OrdersDao(Connection con) {
        this.con = con;
    }

    //Method to store orders details in a table
    public boolean saveOrdersDetail(Orders order) {

        boolean isQueryExecute = false;
        try {
            String query = "INSERT INTO ORDERS(customer_id, booking_type, booking_ref_id, total_amount, status, date_of_booking) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, order.getCustomerId());
            pstmt.setString(2, order.getBookingType());
            pstmt.setString(3, order.getBookingReferenceId());
            pstmt.setFloat(4, order.getTotalAmount());
            pstmt.setString(5, order.getStatus());
            pstmt.setString(6, order.getDateOfBooking());

            pstmt.executeUpdate();
            isQueryExecute = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isQueryExecute;
    }

}
