package com.project.dao;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;
import com.project.entities.Train;

public class TrainDao {
    
    private Connection con;
    
    public TrainDao(Connection con) {
        this.con = con;
    }

    //method to insert train data into database
    public boolean saveTrainDetails(Train train) {
        
        boolean isQueryExecute = false;
        try {
            String query = "INSERT INTO trains(train_name, departure_station, arrival_station, departure_time, arrival_time, seat_type, ticket_price, created_by) VALUES(?,?,?,?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, train.getTrainName());
            pstmt.setString(2, train.getDepartureStation());
            pstmt.setString(3, train.getArrivalStation());
            pstmt.setString(4, train.getDepartureTime());
            pstmt.setString(5, train.getArrivalTime());
            pstmt.setString(6, train.getSeatType());
            pstmt.setFloat(7, train.getTicketPrice());
            pstmt.setFloat(8, train.getCreatedBy());
            
            pstmt.executeUpdate();
            isQueryExecute = true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return isQueryExecute;
    }

    //Method to fetch all train data
    public List<Train> getAllTrainsList(int pageNumber, int pageSize) {
        
        List<Train> list = new ArrayList<>();
        
        try {
            String query = "SELECT * FROM trains LIMIT ?, ?";
            PreparedStatement p = con.prepareStatement(query);
            p.setInt(1, (pageNumber - 1) * pageSize);
            p.setInt(2, pageSize);
            
            ResultSet set = p.executeQuery();
            
            while (set.next()) {
                int trainId = set.getInt("train_id");
                String trainName = set.getString("train_name");
                String departureStation = set.getString("departure_station");
                String arrivalStation = set.getString("arrival_station");
                String departureTime = set.getString("departure_time");
                String arrivalTime = set.getString("arrival_time");
                String seatType = set.getString("seat_type");
                float ticketPrice = set.getFloat("ticket_price");
                String trainImage = set.getString("train_image");
                
                Train train = new Train(trainId, trainName, departureStation, arrivalStation, departureTime, arrivalTime, seatType, ticketPrice, trainImage);
                list.add(train);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
        
    }

    // Method to calculate train count
    public int getTotalTrainsCount() {
        int count = 0;
        try {
            String query = "SELECT COUNT(*) FROM trains";
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

    //Method to fetch train details by train id
    public Train getTrainDetailById(int id) {
        Train train = null;
        
        try {
            String query = "SELECT * FROM trains WHERE train_id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, id);
            
            ResultSet set = pstmt.executeQuery();
            
            if (set.next()) {
                train = new Train();
                
                train.setTrainId(set.getInt("train_id"));
                train.setTrainName(set.getString("train_name"));
                train.setDepartureStation(set.getString("departure_station"));
                train.setArrivalStation(set.getString("arrival_station"));
                train.setDepartureTime(set.getString("departure_time"));
                train.setArrivalTime(set.getString("arrival_time"));
                train.setSeatType(set.getString("seat_type"));
                train.setTicketPrice(set.getFloat("ticket_price"));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return train;
    }
    
}
