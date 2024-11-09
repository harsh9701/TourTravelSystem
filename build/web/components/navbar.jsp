<%-- 
    Document   : navbar.jsp
    Created on : Sep 6, 2024, 3:50:28 AM
    Author     : HARSH
--%>

<%@page import="com.project.entities.User" %>
<%
    User user = (User) session.getAttribute("currentUser");
%>

<nav class="navbar bg-body-tertiary sticky-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">
            <span>
                <img src="assets/logo.png" alt="Logo" width="50" height="35" class="d-inline-block align-text-top">
            </span>
            <span class="logo-text">
                ExploreMe
            </span>
        </a>
        <div class="middle-navbar">
            <div class="links">
                <a class="nav-options text-body-secondary" href="listing.jsp?searchTerm=flights">Flights</a>
                <a class="nav-options text-body-secondary" href="listing.jsp?searchTerm=trains">Trains</a>
                <a class="nav-options text-body-secondary" href="listing.jsp?searchTerm=buses">Buses</a>
                <a class="nav-options text-body-secondary" href="listing.jsp?searchTerm=hotels">Hotels</a>
                <a class="nav-options text-body-secondary" href="listing.jsp?searchTerm=motels">Motels</a>
                <%
                    if ((user != null) && ("admin".equals(user.getUserRole()))) {
                %>
                <a class="nav-options text-body-secondary" href="admin_page.jsp">Admin Panel</a>
                <%
                    }
                %>
            </div>
            <div class="search-bar">
                <form class="d-flex search-bar-inner" role="search">
                    <input class="form-control rounded-pill" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                </form>
            </div>
        </div>
        <div>
            <button class="navbar-toggler" data-toggle="tooltip" data-placement="bottom" title="Account" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <!--<span class="navbar-toggler-icon"></span>-->
                <span><i class="fa-solid fa-user"></i></span>
            </button>
        </div>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav">
                <a class="nav-link" aria-current="page" href="index.jsp">Explore</a>
                <a class="nav-link" href="user_account.jsp">My Account</a>
                <% if (user == null) { %>
                <a class="nav-link" href="login.jsp">Login</a>
                <a class="nav-link" href="registration.jsp">Signup</a>
                <% } else { %>
                <a class="nav-link" href="booking_list.jsp">My Bookings</a>
                <a class="nav-link" href="LogoutServlet">Logout</a>
                <% }%>
                <%
                    if ((user != null) && ("admin".equals(user.getUserRole()))) {
                %>
                <a class="nav-link" href="admin_page.jsp">Admin Panel</a>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</nav>
