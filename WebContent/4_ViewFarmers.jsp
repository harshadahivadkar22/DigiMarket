<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" session="true" %>
<%@ page import="com.digimarket.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>View/Delete Farmers - DigiMarket</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(to right, #f1f8e9, #e8f5e9);
      margin: 0;
      padding: 20px;
    }

    h2 {
      text-align: center;
      color: #2e7d32;
      margin-bottom: 30px;
    }

    .table-card {
      max-width: 90%;
      margin: auto;
      background-color: white;
      border-radius: 10px;
      padding: 25px;
      box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 15px;
    }

    th, td {
      padding: 12px 15px;
      text-align: center;
      border-bottom: 1px solid #ccc;
    }

    th {
      background-color: #a5d6a7;
      color: #1b5e20;
    }

    tr:hover {
      background-color: #f1f8e9;
    }

    .delete-btn {
      background-color: #c62828;
      color: white;
      border: none;
      padding: 8px 15px;
      border-radius: 5px;
      cursor: pointer;
      font-weight: bold;
      transition: background-color 0.3s ease;
    }

    .delete-btn i {
      margin-right: 6px;
    }

    .delete-btn:hover {
      background-color: #b71c1c;
    }

    .back-link {
      display: inline-block;
      margin-top: 25px;
      margin-left: 30px;
      background-color: #2e7d32;
      color: white;
      padding: 10px 20px;
      text-decoration: none;
      border-radius: 8px;
      font-weight: bold;
      transition: background-color 0.3s ease;
    }

    .back-link:hover {
      background-color: #1b5e20;
    }
  </style>
</head>
<body>

<%
  Connection con = DbConnection.connect();
  PreparedStatement pstmt = con.prepareStatement("SELECT * FROM farmer");
  ResultSet rs = pstmt.executeQuery();
%>

<div class="table-card">
  <h2><i class="fas fa-leaf"></i> Registered Farmers</h2>
  <table>
    <thead>
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Location</th>
        <th>Contact</th>
        <th>Email</th>
        <th>Password</th>
        <th>Action</th>
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
          <td>
            <form action="DeleteFarmers" method="post" style="margin: 0;">
              <input type="hidden" name="farmerId" value="<%= rs.getInt(1) %>">
              <button type="submit" class="delete-btn">
                <i class="fas fa-trash-alt"></i> Delete
              </button>
            </form>
          </td>
        </tr>
      <% } %>
    </tbody>
  </table>

  <a href="2_adminDashboard.jsp" class="back-link"><i class="fas fa-arrow-left"></i> Back</a>
</div>

</body>
</html>
