package com.project.entities;

public class Orders {

    private int orderId;
    private int customerId;
    private String bookingType;
    private String bookingReferenceId;
    private float totalAmount;
    private String status;
    private String dateOfBooking;

    public Orders(int customerId, String bookingType, String bookingReferenceId, float totalAmount, String status, String dateOfBooking) {
        this.customerId = customerId;
        this.bookingType = bookingType;
        this.bookingReferenceId = bookingReferenceId;
        this.totalAmount = totalAmount;
        this.status = status;
        this.dateOfBooking = dateOfBooking;
    }

    public Orders() {
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getBookingType() {
        return bookingType;
    }

    public void setBookingType(String bookingType) {
        this.bookingType = bookingType;
    }

    public String getBookingReferenceId() {
        return bookingReferenceId;
    }

    public void setBookingReferenceId(String bookingReferenceId) {
        this.bookingReferenceId = bookingReferenceId;
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

    public String getDateOfBooking() {
        return dateOfBooking;
    }

    public void setDateOfBooking(String dateOfBooking) {
        this.dateOfBooking = dateOfBooking;
    }

}
