
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Review Submitted</title>
    <link rel="stylesheet" type="text/css" href="css/Style1.css">
</head>
<body>
    <h1>Review Submitted</h1>
    <%
        // Retrieve data from the form
        String username = request.getParameter("username");
        int rating = Integer.parseInt(request.getParameter("rating"));
        String feedback = request.getParameter("feedback");

        // Database connection parameters
        String jdbcURL = "jdbc:mysql://localhost:3306/events";
        String dbUser = "root";
        String dbPassword = "Amu@2023";

        try {
            // Connect to the database
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // Create SQL statement to insert the review
            String insertSQL = "INSERT INTO review (username,rating, feedback) VALUES (?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(insertSQL);
            preparedStatement.setString(1, username);
            preparedStatement.setInt(2, rating);
            preparedStatement.setString(3, feedback);

            // Execute the statement
            preparedStatement.executeUpdate();
            // Close the database connection
            connection.close();
            response.sendRedirect("review_page.jsp");
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    %>
    <p>Thank you for your review!</p>
</body>
</html>
