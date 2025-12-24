<%@ page import="java.sql.*, com.quizapp.util.DBConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
 
    int userId = (int) session.getAttribute("userId");
 
    Connection con = DBConnection.getConnection();
 
    // Fetch user info
    PreparedStatement psUser = con.prepareStatement("SELECT * FROM users WHERE id=?");
    psUser.setInt(1, userId);
    ResultSet rsUser = psUser.executeQuery();
    rsUser.next();  // we know one row exists
 
    // Total quizzes attempted
    PreparedStatement psCount = con.prepareStatement("SELECT COUNT(*) FROM results WHERE user_id=?");
    psCount.setInt(1, userId);
    ResultSet rsCount = psCount.executeQuery();
    rsCount.next();
    int totalAttempts = rsCount.getInt(1);
 
    // Highest score
    PreparedStatement psBest = con.prepareStatement("SELECT MAX(score) FROM results WHERE user_id=?");
    psBest.setInt(1, userId);
    ResultSet rsBest = psBest.executeQuery();
    rsBest.next();
    int bestScore = rsBest.getInt(1);
%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>
 
<style>
body {
    margin: 0;
    background: #e3f2fd;
    font-family: Arial;
}
 
.container {
    padding: 40px;
    width: 500px;
    margin: auto;
}
 
.box {
    background: white;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 0 10px rgba(0,0,0,0.2);
}
 
h2 {
    text-align: center;
    margin-bottom: 20px;
}
 
.label {
    font-weight: bold;
}
 
.info {
    margin-bottom: 15px;
    font-size: 18px;
}
</style>
 
</head>
<body>
 
<div class="container">
 
    <div class="box">
        <h2>User Profile</h2>
 
        <div class="info">
            <span class="label">Name:</span>
            <%= rsUser.getString("name") %>
        </div>
 
        <div class="info">
            <span class="label">Email:</span>
            <%= rsUser.getString("email") %>
        </div>
 
        <div class="info">
            <span class="label">Total Quizzes Attempted:</span>
            <%= totalAttempts %>
        </div>
 
        <div class="info">
            <span class="label">Highest Score:</span>
            <%= bestScore %>
        </div>
 
    </div>
 
</div>
 
</body>
</html>
 