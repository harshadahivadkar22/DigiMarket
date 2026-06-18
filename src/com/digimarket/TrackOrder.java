package com.digimarket;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class TrackOrder extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("buyerId") == null) {
            response.sendRedirect("buyerLogin.jsp?msg=session_expired");
            return;
        }

        int buyerId = (int) session.getAttribute("buyerId");

        try (Connection con = DbConnection.connect();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM orders WHERE buyerId = ?")) {

            ps.setInt(1, buyerId);
            ResultSet rs = ps.executeQuery();
            request.setAttribute("orderResultSet", rs);

            RequestDispatcher rd = request.getRequestDispatcher("14_TrackOrderStatus.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
