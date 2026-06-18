<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>Register Farmer - DigiMarket</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    body {
      background: linear-gradient(to right, #f1f8e9, #e0f7fa);
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .register-box {
      background: #fff;
      padding: 40px 35px;
      border-radius: 15px;
      box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
      width: 450px;
    }

    h2 {
      color: #2e7d32;
      margin-bottom: 25px;
      font-size: 26px;
      text-align: center;
    }

    form {
      display: flex;
      flex-direction: column;
    }

    .icon-label {
      font-size: 14px;
      color: #333;
      margin: 10px 0 5px 5px;
      text-align: left;
    }

    input[type="text"], input[type="password"], input[type="email"] {
      padding: 12px;
      border-radius: 8px;
      border: 1px solid #ccc;
      font-size: 16px;
      margin-bottom: 15px;
      outline: none;
      transition: 0.3s;
    }

    input[type="text"]:focus, input[type="password"]:focus, input[type="email"]:focus {
      border-color: #66bb6a;
      box-shadow: 0 0 5px rgba(102, 187, 106, 0.5);
    }

    input[type="submit"] {
      background-color: #388e3c;
      color: white;
      padding: 12px;
      font-size: 17px;
      font-weight: bold;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      transition: 0.3s;
    }

    input[type="submit"]:hover {
      background-color: #2e7d32;
    }

    a {
      display: block;
      text-align: center;
      margin-top: 20px;
      color: #388e3c;
      text-decoration: none;
      font-weight: bold;
    }

    a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
  <div class="register-box">
    <h2><i class="fas fa-tractor"></i> Add Farmers</h2>
    <form action="AddFarmer_Admin" method="post">

      <div class="icon-label"><i class="fas fa-user"></i> Farmer Name</div>
      <input type="text" name="farmerName" placeholder="Enter your name" required>

      <div class="icon-label"><i class="fas fa-map-marker-alt"></i> Farmer Location</div>
      <input type="text" name="farmerLocation" placeholder="Village/City" required>

      <div class="icon-label"><i class="fas fa-phone"></i> Farmer Contact</div>
      <input type="text" name="farmerContact" placeholder="Mobile number" required>

      <div class="icon-label"><i class="fas fa-envelope"></i> Farmer Email</div>
      <input type="email" name="farmerEmail" placeholder="Enter your email" required>

      <div class="icon-label"><i class="fas fa-lock"></i> Farmer Password</div>
      <input type="password" name="farmerPassword" placeholder="Create a password" required>

      <input type="submit" value="Add Farmer">
    </form>

    <a href="2_adminDashboard.jsp"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
  </div>
</body>
</html>
