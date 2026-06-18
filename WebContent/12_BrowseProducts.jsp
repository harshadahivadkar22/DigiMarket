<%@ page import="java.sql.*" %>
<%@ page import="com.digimarket.DbConnection" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Browse Products</title>
    <style>
        body {
            background: #f1f8e9;
            font-family: Arial, sans-serif;
            padding: 40px;
        }

        h2 {
            color: #2e7d32;
            text-align: center;
        }

        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            background: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #66bb6a;
            color: white;
        }

        tr:hover {
            background-color: #f9fbe7;
        }

        .back-link {
            display: block;
            width: fit-content;
            margin: 20px auto;
            text-decoration: none;
            padding: 10px 15px;
            background-color: #2e7d32;
            color: white;
            border-radius: 6px;
        }

        .back-link:hover {
            background-color: #1b5e20;
        }
    </style>
</head>
<body>
    <h2>Available Products</h2>
    <%
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = DbConnection.connect();
            pstmt = con.prepareStatement("SELECT * FROM products");
            rs = pstmt.executeQuery();
    %>
    <table>
        <tr>
            <th>Product ID</th>
            <th>Farmer ID</th>
            <th>Product Name</th>
            <th>Quantity</th>
            <th>Price per Unit</th>
            <th>Post Date</th>
        </tr>
        <%
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("productId") %></td>
            <td><%= rs.getInt("farmerId") %></td>
            <td><%= rs.getString("productName") %></td>
            <td><%= rs.getString("quantity") %></td>
            <td><%= rs.getDouble("price") %></td>
            <td><%= rs.getString("postDate") %></td>
        </tr>
        <%
            }
        %>
    </table>
    <%
        } catch(Exception e) {
            out.print("<p style='color:red;text-align:center;'>Error: " + e.getMessage() + "</p>");
        } finally {
            try { if (rs != null) rs.close(); } catch(Exception e) {}
            try { if (pstmt != null) pstmt.close(); } catch(Exception e) {}
            try { if (con != null) con.close(); } catch(Exception e) {}
        }
    %>
    <a class="back-link" href="2_buyerDashboard.jsp">Back to Dashboard</a>
</body>
</html>
