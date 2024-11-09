<%-- 
    Document   : index.jsp
    Created on : Sep 6, 2024, 2:09:41 AM
    Author     : HARSH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Tour Travel System</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/style.css" >
        <link rel="stylesheet" type="text/css" href="css/navbar.css" >
        <link rel="stylesheet" type="text/css" href="css/footer.css" >
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>

        <!--include navbar-->
        <jsp:include page="components/navbar.jsp" />

        <div class="slider">
            <div id="carouselExampleCaptions" class="carousel slide">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active carousel-btn" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2" class="carousel-btn"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3" class="carousel-btn"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="assets/sliders/img-1.jpeg" class="d-block w-100 carousel-img" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                            <h3 class="text-dark fs-1">Explore The World</h3>
                            <p class="text-dark fw-bold">Create Timeless Memories</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="assets/sliders/img-2.jpg" class="d-block w-100 carousel-img" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                            <h3 class="text-dark fs-1">Discover the World, One Journey at a Time</h3>
                            <p class="text-dark fw-bold">Travel is the only thing you buy that makes you richer.</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="assets/sliders/img-3.jpg" class="d-block w-100 carousel-img" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                            <h3 class="text-dark fs-1">Travel Beyond Boundaries, Dream Without Limits</h3>
                            <p class="text-dark fw-bold">Travel brings power and love back into your life.</p>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true" data-toggle="tooltip" data-placement="bottom" title="Previous"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true" data-toggle="tooltip" data-placement="bottom" title="Next"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>

        <div class="accordion" id="accordionExample">
            <div class="w-100 d-flex justify-content-center gap-1">
                <p class="d-inline-flex">
                    <button class="btn btn-dark collapse-btn" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                        Book Flights
                    </button>
                </p>
                <p class="d-inline-flex">
                    <button class="btn btn-dark collapse-btn" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                        Book Trains
                    </button>
                </p>
                <p class="d-inline-flex">
                    <button class="btn btn-dark collapse-btn" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                        Book Hotels
                    </button>
                </p>
                <p class="d-inline-flex">
                    <button class="btn btn-dark collapse-btn" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseThree">
                        Holiday Packages
                    </button>
                </p>
                <p class="d-inline-flex">
                    <button class="btn btn-dark collapse-btn" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseThree">
                        Leisure Tourism
                    </button>
                </p>
            </div>
            <div id="accordionExample">
                <div class="collapse show" id="collapseOne" data-bs-parent="#accordionExample">
                    <div class="d-flex justify-content-center card-section">
                        <div class="card card-body travel-cards">
                            <img src="assets/flights/international_flights.jpeg" class="card-img-top" alt="International Flights">
                            <h5 class="card-title">International Flights</h5>
                            <div class="card-body">
                                <div class="btn-group">
                                    <a href="listing.jsp?searchTerm=flights" class="btn btn-primary">Book Now</a>
                                    <a href="listing.jsp?searchTerm=flights" class="btn btn-outline-secondary">Explore More</a>
                                </div>
                            </div>
                        </div>
                        <div class="card card-body travel-cards">
                            <img src="assets/flights/business_flight.jpg" class="card-img-top" alt="...">
                            <h5 class="card-title">Business Flights</h5>
                            <div class="card-body">
                                <div class="btn-group">
                                    <a href="listing.jsp?searchTerm=flights" class="btn btn-primary">Book Now</a>
                                    <a href="listing.jsp?searchTerm=flights" class="btn btn-outline-secondary">Explore More</a>
                                </div>
                            </div>
                        </div>
                        <div class="card card-body travel-cards">
                            <img src="assets/flights/domestic_flight.jpg" class="card-img-top" alt="...">
                            <h5 class="card-title">Domestic Flights</h5>
                            <div class="card-body">
                                <div class="btn-group">
                                    <a href="listing.jsp?searchTerm=flights" class="btn btn-primary">Book Now</a>
                                    <a href="listing.jsp?searchTerm=flights" class="btn btn-outline-secondary">Explore More</a>
                                </div>
                            </div>
                        </div>
                        <div class="card card-body travel-cards">
                            <img src="assets/flights/cheap_flights.jpg" class="card-img-top" alt="...">
                            <h5 class="card-title">Cheaper Flights</h5>
                            <div class="card-body">
                                <div class="btn-group">
                                    <a href="listing.jsp?searchTerm=flights" class="btn btn-primary">Book Now</a>
                                    <a href="listing.jsp?searchTerm=flights" class="btn btn-outline-secondary">Explore More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="collapse" id="collapseTwo" data-bs-parent="#accordionExample">
                    <div class="d-flex justify-content-center card-section">
                        <div class="card card-body travel-cards">
                            <img src="assets/trains/luxury_trains.jpg" class="card-img-top" alt="...">
                            <h5 class="card-title">Luxury Trains</h5>
                            <div class="card-body">
                                <div class="btn-group">
                                    <a href="listing.jsp?searchTerm=trains" class="btn btn-primary">Book Now</a>
                                    <a href="listing.jsp?searchTerm=trains" class="btn btn-outline-secondary">Explore More</a>
                                </div>
                            </div>
                        </div>
                        <div class="card card-body travel-cards">
                            <img src="assets/trains/vandhe_bharat.jpg" class="card-img-top" alt="...">
                            <h5 class="card-title">Vande Bharat</h5>
                            <div class="card-body">
                                <div class="btn-group">
                                    <a href="listing.jsp?searchTerm=trains" class="btn btn-primary">Book Now</a>
                                    <a href="listing.jsp?searchTerm=trains" class="btn btn-outline-secondary">Explore More</a>
                                </div>
                            </div>
                        </div>
                        <div class="card card-body travel-cards">
                            <img src="assets/trains/regional_trains.jpg" class="card-img-top" alt="...">
                            <h5 class="card-title">Regional Trains</h5>
                            <div class="card-body">
                                <div class="btn-group">
                                    <a href="listing.jsp?searchTerm=trains" class="btn btn-primary">Book Now</a>
                                    <a href="listing.jsp?searchTerm=trains" class="btn btn-outline-secondary">Explore More</a>
                                </div>
                            </div>
                        </div>
                        <div class="card card-body travel-cards">
                            <img src="assets/trains/sleepers_trains.jpg" class="card-img-top" alt="...">
                            <h5 class="card-title">Sleepers Trains</h5>
                            <div class="card-body">
                                <div class="btn-group">
                                    <a href="listing.jsp?searchTerm=trains" class="btn btn-primary">Book Now</a>
                                    <a href="listing.jsp?searchTerm=trains" class="btn btn-outline-secondary">Explore More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="collapse" id="collapseThree" data-bs-parent="#accordionExample">
                    <div class="d-flex justify-content-center card-section">
                        <div class="card card-body travel-cards">
                            <img src="assets/hotels/luxury_hotels.jpg" class="card-img-top" alt="...">
                            <h5 class="card-title">Luxury Hotels</h5>
                            <div class="card-body">
                                <div class="btn-group">
                                    <a href="listing.jsp?searchTerm=hotels" class="btn btn-primary">Book Now</a>
                                    <a href="listing.jsp?searchTerm=hotels" class="btn btn-outline-secondary">Explore More</a>
                                </div>
                            </div>
                        </div>
                        <div class="card card-body travel-cards">
                            <img src="assets/hotels/eco_friendly_hotels.jpg" class="card-img-top" alt="...">
                            <h5 class="card-title">Eco-Friendly Hotels</h5>
                            <div class="card-body">
                                <div class="btn-group">
                                    <a href="listing.jsp?searchTerm=hotels" class="btn btn-primary">Book Now</a>
                                    <a href="listing.jsp?searchTerm=hotels" class="btn btn-outline-secondary">Explore More</a>
                                </div>
                            </div>
                        </div>
                        <div class="card card-body travel-cards">
                            <img src="assets/hotels/resort_hotels.jpg" class="card-img-top" alt="...">
                            <h5 class="card-title">Resort Hotels</h5>
                            <div class="card-body">
                                <div class="btn-group">
                                    <a href="listing.jsp?searchTerm=hotels" class="btn btn-primary">Book Now</a>
                                    <a href="listing.jsp?searchTerm=hotels" class="btn btn-outline-secondary">Explore More</a>
                                </div>
                            </div>
                        </div>
                        <div class="card card-body travel-cards">
                            <img src="assets/hotels/budget_hotels.jpg" class="card-img-top" alt="...">
                            <h5 class="card-title">Budget Hotels</h5>
                            <div class="card-body">
                                <div class="btn-group">
                                    <a href="listing.jsp?searchTerm=hotels" class="btn btn-primary">Book Now</a>
                                    <a href="listing.jsp?searchTerm=hotels" class="btn btn-outline-secondary">Explore More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="collapse" id="collapseFour" data-bs-parent="#accordionExample">
                    <div class="d-flex justify-content-center card-section">
                        <div class="card card-body travel-cards">
                            <img src="assets/misc/family_freindly_package.jpg" class="card-img-top" alt="...">
                            <h5 class="card-title">Family Vacation Packages</h5>
                            <div class="card-body">
                                <div class="btn-group">
                                    <a href="listing.jsp?searchTerm=Packages" class="btn btn-primary">Book Now</a>
                                    <a href="listing.jsp?searchTerm=Packages" class="btn btn-outline-secondary">Explore More</a>
                                </div>
                            </div>
                        </div>
                        <div class="card card-body travel-cards">
                            <img src="assets/misc/romantic_packages.jpg" class="card-img-top" alt="...">
                            <h5 class="card-title">Romantic Getaway Packages</h5>
                            <div class="card-body">
                                <div class="btn-group">
                                    <a href="listing.jsp?searchTerm=Packages" class="btn btn-primary">Book Now</a>
                                    <a href="listing.jsp?searchTerm=Packages" class="btn btn-outline-secondary">Explore More</a>
                                </div>
                            </div>
                        </div>
                        <div class="card card-body travel-cards">
                            <img src="assets/misc/adventure_packages.jpg" class="card-img-top" alt="...">
                            <h5 class="card-title">Adventure Holiday Packages</h5>
                            <div class="card-body">
                                <div class="btn-group">
                                    <a href="listing.jsp?searchTerm=Packages" class="btn btn-primary">Book Now</a>
                                    <a href="listing.jsp?searchTerm=Packages" class="btn btn-outline-secondary">Explore More</a>
                                </div>
                            </div>
                        </div>
                        <div class="card card-body travel-cards">
                            <img src="assets/misc/cultural_tourism.jpg" class="card-img-top" alt="...">
                            <h5 class="card-title">Cultural & Heritage Packages</h5>
                            <div class="card-body">
                                <div class="btn-group">
                                    <a href="listing.jsp?searchTerm=Packages" class="btn btn-primary">Book Now</a>
                                    <a href="listing.jsp?searchTerm=Packages" class="btn btn-outline-secondary">Explore More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="collapse" id="collapseFive" data-bs-parent="#accordionExample">
                    <div class="d-flex justify-content-center card-section">
                        <div class="card card-body travel-cards">
                            <img src="assets/misc/beach_tourism.jpg" class="card-img-top" alt="...">
                            <h5 class="card-title">Beach Tourism</h5>
                            <div class="card-body">
                                <div class="btn-group">
                                    <a href="listing.jsp?searchTerm=Leisure Packages" class="btn btn-primary">Book Now</a>
                                    <a href="listing.jsp?searchTerm=Leisure Packages" class="btn btn-outline-secondary">Explore More</a>
                                </div>
                            </div>
                        </div>
                        <div class="card card-body travel-cards">
                            <img src="assets/misc/adventure_tourism.jpg" class="card-img-top" alt="...">
                            <h5 class="card-title">Adventure Tourism</h5>
                            <div class="card-body">
                                <div class="btn-group">
                                    <a href="listing.jsp?searchTerm=Leisure Packages" class="btn btn-primary">Book Now</a>
                                    <a href="listing.jsp?searchTerm=Leisure Packages" class="btn btn-outline-secondary">Explore More</a>
                                </div>
                            </div>
                        </div>
                        <div class="card card-body travel-cards">
                            <img src="assets/misc/cruise_tourism.jpg" class="card-img-top" alt="...">
                            <h5 class="card-title">Cruise Tourism</h5>
                            <div class="card-body">
                                <div class="btn-group">
                                    <a href="listing.jsp?searchTerm=Leisure Packages" class="btn btn-primary">Book Now</a>
                                    <a href="listing.jsp?searchTerm=Leisure Packages" class="btn btn-outline-secondary">Explore More</a>
                                </div>
                            </div>
                        </div>
                        <div class="card card-body travel-cards">
                            <img src="assets/misc/wildlife_tourism.jpg" class="card-img-top" alt="...">
                            <h5 class="card-title">Wildlife & Safari Tourism</h5>
                            <div class="card-body">
                                <div class="btn-group">
                                    <a href="listing.jsp?searchTerm=Leisure Packages" class="btn btn-primary">Book Now</a>
                                    <a href="listing.jsp?searchTerm=Leisure Packages" class="btn btn-outline-secondary">Explore More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--include footer-->
        <jsp:include page="components/footer.jsp" />


        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="script/script.js"></script>

        <script>
            $(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
    </body>
</html>