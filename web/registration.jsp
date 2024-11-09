<%-- 
    Document   : registration
    Created on : Sep 7, 2024, 12:50:57 AM
    Author     : HARSH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Registration</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome (For Icons) -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <!--Sweet Alert-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <style>
            body {
                background-color: #1d1f21; /* Dark background */
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                color: #f8f9fa;
            }

            .registration-form {
                background: #2b2e33; /* Darker form background */
                padding: 2rem;
                border-radius: 8px;
                box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.6);
                width: 100%;
                max-width: 400px;
            }

            .form-header {
                text-align: center;
                margin-bottom: 1.5rem;
            }

            .form-header i {
                font-size: 4rem;
                color: #17a2b8; /* Light teal for icon */
            }

            .form-header h2 {
                margin-top: 10px;
                font-weight: bold;
                color: #17a2b8;
            }

            .form-control {
                background-color: #3c3f43; /* Dark input background */
                border: none;
                color: white;
            }

            .form-control:focus {
                background-color: #4e5155;
                border-color: #17a2b8;
                box-shadow: none;
            }

            .btn-primary {
                background-color: #17a2b8;
                border: none;
            }

            .btn-primary:hover {
                background-color: #138496;
            }

            .form-footer {
                text-align: center;
                margin-top: 1rem;
            }

            .form-footer a {
                color: #17a2b8;
                text-decoration: none;
            }

            .form-footer a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div class="registration-form">
            <div class="form-header">
                <i class="fas fa-user-plus"></i>
                <h2>User Registration</h2>
            </div>
            <form action="RegisterServlet" method="POST" id="regForm">
                <div class="mb-3">
                    <label for="fullname" class="form-label">Full Name</label>
                    <input type="text" name="fullName" class="form-control" id="fullname" placeholder="Enter Full Name" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" name="email" class="form-control" id="email" placeholder="Enter email" required>
                </div>
                <div class="mb-3">
                    <label for="contactno" class="form-label">Contact Number</label>
                    <input type="text" name="contactNo" class="form-control" id="contactno" placeholder="Enter contact number" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" name="password" class="form-control" id="password" placeholder="Enter password" required>
                </div>
                <div class="container text-center" id="loader" style="display: none">
                    <i class="fa fa-refresh fa-3x"></i>
                    <p>Please Wait....</p>
                </div>
                <div class="d-grid" id="submitButton">
                    <button type="submit" class="btn btn-primary">Register</button>
                </div>
            </form>
            <div class="form-footer">
                <p>Already have an account? <a href="login.jsp">Login here</a></p>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
        <!--JQUERY CDN-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

        <script>
            $(document).ready(function () {
                console.log("Loaded");

                $("#regForm").on("submit", function (event) {
                    event.preventDefault();
                    
                    let form = new FormData(this);

                    $("#submitButton").hide();
                    $("#loader").show();
                    
                    console.log(form);

                    //Send register servlet
                    $.ajax({
                        url: "RegisterServlet",
                        type: "POST",
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            $("#loader").hide();
                            $("#submitButton").show();

                            if (data.trim() === "done") {
                                swal({
                                    title: "Good job!",
                                    text: "You are registered with us",
                                    icon: "success",
                                    button: "Go to Login Page"
                                }).then((value) => {
                                    window.location = "login.jsp";
                                });
                            } else {
                                swal(data + ": Please make sure username and email can't be matched with our database");
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
