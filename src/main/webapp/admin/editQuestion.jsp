<%@ page import="java.sql.*, com.quizapp.util.DBConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Question</title>
 
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
input {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
}
button {
    padding: 12px;
    width: 100%;
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
    <h2>Edit Question</h2>
 
    <div class="form-box">
 
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM questions WHERE id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()) {
        %>
 
        <form action="../UpdateQuestionServlet" method="post">
 
            <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
 
            <label>Question:</label>
            <input type="text" name="question" value="<%= rs.getString("question") %>" required>
 
            <label>Option 1:</label>
            <input type="text" name="opt1" value="<%= rs.getString("option1") %>" required>
 
            <label>Option 2:</label>
            <input type="text" name="opt2" value="<%= rs.getString("option2") %>" required>
 
            <label>Option 3:</label>
            <input type="text" name="opt3" value="<%= rs.getString("option3") %>" required>
 
            <label>Option 4:</label>
            <input type="text" name="opt4" value="<%= rs.getString("option4") %>" required>
 
            <label>Correct Answer:</label>
            <input type="text" name="answer" value="<%= rs.getString("answer") %>" required>
 
            <button type="submit">Update Question</button>
 
        </form>
 
        <% } %>
    </div>
</div>
 
</body>
</html>
 