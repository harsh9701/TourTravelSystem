package com.project.dao;

import java.sql.*;
import com.project.entities.HotelBooking;
import java.util.ArrayList;
import java.util.List;

public class HotelBookingDao {

    private Connection con;

    public HotelBookingDao(Connection con) {
        this.con = con;
    }

    //Method to insert hotel booking data into db
    public boolean saveHotelBookingDetails(HotelBooking hb) {

        boolean isQueryExecute = false;
        try {
            String query = "INSERT INTO hotel_booking (booking_id, customer_id, hotel_id, check_in_date, check_out_date, number_of_rooms, number_of_days, date_of_booking, name_of_traveler, contact_of_traveler, address_of_traveler, total_amount, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, hb.getBookingId());
            pstmt.setInt(2, hb.getCustomerId());
            pstmt.setInt(3, hb.getHotelId());
            pstmt.setString(4, hb.getCheckIn());
            pstmt.setString(5, hb.getCheckOut());
            pstmt.setInt(6, hb.getNumberOfRooms());
            pstmt.setInt(7, hb.getNumberOfDays());
            pstmt.setString(8, hb.getDateOfBooking());
            pstmt.setString(9, hb.getNameOfTraveler());
            pstmt.setString(10, hb.getContactOfTraveler());
            pstmt.setString(11, hb.getAddressOfTraveler());
            pstmt.setFloat(12, hb.getTotalAmount());
            pstmt.setString(13, hb.getStatus());

            pstmt.executeUpdate();
            isQueryExecute = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isQueryExecute;
    }

    //Method to fetch flight details by customer id
    public List<HotelBooking> getHotelBookingDetailsByCustId(int custId) {

        List<HotelBooking> list = new ArrayList<>();

        try {
            String query = "SELECT * FROM hotel_booking WHERE customer_id = ?";
            PreparedStatement p = con.prepareStatement(query);
            p.setInt(1, custId);

            ResultSet set = p.executeQuery();

            while (set.next()) {
                int hotelBookingId = set.getInt("hotel_booking_id");
                String bookingId = set.getString("booking_id");
                int customerId = set.getInt("customer_id");
                int hotelId = set.getInt("hotel_id");
                String checkIn = set.getString("check_in_date");
                String checkOut = set.getString("check_out_date");
                int noOfRooms = set.getInt("number_of_rooms");
                int noOfDays = set.getInt("number_of_days");
                String dateOfBooking = set.getString("date_of_booking");
                String nameOfTraveler = set.getString("name_of_traveler");
                String contactOfTraveler = set.getString("contact_of_traveler");
                String addressOfTraveler = set.getString("address_of_traveler");
                float totalSum = set.getFloat("total_amount");
                String status = set.getString("status");

                HotelBooking hb = new HotelBooking(hotelBookingId, bookingId, customerId, hotelId, checkIn, checkOut, noOfRooms, noOfDays, dateOfBooking, nameOfTraveler, contactOfTraveler, addressOfTraveler, totalSum, status);

                list.add(hb);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    //Method to fetch flight details by Booking id
    public HotelBooking getHotelBookingDetailsByBookingId(String bookId) {

        HotelBooking hb = null;

        try {
            String query = "SELECT * FROM hotel_booking WHERE booking_id = ?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, bookId);

            ResultSet set = p.executeQuery();

            while (set.next()) {
                int hotelBookingId = set.getInt("hotel_booking_id");
                String bookingId = set.getString("booking_id");
                int customerId = set.getInt("customer_id");
                int hotelId = set.getInt("hotel_id");
                String checkIn = set.getString("check_in_date");
                String checkOut = set.getString("check_out_date");
                int noOfRooms = set.getInt("number_of_rooms");
                int noOfDays = set.getInt("number_of_days");
                String dateOfBooking = set.getString("date_of_booking");
                String nameOfTraveler = set.getString("name_of_traveler");
                String contactOfTraveler = set.getString("contact_of_traveler");
                String addressOfTraveler = set.getString("address_of_traveler");
                float totalSum = set.getFloat("total_amount");
                String status = set.getString("status");

                hb = new HotelBooking(hotelBookingId, bookingId, customerId, hotelId, checkIn, checkOut, noOfRooms, noOfDays, dateOfBooking, nameOfTraveler, contactOfTraveler, addressOfTraveler, totalSum, status);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return hb;
    }
}
