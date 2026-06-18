<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.digimarket.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>View All Products - DigiMarket</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(to right, #e0f7fa, #f1f8e9);
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
    }

    .table-card {
      background: #ffffff;
      padding: 40px;
      border-radius: 15px;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
      width: 90%;
      max-width: 1000px;
      transition: transform 0.3s ease;
    }

    .table-card:hover {
      transform: scale(1.01);
    }

    h2 {
      color: #2e7d32;
      margin-bottom: 25px;
      font-size: 28px;
      text-align: center;
    }

    h2 i {
      margin-right: 10px;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    th, td {
      padding: 14px;
      border-bottom: 1px solid #ddd;
      text-align: center;
      font-size: 16px;
    }

    th {
      background-color: #c8e6c9;
      color: #1b5e20;
    }

    tr:hover {
      background-color: #f1f8e9;
    }

    a {
      display: inline-block;
      margin-top: 20px;
      text-decoration: none;
      background-color: #388e3c;
      color: white;
      padding: 12px 24px;
      border-radius: 8px;
      font-weight: bold;
      font-size: 16px;
      transition: background-color 0.3s ease, box-shadow 0.3s ease;
    }

    a:hover {
      background-color: #2e7d32;
      box-shadow: 0 6px 14px rgba(0, 0, 0, 0.2);
    }
  </style>
</head>
<body>

<%
  Connection con = DbConnection.connect();
  PreparedStatement pstmt = con.prepareStatement("SELECT * FROM products");
  ResultSet rs = pstmt.executeQuery();
%>

<div class="table-card">
  <h2><i class="fas fa-boxes"></i> View All Products</h2>
  <table>
    <thead>
      <tr>
        <th>ID</th>
        <th>Farmer ID</th>
        <th>Product Name</th>
        <th>Quantity</th>
        <th>Price</th>
        <th>Post Date</th>
      </tr>
    </thead>
    <tbody>
      <% while(rs.next()) { %>
        <tr>
          <td><%= rs.getInt(1) %></td>
          <td><%= rs.getInt(2) %></td>
          <td><%= rs.getString(3) %></td>
          <td><%= rs.getInt(4) %></td>
          <td><%= rs.getInt(5) %></td>
          <td><%= rs.getString(6) %></td>
        </tr>
      <% } %>
    </tbody>
  </table>
  
  <a href="2_adminDashboard.jsp"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
</div>

</body>
</html>
