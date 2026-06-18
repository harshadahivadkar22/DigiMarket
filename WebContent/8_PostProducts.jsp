<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.digimarket.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Post Product - Farmer</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background: linear-gradient(to right, #f1f8e9, #e0f7fa);
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }
    .form-container {
      background: #ffffff;
      padding: 35px 40px;
      border-radius: 15px;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
      width: 420px;
      text-align: center;
    }
    h2 {
      color: #2e7d32;
      margin-bottom: 25px;
      font-size: 26px;
    }
    input[type="text"], input[type="number"], input[type="date"] {
      width: 100%;
      padding: 12px;
      margin: 10px 0;
      border: 1px solid #ccc;
      border-radius: 8px;
      font-size: 15px;
    }
    input[type="submit"] {
      margin-top: 15px;
      width: 100%;
      padding: 12px;
      background-color: #388e3c;
      border: none;
      color: white;
      font-size: 17px;
      font-weight: bold;
      border-radius: 8px;
      cursor: pointer;
    }
    input[type="submit"]:hover {
      background-color: #2e7d32;
    }
    a {
      display: inline-block;
      margin-top: 15px;
      color: #2e7d32;
      font-size: 14px;
      text-decoration: none;
    }
    a:hover {
      text-decoration: underline;
      color: #1b5e20;
    }
  </style>
</head>
<body>
  <div class="form-container">
    <h2><i class="fas fa-box"></i> Post New Product</h2>
    <form action="PostProduct" method="post">
      <input type="text" name="productName" placeholder="Product Name" required>
      <input type="number" name="quantity" placeholder="Quantity" required>
      <input type="number" name="price" step="0.01" placeholder="Price per unit" required>
      <input type="date" name="postDate" required>
      <input type="submit" value="Post Product">
    </form>
    <a href="2_farmerDashboard.jsp"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
  </div>
</body>
</html>
