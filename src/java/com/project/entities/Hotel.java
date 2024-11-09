package com.project.entities;

public class Hotel {

    private int hotelId;
    private String hotelName;
    private String location;
    private String roomType;
    private float pricePerNight;
    private int availableRooms;
    private float rating;
    private int createdBy;
    private String hotelImage;

    public Hotel(String hotelName, String location, String roomType, float pricePerNight, int availableRooms, float rating, int createdBy, String hotelImage) {
        this.hotelName = hotelName;
        this.location = location;
        this.roomType = roomType;
        this.pricePerNight = pricePerNight;
        this.availableRooms = availableRooms;
        this.rating = rating;
        this.createdBy = createdBy;
        this.hotelImage = hotelImage;
    }

    public Hotel(int hotelId, String hotelName, String location, String roomType, float pricePerNight, int availableRooms, float rating, String hotelImage) {
        this.hotelId = hotelId;
        this.hotelName = hotelName;
        this.location = location;
        this.roomType = roomType;
        this.pricePerNight = pricePerNight;
        this.availableRooms = availableRooms;
        this.rating = rating;
        this.hotelImage = hotelImage;
    }
    
    public Hotel() {
        
    }

    public int getHotelId() {
        return hotelId;
    }

    public void setHotelId(int hotelId) {
        this.hotelId = hotelId;
    }

    public String getHotelName() {
        return hotelName;
    }

    public void setHotelName(String hotelName) {
        this.hotelName = hotelName;
    }

    public String getHotelImage() {
        return hotelImage;
    }

    public void setHotelImage(String hotelImage) {
        this.hotelImage = hotelImage;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public float getPricePerNight() {
        return pricePerNight;
    }

    public void setPricePerNight(float pricePerNight) {
        this.pricePerNight = pricePerNight;
    }

    public int getAvailableRooms() {
        return availableRooms;
    }

    public void setAvailableRooms(int availableRooms) {
        this.availableRooms = availableRooms;
    }

    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

}
