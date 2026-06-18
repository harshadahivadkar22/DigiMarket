package com.digimarket;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ChangePasswordFarmer extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Connection con = null;
        PreparedStatement checkStmt = null;
        PreparedStatement updateStmt = null;
        ResultSet rs = null;

        
            con = DbConnection.connect();

            String oldPass = request.getParameter("oldPassword").trim();
            String newPass = request.getParameter("newPassword").trim();
            int farmerId = GetSet_farmerId.getFarmerId();

            // Step 1: Check if the old password matches
            try {
            	updateStmt = con.prepareStatement(
            		    "UPDATE farmer SET farmerPassword = ? WHERE farmerId = ? AND farmerPassword = ?"
            		);
				updateStmt.setString(1, newPass);
				updateStmt.setInt(2, farmerId);
				updateStmt.setString(3, oldPass);
				int i = updateStmt.executeUpdate();
				if(i>0) {
					response.sendRedirect("2_farmerDashboard.jsp");
				}
            } catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    }      
   
}
