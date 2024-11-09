package com.project.entities;

public class Train {

    private int trainId;
    private String trainName;
    private String departureStation;
    private String arrivalStation;
    private String departureTime;
    private String arrivalTime;
    private String seatType;
    private float ticketPrice;
    private int createdBy;
    private String trainImage;

    public Train(String trainName, String departureStation, String arrivalStation, String departureTime, String arrivalTime, String seatType, float ticketPrice, int createdBy) {
        this.trainName = trainName;
        this.departureStation = departureStation;
        this.arrivalStation = arrivalStation;
        this.departureTime = departureTime;
        this.arrivalTime = arrivalTime;
        this.seatType = seatType;
        this.ticketPrice = ticketPrice;
        this.createdBy = createdBy;
    }

    public Train(int trainId, String trainName, String departureStation, String arrivalStation, String departureTime, String arrivalTime, String seatType, float ticketPrice, String trainImage) {
        this.trainId = trainId;
        this.trainName = trainName;
        this.departureStation = departureStation;
        this.arrivalStation = arrivalStation;
        this.departureTime = departureTime;
        this.arrivalTime = arrivalTime;
        this.seatType = seatType;
        this.ticketPrice = ticketPrice;
        this.trainImage = trainImage;
    }
    
    

    public Train() {
        
    }

    public String getTrainImage() {
        return trainImage;
    }

    public void setTrainImage(String trainImage) {
        this.trainImage = trainImage;
    }

    public int getTrainId() {
        return trainId;
    }

    public void setTrainId(int trainId) {
        this.trainId = trainId;
    }

    public String getTrainName() {
        return trainName;
    }

    public void setTrainName(String trainName) {
        this.trainName = trainName;
    }

    public String getDepartureStation() {
        return departureStation;
    }

    public void setDepartureStation(String departureStation) {
        this.departureStation = departureStation;
    }

    public String getArrivalStation() {
        return arrivalStation;
    }

    public void setArrivalStation(String arrivalStation) {
        this.arrivalStation = arrivalStation;
    }

    public String getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(String departureTime) {
        this.departureTime = departureTime;
    }

    public String getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(String arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    public String getSeatType() {
        return seatType;
    }

    public void setSeatType(String seatType) {
        this.seatType = seatType;
    }

    public float getTicketPrice() {
        return ticketPrice;
    }

    public void setTicketPrice(float ticketPrice) {
        this.ticketPrice = ticketPrice;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

}
