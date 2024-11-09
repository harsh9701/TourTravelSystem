package com.project.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.project.helper.ConnectionProvider;
import com.project.dao.FlightBookingDao;
import com.project.dao.TrainBookingDao;
import com.project.dao.HotelBookingDao;
import com.project.dao.OrdersDao;
import com.project.entities.FlightBooking;
import com.project.entities.TrainBooking;
import com.project.entities.HotelBooking;
import com.project.entities.Orders;
import com.project.entities.Bank;
import com.project.dao.BankDao;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.annotation.MultipartConfig;

@MultipartConfig
@WebServlet(name = "CheckoutServlet", urlPatterns = {"/CheckoutServlet"})
public class CheckoutServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //Get the form data from the client side
            String bookingId = request.getParameter("bookingId");
            String customerId = request.getParameter("customerId");
            String flightId = request.getParameter("flightId");
            String trainId = request.getParameter("trainId");
            String hotelId = request.getParameter("hotelId");
            String airlineName = request.getParameter("airlineName");
            String trainName = request.getParameter("trainName");
            String hotelName = request.getParameter("hotelName");
            String departureDate = request.getParameter("departureDate");
            String arrivalDate = request.getParameter("arrivalDate");
            String checkIn = request.getParameter("checkIn");
            String checkOut = request.getParameter("checkOut");
            String noOfRooms = request.getParameter("noOfRooms");
            String noOfDays = request.getParameter("noOfDays");
            String noOfAdult = request.getParameter("noOfAdult");
            String noOfChildren = request.getParameter("noOfChildren");
            String travellerName = request.getParameter("travellerName");
            String ageOfTraveller = request.getParameter("ageOfTraveller");
            String contactOfTraveller = request.getParameter("contactOfTraveller");
            String address = request.getParameter("address");
            float totalSum = Float.parseFloat(request.getParameter("totalSum"));
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String cardHolder = request.getParameter("cardHolder");
            String cardNumber = request.getParameter("cardNumber").replaceAll("\\s", "");
            String expiryDate = request.getParameter("expiryDate");
            String cvv = request.getParameter("cvv");

            // Create a Date object for the current date and time
            Date currentDate = new Date();
            // Create a SimpleDateFormat object with the desired format
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            // Format the current date
            String formattedDate = dateFormat.format(currentDate);

            BankDao bankDao = new BankDao(ConnectionProvider.getConnection());
            Bank bank = bankDao.getBankDetails(cardNumber);

            if (bank != null) {
                String fetchCardNum = bank.getCardNumber();
                String fetchCardHolder = bank.getCardHolderName();
                String fetchCvv = bank.getCvv();
                if (cardNumber.equals(fetchCardNum) && cardHolder.equals(fetchCardHolder) && cvv.equals(fetchCvv)) {
                    if (!("null".equals(flightId))) {

                        int numberOfTraveler = Integer.parseInt(noOfChildren) + Integer.parseInt(noOfAdult);
                        int customer_id = Integer.parseInt(customerId);
                        int flight_id = Integer.parseInt(flightId);
                        int age = Integer.parseInt(ageOfTraveller);
                        FlightBooking fb = new FlightBooking(bookingId, customer_id, flight_id, departureDate, arrivalDate, numberOfTraveler, formattedDate, travellerName, age, contactOfTraveller, address, totalSum, "Pending");
                        FlightBookingDao fbDao = new FlightBookingDao(ConnectionProvider.getConnection());
                        Orders order = new Orders(customer_id, "flight", bookingId, totalSum, "pending", formattedDate);
                        OrdersDao orderDao = new OrdersDao(ConnectionProvider.getConnection());
                        if (fbDao.saveFlightBookingDetails(fb)) {
                            if (orderDao.saveOrdersDetail(order)) {
                                out.println("done");
                            } else {
                                out.println("error");
                            }
                        } else {
                            out.println("error");
                        }

                    } else if (!("null".equals(trainId))) {

                        int no_of_adults = Integer.parseInt(noOfAdult);
                        int no_of_children = Integer.parseInt(noOfChildren);
                        int customer_id = Integer.parseInt(customerId);
                        int train_id = Integer.parseInt(trainId);
                        int age = Integer.parseInt(ageOfTraveller);
                        TrainBooking tb = new TrainBooking(bookingId, customer_id, train_id, departureDate, arrivalDate, no_of_adults, no_of_children, formattedDate, travellerName, age, contactOfTraveller, address, totalSum, "Pending");
                        TrainBookingDao tbDao = new TrainBookingDao(ConnectionProvider.getConnection());
                        Orders order = new Orders(customer_id, "train", bookingId, totalSum, "pending", formattedDate);
                        OrdersDao orderDao = new OrdersDao(ConnectionProvider.getConnection());
                        if (tbDao.saveTrainBookingDetails(tb)) {
                            if (orderDao.saveOrdersDetail(order)) {
                                out.println("done");
                            } else {
                                out.println("error");
                            }
                        } else {
                            out.println("error");
                        }

                    } else if (!("null".equals(hotelId))) {

                        int no_of_rooms = Integer.parseInt(noOfRooms);
                        int no_of_days = Integer.parseInt(noOfDays);
                        int customer_id = Integer.parseInt(customerId);
                        int hotel_id = Integer.parseInt(hotelId);
                        HotelBooking hb = new HotelBooking(bookingId, customer_id, hotel_id, checkIn, checkOut, no_of_rooms, no_of_days, formattedDate, travellerName, contactOfTraveller, address, totalSum, "Pending");
                        HotelBookingDao tbDao = new HotelBookingDao(ConnectionProvider.getConnection());
                        Orders order = new Orders(customer_id, "hotel", bookingId, totalSum, "pending", formattedDate);
                        OrdersDao orderDao = new OrdersDao(ConnectionProvider.getConnection());
                        if (tbDao.saveHotelBookingDetails(hb)) {
                            if (orderDao.saveOrdersDetail(order)) {
                                out.println("done");
                            } else {
                                out.println("error");
                            }
                        } else {
                            out.println("error");
                        }

                    } else {
                        out.println("No booking details provided");
                    }
                } else {
                    out.println("Invalid Card Details! Please try again..");
                }
            } else {
                out.println("No bank details found for this card number.");
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
