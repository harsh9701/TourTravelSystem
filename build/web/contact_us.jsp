<%-- 
    Document   : contact_us
    Created on : Sep 16, 2024, 1:16:13 PM
    Author     : HARSH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Contact Us</title>
        <link rel="stylesheet" type="text/css" href="css/style.css" >
        <link rel="stylesheet" type="text/css" href="css/navbar.css" >
        <link rel="stylesheet" type="text/css" href="css/footer.css" >
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- Bootstrap CSS -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .contact-form {
                background-color: #fff;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
            }
            .contact-form h2 {
                margin-bottom: 20px;
            }
            .btn-custom {
                background-color: #007bff;
                color: #fff;
            }
            .btn-custom:hover {
                background-color: #0056b3;
            }
            .map-iframe {
                width: 100%;
                height: 300px;
                border: none;
                margin-bottom: 20px;
            }
        </style>
    </head>
    <body>

        <div class="sticky-top" style="background-color: #FAF9F6">
            <!--include navbar-->
            <jsp:include page="components/navbar.jsp" />
        </div>

        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-lg-6 col-md-8">
                    <div class="contact-form">
                        <h2>Contact Us</h2>
                        <p>If you have any questions, feel free to drop us a message below. We will get back to you as soon as possible.</p>

                        <!-- Contact Form -->
                        <form id="contactForm" action="ContactServlet" method="POST">
                            <div class="form-group">
                                <label for="name">Full Name</label>
                                <input type="text" class="form-control" id="name" name="name" placeholder="Your Full Name" required>
                            </div>
                            <div class="form-group">
                                <label for="email">Email Address</label>
                                <input type="email" class="form-control" id="email" name="email" placeholder="Your Email" required>
                            </div>
                            <div class="form-group">
                                <label for="message">Your Message</label>
                                <textarea class="form-control" id="message" name="message" rows="5" placeholder="Write your message here" required></textarea>
                            </div>
                            <button type="submit" class="btn btn-custom btn-block">Send Message</button>
                        </form>

                        <!-- Success/Failure Message -->
                        <div id="formMessage" class="mt-3"></div>

                        <!-- Google Map Embed -->
                        <iframe class="map-iframe" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3151.8354345093746!2d144.95373631550057!3d-37.81720974201488!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6ad642af0f11fd81%3A0xfb338b45b65f5735!2sFlinders+St+Station%2C+Melbourne+VIC%2C+Australia!5e0!3m2!1sen!2sin!4v1617069843175!5m2!1sen!2sin"></iframe>
                    </div>
                </div>
            </div>
        </div>

        <!--include footer-->
        <jsp:include page="components/footer.jsp" />


        <!-- Bootstrap and jQuery JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

        <script src="script/script.js"></script>

        <!-- JavaScript Form Validation -->
        <script>
            document.getElementById('contactForm').addEventListener('submit', function (event) {
                let name = document.getElementById('name').value.trim();
                let email = document.getElementById('email').value.trim();
                let message = document.getElementById('message').value.trim();

                if (!name || !email || !message) {
                    document.getElementById('formMessage').innerHTML = '<div class="alert alert-danger">All fields are required!</div>';
                    event.preventDefault();
                } else {
                    document.getElementById('formMessage').innerHTML = '<div class="alert alert-success">Your message has been sent!</div>';
                }
            });
        </script>
    </body>
</html>
