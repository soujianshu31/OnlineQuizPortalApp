<%@ page import="java.sql.*, com.quizapp.util.DBConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Assign Questions To Quiz</title>
 
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
    padding: 10px;
    text-align: left;
}
 
table th {
    background: #1976d2;
    color: white;
}
 
button {
    padding: 12px;
    background: #1976d2;
    border: none;
    color: white;
    border-radius: 5px;
    cursor: pointer;
    margin-top: 20px;
}
</style>
 
</head>
<body>
 
<jsp:include page="dashboard.jsp"></jsp:include>
 
<div class="container">
    
    <h2>Assign Questions to Quiz</h2>
 
    <form action="../AssignQuestionsServlet" method="post">
 
        <%
            int quizId = Integer.parseInt(request.getParameter("id"));
        %>
 
        <input type="hidden" name="quiz_id" value="<%= quizId %>">
 
        <table>
            <tr>
                <th>Select</th>
                <th>Question</th>
                <th>Option-1</th>
                <th>Option-2</th>
                <th>Option-3</th>
                <th>Option-4</th>
                <th>Correct</th>
            </tr>
 
            <%
                Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement("SELECT * FROM questions");
                ResultSet rs = ps.executeQuery();
 
                while(rs.next()) {
            %>
 
            <tr>
                <td><input type="checkbox" name="question_ids" value="<%= rs.getInt("id") %>"></td>
                <td><%= rs.getString("question") %></td>
                <td><%= rs.getString("option1") %></td>
                <td><%= rs.getString("option2") %></td>
                <td><%= rs.getString("option3") %></td>
                <td><%= rs.getString("option4") %></td>
                <td><%= rs.getString("answer") %></td>
            </tr>
 
            <% } %>
 
        </table>
 
        <button type="submit">Assign Selected Questions</button>
    </form>
</div>
 
</body>
</html>
 