<%@ page import="java.sql.*, com.quizapp.util.DBConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<%
    // User must be logged in
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Start Quiz</title>
 
<style>
body {
    margin: 0;
    background: #e3f2fd;
    font-family: Arial;
}
 
.container {
    padding: 20px;
}
 
.question-box {
    background: white;
    padding: 20px;
    margin-bottom: 25px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
}
 
button {
    padding: 12px 20px;
    background: #1976d2;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}
</style>
 
</head>
<body>
 
<div class="container">
 
    <h2>Quiz</h2>
 
    <form action="../SubmitQuizServlet" method="post">
 
        <%
            int quizId = Integer.parseInt(request.getParameter("id"));
            Connection con = DBConnection.getConnection();
 
            // Fetch questions assigned to this quiz
          String sql =
"SELECT DISTINCT qu.id, qu.question, qu.option1, qu.option2, qu.option3, qu.option4, qu.answer " +
"FROM quiz_questions qq " +
"JOIN questions qu ON qq.question_id = qu.id " +
"WHERE qq.quiz_id = ? " +
"ORDER BY qu.id";
 
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, quizId);
            ResultSet rs = ps.executeQuery();
 
            int qNo = 1;
        %>
 
        <input type="hidden" name="quiz_id" value="<%= quizId %>">
 
        <%
            while (rs.next()) {
        %>
 
        <div class="question-box">
            <h3>Q<%= qNo %>. <%= rs.getString("question") %></h3>
 
            <label>
                <input type="radio" name="q<%= rs.getInt("id") %>" value="A" required>
                <%= rs.getString("option1") %>
            </label><br>
 
            <label>
                <input type="radio" name="q<%= rs.getInt("id") %>" value="B">
                <%= rs.getString("option2") %>
            </label><br>
 
            <label>
                <input type="radio" name="q<%= rs.getInt("id") %>" value="C">
                <%= rs.getString("option3") %>
            </label><br>
 
            <label>
                <input type="radio" name="q<%= rs.getInt("id") %>" value="D">
                <%= rs.getString("option4") %>
            </label><br>
 
        </div>
 
        <%
                qNo++;
            }
        %>
 
        <button type="submit">Submit Quiz</button>
 
    </form>
 
</div>
 
</body>
</html>

 