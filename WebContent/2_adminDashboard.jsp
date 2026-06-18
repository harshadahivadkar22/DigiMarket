<!-- Folder: DigiMarket/WebContent/02_Admin/2_adminDashboard.jsp -->
<%@ page language="java" session="true" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>Admin Dashboard - DigiMarket</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      margin: 0;
      padding: 0;
      background: linear-gradient(to right, #e8f5e9, #f1f8e9);
    }
    .header {
      background-color: #2e7d32;
      color: white;
      padding: 20px;
      text-align: center;
    }
    .header h1 {
      margin: 0;
      font-size: 28px;
    }
    .dashboard {
      padding: 30px;
      display: flex;
      justify-content: space-around;
      flex-wrap: wrap;
    }
    .card {
      background-color: white;
      border-radius: 12px;
      padding: 25px;
      width: 250px;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
      margin: 15px;
      text-align: center;
      transition: transform 0.3s ease;
    }
    .card:hover {
      transform: scale(1.05);
    }
    .card i {
      font-size: 36px;
      color: #388e3c;
      margin-bottom: 15px;
    }
    .card h3 {
      margin: 10px 0 5px 0;
      font-size: 20px;
      color: #2e7d32;
    }
    .card p {
      font-size: 14px;
      color: #555;
    }
    .logout {
      margin-top: 30px;
      text-align: center;
    }
    .logout a {
      color: #c62828;
      text-decoration: none;
      font-weight: bold;
      font-size: 16px;
    }
  </style>
</head>
<body>
  <div class="header">
    <h1>Welcome, <%= session.getAttribute("adminName") != null ? session.getAttribute("adminName") : "Admin" %>!</h1>
  </div>
   
   <div class="dashboard">
    <div class="card">
      <i class="fas fa-users"></i>
      <h3><a href="3_AddFarmers.jsp" class="role-card">Add Farmers</a></h3>
      <p>Add farmers</p>
    </div>
  <div class="dashboard">
    <div class="card">
      <i class="fas fa-users"></i>
      <h3><a href="4_ViewFarmers.jsp" class="role-card">View/Delete Farmers</a></h3>
      <p>Manage registered farmer details and delete the not required</p>
    </div>
    
    <div class="card">
      <i class="fas fa-user-tie"></i>
      <h3><a href="6_ViewBuyers.jsp" class="role-card">View Buyers</a></h3>
      <p>Manage registered buyer details</p>
    </div>
    <div class="card">
      <i class="fas fa-shopping-bag"></i>
      <h3><a href="7_ManageProducts.jsp" class="role-card"> Manage Products</h3>
      <p>Manage all the Products</p>
    </div>
  </div>

  <div class="logout">
    <a href="Logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
  </div>
</body>
</html>



