package com.project.servlets;

import com.project.entities.User;
import com.project.entities.Hotel;
import com.project.dao.HotelDao;
import com.project.helper.ConnectionProvider;
import com.project.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author HARSH
 */
@MultipartConfig
@WebServlet(name = "AddHotelServlet", urlPatterns = {"/AddHotelServlet"})
public class AddHotelServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //Get hotels details from the client side
            String hotelName = request.getParameter("hotelName");
            String location = request.getParameter("location");
            String roomType = request.getParameter("roomType");
            float pricePerNight = Float.parseFloat(request.getParameter("pricePerNight"));
            int availableRooms = Integer.parseInt(request.getParameter("availableRooms"));
            float rating = Float.parseFloat(request.getParameter("rating"));
            Part part = request.getPart("hotelImage");
            String hotelImageName = part.getSubmittedFileName();

            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("currentUser");

            int createdBy = user.getId();

            //Create hotel object and set all vakues to that object
            Hotel hotel = new Hotel(hotelName, location, roomType, pricePerNight, availableRooms, rating, createdBy, hotelImageName);

            HotelDao dao = new HotelDao(ConnectionProvider.getConnection());

            if (dao.saveHotelDetails(hotel)) {

                String path = request.getRealPath("/") + "assets" + File.separator + "hotels" + File.separator + hotelImageName;

                if (Helper.saveFile(part.getInputStream(), path)) {
                    out.println("done");
                }
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
