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
 * Servlet implementation class RegisterBuyer
 */
public class RegisterBuyer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterBuyer() {
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
		int buyerId = 0;
		String buyerName = request.getParameter("buyerName");
		String buyerConatct = request.getParameter("buyerConatct");
		String buyerAddress = request.getParameter("buyerAddress");
		String buyerEmail = request.getParameter("buyerEmail");
		String buyerPassword = request.getParameter("buyerPassword");
		
		Connection con = DbConnection.connect();
		
		
	    try {
			PreparedStatement pstmt = con.prepareStatement("insert into buyer values(?,?,?,?,?,?)");
			pstmt.setInt(1, buyerId);
			pstmt.setString(2, buyerName);
			pstmt.setString(3, buyerConatct);
			pstmt.setString(4, buyerAddress);
			pstmt.setString(5, buyerEmail);
			pstmt.setString(6, buyerPassword);
			
			int i = pstmt.executeUpdate();
			if(i>0){
				System.out.println("Account Created Successfully");
				response.sendRedirect("2_buyerDashboard.jsp");
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
	