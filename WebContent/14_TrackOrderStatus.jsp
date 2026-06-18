<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Track Orders - DigiMarket</title>
  <style>
    :root {
      --primary-color: #2e7d32;
      --light-green: #e8f5e9;
      --table-bg: #ffffff;
      --hover-bg: #f1f8e9;
      --text-color: #333;
      --border-radius: 10px;
      --box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
    }

    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: var(--hover-bg);
      margin: 0;
      padding: 30px;
      color: var(--text-color);
    }

    h2 {
      text-align: center;
      color: var(--primary-color);
      margin-bottom: 30px;
      font-size: 28px;
    }

    .order-table-container {
      max-width: 90%;
      margin: auto;
      background-color: var(--table-bg);
      border-radius: var(--border-radius);
      box-shadow: var(--box-shadow);
      overflow-x: auto;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      border-radius: var(--border-radius);
      overflow: hidden;
    }

    th, td {
      padding: 14px;
      text-align: center;
      font-size: 15px;
    }

    th {
      background-color: var(--primary-color);
      color: white;
      font-weight: 600;
    }

    tr:nth-child(even) {
      background-color: #f9f9f9;
    }

    tr:hover {
      background-color: var(--light-green);
    }

    .no-orders {
      text-align: center;
      padding: 20px;
      color: #777;
      font-style: italic;
    }

    a {
      display: block;
      width: fit-content;
      margin: 30px auto 0;
      padding: 10px 18px;
      text-decoration: none;
      background-color: var(--primary-color);
      color: white;
      border-radius: 6px;
      font-weight: bold;
      transition: background 0.3s ease;
    }

    a:hover {
      background-color: #1b5e20;
    }
  </style>
</head>
<body>
  <h2><i class="fas fa-history"></i> Your Order History</h2>
  <div class="order-table-container">
    <table>
      <tr>
        <th>Order ID</th>
        <th>Buyer ID</th>
        <th>Product ID</th>
        <th>Quantity</th>
        <th>Order Date</th>
        <th>Status</th>
      </tr>
      <%
        ResultSet rs = (ResultSet) request.getAttribute("orderResultSet");
        boolean hasData = false;
        if (rs != null) {
          while (rs.next()) {
            hasData = true;
      %>
        <tr>
          <td><%= rs.getInt("orderId") %></td>
          <td><%= rs.getInt("buyerId") %></td>
          <td><%= rs.getInt("productId") %></td>
          <td><%= rs.getInt("quantityOrdered") %></td>
          <td><%= rs.getTimestamp("orderDate") %></td>
          <td><%= rs.getString("status") %></td>
        </tr>
      <%
          }
        }
        if (!hasData) {
      %>
        <tr>
          <td colspan="6" class="no-orders">No orders placed yet.</td>
        </tr>
      <%
        }
      %>
    </table>
  </div>
  <a href="2_buyerDashboard.jsp"> Back to Dashboard</a>
</body>
</html>
