<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.digimarket.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>View Buyers - DigiMarket</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(to right, #e0f7fa, #f1f8e9);
      margin: 0;
      padding: 20px;
    }

    h2 {
      text-align: center;
      color: #2e7d32;
      margin-bottom: 30px;
      font-size: 28px;
    }

    .table-card {
      max-width: 90%;
      margin: auto;
      background-color: #ffffff;
      border-radius: 12px;
      padding: 30px;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 15px;
    }

    th, td {
      padding: 14px 16px;
      text-align: center;
      border-bottom: 1px solid #ddd;
      font-size: 16px;
    }

    th {
      background-color: #a5d6a7;
      color: #1b5e20;
      font-size: 17px;
    }

    tr:hover {
      background-color: #f1f8e9;
    }

    i {
      color: #2e7d32;
      margin-right: 8px;
    }

    a {
      display: inline-block;
      margin-top: 25px;
      text-decoration: none;
      background-color: #388e3c;
      color: white;
      padding: 10px 20px;
      border-radius: 8px;
      font-weight: bold;
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
  PreparedStatement pstmt = con.prepareStatement("SELECT * FROM buyer");
  ResultSet rs = pstmt.executeQuery();
%>

<div class="table-card">
  <h2><i class="fas fa-users"></i> Registered Buyers</h2>
  <table>
    <thead>
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Contact</th>
        <th>Address</th>
        <th>Email</th>
        <th>Password</th>
      </tr>
    </thead>
    <tbody>
      <% while(rs.next()) { %>
        <tr>
          <td><%= rs.getInt(1) %></td>
          <td><%= rs.getString(2) %></td>
          <td><%= rs.getString(3) %></td>
          <td><%= rs.getString(4) %></td>
          <td><%= rs.getString(5) %></td>
          <td><%= rs.getString(6) %></td>
        </tr>
      <% } %>
    </tbody>
  </table>
  <a href="2_adminDashboard.jsp"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
</div>

</body>
</html>
