<%-- 
    Document   : about_us
    Created on : Sep 16, 2024, 1:51:39 PM
    Author     : HARSH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>About Us - ExploreMe</title>
        <link rel="stylesheet" type="text/css" href="css/style.css" >
        <link rel="stylesheet" type="text/css" href="css/navbar.css" >
        <link rel="stylesheet" type="text/css" href="css/footer.css" >
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!-- Bootstrap CSS -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .hero-section {
                background-image: url('assets/about_img1.jpg');
                background-size: cover;
                background-position: center;
                height: 400px;
                position: relative;
                color: white;
                text-align: center;
            }
            .hero-section h1 {
                font-size: 3rem;
                font-weight: bold;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);
            }
            .info-section {
                padding: 50px 0;
            }
            .about-img {
                max-width: 100%;
            }
            .feature-section {
                background-color: #f8f9fa;
                padding: 40px 0;
            }
            .feature-card {
                padding: 20px;
                border: 1px solid #ddd;
                border-radius: 8px;
                text-align: center;
            }
            .feature-card h5 {
                font-weight: bold;
                margin-top: 20px;
            }
            .feature-card p {
                color: #666;
            }
            .img-fluid {
                height: 180px !important;
                width: 300px !important;
                border-radius: 9px;
            }
        </style>
    </head>
    <body>

        <div class="sticky-top" style="background-color: #FAF9F6">
            <!--include navbar-->
            <jsp:include page="components/navbar.jsp" />
        </div>

        <!-- Hero Section -->
        <section class="hero-section">
            <h1 style="color: #000">Welcome to ExploreMe</h1>
            <h2 style="color: #000">Find Amazing Packages/Offers Here</h2>
        </section>

        <!-- About Info Section -->
        <section class="info-section container">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <img src="assets/logo.png" alt="About Us" class="about-img"> <!-- Replace with a relevant image -->
                </div>
                <div class="col-lg-6">
                    <h2>Why ExploreMe?</h2>
                    <p>ExploreMe provides some of the best offers, the lowest airfares, exclusive discounts, and a seamless online booking experience. Whether it's flight, hotel, or holiday package bookings through our site, you will enjoy a user-friendly platform and a smooth process from start to finish.</p>
                    <h3>Domestic Flights with ExploreMe</h3>
                    <p>With the cheapest fare guarantee and exclusive discounts, we help you get the best value on domestic and international flights. Our instant notifications keep you updated on the latest deals, fare drops, and more.</p>
                </div>
            </div>
        </section>

        <!-- Feature Section -->
        <section class="feature-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="feature-card">
                            <img src="assets/about_img2.jpg" alt="We Know" class="img-fluid">
                            <h5>We Know</h5>
                            <p>Our experience covers the length and breadth of your travel needs.</p>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="feature-card">
                            <img src="assets/about_img5.jpg" alt="We Can Help" class="img-fluid"> <!-- Replace with a relevant image -->
                            <h5>We Can Help</h5>
                            <p>We are flexible and can customize your requirements to ensure your satisfaction.</p>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="feature-card">
                            <img src="assets/about_img3.jpg" alt="We Care" class="img-fluid"> <!-- Replace with a relevant image -->
                            <h5>We Care</h5>
                            <p>We pay attention to every detail to ensure your trip is delightful.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!--include footer-->
        <jsp:include page="components/footer.jsp" />


        <script src="script/script.js"></script>
        <!-- Bootstrap and jQuery JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <!-- Bootstrap and jQuery JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    </body>
</html>

