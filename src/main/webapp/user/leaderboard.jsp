<%@ page import="java.sql.*, com.quizapp.util.DBConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Leaderboard</title>
 
<style>
body {
    margin: 0;
    background: #e3f2fd;
    font-family: Arial;
}
 
.container {
    padding: 20px;
}
 
table {
    width: 100%;
    background: white;
    border-collapse: collapse;
    margin-top: 20px;
}
 
table th, table td {
    border: 1px solid #ccc;
    padding: 12px;
    text-align: left;
}
 
table th {
    background: #1976d2;
    color: white;
}
</style>
 
</head>
<body>
 
<div class="container">
 
    <h2>Leaderboard</h2>
 
    <table>
        <tr>
            <th>Rank</th>
            <th>User Name</th>
            <th>Quiz Title</th>
            <th>Score</th>
        </tr>
 
        <%
            Connection con = DBConnection.getConnection();
 
            // Query for joining results + users + quiz table
            String sql = "SELECT u.name AS username, q.title AS quizname, r.score AS score "
                       + "FROM results r "
                       + "JOIN users u ON r.user_id = u.id "
                       + "JOIN quiz q ON r.quiz_id = q.id "
                       + "ORDER BY r.score DESC";
 
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
 
            int rank = 1;
            while (rs.next()) {
        %>
 
        <tr>
            <td><%= rank++ %></td>
            <td><%= rs.getString("username") %></td>
            <td><%= rs.getString("quizname") %></td>
            <td><%= rs.getInt("score") %></td>
        </tr>
 
        <% } %>
    </table>
 
</div>
 
</body>
</html>
 