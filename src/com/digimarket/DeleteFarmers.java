

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
 * Servlet implementation class DeleteFarmers
 */
public class DeleteFarmers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteFarmers() {
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
		// TODO Auto-generated method st
		
          int id = Integer.parseInt(request.getParameter("farmerId"));
          Connection con = DbConnection.connect();
          try {
                 PreparedStatement st = con.prepareStatement("DELETE FROM farmer WHERE farmerId = ?");
             st.setInt(1, id);
            int i = st.executeUpdate();
            if(i>0) {
                response.sendRedirect("4_ViewFarmers.jsp");
                    }
           } catch (SQLException e) {
// TODO Auto-generated catch block
             e.printStackTrace();
            }
		
		
		
		doGet(request, response);
	}

}
