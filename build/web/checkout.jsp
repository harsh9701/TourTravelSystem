<%-- 
    Document   : checkout
    Created on : Sep 24, 2024, 2:35:33 AM
    Author     : HARSH
--%>

<%@page import="com.project.entities.User" %>

<%
    User user = (User) session.getAttribute("currentUser");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<%
    String bookingId = request.getParameter("bookingId");
    String customerId = request.getParameter("customerId");
    String flightId = request.getParameter("flightId");
    String trainId = request.getParameter("trainId");
    String hotelId = request.getParameter("hotelId");
    String airlineName = request.getParameter("airlineName"); // For flight
    String trainName = request.getParameter("trainName"); // For train
    String hotelName = request.getParameter("hotelName"); // For hotel
    String departureDate = request.getParameter("departureDate");
    String arrivalDate = request.getParameter("arrivalDate");
    String checkIn = request.getParameter("checkIn"); // For hotel
    String checkOut = request.getParameter("checkOut"); // For hotel
    String noOfRooms = request.getParameter("noOfRooms"); // For hotel
    String currentDate = request.getParameter("currentDate");
    String noOfDays = request.getParameter("noOfDays"); // For hotel
    String noOfAdult = request.getParameter("noOfAdult");
    String noOfChildren = request.getParameter("noOfChildren");
    String travellerName = request.getParameter("travellerName");
    String ageOfTraveller = request.getParameter("ageOfTraveller");
    String contactOfTraveller = request.getParameter("contactOfTraveller");
    String address = request.getParameter("address");
    String totalSum = request.getParameter("totalSum");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Checkout Page</title>
        <link rel="stylesheet" type="text/css" href="css/navbar.css" >
        <link rel="stylesheet" type="text/css" href="css/footer.css" >
        <link rel="stylesheet" type="text/css" href="css/style.css" >
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <!--Sweet Alert-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <style>
            body {
                background-color: #f8f9fa;
            }
            .checkout-container {
                margin-top: 50px;
                background: white;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .icon {
                font-size: 1.5em;
                margin-right: 10px;
            }
        </style>
    </head>
    <body>

        <!--include navbar-->
        <jsp:include page="components/navbar.jsp" />

        <div class="container checkout-container mb-3">
            <h2 class="text-center">Checkout</h2>
            <form action="CheckoutServlet" method="POST" id="checkoutForm">

                <input type="hidden" name="bookingId" value="<%= bookingId%>">
                <input type="hidden" name="customerId" value="<%= customerId%>">
                <input type="hidden" name="flightId" value="<%= flightId%>">
                <input type="hidden" name="trainId" value="<%= trainId%>">
                <input type="hidden" name="hotelId" value="<%= hotelId%>">
                <input type="hidden" name="airlineName" value="<%= airlineName%>">
                <input type="hidden" name="trainName" value="<%= trainName%>">
                <input type="hidden" name="hotelName" value="<%= hotelName%>">
                <input type="hidden" name="departureDate" value="<%= departureDate%>">
                <input type="hidden" name="arrivalDate" value="<%= arrivalDate%>">
                <input type="hidden" name="checkIn" value="<%= checkIn%>">
                <input type="hidden" name="checkOut" value="<%= checkOut%>">
                <input type="hidden" name="noOfRooms" value="<%= noOfRooms%>">
                <input type="hidden" name="currentDate" value="<%= currentDate%>">
                <input type="hidden" name="noOfDays" value="<%= noOfDays%>">
                <input type="hidden" name="noOfAdult" value="<%= noOfAdult%>">
                <input type="hidden" name="noOfChildren" value="<%= noOfChildren%>">
                <input type="hidden" name="travellerName" value="<%= travellerName%>">
                <input type="hidden" name="ageOfTraveller" value="<%= ageOfTraveller%>">
                <input type="hidden" name="contactOfTraveller" value="<%= contactOfTraveller%>">
                <input type="hidden" name="address" value="<%= address%>">
                <input type="hidden" name="totalSum" value="<%= totalSum%>">

                <h4><i class="fas fa-user icon"></i> Customer Information</h4>
                <div class="form-row">
                    <div class="form-group col-md-6 col-12">
                        <label for="name">Full Name</label>
                        <input type="text" class="form-control" id="name" placeholder="Enter your name" value="<%= travellerName%>" required>
                    </div>
                    <div class="form-group col-md-3 col-12">
                        <label for="email">Email Address</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
                    </div>
                    <div class="form-group col-md-3 col-12">
                        <label for="phone">Phone Number</label>
                        <input type="tel" class="form-control" id="phone" name="phone" placeholder="Enter your phone number" value="<%= contactOfTraveller%>" required>
                    </div>
                </div>
                <h4><i class="fas fa-credit-card icon"></i> Payment Details</h4>
                <div class="form-row">
                    <div class="form-group col-md-3 col-12">
                        <label for="cardHolder">Card HolderName</label>
                        <input type="text" class="form-control" id="cardHolder" name="cardHolder" placeholder="Card Holder" required>
                    </div>
                    <div class="form-group col-md-3 col-12">
                        <label for="cardNumber">Card Number</label>
                        <input type="tel" class="form-control" id="cardNumber" name="cardNumber" maxlength="19" oninput="formatCardNumber(this)" placeholder="Card Number" required>
                    </div>
                    <div class="form-group col-md-3 col-12">
                        <label for="expiryDate">Expiry Date</label>
                        <input type="text" class="form-control" id="expiryDate" placeholder="MM/YY" name="expiryDate" pattern="^(0[1-9]|1[0-2])\/\d{2}$" title="Format: MM/YY" required>
                    </div>
                    <div class="form-group col-md-3 col-12">
                        <label for="cvv">CVV</label>
                        <input type="tel" class="form-control" name="cvv" id="cvv" pattern="[0-9]{3}" placeholder="CVV" required>
                    </div>
                </div>

                <h4><i class="fas fa-shopping-cart icon"></i> Order Summary</h4>
                <div class="mb-3">
                    <p class="d-flex justify-content-between mt-3 mb-3 p-3"><span><strong>Amount to be paid: </strong></span><span><strong><%= totalSum%></strong></span></p>
                </div>
                <div class="container text-center" id="loader" style="display: none">
                    <i class="fa fa-refresh fa-3x"></i>
                    <p>Please Wait....</p>
                </div>
                <button type="submit" id="submitButton" class="btn btn-primary btn-block">Complete Purchase</button>
            </form>
        </div>

        <!--include footer-->
        <jsp:include page="components/footer.jsp" />

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script>
            function formatCardNumber(input) {
                let value = input.value.replace(/\D/g, ''); // Remove non-digit characters
                let formattedValue = '';
                for (let i = 0; i < value.length; i += 4) {
                    formattedValue += value.substring(i, i + 4) + ' '; // Add a space after every four digits
                }
                input.value = formattedValue.trim(); // Set the formatted value
            }
        </script>
        <script>
            $(document).ready(function () {

                $("#checkoutForm").on("submit", function (event) {
                    event.preventDefault();

                    let form = new FormData(this);

                    $("#submitButton").hide();
                    $("#loader").show();

                    //Send checkout servlet
                    $.ajax({
                        url: "CheckoutServlet",
                        type: "POST",
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            $("#loader").hide();
                            $("#submitButton").show();

                            if (data.trim() === "done") {
                                swal({
                                    title: "Good job!",
                                    text: "Booking Successful",
                                    icon: "success",
                                    button: "Download Receipt"
                                }).then(() => {
                                    window.location = "receipt.jsp";
                                });
                            } else {
                                swal(data + ": Something Went Wrong");
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

