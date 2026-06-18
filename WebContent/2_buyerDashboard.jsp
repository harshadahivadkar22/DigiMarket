<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>Buyer Dashboard - DigiMarket</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    body {
      background: linear-gradient(to right, #f1f8e9, #e8f5e9);
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

    .back {
      margin: 50px auto 30px;
      text-align: center;
    }

    .back a {
      text-decoration: none;
      background: #1565c0;
      color: white;
      padding: 10px 20px;
      border-radius: 6px;
      font-weight: bold;
    }

    .back a:hover {
      background: #0d47a1;
    }
  </style>
</head>
<body>

  <div class="header">
    <i class="fas fa-store"></i> Buyer Dashboard
  </div>

  <div class="dashboard">
    <a href="12_BrowseProducts.jsp" class="card">
      <i class="fas fa-seedling"></i>
      <span>Browse Products</span>
    </a>
    <a href="13_PlaceOrders.jsp" class="card">
      <i class="fas fa-cart-plus"></i>
      <span>Place Orders</span>
    </a>
    <a href="14_TrackOrderStatus.jsp" class="card">
      <i class="fas fa-truck"></i>
      <span>Track Order</span>
    </a>
    <a href="15_ChangePassword.jsp" class="card">
      <i class="fas fa-key"></i>
      <span>Change Password</span>
    </a>
  </div>

  <div class="back">
    <a href="index.html"><i class="fas fa-arrow-left"></i> Back</a>
  </div>

</body>
</html>
