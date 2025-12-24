<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.quizapp.util.DBConnection" %>

 
<%
    Connection con = DBConnection.getConnection();
 
    // Count quizzes
    PreparedStatement ps1 = con.prepareStatement("SELECT COUNT(*) FROM quiz");
    ResultSet rs1 = ps1.executeQuery();
    rs1.next();
    int totalQuiz = rs1.getInt(1);
 
    // Count questions
    PreparedStatement ps2 = con.prepareStatement("SELECT COUNT(*) FROM questions");
    ResultSet rs2 = ps2.executeQuery();
    rs2.next();
    int totalQuestions = rs2.getInt(1);
 
    // Count users (only normal users, not admin)
    PreparedStatement ps3 = con.prepareStatement("SELECT COUNT(*) FROM users WHERE role='user'");
    ResultSet rs3 = ps3.executeQuery();
    rs3.next();
    int totalUsers = rs3.getInt(1);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard | Quiz App</title>
 
<style>
 
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #f5f5f5;
}
 
/* SIDEBAR */
.sidebar {
    width: 250px;
    height: 100vh;
    background: #1976d2;
    position: fixed;
    padding-top: 20px;
    color: white;
}
 
.sidebar h2 {
    text-align: center;
    margin-bottom: 40px;
}
 
.sidebar a {
    display: block;
    padding: 12px 30px;
    color: white;
    text-decoration: none;
    font-size: 16px;
}
 
.sidebar a:hover {
    background: #0d47a1;
}
 
/* MAIN AREA */
.main {
    margin-left: 250px;
    padding: 20px;
}
 
.header {
    background: white;
    padding: 15px;
    font-size: 18px;
    margin-bottom: 20px;
    display: flex;
    justify-content: space-between;
    border-radius: 5px;
}
 
.card-box {
    display: flex;
    gap: 20px;
}
 
.card {
    background: white;
    width: 250px;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
    text-align: center;
}
 
.card h3 {
    margin-bottom: 10px;
}
 
</style>
 
</head>
<body>
 
<!-- SIDEBAR -->
<div class="sidebar" id="sidebar">
    <h2>QUIZ APP</h2>
 
    <a href="dashboard.jsp" class="side-link">Dashboard</a>
 
    <div class="menu-group">
        <div class="menu-header" data-target="quizMenu">
            <span>Quiz Manager</span>
            <span class="chev">▸</span>
        </div>
        <div class="menu-body" id="quizMenu">
            <a href="createQuiz.jsp" class="side-sublink">Create New Quiz</a>
            <a href="quizList.jsp" class="side-sublink">Quiz List</a>
        </div>
    </div>
 
    <div class="menu-group">
        <div class="menu-header" data-target="questionMenu">
            <span>Question Manager</span>
            <span class="chev">▸</span>
        </div>
        <div class="menu-body" id="questionMenu">
            <a href="addQuestion.jsp" class="side-sublink">Add New Question</a>
            <a href="questionList.jsp" class="side-sublink">Question List</a>
        </div>
    </div>
</div>
 
<!-- Add small CSS + JS for accordion behavior -->
<style>
/* sidebar basics (keeps your colors) */
.sidebar { width:250px; height:100vh; background:#1976d2; position:fixed; padding-top:20px; color:#fff; }
.sidebar h2{ text-align:center; margin-bottom:20px; font-size:22px; }
.side-link{ display:block; padding:12px 30px; color:#fff; text-decoration:none; font-size:16px; }
.side-link:hover{ background:#0d47a1; }
 
/* accordion group */
.menu-group{ margin-top:10px; }
.menu-header{ padding:12px 30px; cursor:pointer; display:flex; justify-content:space-between; align-items:center; font-weight:bold; color:#fff; }
.menu-body{ max-height:0; overflow:hidden; transition: max-height 0.25s ease-out, padding 0.2s; padding-left:30px; }
.menu-body a.side-sublink{ display:block; padding:10px 0; color:#fff; text-decoration:none; font-weight:normal; }
.menu-body a.side-sublink:hover{ text-decoration:underline; }
 
/* rotated chevron when open */
.menu-header.open .chev{ transform:rotate(90deg); }
 
/* when open — give room for items */
.menu-body.open{ max-height:400px; padding-bottom:10px; }
</style>
 
<script>
document.addEventListener('DOMContentLoaded', function(){
    // Attach click handlers to headers
    var headers = document.querySelectorAll('.menu-header');
    headers.forEach(function(h){
        h.addEventListener('click', function(){
            var targetId = h.getAttribute('data-target');
            var body = document.getElementById(targetId);
            var isOpen = body.classList.contains('open');
 
            // Close all menu bodies (so only one open at a time). Optional: remove loop to allow multiple open.
            document.querySelectorAll('.menu-body').forEach(function(b){ b.classList.remove('open'); b.previousElementSibling.classList.remove('open'); });
 
            if(!isOpen){
                body.classList.add('open');
                h.classList.add('open');
            } else {
                body.classList.remove('open');
                h.classList.remove('open');
            }
        });
    });
 
    // Optionally open the first menu on load
    // document.getElementById('quizMenu').classList.add('open');
    // document.querySelector('[data-target="quizMenu"]').classList.add('open');
});
</script>
 
<!-- MAIN CONTENT -->
<div class="main">
 
    <!-- HEADER -->
    <div class="header">
        <div>Dashboard</div>
        <div>Welcome <%= session.getAttribute("adminName") %></div>
    </div>
 
    <!-- STAT CARDS -->
    <div class="card-box">
        <div class="card">
            <h3>Total Quizzes</h3>
           <p><%= totalQuiz %></p>
        </div>
 
        <div class="card">
            <h3>Total Questions</h3>
            <p><%= totalQuestions %></p>
        </div>
 
        <div class="card">
            <h3>Total Users</h3>
            <p><%= totalUsers %></p>
        </div>
    </div>
 
</div>
 
</body>
</html>
 