<!-- 
Document   : booking_list
Created on : Sep 27, 2024, 12:34:21 AM
Author     : HARSH
-->

<%@page import="java.util.List" %>
<%@page import="com.project.entities.User" %>
<%@page import="com.project.entities.FlightBooking" %>
<%@page import="com.project.entities.TrainBooking" %>
<%@page import="com.project.entities.HotelBooking" %>
<%@page import="com.project.dao.FlightBookingDao" %>
<%@page import="com.project.dao.TrainBookingDao" %>
<%@page import="com.project.dao.HotelBookingDao" %>
<%@page import="com.project.helper.ConnectionProvider" %>

<%
    User user = (User) session.getAttribute("currentUser");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<%
    List<FlightBooking> flightBooking = null;
    List<TrainBooking> trainBooking = null;
    List<HotelBooking> hotelBooking = null;

    FlightBookingDao flightDao = new FlightBookingDao(ConnectionProvider.getConnection());
    flightBooking = flightDao.getFlightBookingDetailsByCustId(user.getId());

    TrainBookingDao trainDao = new TrainBookingDao(ConnectionProvider.getConnection());
    trainBooking = trainDao.getTrainBookingDetailsByCustId(user.getId());

    HotelBookingDao hotelDao = new HotelBookingDao(ConnectionProvider.getConnection());
    hotelBooking = hotelDao.getHotelBookingDetailsByCustId(user.getId());
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bookings | ExploreMe</title>
        <link rel="stylesheet" type="text/css" href="css/style.css" >
        <link rel="stylesheet" type="text/css" href="css/navbar.css" >
        <link rel="stylesheet" type="text/css" href="css/footer.css" >
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <!--Sweet Alert-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <style>
            body {
                background-color: #f1f3f5;
            }
            .account-container {
                margin-top: 2px;
                padding: 15px;
            }
            .card {
                margin-bottom: 10px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            .table-custom th {
                background-color: #16a085;
                color: white;
                text-align: center;
            }
            .table-custom td {
                text-align: center;
            }
            /* Add different colors for each service type */
            .flight-row {
                background-color: #e3f2fd;
            }
            .train-row {
                background-color: #e8f5e9;
            }
            .hotel-row {
                background-color: #fff3e0;
            }
            .custom-btn {
                background-color: #28a745;
                color: white;
                border-radius: 10px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 0.8rem;
            }
            .custom-btn i {
                font-size: 0.8rem;
                margin-right: 8px;
            }
            .custom-btn:hover {
                background-color: #16a085 !important;
            }
        </style>
    </head>
    <body>

        <!--include navbar-->
        <jsp:include page="components/navbar.jsp" />

        <div class="container account-container">
            <h3 class="text-center" style="color: #0d5d4d;">Welcome <%= user.getFullName()%></h3>
            <h4 class="text-center mb-4" style="color: #0d5d4d;">Your Bookings</h4>

            <!-- Bookings Card -->
            <div class="card">
                <div class="card-body">
                    <!-- Make the table responsive -->
                    <div class="table-responsive">
                        <table class="table table-striped table-hover table-custom">
                            <thead>
                                <tr>
                                    <th>Booking ID</th>
                                    <th>Service Type</th>
                                    <th>Date</th>
                                    <th>Status</th>
                                    <th>Receipt</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% if (flightBooking != null) { %>
                                <% for (FlightBooking f : flightBooking) {%>
                                <tr class="flight-row">
                                    <td><%= f.getBookingId()%></td>
                                    <td>Flight</td>
                                    <td><%= f.getDateOfBooking()%></td>
                                    <td><%= f.getStatus()%></td>
                                    <td class="d-flex justify-content-center"><a href="receipt.jsp?bookingType=flight&bookingId=<%= f.getBookingId()%>" class="btn custom-btn"><i class="fas fa-print"></i>Print</a></td>
                                </tr>
                                <% } %>
                                <% } %>

                                <% if (trainBooking != null) { %>
                                <% for (TrainBooking t : trainBooking) {%>
                                <tr class="train-row">
                                    <td><%= t.getBookingId()%></td>
                                    <td>Train</td>
                                    <td><%= t.getDateOfBooking()%></td>
                                    <td><%= t.getStatus()%></td>
                                    <td class="d-flex justify-content-center"><a href="receipt.jsp?bookingType=train&bookingId=<%= t.getBookingId()%>" class="btn custom-btn"><i class="fas fa-print"></i>Print</a></td>
                                </tr>
                                <% } %>
                                <% } %>

                                <% if (hotelBooking != null) { %>
                                <% for (HotelBooking h : hotelBooking) {%>
                                <tr class="hotel-row">
                                    <td><%= h.getBookingId()%></td>
                                    <td>Hotel</td>
                                    <td><%= h.getDateOfBooking()%></td>
                                    <td><%= h.getStatus()%></td>
                                    <td class="d-flex justify-content-center"><a href="receipt.jsp?bookingType=hotel&bookingId=<%= h.getBookingId()%>" class="btn custom-btn"><i class="fas fa-print"></i>Print</a></td>
                                </tr>
                                <% } %>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!--include footer-->
        <jsp:include page="components/footer.jsp" />

        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
