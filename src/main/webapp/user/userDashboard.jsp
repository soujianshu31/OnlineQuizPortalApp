<%@ page import="java.sql.*, com.quizapp.util.DBConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<%
    // if user is not logged in
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>
 
<style>
body {
    margin: 0;
    background: #e3f2fd;
    font-family: Arial;
}
 
/* TOP NAVIGATION BAR */
.navbar {
    background: #1976d2;
    padding: 15px;
    color: white;
    display: flex;
    justify-content: space-between;
}
.navbar a {
    color: white;
    text-decoration: none;
    margin-left: 20px;
}
 
/* MAIN CONTENT */
.container {
    padding: 20px;
}
 
.quiz-card {
    background: white;
    padding: 15px;
    border-radius: 10px;
    width: 600px;
    margin-bottom: 20px;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
}
 
.start-btn {
    background: #1976d2;
    color: white;
    padding: 10px 15px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    text-decoration: none;
}
 
</style>
 
</head>
<body>
 
<!-- NAVBAR -->
<div class="navbar">
    <div>Welcome, <%= session.getAttribute("userName") %></div>
 
    <div>
        <a href="userDashboard.jsp">Dashboard</a>
        <a href="leaderboard.jsp">Leaderboard</a>
        <a href="profile.jsp">Profile</a>
        <a href="../LogoutServlet">Logout</a>
    </div>
</div>
 
<div class="container">
 
    <h2>Available Quizzes</h2>
 
    <%
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM quiz");
        ResultSet rs = ps.executeQuery();
 
        while (rs.next()) {
    %>
 
    <div class="quiz-card">
        <h3><%= rs.getString("title") %></h3>
        <p><%= rs.getString("description") %></p>
        <a class="start-btn" href="startQuiz.jsp?id=<%= rs.getInt("id") %>">Start Quiz</a>
    </div>
 
    <% } %>
 
</div>
 
</body>
</html>
 