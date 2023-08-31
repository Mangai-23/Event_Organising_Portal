<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Submit a Review</title>
    <link rel="stylesheet" type="text/css" href="css/Style1.css">
    <style>
        /* Add custom CSS for the star rating */
        .star-rating {
            display: inline-block;
            font-size: 30px;
            margin-right: 10px;
        }
        .star-rating input[type="radio"] {
            display: none;
        }
        .star-rating label {
            cursor: pointer;
            position: relative;
            padding-left: 35px;
            color: #FFD700;
        }
        .star-rating label:before {
            content: "\2605";
            position: absolute;
            left: 0;
            font-size: 30px;
        }
        .star-rating label:hover:before,
        .star-rating label:hover ~ label:before,
        .star-rating input[type="radio"]:checked ~ label:before {
            content: "\2605";
            color: #FFD700;
        }
    </style>
</head>
<body>
    <h1>Submit a Review</h1>
    <form action="submit_review.jsp" method="post">
    	<input type="text" name="username" placeholder="Your Name" required>
        <p>Rate our service:</p>
        <div class="star-rating">
            <input type="radio" id="star5" name="rating" value="5" />
            <label for="star5">Excellent</label>
            
            <input type="radio" id="star4" name="rating" value="4" />
            <label for="star4">Very Good</label>
            
            <input type="radio" id="star3" name="rating" value="3" />
            <label for="star3">Good</label>
            
            <input type="radio" id="star2" name="rating" value="2" />
            <label for="star2">Fair</label>
            
            <input type="radio" id="star1" name="rating" value="1" />
            <label for="star1">Poor</label>
        </div>
        <p>Leave your feedback:</p>
        <textarea name="feedback" rows="4" cols="50"></textarea>
        <br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
