<%@ page import="com.digimarket.*" %>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
  int buyerId = GetSet_buyerId.getBuyerId();
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>My Orders - Buyer</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(to right, #f1f8e9, #e8f5e9);
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
    .table-card {
      max-width: 90%;
      margin: 40px auto;
      background-color: #fff;
      border-radius: 10px;
      padding: 25px;
      box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
    }
    h2 {
      text-align: center;
      color: #2e7d32;
      margin-bottom: 20px;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 15px;
    }
    th, td {
      padding: 12px 15px;
      text-align: center;
      border-bottom: 1px solid #ccc;
    }
    th {
      background-color: #c8e6c9;
      color: #1b5e20;
    }
    tr:hover {
      background-color: #f1f8e9;
    }
    .error-row {
      text-align: center;
      color: red;
      font-weight: bold;
    }
  </style>
</head>
<body>

  <div class="header">
    <i class="fas fa-clipboard-list"></i> My Orders
  </div>

  <div class="table-card">
    <table>
      <thead>
        <tr>
          <th>Order ID</th>
          <th>Product ID</th>
          <th>Quantity</th>
          <th>Date</th>
          <th>Status</th>
        </tr>
      </thead>
      <tbody>
        <%
          Connection con1 = null;
          PreparedStatement pstmt = null;
          ResultSet rs1 = null;

          try {
              con1 = DbConnection.connect();
              pstmt = con1.prepareStatement("SELECT * FROM orders WHERE buyerId = ?");
              pstmt.setInt(1, buyerId);
              rs1 = pstmt.executeQuery();
              boolean found = false;

              while(rs1.next()) {
                  found = true;
        %>
        <tr>
          <td><%= rs1.getInt("orderId") %></td>
          <td><%= rs1.getInt("productId") %></td>
          <td><%= rs1.getInt("quantityOrdered") %></td>
          <td><%= rs1.getTimestamp("orderDate") %></td>
          <td><%= rs1.getString("status") %></td>
        </tr>
        <% } 
            if (!found) {
        %>
        <tr>
          <td colspan="5" class="error-row">No orders found.</td>
        </tr>
        <%
            }
          } catch(Exception e) {
            e.printStackTrace();
        %>
        <tr>
          <td colspan="5" class="error-row">Error loading orders.</td>
        </tr>
        <%
          } finally {
            try { if (rs1 != null) rs1.close(); } catch (Exception ex) {}
            try { if (pstmt != null) pstmt.close(); } catch (Exception ex) {}
            try { if (con1 != null) con1.close(); } catch (Exception ex) {}
          }
        %>
      </tbody>
    </table>
  </div>

</body>
</html>
