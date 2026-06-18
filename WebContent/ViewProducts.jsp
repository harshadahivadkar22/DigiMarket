<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.digimarket.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Products</title>
    <style>
        /* Same styling as before */
    </style>
</head>
<body>
    <div class="table-card">
        <h2><i class="fas fa-boxes"></i> View All Products</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Farmer ID</th>
                    <th>Product Name</th>
                    <th>Available Qty</th>
                    <th>Price</th>
                    <th>Post Date</th>
                    <th>Order</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection con = DbConnection.connect();
                    PreparedStatement pstmt = con.prepareStatement("SELECT * FROM products");
                    ResultSet rs = pstmt.executeQuery();
                    while(rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("productId") %></td>
                    <td><%= rs.getInt("farmerId") %></td>
                    <td><%= rs.getString("productName") %></td>
                    <td><%= rs.getInt("quantity") %></td>
                    <td><%= rs.getInt("price") %></td>
                    <td><%= rs.getString("postDate") %></td>
                    <td>
                        <form action="PlaceOrder" method="post">
                            <input type="hidden" name="productId" value="<%= rs.getInt("productId") %>">
                            <input type="number" name="quantity" min="1" max="<%= rs.getInt("quantity") %>" required>
                            <input type="submit" value="Order">
                        </form>
                    </td>
                </tr>
                <%
                    }
                    rs.close();
                    pstmt.close();
                    con.close();
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
