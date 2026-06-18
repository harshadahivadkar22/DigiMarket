package com.digimarket;

import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;
import javax.servlet.*;
import javax.servlet.http.*;

public class PlaceOrder extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("buyerId") == null) {
            response.sendRedirect("buyerLogin.jsp?msg=session_expired");
            return;
        }
        int buyerId = (int) session.getAttribute("buyerId");

        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        try (Connection con = DbConnection.connect();
             PreparedStatement psCheck = con.prepareStatement("SELECT quantity FROM products WHERE productId = ?");
             PreparedStatement psUpdate = con.prepareStatement("UPDATE products SET quantity = quantity - ? WHERE productId = ?");
             PreparedStatement psInsert = con.prepareStatement("INSERT INTO orders (buyerId, productId, quantityOrdered, orderDate, status) VALUES (?, ?, ?, ?, ?)")) {

            psCheck.setInt(1, productId);
            ResultSet rs = psCheck.executeQuery();

            if (rs.next()) {
                int availableQty = rs.getInt("quantity");

                if (quantity > 0 && quantity <= availableQty) {
                    psUpdate.setInt(1, quantity);
                    psUpdate.setInt(2, productId);
                    psUpdate.executeUpdate();

                    psInsert.setInt(1, buyerId);
                    psInsert.setInt(2, productId);
                    psInsert.setInt(3, quantity);
                    psInsert.setDate(4, Date.valueOf(LocalDate.now()));
                    psInsert.setString(5, "Placed");
                    psInsert.executeUpdate();

                    response.sendRedirect("9_ViewOrders.jsp?msg=success");
                } else {
                    response.sendRedirect("9_ViewOrders.jsp?msg=invalid_quantity");
                }
            } else {
                response.sendRedirect("9_ViewOrders.jsp?msg=product_not_found");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("9_ViewOrders.jsp?msg=error");
        }
    }
}
