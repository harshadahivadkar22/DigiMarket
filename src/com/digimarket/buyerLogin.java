//package com.digimarket;
//
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
///**
// * Servlet implementation class buyerLogin
// */
//public class buyerLogin extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//       
//    /**
//     * @see HttpServlet#HttpServlet()
//     */
//    public buyerLogin() {
//        super();
//        // TODO Auto-generated constructor stub
//    }
//
//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}
//
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		String buyerEmail = request.getParameter("buyerEmail");
//	    String buyerPassword = request.getParameter("buyerPassword");
//
//	    Connection con = DbConnection.connect();
//
//	    try {
//	        PreparedStatement pstmt = con.prepareStatement("SELECT * FROM buyer WHERE buyerEmail=? AND buyerPassword=?");
//	        pstmt.setString(1, buyerEmail);
//	        pstmt.setString(2, buyerPassword);
//	        ResultSet rs = pstmt.executeQuery();
//
//	        if (rs.next()) {
//	            int buyerId = rs.getInt("buyerId"); // make sure DB column name is correct
//	            System.out.println("buyerId = " + buyerId);
//
//	            GetSet_buyerId.setBuyerId(buyerId); // ✅ Fix: use correct variable
//
//	            response.sendRedirect("2_buyerDashboard.jsp");
//	        } else {
//	            response.sendRedirect("error.html");
//	        }
//
//	    } catch (SQLException e) {
//	        e.printStackTrace();
//	    }
//		
//		
//		doGet(request, response);
//	}
//
//}
//
//


package com.digimarket;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class buyerLogin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String buyerEmail = request.getParameter("buyerEmail");
        String buyerPassword = request.getParameter("buyerPassword");

        try (Connection con = DbConnection.connect();
             PreparedStatement pstmt = con.prepareStatement("SELECT * FROM buyer WHERE buyerEmail=? AND buyerPassword=?")) {

            pstmt.setString(1, buyerEmail);
            pstmt.setString(2, buyerPassword);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
            	int buyerId =  rs.getInt(1);
               GetSet_buyerId.setBuyerId(rs.getInt(1));
               

                // ✅ Store buyerId in session
                HttpSession session = request.getSession();
                session.setAttribute("buyerId", buyerId);

                response.sendRedirect("2_buyerDashboard.jsp");
            } else {
                response.sendRedirect("error.html");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.html");
        }
    }
}
