<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Change Buyer Password</title>
  <style>
    :root {
      --primary-color: #2e7d32;
      --primary-dark: #1b5e20;
      --bg-color: #f1f8e9;
      --text-color: #333;
      --card-radius: 10px;
      --box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
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

    .card {
      background-color: #fff;
      padding: 30px 40px;
      border-radius: var(--card-radius);
      box-shadow: var(--box-shadow);
      width: 400px;
      text-align: center;
    }

    h3 {
      color: var(--primary-color);
      margin-bottom: 25px;
    }

    input[type="password"] {
      width: 100%;
      padding: 12px;
      margin: 10px 0;
      font-size: 15px;
      border: 1px solid #ccc;
      border-radius: 8px;
    }

    .submit-btn {
      background-color: var(--primary-color);
      color: white;
      border: none;
      padding: 12px 20px;
      font-size: 16px;
      border-radius: 8px;
      cursor: pointer;
      margin-top: 15px;
      transition: background-color 0.3s ease;
    }

    .submit-btn:hover {
      background-color: var(--primary-dark);
    }

    a {
      display: inline-block;
      margin-top: 20px;
      text-decoration: none;
      color: var(--primary-color);
      font-weight: bold;
    }

    a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
  <div id="buyerPassword" class="card">
    <h3>Change Password</h3>
    <form action="ChangePasswordBuyer" method="post">
      <input type="password" name="oldPassword" placeholder="Old Password" required>
      <br>
      <input type="password" name="newPassword" placeholder="New Password" required>
      <br>
      <button type="submit" class="submit-btn">Update Password</button>
      <br>
      <a href="2_buyerDashboard.jsp">Back</a>
    </form>
  </div>
</body>
</html>
