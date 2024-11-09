<%-- 
    Document   : login
    Created on : Sep 15, 2024, 2:36:40 AM
    Author     : HARSH
--%>

<%@page import="com.project.entities.Message" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Login</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome (For Icons) -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #1d1f21; /* Dark background */
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                color: #f8f9fa;
            }

            .login-form {
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
        <div class="login-form">
            <div class="form-header">
                <i class="fas fa-sign-in-alt"></i>
                <h2>User Login</h2>
            </div>
            <form action="LoginServlet" method="POST">
                <%
                    Message m = (Message) session.getAttribute("msg");
                    if (m != null) {
                %>
                <div class="alert <%= m.getCssClass()%>" role="alert">
                    <%= m.getMsg()%>
                </div>
                <%
                        session.removeAttribute("msg");
                    }
                %>
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" name="email" class="form-control" id="email" placeholder="Enter email" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" name="password" class="form-control" id="password" placeholder="Enter password" required>
                </div>
                <div class="d-grid">
                    <button type="submit" class="btn btn-primary">Login</button>
                </div>
            </form>
            <div class="form-footer">
                <p>Don't have an account? <a href="registration.jsp">Register here</a></p>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
