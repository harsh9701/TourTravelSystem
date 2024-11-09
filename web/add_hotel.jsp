<%-- 
    Document   : add_hotel
    Created on : Sep 17, 2024, 12:50:16 AM
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

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Hotel</title>
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
                            <h3>Add Hotel Details</h3>
                        </div>
                        <div class="card-body">
                            <!-- Hotel form starts here -->
                            <form action="AddHotelServlet" method="POST" id="hotelForm" enctype="multipart/form-data">
                                <div class="form-row">
                                    <!-- Hotel Name -->
                                    <div class="form-group col-md-6 col-12">
                                        <label for="hotelName">Hotel Name</label>
                                        <input type="text" class="form-control" id="hotelName" name="hotelName" placeholder="Enter hotel name" required>
                                    </div>

                                    <!-- Location -->
                                    <div class="form-group col-md-6 col-12">
                                        <label for="location">Location</label>
                                        <input type="text" class="form-control" id="location" name="location" placeholder="Enter location" required>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <!-- Room Type -->
                                    <div class="form-group col-md-6 col-12">
                                        <label for="roomType">Room Type</label>
                                        <select class="form-control" id="roomType" name="roomType" required>
                                            <option value="">Select Room Type</option>
                                            <option value="Single">Single</option>
                                            <option value="Double">Double</option>
                                            <option value="Suite">Suite</option>
                                        </select>
                                    </div>

                                    <!-- Price per Night -->
                                    <div class="form-group col-md-6 col-12">
                                        <label for="pricePerNight">Price per Night</label>
                                        <input type="number" class="form-control" id="pricePerNight" name="pricePerNight" placeholder="Enter price per night" required>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <!-- Available Rooms -->
                                    <div class="form-group col-md-6 col-12">
                                        <label for="availableRooms">Available Rooms</label>
                                        <input type="number" class="form-control" id="availableRooms" name="availableRooms" placeholder="Enter available rooms" required>
                                    </div>

                                    <!-- Rating -->
                                    <div class="form-group col-md-6 col-12">
                                        <label for="rating">Rating</label>
                                        <input type="number" step="0.1" class="form-control" id="rating" name="rating" placeholder="Enter hotel rating" required>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <!-- Upload Photo -->
                                    <div class="form-group col-md-12 col-12">
                                        <label for="hotelImage">Upload Image</label>
                                        <input type="file" class="form-control" id="hotelImage" name="hotelImage" placeholder="Upload Photo" required>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-center loader" style="width: 100%">
                                    <div class="spinner-border" id="loader" role="status" style="display: none">
                                        <span class="sr-only">Loading...</span>
                                    </div>
                                </div>
                                <!-- Submit Button -->
                                <button type="submit" id="submitButton" class="btn btn-custom btn-block">Add Hotel</button>
                            </form>
                            <!-- Hotel form ends here -->
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--include footer-->
        <jsp:include page="components/footer.jsp" />

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <script>
            $(document).ready(function () {
                console.log("Hotel Form Loaded....");

                $("#hotelForm").on("submit", function (event) {
                    event.preventDefault();

                    let form = new FormData(this);

                    $("#submitButton").hide();
                    $("#loader").show();

                    //Send register to servlet
                    $.ajax({
                        url: "AddHotelServlet",
                        type: "POST",
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            $("#loader").hide();
                            $("#submitButton").show();

                            if (data.trim() === "done") {
                                swal({
                                    title: "Good job!",
                                    text: "Hotel Add Successfuly",
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

