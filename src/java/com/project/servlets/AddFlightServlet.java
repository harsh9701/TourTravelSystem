package com.project.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.project.entities.Flight;
import com.project.entities.User;
import com.project.dao.FlightDao;
import com.project.helper.ConnectionProvider;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;

/**
 *
 * @author HARSH
 */

@MultipartConfig
@WebServlet(name = "AddFlightServlet", urlPatterns = {"/AddFlightServlet"})
public class AddFlightServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //Get flight details from client side
            String flightNumber = request.getParameter("flightNumber");
            String airlineName = request.getParameter("airlineName");
            String departureAirport = request.getParameter("departureAirport");
            String arrivalAirport = request.getParameter("arrivalAirport");
            String departureTime = request.getParameter("departureTime");
            String arrivalTime = request.getParameter("arrivalTime");
            float ticketPrice = Float.parseFloat(request.getParameter("ticketPrice"));
            String classType = request.getParameter("classType");

            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("currentUser");

            int createdBy = user.getId();

            //Create flight object and set all values to that object
            Flight flight = new Flight(flightNumber, airlineName, departureAirport, arrivalAirport, departureTime, arrivalTime, ticketPrice, classType, createdBy);

            FlightDao dao = new FlightDao(ConnectionProvider.getConnection());

            if (dao.saveFlightDetails(flight)) {
                out.println("done");
            } else {
                out.println("Error");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
