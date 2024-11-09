package com.project.dao;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;
import com.project.entities.FlightBooking;

public class FlightBookingDao {

    private Connection con;

    public FlightBookingDao(Connection con) {
        this.con = con;
    }

    //Mthod to insert flight booking details into table
    public boolean saveFlightBookingDetails(FlightBooking fb) {

        boolean isQueryExecute = false;
        try {
            String query = "INSERT INTO flight_booking (booking_id, customer_id, flight_id, departure_date, arrival_date, number_of_traveler, date_of_booking, name_of_traveler, age_of_traveler, contact_of_traveler, address_of_traveler, total_amount, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, fb.getBookingId());
            pstmt.setInt(2, fb.getCustomerId());
            pstmt.setInt(3, fb.getFlightId());
            pstmt.setString(4, fb.getDepartureDate());
            pstmt.setString(5, fb.getArrivalDate());
            pstmt.setInt(6, fb.getNumberOfTraveler());
            pstmt.setString(7, fb.getDateOfBooking());
            pstmt.setString(8, fb.getNameOfTraveler());
            pstmt.setInt(9, fb.getAgeOfTraveler());
            pstmt.setString(10, fb.getContactOfTraveler());
            pstmt.setString(11, fb.getAddressOfTraveler());
            pstmt.setFloat(12, fb.getTotalAmount());
            pstmt.setString(13, fb.getStatus());

            pstmt.executeUpdate();
            isQueryExecute = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isQueryExecute;
    }

    //Method to fetch flight details by customer id
    public List<FlightBooking> getFlightBookingDetailsByCustId(int custId) {

        List<FlightBooking> list = new ArrayList<>();

        try {
            String query = "SELECT * FROM flight_booking WHERE customer_id = ?";
            PreparedStatement p = con.prepareStatement(query);
            p.setInt(1, custId);

            ResultSet set = p.executeQuery();

            while (set.next()) {
                int flightBookingId = set.getInt("flight_booking_id");
                String bookingId = set.getString("booking_id");
                int customerId = set.getInt("customer_id");
                int flightId = set.getInt("flight_id");
                String departureDate = set.getString("departure_date");
                String arrivalDate = set.getString("arrival_date");
                int noOfTraveler = set.getInt("number_of_traveler");
                String dateOfBooking = set.getString("date_of_booking");
                String nameOfTraveler = set.getString("name_of_traveler");
                int ageOfTraveler = set.getInt("age_of_traveler");
                String addressOfTraveler = set.getString("address_of_traveler");
                String contactOfTraveler = set.getString("contact_of_traveler");
                float totalSum = set.getFloat("total_amount");
                String status = set.getString("status");

                FlightBooking fb = new FlightBooking(flightBookingId, bookingId, customerId, flightId, departureDate, arrivalDate, nameOfTraveler, dateOfBooking, noOfTraveler, ageOfTraveler, contactOfTraveler, addressOfTraveler, totalSum, status);

                list.add(fb);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    //Method to fetch flight details by Booking id
    public FlightBooking getFlightBookingDetailsByBookingId(String bookId) {

        FlightBooking details = null;

        try {
            String query = "SELECT * FROM flight_booking WHERE booking_id = ?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, bookId);

            ResultSet set = p.executeQuery();

            while (set.next()) {
                int flightBookingId = set.getInt("flight_booking_id");
                String bookingId = set.getString("booking_id");
                int customerId = set.getInt("customer_id");
                int flightId = set.getInt("flight_id");
                String departureDate = set.getString("departure_date");
                String arrivalDate = set.getString("arrival_date");
                int noOfTraveler = set.getInt("number_of_traveler");
                String dateOfBooking = set.getString("date_of_booking");
                String nameOfTraveler = set.getString("name_of_traveler");
                int ageOfTraveler = set.getInt("age_of_traveler");
                String addressOfTraveler = set.getString("address_of_traveler");
                String contactOfTraveler = set.getString("contact_of_traveler");
                float totalSum = set.getFloat("total_amount");
                String status = set.getString("status");
                details = new FlightBooking(flightBookingId, bookingId, customerId, flightId, departureDate, arrivalDate, nameOfTraveler, dateOfBooking, noOfTraveler, ageOfTraveler, contactOfTraveler, addressOfTraveler, totalSum, status);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return details;
    }

}
