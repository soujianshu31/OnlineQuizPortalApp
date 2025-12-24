<%@ page import="java.sql.*, com.quizapp.util.DBConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz List</title>
 
<style>
body {
    margin: 0;
    background: #f5f5f5;
    font-family: Arial;
}
 
.container {
    margin-left: 250px;
    padding: 20px;
}
 
table {
    width: 100%;
    background: white;
    border-collapse: collapse;
    font-size: 15px;
}
 
table th, table td {
    border: 1px solid #ddd;
    padding: 12px;
    text-align: left;
}
 
table th {
    background: #1976d2;
    color: white;
}
 
.action-icons a {
    font-size: 18px;
    text-decoration: none;
    margin-right: 15px;
}
</style>
 
</head>
<body>
 
<jsp:include page="dashboard.jsp"></jsp:include>
 
<div class="container">
    
    <h2>Quiz List</h2>
 
    <table>
        <tr>
            <th>Sr No</th>
            <th>Quiz Title</th>
            <th>Description</th>
            <th>Total Questions</th>
            <th>Action</th>
        </tr>
 
        <%
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM quiz ORDER BY id ASC";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            int count = 1;
 
            while(rs.next()) {
        %>
 
        <tr>
            <td><%= count++ %></td>
            <td><%= rs.getString("title") %></td>
            <td><%= rs.getString("description") %></td>
            <td><%= rs.getInt("total_questions") %></td>
 
            <td class="action-icons">
                <a href="editQuiz.jsp?id=<%= rs.getInt("id") %>">✏</a>
                <a href="../DeleteQuizServlet?id=<%= rs.getInt("id") %>" 
                   onclick="return confirm('Delete this quiz?');">🗑</a>
                <a href="assignQuestions.jsp?id=<%= rs.getInt("id") %>">➕</a>
            </td>
        </tr>
 
        <% } %>
    </table>
 
</div>
 
</body>
</html>
 