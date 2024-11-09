package com.project.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.project.entities.User;
import com.project.entities.Train;
import com.project.dao.TrainDao;
import com.project.helper.ConnectionProvider;
import javax.servlet.annotation.MultipartConfig;

/**
 *
 * @author HARSH
 */
@MultipartConfig
@WebServlet(name = "AddTrainServlet", urlPatterns = {"/AddTrainServlet"})
public class AddTrainServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            //Get train details from the client side
            String trainName = request.getParameter("trainName");
            String trainNumber = request.getParameter("trainNumber");
            String departureStation = request.getParameter("departureStation");
            String arrivalStation = request.getParameter("arrivalStation");
            String departureTime = request.getParameter("departureTime");
            String arrivalTime = request.getParameter("arrivalTime");
            String seatType = request.getParameter("seatType");
            float ticketPrice = Float.parseFloat(request.getParameter("ticketPrice"));

            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("currentUser");

            int createdBy = user.getId();

            //Create Train object and set all the value to that object
            Train train = new Train(trainName, departureStation, arrivalStation, departureTime, arrivalTime, seatType, ticketPrice, createdBy);

            TrainDao dao = new TrainDao(ConnectionProvider.getConnection());

            if (dao.saveTrainDetails(train)) {
                out.print("done");
            } else {
                out.print("Error");
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
