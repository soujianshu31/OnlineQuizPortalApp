<%@ page import="java.sql.*, com.quizapp.util.DBConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
 
    // Determine quizId: prefer request param, else fallback to session-stored lastQuizId
    int quizId = 0;
    if (request.getParameter("id") != null) {
        quizId = Integer.parseInt(request.getParameter("id"));
    } else if (session.getAttribute("lastQuizId") != null) {
        quizId = Integer.parseInt(session.getAttribute("lastQuizId").toString());
    } else {
        // nothing to review
        out.println("<p>No quiz found to review.</p>");
        return;
    }
%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz Review</title>
 
<style>
body {
    background: #e3f2fd;
    font-family: Arial, sans-serif;
}
.container {
    width: 85%;
    margin: 20px auto;
}
.question-box {
    background: white;
    padding: 18px;
    margin-bottom: 14px;
    border-radius: 10px;
    box-shadow: 0 0 6px rgba(0,0,0,0.08);
}
.option {
    padding: 10px;
    border-radius: 6px;
    margin-bottom: 8px;
}
.correct {
    background-color: #c8ffc8; /* green */
}
.wrong {
    background-color: #ffb3b3; /* red */
}
.meta {
    font-size: 14px;
    color: #555;
    margin-bottom: 10px;
}
.topbar {
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom: 18px;
}
.btn {
    background:#1976d2;
    color:white;
    padding:8px 12px;
    border-radius:6px;
    text-decoration:none;
}
</style>
 
</head>
<body>
 
<div class="container">
    <div class="topbar">
        <h2>Quiz Review</h2>
        <div>
            <a class="btn" href="userDashboard.jsp">Back to Dashboard</a>
        </div>
    </div>
 
    <%
        Connection con = DBConnection.getConnection();
 
        // fetch quiz title for header (optional)
        PreparedStatement psQuiz = con.prepareStatement("SELECT title FROM quiz WHERE id = ?");
        psQuiz.setInt(1, quizId);
        ResultSet rsQuiz = psQuiz.executeQuery();
        if (rsQuiz.next()) {
    %>
        <div class="meta">Quiz: <strong><%= rsQuiz.getString("title") %></strong></div>
    <%
        }
 
        // Fetch questions assigned to this quiz (in insertion order)
        String sql = "SELECT q.* FROM questions q "
                   + "JOIN quiz_questions qq ON q.id = qq.question_id "
                   + "WHERE qq.quiz_id = ? ORDER BY qq.id ASC";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, quizId);
        ResultSet rs = ps.executeQuery();
 
        int qNo = 1;
        while (rs.next()) {
            int qid = rs.getInt("id");
            String correct = rs.getString("answer");           // expected: "A"/"B"/"C"/"D"
            String userAns = (String) session.getAttribute("ans_" + qid); // set by servlet
    %>
 
    <div class="question-box">
        <h3>Q<%= qNo++ %>. <%= rs.getString("question") %></h3>
 
        <div class="option <%= "A".equalsIgnoreCase(correct) ? "correct" : ((userAns!=null && userAns.equalsIgnoreCase("A")) ? "wrong" : "") %>">
            <strong>A.</strong> <%= rs.getString("option1") %>
            <% if(userAns!=null && userAns.equalsIgnoreCase("A") && !"A".equalsIgnoreCase(correct)) { %>
                &nbsp; <em>(Your answer)</em>
            <% } %>
            <% if("A".equalsIgnoreCase(correct)) { %>
                &nbsp; <em>(Correct)</em>
            <% } %>
        </div>
 
        <div class="option <%= "B".equalsIgnoreCase(correct) ? "correct" : ((userAns!=null && userAns.equalsIgnoreCase("B")) ? "wrong" : "") %>">
            <strong>B.</strong> <%= rs.getString("option2") %>
            <% if(userAns!=null && userAns.equalsIgnoreCase("B") && !"B".equalsIgnoreCase(correct)) { %>
                &nbsp; <em>(Your answer)</em>
            <% } %>
            <% if("B".equalsIgnoreCase(correct)) { %>
                &nbsp; <em>(Correct)</em>
            <% } %>
        </div>
 
        <div class="option <%= "C".equalsIgnoreCase(correct) ? "correct" : ((userAns!=null && userAns.equalsIgnoreCase("C")) ? "wrong" : "") %>">
            <strong>C.</strong> <%= rs.getString("option3") %>
            <% if(userAns!=null && userAns.equalsIgnoreCase("C") && !"C".equalsIgnoreCase(correct)) { %>
                &nbsp; <em>(Your answer)</em>
            <% } %>
            <% if("C".equalsIgnoreCase(correct)) { %>
                &nbsp; <em>(Correct)</em>
            <% } %>
        </div>
 
        <div class="option <%= "D".equalsIgnoreCase(correct) ? "correct" : ((userAns!=null && userAns.equalsIgnoreCase("D")) ? "wrong" : "") %>">
            <strong>D.</strong> <%= rs.getString("option4") %>
            <% if(userAns!=null && userAns.equalsIgnoreCase("D") && !"D".equalsIgnoreCase(correct)) { %>
                &nbsp; <em>(Your answer)</em>
            <% } %>
            <% if("D".equalsIgnoreCase(correct)) { %>
                &nbsp; <em>(Correct)</em>
            <% } %>
        </div>
 
    </div>
 
    <% } %>
 
</div>
 
</body>
</html>
 