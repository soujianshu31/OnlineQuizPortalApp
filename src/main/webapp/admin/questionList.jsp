<%@ page import="java.sql.*, com.quizapp.util.DBConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Question List</title>
 
<style>
body {
    margin: 0;
    font-family: Arial;
    background: #f5f5f5;
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
    padding: 10px;
    text-align: left;
}
 
table th {
    background: #1976d2;
    color: white;
}
 
.action-icons a {
    margin-right: 10px;
    font-size: 18px;
    text-decoration: none;
}
</style>
 
</head>
<body>
 
<jsp:include page="dashboard.jsp"></jsp:include>
 
<div class="container">
    <h2>Question List</h2>
 
    <table>
        <tr>
            <th>Sr No.</th>
            <th>Question</th>
            <th>Option-1</th>
            <th>Option-2</th>
            <th>Option-3</th>
            <th>Option-4</th>
            <th>Correct Option</th>
            <th>Action</th>
        </tr>
 
        <%
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM questions ORDER BY id ASC";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            int count = 1;
 
            while(rs.next()) {
        %>
 
        <tr>
            <td><%= count++ %></td>
            <td><%= rs.getString("question") %></td>
            <td><%= rs.getString("option1") %></td>
            <td><%= rs.getString("option2") %></td>
            <td><%= rs.getString("option3") %></td>
            <td><%= rs.getString("option4") %></td>
            <td><%= rs.getString("answer") %></td>
            <td class="action-icons">
                <a href="editQuestion.jsp?id=<%= rs.getInt("id") %>">✏</a>
                <a href="../DeleteQuestionServlet?id=<%= rs.getInt("id") %>" 
                   onclick="return confirm('Delete this question?');">🗑</a>
            </td>
        </tr>
 
        <% } %>
    </table>
 
</div>
 
</body>
</html>
 