package com.digimarket;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class PostProduct
 */
public class PostProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostProduct() {
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

		int farmerId = GetSet_farmerId.getFarmerId();
		int id = 0;

        String productName = request.getParameter("productName");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));
        String postDate = request.getParameter("postDate");
        Connection con  = DbConnection.connect();
        try {
        	PreparedStatement pstmt = con.prepareStatement("insert into products(farmerId, productName, quantity, price, postDate) VALUES (?, ?, ?, ?, ?)");
            pstmt.setInt(1, farmerId);
            pstmt.setString(2, productName);
            pstmt.setInt(3, quantity);
            pstmt.setDouble(4, price);
            pstmt.setString(5, postDate);

            pstmt.executeUpdate();

            pstmt.close();
            con.close();

            response.sendRedirect("2_farmerDashboard.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("8_PostProducts.jsp?error=exception");
        }

		
		doGet(request, response);
	}

}
