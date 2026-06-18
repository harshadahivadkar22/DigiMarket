<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>Farmer Login - DigiMarket</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    body {
      background: linear-gradient(to right, #e8f5e9, #f1f8e9);
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .login-box {
      background: white;
      padding: 40px 30px;
      border-radius: 12px;
      box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
      width: 340px;
      text-align: center;
    }

    h1 {
      color: #2e7d32;
      margin-bottom: 30px;
    }

    label {
      display: block;
      text-align: left;
      margin-bottom: 5px;
      font-weight: 500;
      color: #333;
    }

    input[type="text"] {
      width: 100%;
      padding: 10px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 6px;
      font-size: 14px;
    }

    button {
      width: 100%;
      padding: 10px;
      background-color: #2e7d32;
      color: white;
      border: none;
      font-size: 16px;
      border-radius: 6px;
      cursor: pointer;
    }

    button:hover {
      background-color: #1b5e20;
    }

    a {
      display: inline-block;
      margin-top: 20px;
      color: #2e7d32;
      text-decoration: none;
      font-weight: bold;
    }

    a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>

  <div class="login-box">
    <h1><i class="fas fa-user-gear"></i> Farmer Login</h1>
    <form action="farmerLogin" method="post">
      <label>Email</label>
      <input type="text" name="farmerEmail" required>

      <label>Password</label>
      <input type="text" name="farmerPassword" required>

      <button type="submit">Login</button>

      <a href="1_registerFarmer.html">Don't have an account? Register Here</a>
    </form>
  </div>

</body>
</html>
