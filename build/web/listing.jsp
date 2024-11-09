<%-- 
    Document   : listing
    Created on : Sep 21, 2024, 12:21:23 AM
    Author     : HARSH
--%>

<%@page import="java.util.List" %>
<%@page import="com.project.entities.Flight" %>
<%@page import="com.project.entities.Train" %>
<%@page import="com.project.entities.Hotel" %>
<%@page import="com.project.dao.FlightDao" %>
<%@page import="com.project.dao.TrainDao" %>
<%@page import="com.project.dao.HotelDao" %>
<%@page import="com.project.helper.ConnectionProvider" %>

<%
    String searchTerm = request.getParameter("searchTerm");
%>
<%
    int pageSize = 8; // Number of flights per page
    int pageNumber = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
    int totalPages = 0;

    List<Flight> flights = null;
    List<Train> trains = null;
    List<Hotel> hotels = null;

    if (searchTerm.equals("flights")) {

        FlightDao dao = new FlightDao(ConnectionProvider.getConnection());
        flights = dao.getAllFlightsList(pageNumber, pageSize);
        int totalFlights = dao.getTotalFlightsCount();
        totalPages = (int) Math.ceil((double) totalFlights / pageSize);

    } else if (searchTerm.equals("trains")) {

        TrainDao dao = new TrainDao(ConnectionProvider.getConnection());
        trains = dao.getAllTrainsList(pageNumber, pageSize);
        int totalTrains = dao.getTotalTrainsCount();
        totalPages = (int) Math.ceil((double) totalTrains / pageSize);

    } else if (searchTerm.equals("hotels")) {

        HotelDao dao = new HotelDao(ConnectionProvider.getConnection());
        hotels = dao.getAllHotelsList(pageNumber, pageSize);
        int totalHotels = dao.getTotalTrainsCount(); // Fixed typo: "getTotalTrainsCount" to "getTotalHotelsCount"
        totalPages = (int) Math.ceil((double) totalHotels / pageSize);

    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ExploreMe - listings</title>
        <link rel="stylesheet" type="text/css" href="css/style.css" >
        <link rel="stylesheet" type="text/css" href="css/navbar.css" >
        <link rel="stylesheet" type="text/css" href="css/footer.css" >
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <style>
            body {
                background-color: #f5f5f5;
            }
            .card {
                transition: transform 0.3s ease;
            }
            .card:hover {
                transform: translateY(-10px);
            }
            .card img {
                height: 200px;
                object-fit: cover;
            }
            .listing-title {
                font-weight: bold;
                font-size: 1.5rem;
                color: #333;
            }
            .btn-custom {
                background-color: #007bff;
                color: #fff;
                border: none;
                width: 70%;
            }
            .btn-custom:hover {
                background-color: #0056b3;
                color: white;
            }
        </style>
    </head>
    <body>

        <!--include navbar-->
        <jsp:include page="components/navbar.jsp" />

        <div class="container my-5">
            <h2 class="text-center mb-4">Available <%= searchTerm.substring(0, 1).toUpperCase() + searchTerm.substring(1).toLowerCase()%></h2>
            <div class="row">
                <!-- Listing Item 1 -->

                <% if (flights != null) { %>
                <% for (Flight f : flights) {%>
                <!-- Display flight details -->
                <div class="col-md-3 mb-2">
                    <div class="card shadow-sm">
                        <img src="assets/flights/<% if (f.getAirlineName().equals("Air India")) {%>air_india.png<% } else if (f.getAirlineName().equals("IndiGo")) {%>indigo.png<% } else if (f.getAirlineName().equals("SpiceJet")) {%>spicejet.png<% } else if (f.getAirlineName().equals("GoAir")) {%>goair.jpeg<% } else if (f.getAirlineName().equals("Vistara")) {%>vistara.png<% } else { %>flightDefault.jpg<%}%>" class="card-img-top border rounded" alt="Flight Image">
                        <div class="card-body text-center">
                            <h5 class="listing-title"><%= f.getAirlineName()%></h5>
                            <div class="card-text d-flex justify-content-around"><span style="color: green " >Departure: <%= f.getDepartureAirport()%></span> <span style="color: red">Arrival: <%= f.getArrivalAirport()%></span></div>
                            <div class="card-text d-flex justify-content-around mb-2"><span>Class: <%= f.getClassType()%></span> <span>Price: <%= f.getTicketPrice()%></span></div>
                            <a href="booking.jsp?type=flight&typeId=<%= f.getFlightId()%>" class="btn btn-custom btn-sm">Book Now</a>
                        </div>
                    </div>
                </div>
                <% } %>
                <% } else if (trains != null) { %>
                <% for (Train t : trains) {%>
                <!-- Display train details -->
                <div class="col-md-3">
                    <div class="card shadow-sm">
                        <img src="assets/trains/<%= t.getTrainImage()%>" class="card-img-top" alt="Flight Image">
                        <div class="card-body text-center">
                            <h5 class="listing-title"><%= t.getTrainName()%></h5>
                            <div class="card-text d-flex justify-content-between"><span style="color: green " >From: <%= t.getDepartureStation()%></span> <span style="color: red">To: <%= t.getArrivalStation()%></span></div>
                            <div class="card-text d-flex justify-content-between mb-2"><span>Class: <%= t.getSeatType()%></span> <span>Price: <%= t.getTicketPrice()%></span></div>
                            <a href="booking.jsp?type=train&typeId=<%= t.getTrainId()%>" class="btn btn-custom btn-sm">Book Now</a>
                        </div>
                    </div>
                </div>
                <% } %>
                <!-- Display hotel details -->
                <% } else if (hotels != null) { %>
                <% for (Hotel h : hotels) {%>
                <div class="col-md-3">
                    <div class="card shadow-sm">
                        <img src="assets/hotels/<%= h.getHotelImage()%>" class="card-img-top" alt="Flight Image">
                        <div class="card-body text-center">
                            <h5 class="listing-title m-0"><%= h.getHotelName()%></h5>
                            <div style="color: teal; font-size: 0.9rem;">(<%= h.getLocation()%>)</div>
                            <div class="card-text d-flex justify-content-between mb-2"><span style="color: green" >Room Type: <%= h.getRoomType()%></span> <span style="color: red">Price: <%= h.getPricePerNight()%>/day</span></div>
                            <a href="booking.jsp?type=hotel&typeId=<%= h.getHotelId()%>" class="btn btn-custom btn-sm">Book Now</a>
                        </div>
                    </div>
                </div>
                <% } %>
                <% } else {%>
                <div class="alert alert-primary text-center fs-4" role="alert">
                    There is no available <%= searchTerm%>
                </div>
                <% }%>
            </div>
        </div>
        <nav>
            <ul class="pagination justify-content-center">
                <li class="page-item <%= pageNumber == 1 ? "disabled" : ""%>">
                    <a class="page-link" href="listing.jsp?searchTerm=<%= searchTerm%>&page=<%= pageNumber - 1%>">Previous</a>
                </li>
                <% for (int i = 1; i <= totalPages; i++) {%>
                <li class="page-item <%= pageNumber == i ? "active" : ""%>">
                    <a class="page-link" href="listing.jsp?searchTerm=<%= searchTerm%>&page=<%= i%>"><%= i%></a>
                </li>
                <% }%>
                <li class="page-item <%= pageNumber == totalPages ? "disabled" : ""%>">
                    <a class="page-link" href="listing.jsp?searchTerm=<%= searchTerm%>&page=<%= pageNumber + 1%>">Next</a>
                </li>
            </ul>
        </nav>

        <!--include footer-->
        <jsp:include page="components/footer.jsp" />

        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="script/script.js"></script>
    </body>
</html>

