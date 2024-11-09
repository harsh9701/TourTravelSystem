package com.project.entities;

public class Flight {

    private int flightId;
    private String flightNumber;
    private String airlineName;
    private String departureAirport;
    private String arrivalAirport;
    private String departureTime;
    private String arrivalTime;
    private float ticketPrice;
    private String classType;
    private int createdBy;

    public Flight(String flightNumber, String airlineName, String departureAirport, String arrivalAirport, String departureTime, String arrivalTime, float ticketPrice, String classType, int createdBy) {
        this.flightNumber = flightNumber;
        this.airlineName = airlineName;
        this.departureAirport = departureAirport;
        this.arrivalAirport = arrivalAirport;
        this.departureTime = departureTime;
        this.arrivalTime = arrivalTime;
        this.ticketPrice = ticketPrice;
        this.classType = classType;
        this.createdBy = createdBy;
    }

    public Flight(int flightId, String flightNumber, String airlineName, String departureAirport, String arrivalAirport, String departureTime, String arrivalTime, float ticketPrice, String classType) {
        this.flightId = flightId;
        this.flightNumber = flightNumber;
        this.airlineName = airlineName;
        this.departureAirport = departureAirport;
        this.arrivalAirport = arrivalAirport;
        this.departureTime = departureTime;
        this.arrivalTime = arrivalTime;
        this.ticketPrice = ticketPrice;
        this.classType = classType;
    }

    public Flight() {
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public int getFlightId() {
        return flightId;
    }

    public void setFlightId(int flightId) {
        this.flightId = flightId;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    public String getFlightNumber() {
        return flightNumber;
    }

    public void setFlightNumber(String flightNumber) {
        this.flightNumber = flightNumber;
    }

    public String getAirlineName() {
        return airlineName;
    }

    public void setAirlineName(String airlineName) {
        this.airlineName = airlineName;
    }

    public String getDepartureAirport() {
        return departureAirport;
    }

    public void setDepartureAirport(String departureAirport) {
        this.departureAirport = departureAirport;
    }

    public String getArrivalAirport() {
        return arrivalAirport;
    }

    public void setArrivalAirport(String arrivalAirport) {
        this.arrivalAirport = arrivalAirport;
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

    public float getTicketPrice() {
        return ticketPrice;
    }

    public void setTicketPrice(float ticketPrice) {
        this.ticketPrice = ticketPrice;
    }

    public String getClassType() {
        return classType;
    }

    public void setClassType(String classType) {
        this.classType = classType;
    }
}
