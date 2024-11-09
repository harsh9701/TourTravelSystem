package com.project.entities;

public class HotelBooking {

    private int hotelBookingId;
    private String bookingId;
    private int customerId;
    private int hotelId;
    private String checkIn;
    private String checkOut;
    private int numberOfRooms;
    private int numberOfDays;
    private String dateOfBooking;
    private String nameOfTraveler;
    private String contactOfTraveler;
    private String addressOfTraveler;
    private float totalAmount;
    private String status;

    public HotelBooking(String bookingId, int customerId, int hotelId, String checkIn, String checkOut, int numberOfRooms, int numberOfDays, String dateOfBooking, String nameOfTraveler, String contactOfTraveler, String addressOfTraveler, float totalAmount, String status) {
        this.bookingId = bookingId;
        this.customerId = customerId;
        this.hotelId = hotelId;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.numberOfRooms = numberOfRooms;
        this.numberOfDays = numberOfDays;
        this.dateOfBooking = dateOfBooking;
        this.nameOfTraveler = nameOfTraveler;
        this.contactOfTraveler = contactOfTraveler;
        this.addressOfTraveler = addressOfTraveler;
        this.totalAmount = totalAmount;
        this.status = status;
    }

    public HotelBooking(int hotelBookingId, String bookingId, int customerId, int hotelId, String checkIn, String checkOut, int numberOfRooms, int numberOfDays, String dateOfBooking, String nameOfTraveler, String contactOfTraveler, String addressOfTraveler, float totalAmount, String status) {
        this.hotelBookingId = hotelBookingId;
        this.bookingId = bookingId;
        this.customerId = customerId;
        this.hotelId = hotelId;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.numberOfRooms = numberOfRooms;
        this.numberOfDays = numberOfDays;
        this.dateOfBooking = dateOfBooking;
        this.nameOfTraveler = nameOfTraveler;
        this.contactOfTraveler = contactOfTraveler;
        this.addressOfTraveler = addressOfTraveler;
        this.totalAmount = totalAmount;
        this.status = status;
    }

    public HotelBooking() {
    }

    public int getHotelBookingId() {
        return hotelBookingId;
    }

    public void setHotelBookingId(int hotelBookingId) {
        this.hotelBookingId = hotelBookingId;
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

    public int getHotelId() {
        return hotelId;
    }

    public void setHotelId(int hotelId) {
        this.hotelId = hotelId;
    }

    public String getCheckIn() {
        return checkIn;
    }

    public void setCheckIn(String checkIn) {
        this.checkIn = checkIn;
    }

    public String getCheckOut() {
        return checkOut;
    }

    public void setCheckOut(String checkOut) {
        this.checkOut = checkOut;
    }

    public int getNumberOfRooms() {
        return numberOfRooms;
    }

    public void setNumberOfRooms(int numberOfRooms) {
        this.numberOfRooms = numberOfRooms;
    }

    public int getNumberOfDays() {
        return numberOfDays;
    }

    public void setNumberOfDays(int numberOfDays) {
        this.numberOfDays = numberOfDays;
    }

    public String getDateOfBooking() {
        return dateOfBooking;
    }

    public void setDateOfBooking(String dateOfBooking) {
        this.dateOfBooking = dateOfBooking;
    }

    public String getNameOfTraveler() {
        return nameOfTraveler;
    }

    public void setNameOfTraveler(String nameOfTraveler) {
        this.nameOfTraveler = nameOfTraveler;
    }

    public String getContactOfTraveler() {
        return contactOfTraveler;
    }

    public void setContactOfTraveler(String contactOfTraveler) {
        this.contactOfTraveler = contactOfTraveler;
    }

    public String getAddressOfTraveler() {
        return addressOfTraveler;
    }

    public void setAddressOfTraveler(String addressOfTraveler) {
        this.addressOfTraveler = addressOfTraveler;
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
