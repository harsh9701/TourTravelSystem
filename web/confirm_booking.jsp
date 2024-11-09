<%-- 
    Document   : confirm_booking
    Created on : Sep 23, 2024, 10:25:38 PM
    Author     : HARSH
--%>

<%@ page import="java.util.Date" %>
<%@ page import="java.time.LocalDate, java.time.temporal.ChronoUnit" %>
<%@ page import="java.util.Random, java.text.SimpleDateFormat" %>
<%@page import="com.project.entities.User" %>
<%@page import="com.project.entities.Flight" %>
<%@page import="com.project.entities.Train" %>
<%@page import="com.project.entities.Hotel" %>
<%@page import="com.project.dao.FlightDao" %>
<%@page import="com.project.dao.TrainDao" %>
<%@page import="com.project.dao.HotelDao" %>
<%@page import="com.project.helper.ConnectionProvider" %>

<%
    User user = (User) session.getAttribute("currentUser");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<%
    String type = request.getParameter("type");
    String noOfAdult = request.getParameter("adults");
    String noOfChildren = request.getParameter("children");
    String passengerName = request.getParameter("passengerName");
    String phoneNumber = request.getParameter("phoneNumber");
    String address = request.getParameter("address");
    String age = request.getParameter("age");
    String noOfRooms = request.getParameter("noOfRooms");
    String guestName = request.getParameter("guestName");
    String checkIn = request.getParameter("checkIn");
    String checkOut = request.getParameter("checkOut");

