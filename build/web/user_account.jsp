<%-- 
    Document   : user_account
    Created on : Sep 25, 2024, 5:12:39 PM
    Author     : HARSH
--%>

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
        <title>User Account Page</title>
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
            .section-title {
                margin-bottom: 15px;
            }
            .more-booking {
                color: #16a085;
                text-decoration: none;
            }
        </style>
    </head>
    <body>

        <!--include navbar-->
        <jsp:include page="components/navbar.jsp" />

        <div class="container account-container">
            <h2 class="text-center mb-4">Welcome <%= user.getFullName()%></h2>

            <!-- Profile Details Card -->
            <div class="card">
                <div class="card-body">
                    <h5 class="section-title">Profile Details</h5>
                    <ul class="list-group">
                        <li class="list-group-item">Email: <%= user.getEmail()%></li>
                        <li class="list-group-item">Contact: <%= user.getContactNo()%></li>
                        <li class="list-group-item">Account Created: <%= user.getRegDate()%></li>
                    </ul>
                </div>
            </div>

            <!-- Bookings Card -->
            <div class="card">
                <div class="card-body">
                    <h5 class="section-title">My Bookings</h5>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Booking ID</th>
                                <th>Service Type</th>
                                <th>Date</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% int count = 0; %>
                            <% if (flightBooking != null) { %>
                            <% for (FlightBooking f : flightBooking) {%>
                            <% count++; %>
                            <% if (count < 5) {%>
                            <tr>
                                <td><%= f.getBookingId()%></td>
                                <td>Flight</td>
                                <td><%= f.getDateOfBooking()%></td>
                                <td><%= f.getStatus()%></td>
                            </tr>
                            <% } %>
                            <% } %>
                            <% }%>
                            <% if (trainBooking != null) { %>
                            <% for (TrainBooking t : trainBooking) {%>
                            <% count++; %>
                            <% if (count < 5) {%>
                            <tr>
                                <td><%= t.getBookingId()%></td>
                                <td>Train</td>
                                <td><%= t.getDateOfBooking()%></td>
                                <td><%= t.getStatus()%></td>
                            </tr>
                            <% } %>
                            <% } %>
                            <% }%>
                            <% if (hotelBooking != null) { %>
                            <% for (HotelBooking h : hotelBooking) {%>
                            <% count++; %>
                            <% if (count < 5) {%>
                            <tr>
                                <td><%= h.getBookingId()%></td>
                                <td>Hotel</td>
                                <td><%= h.getDateOfBooking()%></td>
                                <td><%= h.getStatus()%></td>
                            </tr>
                            <% } %>
                            <% } %>
                            <% }%>
                        </tbody>
                    </table>
                    <% if (count >= 5) { %>
                    <div class="text-center fs-5">
                        <span><a href="booking_list.jsp" class="more-booking">See more bookings</a></span>
                    </div>
                    <% }%>
                </div>
            </div>

            <!-- Change Password Card -->
            <div class="card">
                <div class="card-body">
                    <h5 class="section-title">Update Password</h5>
                    <form action="UpdatePasswordServlet" method="POST" id="updateForm">
                        <input type="hidden" name="email" value="<%= user.getEmail()%>">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="currentPassword">Current Password</label>
                                <input type="password" class="form-control" id="currentPassword" name="currentPassword" placeholder="Enter current password" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="newPassword">Change Password</label>
                                <input type="password" class="form-control" id="newPassword" name="newPassword" placeholder="Enter new password" required>
                            </div>
                        </div>
                        <div class="container text-center" id="loader" style="display: none">
                            <i class="fa fa-refresh fa-2x"></i>
                            <p>Please Wait. Updating...</p>
                        </div>
                        <button type="submit" id="submitButton" class="btn btn-primary">Save Changes</button>
                    </form>
                </div>
            </div>
        </div>

        <!--include footer-->
        <jsp:include page="components/footer.jsp" />

        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <script>
            $(document).ready(function () {

                $("#updateForm").on("submit", function (event) {
                    event.preventDefault();

                    let form = new FormData(this);

                    $("#submitButton").hide();
                    $("#loader").show();

                    console.log(form);

                    //Send register servlet
                    $.ajax({
                        url: "UpdatePasswordServlet",
                        type: "POST",
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            $("#loader").hide();
                            $("#submitButton").show();

                            if (data.trim() === "done") {
                                swal({
                                    title: "Done..",
                                    text: "Password Updated Successfully",
                                    icon: "success",
                                    button: "Close"
                                }).then((value) => {
                                    window.location = "user_account.jsp";
                                });
                            } else {
                                swal({
                                    title: "Error!",
                                    text: "Oops! That's not your current password. Try again.",
                                    icon: "error",
                                    button: "Close"
                                }).then((value) => {
                                    window.location = "user_account.jsp"; // This can be omitted if you just want to close the alert
                                });
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

