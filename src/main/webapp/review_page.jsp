<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Event Reviews</title>
    <style>
    body {
		font-family: Arial, sans-serif;
		margin: 0;
		padding: 0;
		background-color: pink;
	}
	
	h1,
	h2 {
		text-align: center;
	}
	
	.reviews {
		max-width: 800px;
		margin: 0 auto;
	}
	
	.review {
		border: 1px solid #ddd;
		padding: 10px;
		margin: 10px 0;
	}
	
	.review-form {
		max-width: 800px;
		margin: 20px auto;
		padding: 20px;
		border: 1px solid #ddd;
	}
   </style>
</head>
<body>
    <h1>Event Reviews</h1>
    <div class="reviews">
        <% 
            String jdbcURL = "jdbc:mysql://localhost:3306/events";
            String dbUser = "root";
            String dbPassword = "Amu@2023";
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
                
                String selectQuery = "SELECT username,rating,feedback FROM review";
                PreparedStatement preparedStatement = connection.prepareStatement(selectQuery);
                ResultSet resultSet = preparedStatement.executeQuery();
                
                while(resultSet.next()) {
                    String username = resultSet.getString("username");
                    int userrating = resultSet.getInt("rating");
                    String userReview = resultSet.getString("feedback");
                    
        %>
                    <div class="review">
                    <div class="name" style="display:flex;">
					    <h4>Name:</h4>
					    <h4><%= username %></h4>
					</div>
					<h4>Rating:</h4>
					    <div class="star-rating">
					        <%-- Use a loop to display the stars based on the rating --%>
					        <% for (int i = 1; i <= userrating; i++) { %>
					            <span class="star">&#9733;</span>
					        <% } %>
					    </div>
					    <h4>Feedback</h4>
					    <p><%= userReview %></p>
					</div>
        <%
                }
                
                resultSet.close();
                preparedStatement.close();
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
                out.println("An error occurred.");
            }
        %>
    </div>
</body>
</html>
