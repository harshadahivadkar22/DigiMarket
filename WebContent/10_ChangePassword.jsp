<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>Change Password - DigiMarket</title>
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

    .card {
      background: #fff;
      padding: 40px 30px;
      border-radius: 12px;
      box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
      width: 360px;
      text-align: center;
    }

    h3 {
      color: #2e7d32;
      margin-bottom: 25px;
      font-size: 22px;
    }

    input[type="password"] {
      width: 100%;
      padding: 10px;
      margin: 10px 0 20px 0;
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

    .message {
      margin-top: 10px;
      font-size: 14px;
    }

    .success { color: green; }
    .error { color: red; }

    a {
      display: inline-block;
      margin-top: 15px;
      color: #2e7d32;
      text-decoration: none;
    }

    a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>

  <div class="card">
    <h3><i class="fas fa-key"></i> Change Password</h3>

    <%
  String msg = request.getParameter("msg");
  if (msg != null) {
%>
  <div style="color: red; text-align: center; font-weight: bold;">
    <%
      if ("success".equals(msg)) { out.print("Password updated successfully."); }
      else if ("wrong_old_password".equals(msg)) { out.print("Incorrect old password."); }
      else if ("update_failed".equals(msg)) { out.print("Password update failed."); }
      else if ("no_farmer_found".equals(msg)) { out.print("Farmer not found."); }
      else { out.print("Something went wrong."); }
    %>
  </div>
<% } %>


    <form action="ChangePasswordFarmer" method="post">
      <input type="password" name="oldPassword" placeholder="Old Password" required>
      <input type="password" name="newPassword" placeholder="New Password" required>
      <button type="submit" name="submit-btn">Update Password</button>
    </form>

    <a href="2_farmerDashboard.jsp"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
  </div>

</body>
</html>
