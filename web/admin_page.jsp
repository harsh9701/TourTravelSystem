<%-- 
    Document   : admin_page
    Created on : Sep 16, 2024, 3:33:19 PM
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
        <title>Admin Dashboard</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/admin.css">
        <link rel="stylesheet" type="text/css" href="css/footer.css" >
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js">
        </script>
    </head>
    <body>
        <div>

            <!--include Header-->
            <jsp:include page="components/admin_header.jsp" />

            <main class="container-fluid">
                <div class="d-flex justify-content-around">
                    <canvas id="myChart" style="width:100%;max-width:500px;max-height:250px"></canvas>
                    <canvas id="barChart" style="width:100%;max-width:500px;max-height:250px"></canvas>
                </div>
                <div class="row">
                    <div class="col-md-3 mb-4">
                        <div class="card text-center bg-dark text-light">
                            <div class="card-body">
                                <h5 class="card-title">Manage Flights</h5>
                                <a href="add_flight.jsp"><button class="btn btn-primary">Add Flight</button></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 mb-4">
                        <div class="card text-center bg-dark text-light">
                            <div class="card-body">
                                <h5 class="card-title">Manage Hotels</h5>
                                <a href="add_hotel.jsp"><button class="btn btn-primary">Add Hotel</button></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 mb-4">
                        <div class="card text-center bg-dark text-light">
                            <div class="card-body">
                                <h5 class="card-title">Manage Trains</h5>
                                <a href="add_train.jsp"><button class="btn btn-primary">Add Train</button></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 mb-4">
                        <div class="card text-center bg-dark text-light">
                            <div class="card-body">
                                <h5 class="card-title">Manage Package</h5>
                                <a href="add_package.jsp"><button class="btn btn-primary">Add Package</button></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 mb-4">
                        <div class="card text-center bg-dark text-light">
                            <div class="card-body">
                                <h5 class="card-title">Manage Customer</h5>
                                <a href="manage_customer.jsp"><button class="btn btn-primary">Manage</button></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 mb-4">
                        <div class="card text-center bg-dark text-light">
                            <div class="card-body">
                                <h5 class="card-title">Manage Payment</h5>
                                <a href="manage_payment.jsp"><button class="btn btn-primary">Manage</button></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 mb-4">
                        <div class="card text-center bg-dark text-light">
                            <div class="card-body">
                                <h5 class="card-title">Manage Orders</h5>
                                <a href="manage_orders.jsp"><button class="btn btn-primary">Orders</button></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 mb-4">
                        <div class="card text-center bg-dark text-light">
                            <div class="card-body">
                                <h5 class="card-title">Manage Listing</h5>
                                <a href="manage_listing.jsp"><button class="btn btn-primary">All Listing</button></a>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>

        <!--include footer-->
        <jsp:include page="components/footer.jsp" />


        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <script>
                const xValues = ["Flights", "Trains", "Hotels", "Leisure", "Package"];
                const yValues = [20000, 14500, 10190, 8400, 13900];

                new Chart("myChart", {
                    type: "line",
                    data: {
                        labels: xValues,
                        datasets: [{
                                fill: false,
                                lineTension: 0,
                                backgroundColor: "rgba(0,0,255,1.0)",
                                borderColor: "rgba(0,0,255,0.1)",
                                data: yValues
                            }]
                    },
                    options: {
                        legend: {display: false},
                        scales: {
                            yAxes: [{ticks: {min: 6, max: 25000}}]
                        },
                        title: {
                            display: true,
                            text: "Sales"
                        }
                    }
                });

                var xvalues = ["Flights", "Trains", "Hotels", "Leisure", "Packages"];
                var yvalues = [44, 49, 44, 24, 35];
                var barColors = ["red", "green", "blue", "orange", "brown"];

                new Chart("barChart", {
                    type: "bar",
                    data: {
                        labels: xvalues,
                        datasets: [{
                                backgroundColor: barColors,
                                data: yvalues
                            }]
                    },
                    options: {
                        legend: {display: false},
                        title: {
                            display: true,
                            text: "Booking"
                        }
                    }
                });
        </script>
    </body>
</html>

