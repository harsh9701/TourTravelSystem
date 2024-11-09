<%-- 
    Document   : manage_flights
    Created on : Sep 20, 2024, 2:29:55 PM
    Author     : HARSH
--%>

<%@page import="java.util.List" %>
<%@page import="com.project.entities.Flight" %>
<%@page import="com.project.entities.User" %>
<%@page import="com.project.dao.FlightDao" %>
<%@page import="com.project.helper.ConnectionProvider" %>

<%
    User user = (User) session.getAttribute("currentUser");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String role = user.getUserRole();

    if (!"admin".equals(role)) {
        response.sendRedirect("error.jsp");
        return;
    }
%>

<%
    int pageSize = 5; // Number of flights per page
    int pageNumber = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

    FlightDao dao = new FlightDao(ConnectionProvider.getConnection());

    List<Flight> flights = dao.getAllFlightsList(pageNumber, pageSize);

    int totalFlights = dao.getTotalFlightsCount();
    int totalPages = (int) Math.ceil((double) totalFlights / pageSize);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Flights</title>
        <link rel="stylesheet" type="text/css" href="css/footer.css" >
        <link rel="stylesheet" type="text/css" href="css/admin.css" >
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap Icons CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <style>
            body {
                background-color: #2c3e50; /* Dark background */
                color: #ecf0f1; /* Light text for better readability */
            }
            .container {
                margin-top: 20px;
            }
            .btn-primary {
                background-color: #1abc9c; /* Teal color for buttons */
                border-color: #16a085;
            }
            .btn-primary:hover {
                background-color: #16a085; /* Darker teal on hover */
            }
            .table {
                color: #ecf0f1; /* Table text color */
            }
            .table thead {
                background-color: #34495e; /* Dark grey for the header */
            }
            .table tbody tr {
                background-color: #3a4b5c; /* Greyish rows */
            }
            .table tbody tr:hover {
                background-color: #4c5d6e; /* Lighter hover effect */
            }
            .table-bordered {
                border-color: #7f8c8d; /* Light grey borders */
            }
        </style>
    </head>
    <body>

        <!--include Header-->
        <jsp:include page="components/admin_header.jsp" />

        <div class="container">

            <!--            <div class="text-center">
                            <i class="bi bi-arrow-clockwise" style="font-size: 65px;"></i>
                            <p class="mt-2">Refreshing Data...</p>
                        </div>-->

            <h2 class="text-center">Manage Flights</h2>
            <div class="d-flex justify-content-end">
                <a href="add_flight.jsp"><button class="btn btn-primary mb-3">Add New Flight</button></a>
            </div>
            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>Flight Number</th>
                            <th>Airline Name</th>
                            <th>Departure Airport</th>
                            <th>Arrival Airport</th>
                            <th>Departure Time</th>
                            <th>Arrival Time</th>
                            <th>Class Type</th>
                            <th>Ticket Price</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Example row -->
                        <%
                            for (Flight f : flights) {
                        %>
                        <tr>
                            <td><%= f.getFlightNumber()%></td>
                            <td><%= f.getAirlineName()%></td>
                            <td><%= f.getDepartureAirport()%></td>
                            <td><%= f.getArrivalAirport()%></td>
                            <td><%= f.getDepartureTime()%></td>
                            <td><%= f.getArrivalTime()%></td>
                            <td><%= f.getClassType()%></td>
                            <td><%= f.getTicketPrice()%></td>
                            <td>
                                <button class="btn btn-warning btn-sm btn-icon">
                                    <i class="bi bi-pencil-fill"></i>
                                </button>
                                <button class="btn btn-danger btn-sm btn-icon">
                                    <i class="bi bi-trash-fill"></i>
                                </button>
                            </td>
                        </tr>
                        <%
                            }
                        %>

                    </tbody>
                </table>
            </div>
            <!-- Pagination Links -->
            <nav>
                <ul class="pagination justify-content-center">
                    <li class="page-item <%= pageNumber == 1 ? "disabled" : ""%>">
                        <a class="page-link" href="manage_flights.jsp?page=<%= pageNumber - 1%>">Previous</a>
                    </li>
                    <% for (int i = 1; i <= totalPages; i++) {%>
                    <li class="page-item <%= pageNumber == i ? "active" : ""%>">
                        <a class="page-link" href="manage_flights.jsp?page=<%= i%>"><%= i%></a>
                    </li>
                    <% }%>
                    <li class="page-item <%= pageNumber == totalPages ? "disabled" : ""%>">
                        <a class="page-link" href="manage_flights.jsp?page=<%= pageNumber + 1%>">Next</a>
                    </li>
                </ul>
            </nav>
        </div>

        <!--include footer-->
        <jsp:include page="components/footer.jsp" />

        <!-- Bootstrap JS (for responsive functionalities) -->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>

