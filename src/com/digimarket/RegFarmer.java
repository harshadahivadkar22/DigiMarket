package com.digimarket;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegFarmer
 */
public class RegFarmer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegFarmer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int farmerId = 0;
		String farmerName = request.getParameter("farmerName");
		String farmerLocation = request.getParameter("farmerLocation");
		String farmerContact = request.getParameter("farmerContact");
		String farmerEmail = request.getParameter("farmerEmail");
		String farmerPassword = request.getParameter("farmerPassword");
		
		Connection con = DbConnection.connect();
		
		
	    try {
			PreparedStatement pstmt = con.prepareStatement("insert into farmer values(?,?,?,?,?,?)");
			pstmt.setInt(1, farmerId);
			pstmt.setString(2, farmerName);
			pstmt.setString(3, farmerLocation);
			pstmt.setString(4, farmerContact);
			pstmt.setString(5, farmerEmail);
			pstmt.setString(6, farmerPassword);
			
			int i = pstmt.executeUpdate();
			if(i>0){
				System.out.println("Account Created Successfully");
				response.sendRedirect("2_farmerDashboard.jsp");
			}
			else{
				System.out.println("Error Occured");
			}

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		doGet(request, response);
	}

}
