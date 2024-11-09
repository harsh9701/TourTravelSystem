package com.project.dao;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;
import com.project.entities.Hotel;

public class HotelDao {

    private Connection con;

    public HotelDao(Connection con) {
        this.con = con;
    }

    //method to insert hotel data into datbase
    public boolean saveHotelDetails(Hotel hotel) {

        boolean isQueryExecute = false;
        try {
            String query = "INSERT INTO hotels(hotel_name, location, room_type, price_per_night, available_rooms, rating, created_by, hotel_image) VALUES (?,?,?,?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, hotel.getHotelName());
            pstmt.setString(2, hotel.getLocation());
            pstmt.setString(3, hotel.getRoomType());
            pstmt.setFloat(4, hotel.getPricePerNight());
            pstmt.setInt(5, hotel.getAvailableRooms());
            pstmt.setFloat(6, hotel.getRating());
            pstmt.setInt(7, hotel.getCreatedBy());
            pstmt.setString(8, hotel.getHotelImage());

            pstmt.executeUpdate();
            isQueryExecute = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isQueryExecute;
    }

    //Method to fetch all the hotel data
    public List<Hotel> getAllHotelsList(int pageNumber, int pageSize) {

        List<Hotel> list = new ArrayList<>();

        try {
            String query = "SELECT * FROM hotels LIMIT ?, ?";
            PreparedStatement p = con.prepareStatement(query);
            p.setInt(1, (pageNumber - 1) * pageSize);
            p.setInt(2, pageSize);

            ResultSet set = p.executeQuery();

            while (set.next()) {
                int hotelId = set.getInt("hotel_id");
                String hotelName = set.getString("hotel_name");
                String location = set.getString("location");
                String roomType = set.getString("room_type");
                float pricePerNight = set.getFloat("price_per_night");
                int availableRooms = set.getInt("available_rooms");
                float rating = set.getFloat("rating");
                String hotelImage = set.getString("hotel_image");

                Hotel hotel = new Hotel(hotelId, hotelName, location, roomType, pricePerNight, availableRooms, rating, hotelImage);

                list.add(hotel);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // Method to calculate hotel count
    public int getTotalTrainsCount() {
        int count = 0;
        try {
            String query = "SELECT COUNT(*) FROM hotels";
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

    //Method to fetch hotel details by hotel id
    public Hotel getHotelDetailsById(int id) {
        Hotel hotel = null;

        try {
            String query = "SELECT * FROM hotels WHERE hotel_id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, id);

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                hotel = new Hotel();

                hotel.setHotelId(set.getInt("hotel_id"));
                hotel.setHotelName(set.getString("hotel_name"));
                hotel.setLocation(set.getString("location"));
                hotel.setRoomType(set.getString("room_type"));
                hotel.setPricePerNight(set.getFloat("price_per_night"));
                hotel.setAvailableRooms(set.getInt("available_rooms"));
                hotel.setRating(set.getFloat("rating"));
                hotel.setHotelImage(set.getString("hotel_image"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return hotel;
    }
}
