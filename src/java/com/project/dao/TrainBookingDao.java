package com.project.dao;

import java.sql.*;
import com.project.entities.TrainBooking;
import java.util.ArrayList;
import java.util.List;

public class TrainBookingDao {

    private Connection con;

    public TrainBookingDao(Connection con) {
        this.con = con;
    }

    //method to insert train booking detail into table
    public boolean saveTrainBookingDetails(TrainBooking tb) {

        boolean isQueryExecute = false;
        try {
            String query = "INSERT INTO train_booking (booking_id, customer_id, train_id, departure_date, arrival_date, number_of_adults, number_of_children, date_of_booking, name_of_traveler, age_of_traveler, contact_of_traveler, address_of_traveler, total_amount, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, tb.getBookingId());
            pstmt.setInt(2, tb.getCustomerId());
            pstmt.setInt(3, tb.getTrainId());
            pstmt.setString(4, tb.getDepartureDate());
            pstmt.setString(5, tb.getArrivalDate());
            pstmt.setInt(6, tb.getNumberOfAdults());
            pstmt.setInt(7, tb.getNumberOfChildren());
            pstmt.setString(8, tb.getDateOfBooking());
            pstmt.setString(9, tb.getNameOfTraveler());
            pstmt.setInt(10, tb.getAgeOfTraveler());
            pstmt.setString(11, tb.getContactOfTraveler());
            pstmt.setString(12, tb.getAddressOfTraveler());
            pstmt.setFloat(13, tb.getTotalAmount());
            pstmt.setString(14, tb.getStatus());

            pstmt.executeUpdate();
            isQueryExecute = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isQueryExecute;
    }

    //Method to fetch flight details by customer id
    public List<TrainBooking> getTrainBookingDetailsByCustId(int custId) {

        List<TrainBooking> list = new ArrayList<>();

        try {
            String query = "SELECT * FROM train_booking WHERE customer_id = ?";
            PreparedStatement p = con.prepareStatement(query);
            p.setInt(1, custId);

            ResultSet set = p.executeQuery();

            while (set.next()) {
                int trainBookingId = set.getInt("train_booking_id");
                String bookingId = set.getString("booking_id");
                int customerId = set.getInt("customer_id");
                int trainId = set.getInt("train_id");
                String departureDate = set.getString("departure_date");
                String arrivalDate = set.getString("arrival_date");
                int noOfAdults = set.getInt("number_of_adults");
                int noOfChildren = set.getInt("number_of_children");
                String dateOfBooking = set.getString("date_of_booking");
                String nameOfTraveler = set.getString("name_of_traveler");
                int ageOfTraveler = set.getInt("age_of_traveler");
                String contactOfTraveler = set.getString("contact_of_traveler");
                String addressOfTraveler = set.getString("address_of_traveler");
                float totalSum = set.getFloat("total_amount");
                String status = set.getString("status");

                TrainBooking tb = new TrainBooking(trainBookingId, bookingId, customerId, trainId, departureDate, arrivalDate, noOfAdults, noOfChildren, dateOfBooking, nameOfTraveler, ageOfTraveler, contactOfTraveler, addressOfTraveler, totalSum, status);

                list.add(tb);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    //Method to fetch flight details by Booking id
    public TrainBooking getTrainBookingDetailsByBookingId(String bookId) {

        TrainBooking tb = null;

        try {
            String query = "SELECT * FROM train_booking WHERE booking_id = ?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, bookId);

            ResultSet set = p.executeQuery();

            while (set.next()) {
                int trainBookingId = set.getInt("train_booking_id");
                String bookingId = set.getString("booking_id");
                int customerId = set.getInt("customer_id");
                int trainId = set.getInt("train_id");
                String departureDate = set.getString("departure_date");
                String arrivalDate = set.getString("arrival_date");
                int noOfAdults = set.getInt("number_of_adults");
                int noOfChildren = set.getInt("number_of_children");
                String dateOfBooking = set.getString("date_of_booking");
                String nameOfTraveler = set.getString("name_of_traveler");
                int ageOfTraveler = set.getInt("age_of_traveler");
                String contactOfTraveler = set.getString("contact_of_traveler");
                String addressOfTraveler = set.getString("address_of_traveler");
                float totalSum = set.getFloat("total_amount");
                String status = set.getString("status");

                tb = new TrainBooking(trainBookingId, bookingId, customerId, trainId, departureDate, arrivalDate, noOfAdults, noOfChildren, dateOfBooking, nameOfTraveler, ageOfTraveler, contactOfTraveler, addressOfTraveler, totalSum, status);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return tb;
    }

}
