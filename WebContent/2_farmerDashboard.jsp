<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.digimarket.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>Farmer Dashboard - DigiMarket</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    body {
      background: linear-gradient(to right, #e8f5e9, #f1f8e9);
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      margin: 0;
      padding: 0;
    }

    .header {
      background-color: #2e7d32;
      color: white;
      padding: 20px;
      text-align: center;
      font-size: 26px;
    }

    .dashboard {
      display: flex;
      justify-content: center;
      flex-wrap: wrap;
      gap: 30px;
      margin-top: 60px;
    }

    .card {
      background-color: #fff;
      border-radius: 10px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      width: 240px;
      height: 160px;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      transition: transform 0.2s;
      text-decoration: none;
      color: #2e7d32;
    }

    .card:hover {
      transform: scale(1.05);
    }

    .card i {
      font-size: 36px;
      margin-bottom: 10px;
      color: #388e3c;
    }

    .card span {
      font-size: 18px;
      font-weight: 600;
    }

    .logout {
      margin-top: 50px;
      text-align: center;
    }

    .logout a {
      text-decoration: none;
      background: #c62828;
      color: white;
      padding: 10px 20px;
      border-radius: 6px;
      font-weight: bold;
    }

    .logout a:hover {
      background: #b71c1c;
    }
  </style>
</head>
<body>

  <div class="header">
    <i class="fas fa-tractor"></i> Farmer Dashboard
  </div>

  <div class="dashboard">
    <a href="8_PostProducts.jsp" class="card">
      <i class="fas fa-plus-circle"></i>
      <span>Post Products</span>
    </a>
    <a href="9_ViewOrders.jsp" class="card">
      <i class="fas fa-box-open"></i>
      <span>View Orders</span>
    </a>
    <a href="10_ChangePassword.jsp" class="card">
      <i class="fas fa-key"></i>
      <span>Change Password</span>
    </a>
  </div>

  <div class="logout">
    <a href="../logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
  </div>

</body>
</html>
