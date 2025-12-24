<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
 
    Integer score = (Integer) session.getAttribute("latestScore");
    if (score == null) score = 0;
%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz Result</title>
 
<style>
body {
    margin: 0;
    background: #e3f2fd;
    font-family: Arial;
}
 
.container {
    padding: 50px;
    text-align: center;
}
 
.box {
    background: white;
    padding: 40px;
    width: 400px;
    margin: auto;
    border-radius: 12px;
    box-shadow: 0 0 10px rgba(0,0,0,0.2);
}
 
button, a {
    background: #1976d2;
    padding: 12px 20px;
    color: white;
    border-radius: 6px;
    text-decoration: none;
    display: inline-block;
    margin-top: 15px;
}
 
</style>
 
</head>
<body>
 
<div class="container">
 
    <div class="box">
        <h2>Your Score</h2>
        <h1><%= score %></h1>
 
        <a href="userDashboard.jsp">Go to Dashboard</a><br><br>
        <a href="leaderboard.jsp">View Leaderboard</a>
    </div>
 
</div>
 
</body>
</html>
 