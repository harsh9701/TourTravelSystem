package com.project.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.project.dao.UserDao;
import com.project.helper.ConnectionProvider;
import com.project.entities.User;
import javax.servlet.http.HttpSession;
import com.project.entities.Message;

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            // Fetch username and password from the request
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            UserDao dao = new UserDao(ConnectionProvider.getConnection());

            User u = dao.getUserByEmailAndPassword(email, password);

            if (u == null) {
                //Login error
                Message msg = new Message("Invalid Details.... Please Try Again!", "error", "alert-danger");
                HttpSession s = request.getSession();
                s.setAttribute("msg", msg);
                response.sendRedirect("login.jsp");
            } else {
                //Login session
                HttpSession s = request.getSession();
                s.setAttribute("currentUser", u);
                response.sendRedirect("index.jsp");
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
