package com.project.dao;

import java.sql.*;
import com.project.entities.Flight;
import java.util.ArrayList;
import java.util.List;

public class FlightDao {

    private Connection con;

    public FlightDao(Connection con) {
        this.con = con;
    }

    //method to insert the data into the flight table
    public boolean saveFlightDetails(Flight flight) {

        boolean isQueryExecute = false;
        try {
            String query = "INSERT INTO flights(flight_number, airline_name, departure_airport, arrival_airport, departure_time, arrival_time, class_type, ticket_price, created_by) VALUES(?,?,?,?,?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, flight.getFlightNumber());
            pstmt.setString(2, flight.getAirlineName());
            pstmt.setString(3, flight.getDepartureAirport());
            pstmt.setString(4, flight.getArrivalAirport());
            pstmt.setString(5, flight.getDepartureTime());
            pstmt.setString(6, flight.getArrivalTime());
            pstmt.setString(7, flight.getClassType());
            pstmt.setFloat(8, flight.getTicketPrice());
            pstmt.setInt(9, flight.getCreatedBy());

            pstmt.executeUpdate();
            isQueryExecute = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isQueryExecute;
    }

    // Method to fetch all flight data for admin
    public List<Flight> getAllFlightsList(int pageNumber, int pageSize) {

        List<Flight> list = new ArrayList<>();

        try {
            String query = "SELECT * FROM flights LIMIT ?, ?";
            PreparedStatement p = con.prepareStatement(query);
            p.setInt(1, (pageNumber - 1) * pageSize);
            p.setInt(2, pageSize);

            ResultSet set = p.executeQuery();

            while (set.next()) {
                int flightId = set.getInt("flight_id");
                String flightNumber = set.getString("flight_number");
                String airlineName = set.getString("airline_name");
                String departureAirport = set.getString("departure_airport");
                String arrivalAirport = set.getString("arrival_airport");
                String departureTime = set.getString("departure_time");
                String arrivalTime = set.getString("arrival_time");
                String classType = set.getString("class_type");
                float ticketPrice = set.getFloat("ticket_price");

                Flight flight = new Flight(flightId, flightNumber, airlineName, departureAirport, arrivalAirport, departureTime, arrivalTime, ticketPrice, classType);

                list.add(flight);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Method to calculate flight count
    public int getTotalFlightsCount() {
        int count = 0;
        try {
            String query = "SELECT COUNT(*) FROM flights";
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    //Method to fetch flight details using flight id
    public Flight getFlightDetailById(int id) {
        Flight flight = null;
        try {
            String query = "SELECT * FROM flights WHERE flight_id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, id);

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                flight = new Flight();
                
                flight.setFlightId(set.getInt("flight_id"));
                flight.setFlightNumber(set.getString("flight_number"));
                flight.setAirlineName(set.getString("airline_name"));
                flight.setDepartureAirport(set.getString("departure_airport"));
                flight.setArrivalAirport(set.getString("arrival_airport"));
                flight.setDepartureTime(set.getString("departure_time"));
                flight.setArrivalTime(set.getString("arrival_time"));
                flight.setClassType(set.getString("class_type"));
                flight.setTicketPrice(set.getFloat("ticket_price"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return flight;
    }

}
