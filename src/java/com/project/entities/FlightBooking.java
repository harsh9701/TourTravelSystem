package com.project.entities;

public class FlightBooking {

    private int flightBookingId;
    private String bookingId;
    private int customerId;
    private int flightId;
    private String departureDate;
    private String arrivalDate;
    private String nameOfTraveler;
    private String dateOfBooking;
    private int numberOfTraveler;
    private int ageOfTraveler;
    private String contactOfTraveler;
    private String addressOfTraveler;
    private float totalAmount;
    private String status;

    public FlightBooking(String bookingId, int customerId, int flightId, String departureDate, String arrivalDate, int numberOfTraveler, String dateOfBooking, String nameOfTraveler, int ageOfTraveler, String contactOfTraveler, String addressOfTraveler, float totalAmount, String status) {
        this.bookingId = bookingId;
        this.customerId = customerId;
        this.flightId = flightId;
        this.departureDate = departureDate;
        this.arrivalDate = arrivalDate;
        this.nameOfTraveler = nameOfTraveler;
        this.dateOfBooking = dateOfBooking;
        this.numberOfTraveler = numberOfTraveler;
        this.ageOfTraveler = ageOfTraveler;
        this.contactOfTraveler = contactOfTraveler;
        this.addressOfTraveler = addressOfTraveler;
        this.totalAmount = totalAmount;
        this.status = status;
    }

    public FlightBooking(int flightBookingId, String bookingId, int customerId, int flightId, String departureDate, String arrivalDate, String nameOfTraveler, String dateOfBooking, int numberOfTraveler, int ageOfTraveler, String contactOfTraveler, String addressOfTraveler, float totalAmount, String status) {
        this.flightBookingId = flightBookingId;
        this.bookingId = bookingId;
        this.customerId = customerId;
        this.flightId = flightId;
        this.departureDate = departureDate;
        this.arrivalDate = arrivalDate;
        this.nameOfTraveler = nameOfTraveler;
        this.dateOfBooking = dateOfBooking;
        this.numberOfTraveler = numberOfTraveler;
        this.ageOfTraveler = ageOfTraveler;
        this.contactOfTraveler = contactOfTraveler;
        this.addressOfTraveler = addressOfTraveler;
        this.totalAmount = totalAmount;
        this.status = status;
    }

    public FlightBooking() {
    }

    public int getFlightBookingId() {
        return flightBookingId;
    }

    public String getAddressOfTraveler() {
        return addressOfTraveler;
    }

    public void setAddressOfTraveler(String addressOfTraveler) {
        this.addressOfTraveler = addressOfTraveler;
    }

    public void setFlightBookingId(int flightBookingId) {
        this.flightBookingId = flightBookingId;
    }

    public String getBookingId() {
        return bookingId;
    }

    public void setBookingId(String bookingId) {
        this.bookingId = bookingId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getFlightId() {
        return flightId;
    }

    public void setFlightId(int flightId) {
        this.flightId = flightId;
    }

    public String getDepartureDate() {
        return departureDate;
    }

    public void setDepartureDate(String departureDate) {
        this.departureDate = departureDate;
    }

    public String getArrivalDate() {
        return arrivalDate;
    }

    public void setArrivalDate(String arrivalDate) {
        this.arrivalDate = arrivalDate;
    }

    public String getNameOfTraveler() {
        return nameOfTraveler;
    }

    public void setNameOfTraveler(String nameOfTraveler) {
        this.nameOfTraveler = nameOfTraveler;
    }

    public String getDateOfBooking() {
        return dateOfBooking;
    }

    public void setDateOfBooking(String dateOfBooking) {
        this.dateOfBooking = dateOfBooking;
    }

    public int getNumberOfTraveler() {
        return numberOfTraveler;
    }

    public void setNumberOfTraveler(int numberOfTraveler) {
        this.numberOfTraveler = numberOfTraveler;
    }

    public int getAgeOfTraveler() {
        return ageOfTraveler;
    }

    public void setAgeOfTraveler(int ageOfTraveler) {
        this.ageOfTraveler = ageOfTraveler;
    }

    public String getContactOfTraveler() {
        return contactOfTraveler;
    }

    public void setContactOfTraveler(String contactOfTraveler) {
        this.contactOfTraveler = contactOfTraveler;
    }

    public float getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(float totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