%>
<%    Flight flight = new Flight();
    Train train = new Train();
    Hotel hotel = new Hotel();
    double total_sum = 0;
    long stayDays = 0;

    // Generate a 6-digit random number
    Random random = new Random();
    int randomNumber = random.nextInt(900000) + 100000; // Random number between 100000 and 999999

    // Get the current date and time
    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd"); // Format: YYYYMMDDHHMMSS
    String dateString = sdf.format(new Date()); // Current date-time as a string

    // Combine random number and date string
    String bookingId = randomNumber + dateString;

    if ("flight".equals(type)) {
        int flightId = Integer.parseInt(request.getParameter("flightId"));
        FlightDao dao = new FlightDao(ConnectionProvider.getConnection());
        flight = dao.getFlightDetailById(flightId);

        float children = Float.parseFloat(noOfChildren);
        float adults = Float.parseFloat(noOfAdult);
        float ticketPrice = flight.getTicketPrice();

        total_sum = (children * ticketPrice) + (adults * ticketPrice);

    } else if ("train".equals(type)) {
        int trainId = Integer.parseInt(request.getParameter("trainId"));
        TrainDao dao = new TrainDao(ConnectionProvider.getConnection());
        train = dao.getTrainDetailById(trainId);

        float children = Float.parseFloat(noOfChildren);
        float adults = Float.parseFloat(noOfAdult);
        float ticketPrice = train.getTicketPrice();

        total_sum = ((children * ticketPrice) / 2) + (adults * ticketPrice);

    } else if ("hotel".equals(type)) {
        int hotelId = Integer.parseInt(request.getParameter("hotelId"));
        HotelDao dao = new HotelDao(ConnectionProvider.getConnection());
        hotel = dao.getHotelDetailsById(hotelId);

        int roomCount = Integer.parseInt(noOfRooms);
        float price = hotel.getPricePerNight();
        passengerName = guestName;

        LocalDate checkInDate = LocalDate.parse(checkIn);
        LocalDate checkOutDate = LocalDate.parse(checkOut);

        // Calculate the number of days between checkIn and checkOut
        stayDays = ChronoUnit.DAYS.between(checkInDate, checkOutDate);

        //Calculate total sum
        if (stayDays > 0) {
            total_sum = (roomCount * price) * stayDays;
        } else {
            stayDays = 1;
            total_sum = price;
        }
    }

    Date currentDate = new Date();
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Confirm Booking</title>
        <link rel="stylesheet" type="text/css" href="css/style.css" >
        <link rel="stylesheet" type="text/css" href="css/navbar.css" >
        <link rel="stylesheet" type="text/css" href="css/footer.css" >
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <style>
            body {
                background-color: #e8eff7;
            }
            .booking-container {
                background-color: #fff;
                padding: 30px;
                border-radius: 12px;
                box-shadow: 0 6px 16px rgba(0,0,0,0.1);
                margin-top: 50px;
                margin-bottom: 50px;
            }
            .booking-header {
                font-size: 24px;
                color: #007bff;
                text-align: center;
                margin-bottom: 30px;
                font-weight: 500;
            }
            .detail-row {
                display: flex;
                justify-content: space-between;
                padding: 10px 0;
                border-bottom: 1px solid #f0f0f0;
            }
            .detail-label {
                font-weight: 500;
                color: #333;
                font-size: 16px;
            }
            .detail-value {
                color: #666;
                font-size: 16px;
            }
            .confirm-btn {
                width: 100%;
                padding: 12px;
                font-size: 18px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 8px;
                margin-top: 20px;
                cursor: pointer;
            }
            .confirm-btn:hover {
                background-color: #0056b3;
            }
            .footer {
                background-color: #007bff;
                color: white;
                padding: 12px;
                text-align: center;
            }
        </style>
    </head>
    <body>

        <!--include navbar-->
        <jsp:include page="components/navbar.jsp" />

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="booking-container">
                        <h2 class="booking-header">Confirm Booking</h2>
                        <form action="checkout.jsp" method="POST">
                            <div class="detail-row">
                                <div class="detail-label">Booking ID</div>
                                <div class="detail-value"><%= bookingId%></div>
                                <input type="text" class="form-control" name="bookingId" value="<%= bookingId%>" required style="display:none">
                            </div>
                            <div class="detail-row">
                                <div class="detail-label">Customer ID</div>
                                <div class="detail-value"><%= user.getId()%></div>
                                <input type="text" class="form-control" name="customerId" value="<%= user.getId()%>" required style="display:none">
                            </div>
                            <!-- Additional details -->
                            <div class="detail-row">
                                <% if ("flight".equals(type)) {%>
                                <div class="detail-label">Airline Name</div>
                                <div class="detail-value"><%= flight.getAirlineName()%></div>
                                <input type="text" class="form-control" name="airlineName" value="<%= flight.getAirlineName()%>" required style="display:none">
                                <input type="text" class="form-control" name="flightId" value="<%= flight.getFlightId()%>" required style="display:none">
                                <% } else if ("train".equals(type)) {%>
                                <div class="detail-label">Train Name</div>
                                <div class="detail-value"><%= train.getTrainName()%></div>
                                <input type="text" class="form-control" name="trainName" value="<%= train.getTrainName()%>" required style="display:none">
                                <input type="text" class="form-control" name="trainId" value="<%= train.getTrainId()%>" required style="display:none">
                                <% } else if ("hotel".equals(type)) {%>
                                <div class="detail-label">Hotel Name</div>
                                <div class="detail-value"><%= hotel.getHotelName()%></div>
                                <input type="text" class="form-control" name="hotelName" value="<%= hotel.getHotelName()%>" required style="display:none">                            
                                <input type="text" class="form-control" name="hotelId" value="<%= hotel.getHotelId()%>" required style="display:none">                            
                                <% }%>
                            </div>
                            <% if ("hotel".equals(type)) {%>
                            <% } else {%>
                            <div class="detail-row">
                                <div class="detail-label">Source - Destination</div>
                                <% if ("flight".equals(type)) {%>
                                <div class="detail-value"><%= flight.getDepartureAirport()%> to <%= flight.getArrivalAirport()%></div>
                                <% } else if ("train".equals(type)) {%>
                                <div class="detail-value"><%= train.getDepartureStation()%> to <%= train.getArrivalStation()%></div>
                                <% }%>
                            </div>
                            <% }%>

                            <div class="detail-row">
                                <% if ("hotel".equals(type)) {%>
                                <div class="detail-label">Check-In - Check-Out Time</div>
                                <% } else {%>
                                <div class="detail-label">Departure - Arrival Time</div>
                                <% }%>
                                <% if ("flight".equals(type)) {%>
                                <div class="detail-value"><%= flight.getDepartureTime()%> - <%= flight.getArrivalTime()%></div>
                                <input type="text" class="form-control" name="departureDate" value="<%= flight.getDepartureTime()%>" required style="display:none">
                                <input type="text" class="form-control" name="arrivalDate" value="<%= flight.getArrivalTime()%>" required style="display:none">
                                <% } else if ("train".equals(type)) {%>
                                <div class="detail-value"><%= train.getDepartureTime()%> - <%= train.getArrivalTime()%></div>
                                <input type="text" class="form-control" name="departureDate" value="<%= train.getDepartureTime()%>" required style="display:none">
                                <input type="text" class="form-control" name="arrivalDate" value="<%= train.getArrivalTime()%>" required style="display:none">
                                <% } else if ("hotel".equals(type)) {%>
                                <div class="detail-value"><%= checkIn%> - <%= checkOut%></div>
                                <input type="text" class="form-control" name="checkIn" value="<%= checkIn%>" required style="display:none">
                                <input type="text" class="form-control" name="checkOut" value="<%= checkOut%>" required style="display:none">
                                <% }%>
                            </div>
                            <% if ("hotel".equals(type)) {%>
                            <div class="detail-row">
                                <div class="detail-label">No. Of Rooms</div>
                                <div class="detail-value"><%= noOfRooms%></div>
                                <input type="text" class="form-control" name="noOfRooms" value="<%= noOfRooms%>" required style="display:none">
                            </div>
                            <% } else {%>
                            <div class="detail-row">
                                <div class="detail-label">Date</div>
                                <div class="detail-value"><%= currentDate%></div>
                                <input type="text" class="form-control" name="currentDate" value="<%= currentDate%>" required style="display:none">
                            </div>
                            <% }%>

                            <div class="detail-row">
                                <% if ("hotel".equals(type)) {%>
                                <div class="detail-label">No of Days</div>
                                <div class="detail-value"><%= stayDays%></div>
                                <input type="text" class="form-control" name="noOfDays" value="<%= stayDays%>" required style="display:none">
                                <% } else {%>
                                <div class="detail-label">No of Adults - Children</div>
                                <div class="detail-value"><%= noOfAdult%> - <%= noOfChildren%></div>
                                <input type="text" class="form-control" name="noOfAdult" value="<%= noOfAdult%>" required style="display:none">
                                <input type="text" class="form-control" name="noOfChildren" value="<%= noOfChildren%>" required style="display:none">
                                <% }%>
                            </div>
                            <div class="detail-row">
                                <% if ("flight".equals(type)) {%>
                                <div class="detail-label">Class</div>
                                <div class="detail-value"><%= flight.getClassType()%></div>
                                <% } else if ("train".equals(type)) {%>
                                <div class="detail-label">Seat Type</div>
                                <div class="detail-value"><%= train.getSeatType()%></div>
                                <% } else if ("hotel".equals(type)) {%>
                                <div class="detail-label">Room Type</div>
                                <div class="detail-value"><%= hotel.getRoomType()%></div>
                                <% }%>
                            </div>
                            <div class="detail-row">
                                <div class="detail-label">Name of the Primary Traveller</div>
                                <div class="detail-value"><%= passengerName%></div>
                                <input type="text" class="form-control" name="travellerName" value="<%= passengerName%>" required style="display:none">
                            </div>
                            <% if ("hotel".equals(type)) {%>
                            <% } else {%>
                            <div class="detail-row">
                                <div class="detail-label">Age of the Primary Traveller</div>
                                <div class="detail-value"><%= age%></div>
                                <input type="text" class="form-control" name="ageOfTraveller" value="<%= age%>" required style="display:none">
                            </div>
                            <% }%>
                            <div class="detail-row">
                                <div class="detail-label">Phone No of the Primary Traveller</div>
                                <div class="detail-value"><%= phoneNumber%></div>
                                <input type="text" class="form-control" name="contactOfTraveller" value="<%= phoneNumber%>" required style="display:none">
                            </div>
                            <div class="detail-row">
                                <div class="detail-label">Address of the Primary Traveller</div>
                                <div class="detail-value"><%= address%></div>
                                <input type="text" class="form-control" name="address" value="<%= address%>" required style="display:none">
                            </div>
                            <div class="detail-row">
                                <div class="detail-label">Total Amount</div>
                                <div class="detail-value"><%= total_sum%></div>
                                <input type="text" class="form-control" name="totalSum" value="<%= total_sum%>" required style="display:none">
                            </div>

                            <button class="confirm-btn">Confirm Booking</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--include footer-->
        <jsp:include page="components/footer.jsp" />

        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="script/script.js"></script>
    </body>
</html>

