package com.project.entities;

public class TrainBooking {

    private int trainBookingId;
    private String bookingId;
    private int customerId;
    private int trainId;
    private String departureDate;
    private String arrivalDate;
    private int numberOfAdults;
    private int numberOfChildren;
    private String dateOfBooking;
    private String nameOfTraveler;
    private int ageOfTraveler;
    private String contactOfTraveler;
    private String addressOfTraveler;
    private float totalAmount;
    private String status;

    public TrainBooking(String bookingId, int customerId, int trainId, String departureDate, String arrivalDate, int numberOfAdults, int numberOfChildren, String dateOfBooking, String nameOfTraveler, int ageOfTraveler, String contactOfTraveler, String addressOfTraveler, float totalAmount, String status) {
        this.bookingId = bookingId;
        this.customerId = customerId;
        this.trainId = trainId;
        this.departureDate = departureDate;
        this.arrivalDate = arrivalDate;
        this.numberOfAdults = numberOfAdults;
        this.numberOfChildren = numberOfChildren;
        this.dateOfBooking = dateOfBooking;
        this.nameOfTraveler = nameOfTraveler;
        this.ageOfTraveler = ageOfTraveler;
        this.contactOfTraveler = contactOfTraveler;
        this.addressOfTraveler = addressOfTraveler;
        this.totalAmount = totalAmount;
        this.status = status;
    }

    public TrainBooking(int trainBookingId, String bookingId, int customerId, int trainId, String departureDate, String arrivalDate, int numberOfAdults, int numberOfChildren, String dateOfBooking, String nameOfTraveler, int ageOfTraveler, String contactOfTraveler, String addressOfTraveler, float totalAmount, String status) {
        this.trainBookingId = trainBookingId;
        this.bookingId = bookingId;
        this.customerId = customerId;
        this.trainId = trainId;
        this.departureDate = departureDate;
        this.arrivalDate = arrivalDate;
        this.numberOfAdults = numberOfAdults;
        this.numberOfChildren = numberOfChildren;
        this.dateOfBooking = dateOfBooking;
        this.nameOfTraveler = nameOfTraveler;
        this.ageOfTraveler = ageOfTraveler;
        this.contactOfTraveler = contactOfTraveler;
        this.addressOfTraveler = addressOfTraveler;
        this.totalAmount = totalAmount;
        this.status = status;
    }

    public TrainBooking() {
    }

    public int getTrainBookingId() {
        return trainBookingId;
    }

    public void setTrainBookingId(int trainBookingId) {
        this.trainBookingId = trainBookingId;
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

    public int getTrainId() {
        return trainId;
    }

    public void setTrainId(int trainId) {
        this.trainId = trainId;
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

    public int getNumberOfAdults() {
        return numberOfAdults;
    }

    public void setNumberOfAdults(int numberOfAdults) {
        this.numberOfAdults = numberOfAdults;
    }

    public int getNumberOfChildren() {
        return numberOfChildren;
    }

    public void setNumberOfChildren(int numberOfChildren) {
        this.numberOfChildren = numberOfChildren;
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
