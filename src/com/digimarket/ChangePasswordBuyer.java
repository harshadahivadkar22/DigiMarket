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
 * Servlet implementation class ChangePasswordBuyer
 */
public class ChangePasswordBuyer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordBuyer() {
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
		Connection con = DbConnection.connect();
		
		String oldPass = request.getParameter("oldPassword");
		String newPass = request.getParameter("newPassword");
		int id = GetSet_buyerId.getBuyerId();
		try {
		
		PreparedStatement pstmt = con.prepareStatement("UPDATE buyer SET buyerPassword = ? WHERE buyerId = ? AND buyerPassword = ?");
		pstmt.setString(1,newPass);
		pstmt.setInt(2,id);
		pstmt.setString(3, oldPass);
		int i = pstmt.executeUpdate();
		if(i>0) {
		response.sendRedirect("2_buyerDashboard.jsp");
		}
		} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
		
		
		doGet(request, response);
	}

}
