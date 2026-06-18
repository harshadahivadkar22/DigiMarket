<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Place Order - Buyer</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    :root {
      --primary-color: #2e7d32;
      --primary-dark: #1b5e20;
      --secondary-color: #e8f5e9;
      --text-color: #333;
      --bg-color: #f1f8e9;
      --border-radius: 12px;
      --box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
    }

    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: var(--bg-color);
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }

    .form-container {
      background-color: #fff;
      padding: 40px 30px;
      border-radius: var(--border-radius);
      box-shadow: var(--box-shadow);
      width: 420px;
      position: relative;
    }

    h2 {
      text-align: center;
      color: var(--primary-color);
      margin-bottom: 30px;
      font-size: 26px;
    }

    .form-container i {
      margin-right: 10px;
    }

    .form-group {
      margin-bottom: 18px;
    }

    label {
      font-size: 15px;
      color: var(--text-color);
      margin-bottom: 6px;
      display: block;
    }

    input[type="text"],
    input[type="number"] {
      width: 100%;
      padding: 12px 14px;
      border: 1px solid #ccc;
      border-radius: var(--border-radius);
      font-size: 15px;
      background-color: #fdfdfd;
    }

    input[type="submit"] {
      width: 100%;
      padding: 14px;
      background-color: var(--primary-color);
      color: white;
      font-size: 16px;
      font-weight: bold;
      border: none;
      border-radius: var(--border-radius);
      cursor: pointer;
      transition: background-color 0.3s ease;
      margin-top: 10px;
    }

    input[type="submit"]:hover {
      background-color: var(--primary-dark);
    }

    a {
      display: inline-block;
      margin-top: 20px;
      text-align: center;
      color: var(--primary-color);
      font-size: 15px;
      text-decoration: none;
      padding: 8px 12px;
      border-radius: 6px;
      transition: background-color 0.2s;
    }

    a:hover {
      background-color: var(--secondary-color);
    }

    ::placeholder {
      color: #aaa;
      font-size: 14px;
    }
  </style>
</head>
<body>
  <div class="form-container">
    <h2><i class="fas fa-shopping-cart"></i> Place Order</h2>
    <form action="PlaceOrder" method="post">
      <div class="form-group">
        <label for="productId"><i class="fas fa-box"></i> Product ID</label>
        <input type="number" name="productId" id="productId" placeholder="Enter product ID" required>
      </div>
      <div class="form-group">
        <label for="quantity"><i class="fas fa-sort-numeric-up"></i> Quantity</label>
        <input type="number" name="quantity" id="quantity" placeholder="Enter quantity (kg/unit)" required>
      </div>
      <input type="submit" value="Place Order">
    </form>
    <a href="2_buyerDashboard.jsp"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
  </div>
</body>
</html>
