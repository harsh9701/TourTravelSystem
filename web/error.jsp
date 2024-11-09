<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Error - Something Went Wrong</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light">
        <div class="container text-center my-5">
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-6">
                    <h1 class="display-4 text-danger">Oops! Something went wrong</h1>
                    <p class="lead text-secondary">We're sorry, but an unexpected error occurred. Please try again later.</p>

                    <div class="mt-4">
                        <a href="index.jsp" class="btn btn-primary btn-lg me-3">Go to Homepage</a>
                        <a href="contact.jsp" class="btn btn-outline-secondary btn-lg">Contact Support</a>
                    </div>

                    <div class="mt-5">
                        <input type="search" class="form-control form-control-lg" placeholder="Search for help...">
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS and Popper.js -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

