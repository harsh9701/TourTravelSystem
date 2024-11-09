<%-- 
    Document   : add_flight
    Created on : Sep 17, 2024, 12:26:07 AM
    Author     : HARSH
--%>

<%@page import="com.project.entities.User" %>
<%@page errorPage="error.jsp" %>

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

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Flight</title>
        <link rel="stylesheet" type="text/css" href="css/footer.css" >
        <link rel="stylesheet" type="text/css" href="css/admin.css" >
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <!--Sweet Alert-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <style>
            body {
                background-color: #f8f9fa;
            }
            .container {
                margin-top: 50px;
                margin-bottom: 50px;
            }
            .card {
                border: none;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            }
            .card-header {
                background-color: #343a40;
                color: #fff;
                text-align: center;
            }
            .btn-custom {
                background-color: #343a40 !important;
                color: #fff !important;
                width: 100% !important;
            }
            .btn-custom:hover {
                background-color: #495057 !important;
            }
            .form-group {
                position: relative;
            }
            .tooltip-text {
                position: absolute;
                top: -10px;
                right: 10px;
                font-size: 12px;
                color: #6c757d;
            }
        </style>
    </head>
    <body>

        <!--include Header-->
        <jsp:include page="components/admin_header.jsp" />

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">
                            <h3>Add Flight Details</h3>
                        </div>
                        <div class="card-body">
                            <!-- Flight form starts here -->
                            <form action="AddFlightServlet" method="POST" id="addFlightForm">
                                <div class="form-row">
                                    <!-- Flight Number -->
                                    <div class="form-group col-md-6 col-12">
                                        <label for="flightNumber">Flight Number</label>
                                        <input type="text" class="form-control" id="flightNumber" name="flightNumber" placeholder="Enter flight number" required>
                                        <span class="tooltip-text" data-toggle="tooltip" title="Unique flight identifier">?</span>
                                    </div>

                                    <!-- Airline Name -->
                                    <div class="form-group col-md-6 col-12">
                                        <label for="airlineName">Airline Name</label>
                                        <input type="text" class="form-control" id="airlineName" name="airlineName" placeholder="Enter airline name" required>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <!-- Departure Airport -->
                                    <div class="form-group col-md-6 col-12">
                                        <label for="departureAirport">Departure Airport</label>
                                        <input type="text" class="form-control" id="departureAirport" name="departureAirport" placeholder="Enter departure airport" required>
                                    </div>

                                    <!-- Arrival Airport -->
                                    <div class="form-group col-md-6 col-12">
                                        <label for="arrivalAirport">Arrival Airport</label>
                                        <input type="text" class="form-control" id="arrivalAirport" name="arrivalAirport" placeholder="Enter arrival airport" required>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <!-- Departure Time -->
                                    <div class="form-group col-md-6 col-12">
                                        <label for="departureTime">Departure Time</label>
                                        <input type="datetime-local" class="form-control" id="departureTime" name="departureTime" required>
                                    </div>

                                    <!-- Arrival Time -->
                                    <div class="form-group col-md-6 col-12">
                                        <label for="arrivalTime">Arrival Time</label>
                                        <input type="datetime-local" class="form-control" id="arrivalTime" name="arrivalTime" required>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <!-- Ticket Price -->
                                    <div class="form-group col-md-6 col-12">
                                        <label for="ticketPrice">Ticket Price</label>
                                        <input type="number" class="form-control" id="ticketPrice" name="ticketPrice" placeholder="Enter ticket price" required>
                                    </div>

                                    <!-- Class Type -->
                                    <div class="form-group col-md-6 col-12">
                                        <label for="classType">Class Type</label>
                                        <select class="form-control" id="classType" name="classType" required>
                                            <option value="">Select Class Type</option>
                                            <option value="Economy">Economy</option>
                                            <option value="Business">Business</option>
                                            <option value="First Class">First Class</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-center loader" style="width: 100%">
                                    <div class="spinner-border" id="loader" role="status" style="display: none">
                                        <span class="sr-only">Loading...</span>
                                    </div>
                                </div>
                                <!-- Submit Button -->
                                <button type="submit" id="submitButton" class="btn btn-custom btn-block">Add Flight</button>
                            </form>
                            <!-- Flight form ends here -->
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--include footer-->
        <jsp:include page="components/footer.jsp" />

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <!--<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>-->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <script>
            $(document).ready(function () {
                console.log("Loaded....");

                $("#addFlightForm").on("submit", function (event) {
                    event.preventDefault();
                    
                    let form = new FormData(this);

                    $("#submitButton").hide();
                    $("#loader").show();
                    
                    console.log(form);

                    //Send register to servlet
                    $.ajax({
                        url: "AddFlightServlet",
                        type: "POST",
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            $("#loader").hide();
                            $("#submitButton").show();

                            if (data.trim() === "done") {
                                swal({
                                    title: "Good job!",
                                    text: "Flight Add Successfuly",
                                    icon: "success",
                                    button: "Go to Admin Panel"
                                }).then((value) => {
                                    window.location = "admin_page.jsp";
                                });
                            } else {
                                swal(data + ": Something Went Wrong..");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $("#loader").hide();
                            $("#submitButton").show();
                            swal("Something Went Wrong... Try Again");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>
    </body>
</html>