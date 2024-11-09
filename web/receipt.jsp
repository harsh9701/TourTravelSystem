<%-- 
    Document   : booking_detail
    Created on : Sep 25, 2024, 3:52:18 PM
    Author     : HARSH
--%>

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

    String bookingType = request.getParameter("bookingType");
    String bookingId = request.getParameter("bookingId");
%>
<%
    FlightBooking flightBooking = null;
    TrainBooking trainBooking = null;
    HotelBooking hotelBooking = null;

    if ("flight".equals(bookingType)) {
        FlightBookingDao flightDao = new FlightBookingDao(ConnectionProvider.getConnection());
        flightBooking = flightDao.getFlightBookingDetailsByBookingId(bookingId);
    } else if ("train".equals(bookingType)) {
        TrainBookingDao trainDao = new TrainBookingDao(ConnectionProvider.getConnection());
        trainBooking = trainDao.getTrainBookingDetailsByBookingId(bookingId);
    } else if ("hotel".equals(bookingType)) {
        HotelBookingDao hotelDao = new HotelBookingDao(ConnectionProvider.getConnection());
        hotelBooking = hotelDao.getHotelBookingDetailsByBookingId(bookingId);
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Booking Receipt</title>
        <link rel="stylesheet" type="text/css" href="css/navbar.css" >
        <link rel="stylesheet" type="text/css" href="css/footer.css" >
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Icons -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f4f4f4;
            }
            .confirmation-card {
                margin: auto;
                margin-top: 20px;
                margin-bottom: 20px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                width: 60%;
            }
            .confirmation-header {
                background-color: #16a085;
                color: white;
                padding: 15px;
                border-top-left-radius: 10px;
                border-top-right-radius: 10px;
                font-size: 20px;
                font-weight: bold;
                text-align: center;
            }
            .booking-details td {
                padding: 10px;
                vertical-align: middle;
            }
            .print-button {
                margin-top: 20px;
                text-align: center;
            }
            .btn-custom {
                background-color: #16a085;
                color: #fff;
            }
            @media (max-width: 576px) {
                .booking-details td {
                    display: block;
                    text-align: left;
                    width: 100%;
                }
                .confirmation-header {
                    font-size: 18px;
                }
            }
            /* Print-only styles */
            @media print {
                body * {
                    visibility: hidden; /* Hide everything */
                }
                .confirmation-card, .confirmation-card * {
                    visibility: visible; /* Only show confirmation card */
                }
                .confirmation-card {
                    position: absolute;
                    top: 20px;
                    left: 0;
                    width: 100%;
                }
            }
        </style>
    </head>
    <body>

        <!-- Include navbar -->
        <jsp:include page="components/navbar.jsp" />

        <div class="container">
            <div class="card confirmation-card">
                <div class="confirmation-header">
                    <i class="fas fa-check-circle"></i> Booking Confirmed!
                </div>
                <div class="card-body">
                    <h4 class="text-center mb-4">Thank you for booking with us!</h4>
                    <table class="table table-borderless booking-details">
                        <tbody>
                            <tr>
                                <td><strong>Booking ID:</strong></td>
                                <% if ("flight".equals(bookingType)) {%>
                                <td><%= flightBooking.getBookingId()%></td>
                                <% } else if ("train".equals(bookingType)) {%>
                                <td><%= trainBooking.getBookingId()%></td>
                                <% } else if ("hotel".equals(bookingType)) {%>
                                <td><%= hotelBooking.getBookingId()%></td>
                                <% }%>
                            </tr>
                            <tr>
                                <td><strong>Traveler Name:</strong></td>
                                <% if ("flight".equals(bookingType)) {%>
                                <td><%= flightBooking.getNameOfTraveler()%></td>
                                <% } else if ("train".equals(bookingType)) {%>
                                <td><%= trainBooking.getNameOfTraveler()%></td>
                                <% } else if ("hotel".equals(bookingType)) {%>
                                <td><%= hotelBooking.getNameOfTraveler()%></td>
                                <% }%>
                            </tr>
                            <tr>
                                <td><strong>Booking Type:</strong></td>
                                <td><%= bookingType.substring(0, 1).toUpperCase() + bookingType.substring(1).toLowerCase()%></td>
                            </tr>
                            <tr>
                                <% if ("flight".equals(bookingType)) {%>
                                <td><strong>Departure:</strong></td>
                                <td><%= flightBooking.getDepartureDate()%></td>
                                <% } else if ("train".equals(bookingType)) {%>
                                <td><strong>Departure:</strong></td>
                                <td><%= trainBooking.getDepartureDate()%></td>
                                <% } else if ("hotel".equals(bookingType)) {%>
                                <td><strong>Check-In:</strong></td>
                                <td><%= hotelBooking.getCheckIn()%></td>
                                <% }%>
                            </tr>
                            <tr>
                                <% if ("flight".equals(bookingType)) {%>
                                <td><strong>Arrival</strong></td>
                                <td><%= flightBooking.getArrivalDate()%></td>
                                <% } else if ("train".equals(bookingType)) {%>
                                <td><strong>Arrival</strong></td>
                                <td><%= trainBooking.getArrivalDate()%></td>
                                <% } else if ("hotel".equals(bookingType)) {%>
                                <td><strong>Check-Out:</strong></td>
                                <td><%= hotelBooking.getCheckOut()%></td>
                                <% }%>
                            </tr>
                            <tr>
                                <td><strong>Price Paid:</strong></td>
                                <% if ("flight".equals(bookingType)) {%>
                                <td><%= flightBooking.getTotalAmount()%></td>
                                <% } else if ("train".equals(bookingType)) {%>
                                <td><%= trainBooking.getTotalAmount()%></td>
                                <% } else if ("hotel".equals(bookingType)) {%>
                                <td><%= hotelBooking.getTotalAmount()%></td>
                                <% }%>
                            </tr>
                        </tbody>
                    </table>
                    <div class="print-button">
                        <button onclick="window.print()" class="btn btn-custom">
                            <i class="fas fa-print"></i> Print Confirmation
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Include footer -->
        <jsp:include page="components/footer.jsp" />

        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
