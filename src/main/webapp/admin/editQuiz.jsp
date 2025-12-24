<%@ page import="java.sql.*, com.quizapp.util.DBConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Quiz</title>
 
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
.form-box {
    background: white;
    padding: 20px;
    width: 600px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
}
input, textarea {
    width: 100%;
    padding: 12px;
    margin: 10px 0;
    border-radius: 5px;
    border: 1px solid #ddd;
}
button {
    width: 100%;
    padding: 12px;
    background: #1976d2;
    border: none;
    border-radius: 5px;
    color: white;
    font-size: 16px;
    cursor: pointer;
}
</style>
 
</head>
<body>
 
<jsp:include page="dashboard.jsp"></jsp:include>
 
<div class="container">
 
    <h2>Edit Quiz</h2>
 
    <div class="form-box">
 
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM quiz WHERE id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
 
            if(rs.next()) {
        %>
 
        <form action="../UpdateQuizServlet" method="post">
 
            <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
 
            <label>Quiz Title:</label>
            <input type="text" name="title" value="<%= rs.getString("title") %>" required>
 
            <label>Description:</label>
            <textarea name="description" required><%= rs.getString("description") %></textarea>
 
            <button type="submit">Update Quiz</button>
        </form>
 
        <% } %>
 
    </div>
 
</div>
 
</body>
</html>