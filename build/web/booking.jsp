<%-- 
    Document   : book.jsp
    Created on : Sep 23, 2024, 1:10:55 PM
    Author     : HARSH
--%>

<%@page import="com.project.entities.Flight" %>
<%@page import="com.project.entities.Train" %>
<%@page import="com.project.entities.Hotel" %>
<%@page import="com.project.dao.FlightDao" %>
<%@page import="com.project.dao.TrainDao" %>
<%@page import="com.project.dao.HotelDao" %>
<%@page import="com.project.helper.ConnectionProvider" %>

<%
    String type = request.getParameter("type");
    int id = Integer.parseInt(request.getParameter("typeId"));
%>
<%
    Flight flight = new Flight();
    Train train = new Train();
    Hotel hotel = new Hotel();

    if ("flight".equals(type)) {
        FlightDao dao = new FlightDao(ConnectionProvider.getConnection());
        flight = dao.getFlightDetailById(id);
    } else if ("train".equals(type)) {
        TrainDao dao = new TrainDao(ConnectionProvider.getConnection());
        train = dao.getTrainDetailById(id);
    } else if ("hotel".equals(type)) {
        HotelDao dao = new HotelDao(ConnectionProvider.getConnection());
        hotel = dao.getHotelDetailsById(id);
    }
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Booking | ExploreMe</title>
        <link rel="stylesheet" type="text/css" href="css/style.css" >
        <link rel="stylesheet" type="text/css" href="css/navbar.css" >
        <link rel="stylesheet" type="text/css" href="css/footer.css" >
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <style>
            body {
                background-color: #f0f8ff;
            }
            .booking-form-container {
                background-color: #ffffff;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                margin-top: 40px;
            }
            .booking-header {
                text-align: center;
                margin-bottom: 30px;
                color: #007bff;
            }
            .btn-primary {
                background-color: #007bff;
                border: none;
            }
            .btn-primary:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>

        <div style="margin-top: -21px" class="sticky-top">
            <!--include navbar-->
            <jsp:include page="components/navbar.jsp" />
        </div>

        <div class="container mb-3">
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-6">
                    <div class="booking-form-container">
                        <% if ("flight".equals(type)) {%>
                        <h2 class="booking-header mt-2">Book Flight</h2>
                        <h5 class="text-center mt-2">Passengers Information</h5>

                        <!-- Flight Booking Form -->
                        <form action="confirm_booking.jsp" method="post">
                            <input type="text" class="form-control" id="type" name="type" value="flight" required style="display:none">
                            <input type="text" class="form-control" id="flightId" name="flightId" value="<%= flight.getFlightId()%>" required style="display:none">

                            <!-- Flight Details -->
                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <label for="flightNumber" class="form-label">Flight Number</label>
                                    <input type="text" class="form-control" id="flightNumber" name="flightNumber" value="<%= flight.getFlightNumber()%>" disabled required>
                                </div>

                                <div class="col-12 col-md-6">
                                    <label for="airlineName" class="form-label">Airline Name</label>
                                    <input type="text" class="form-control" id="airlineName" value="<%= flight.getAirlineName()%>" name="airlineName" disabled required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <label for="departureStation" class="form-label">Departure Station</label>
                                    <input type="text" class="form-control" id="departureStation" name="departureStation" value="<%= flight.getDepartureAirport()%>" disabled required>
                                </div>

                                <div class="col-12 col-md-6">
                                    <label for="arrivalStation" class="form-label">Arrival Station</label>
                                    <input type="text" class="form-control" id="arrivalStation" value="<%= flight.getArrivalAirport()%>" name="arrivalStation" disabled required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <label for="departureTime" class="form-label">Departure Time</label>
                                    <input type="text" class="form-control" id="departureTime" name="departureTime" value="<%= flight.getDepartureTime()%>" disabled required>
                                </div>

                                <div class="col-12 col-md-6">
                                    <label for="arrivalTime" class="form-label">Arrival Time</label>
                                    <input type="text" class="form-control" id="arrivalTime" name="arrivalTime" value="<%= flight.getArrivalTime()%>" disabled required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <label for="class" class="form-label">Class</label>
                                    <input type="text" class="form-control" id="class" name="class" value="<%= flight.getClassType()%>" disabled required>
                                </div>

                                <div class="col-12 col-md-6">
                                    <label for="ticketPrice" class="form-label">Ticket Price</label>
                                    <input type="text" class="form-control" id="ticketPrice" name="ticketPrice" value="<%= flight.getTicketPrice()%>" disabled required>
                                </div>
                            </div>
                            <!-- No of Adults & No of Children -->
                            <div class="row">
                                <div class="col-12 col-md-6 mb-3">
                                    <label for="adults" class="form-label">No Of Adults</label>
                                    <select class="form-select" id="adults" name="adults" required>
                                        <option value="1">1</option>
                                        <option value="2" selected>2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7">7</option>
                                        <option value="8">8</option>
                                        <option value="9">9</option>
                                    </select>
                                </div>

                                <div class="col-12 col-md-6 mb-3">
                                    <label for="children" class="form-label">No Of Children</label>
                                    <select class="form-select" id="children" name="children">
                                        <option value="0" selected>0</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7">7</option>
                                    </select>
                                </div>
                            </div>

                            <!-- Passenger Name and their Details-->
                            <div class="row">
                                <div class="col-12 col-md-6 mb-3">
                                    <label for="passengerName" class="form-label">Name of One Passenger</label>
                                    <input type="text" class="form-control" id="passengerName" name="passengerName" placeholder="Enter passenger name" required>
                                </div>
                                <div class="col-12 col-md-6 mb-3">
                                    <label for="phoneNumber" class="form-label">Phone No</label>
                                    <input type="tel" class="form-control" id="phoneNumber" name="phoneNumber" pattern="[0-9]{10}" placeholder="Enter your phone number" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-md-6 mb-3">
                                    <label for="address" class="form-label">Address</label>
                                    <input type="text" class="form-control" id="address" name="address" placeholder="Enter your address" required>
                                </div>
                                <div class="col-12 col-md-6 mb-3">
                                    <label for="age" class="form-label">Age</label>
                                    <input type="number" class="form-control" id="age" name="age" placeholder="Enter your age" required>
                                </div>
                            </div>
                            <!-- Submit Button -->
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary">Book Here</button>
                            </div>
                        </form>

                        <!--Train Booking Form-->
                        <% } else if ("train".equals(type)) {%>
                        <h2 class="booking-header m-2">Book Train</h2>
                        <h5 class="text-center m-2">Passengers Information</h5>

                        <form action="confirm_booking.jsp" method="post">
                            <input type="text" class="form-control" id="type" name="type" value="train" required style="display:none">
                            <input type="text" class="form-control" id="trainId" name="trainId" value="<%= train.getTrainId()%>" required style="display:none">

                            <!-- Train Details -->
                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <label for="trainName" class="form-label">Train Name</label>
                                    <input type="text" class="form-control" id="trainName" name="trainName" value="<%= train.getTrainName()%>" disabled required>
                                </div>

                                <div class="col-12 col-md-6">
                                    <label for="ticketPrice" class="form-label">Ticket Price</label>
                                    <input type="text" class="form-control" id="ticketPrice" value="<%= train.getTicketPrice()%>" name="ticketPrice" disabled required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <label for="departureStation" class="form-label">Departure Station</label>
                                    <input type="text" class="form-control" id="departureStation" name="departureStation" value="<%= train.getDepartureStation()%>" disabled required>
                                </div>

                                <div class="col-12 col-md-6">
                                    <label for="arrivalStation" class="form-label">Arrival Station</label>
                                    <input type="text" class="form-control" id="arrivalStation" value="<%= train.getArrivalStation()%>" name="arrivalStation" disabled required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <label for="departureTime" class="form-label">Departure Time</label>
                                    <input type="text" class="form-control" id="departureTime" name="departureTime" value="<%= train.getDepartureTime()%>" disabled required>
                                </div>

                                <div class="col-12 col-md-6">
                                    <label for="arrivalTime" class="form-label">Arrival Time</label>
                                    <input type="text" class="form-control" id="arrivalTime" name="arrivalTime" value="<%= train.getArrivalTime()%>" disabled required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <label for="seatType" class="form-label">Seat Type</label>
                                    <input type="text" class="form-control" id="seatType" name="seatType" value="<%= train.getSeatType()%>" disabled required>
                                </div>
                            </div>
                            <!-- No of Adults & No of Children -->
                            <div class="row">
                                <div class="col-12 col-md-6 mb-3">
                                    <label for="adults" class="form-label">No Of Adults</label>
                                    <select class="form-select" id="adults" name="adults" required>
                                        <option value="1">1</option>
                                        <option value="2" selected>2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7">7</option>
                                        <option value="8">8</option>
                                        <option value="9">9</option>
                                    </select>
                                </div>

                                <div class="col-12 col-md-6 mb-3">
                                    <label for="children" class="form-label">No Of Children</label>
                                    <select class="form-select" id="children" name="children">
                                        <option value="0" selected>0</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7">7</option>
                                    </select>
                                </div>
                            </div>

                            <!-- Passenger Name and their Details-->
                            <div class="row">
                                <div class="col-12 col-md-6 mb-3">
                                    <label for="passengerName" class="form-label">Name of One Passenger</label>
                                    <input type="text" class="form-control" id="passengerName" name="passengerName" placeholder="Enter passenger name" required>
                                </div>
                                <div class="col-12 col-md-6 mb-3">
                                    <label for="phoneNumber" class="form-label">Phone No</label>
                                    <input type="tel" class="form-control" id="phoneNumber" name="phoneNumber" pattern="[0-9]{10}" placeholder="Enter your phone number" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-md-6 mb-3">
                                    <label for="address" class="form-label">Address</label>
                                    <input type="text" class="form-control" id="address" name="address" placeholder="Enter your address" required>
                                </div>
                                <div class="col-12 col-md-6 mb-3">
                                    <label for="age" class="form-label">Age</label>
                                    <input type="number" class="form-control" id="age" name="age" placeholder="Enter your age" required>
                                </div>
                            </div>
                            <!-- Submit Button -->
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary">Book Here</button>
                            </div>
                        </form>
                        <% } else if ("hotel".equals(type)) {%>
                        <h2 class="booking-header m-2">Book Hotel</h2>
                        <h5 class="text-center m-2">Booking Information</h5>

                        <form action="confirm_booking.jsp" method="post">
                            <input type="text" class="form-control" id="type" name="type" value="hotel" required style="display:none">
                            <input type="text" class="form-control" id="hotelId" name="hotelId" value="<%= hotel.getHotelId()%>" required style="display:none">

                            <!-- Hotel Details -->
                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <label for="hotelName" class="form-label">Hotel Name</label>
                                    <input type="text" class="form-control" id="hotelName" name="hotelName" value="<%= hotel.getHotelName()%>" disabled required>
                                </div>
                                <div class="col-12 col-md-6">
                                    <label for="location" class="form-label">Location</label>
                                    <input type="text" class="form-control" id="location" value="<%= hotel.getLocation()%>" name="location" disabled required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <label for="roomType" class="form-label">Room Type</label>
                                    <input type="text" class="form-control" id="roomType" name="roomType" value="<%= hotel.getRoomType()%>" disabled required>
                                </div>
                                <div class="col-12 col-md-6">
                                    <label for="pricePerNight" class="form-label">Price Per Night</label>
                                    <input type="text" class="form-control" id="pricePerNight" value="<%= hotel.getPricePerNight()%>" name="pricePerNight" disabled required>
                                </div>
                            </div>
                            <!-- No of Adults & No of Children -->
                            <div class="row">
                                <div class="col-12 col-md-6 mb-3">
                                    <label for="guestName" class="form-label">Name of Guest</label>
                                    <input type="text" class="form-control" id="guestName" name="guestName" placeholder="Enter Your name" required>
                                </div>
                                <div class="col-12 col-md-6 mb-3">
                                    <label for="noOfRooms" class="form-label">Number Of Rooms</label>
                                    <input type="number" min="1" max="10" class="form-control" id="noOfRooms" name="noOfRooms" placeholder="Number Of Rooms" required>
                                </div>
                            </div>

                            <!-- Guest Name and their Details-->
                            <div class="row">
                                <div class="col-12 col-md-6 mb-3">
                                    <label for="address" class="form-label">Address</label>
                                    <input type="text" class="form-control" id="address" name="address" placeholder="Enter your address" required>
                                </div>
                                <div class="col-12 col-md-6 mb-3">
                                    <label for="phoneNumber" class="form-label">Phone No</label>
                                    <input type="tel" class="form-control" id="phoneNumber" name="phoneNumber" placeholder="Enter phone number" pattern="[0-9]{10}" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-md-6 mb-3">
                                    <label for="checkIn" class="form-label">Check-In</label>
                                    <input type="date" class="form-control" id="checkIn" name="checkIn" required>
                                </div>
                                <div class="col-12 col-md-6 mb-3">
                                    <label for="checkOut" class="form-label">Check-Out</label>
                                    <input type="date" class="form-control" id="checkOut" name="checkOut" required>
                                </div>
                            </div>
                            <!-- Submit Button -->
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary">Book Here</button>
                            </div>
                        </form>
                        <% }%>
                    </div>
                </div>
            </div>
        </div>

        <!--include footer-->
        <jsp:include page="components/footer.jsp" />

        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
