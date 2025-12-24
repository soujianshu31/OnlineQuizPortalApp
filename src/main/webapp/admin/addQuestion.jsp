<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New Question</title>
 
<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #f5f5f5;
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
    background: #2196f3;
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
    <h2>Add New Question</h2>
    
    <div class="form-box">
        <form action="../AddQuestionServlet" method="post">
 
            <label>Question:</label>
            <input type="text" name="question" required>
 
            <label>Option 1:</label>
            <input type="text" name="opt1" required>
 
            <label>Option 2:</label>
            <input type="text" name="opt2" required>
 
            <label>Option 3:</label>
            <input type="text" name="opt3" required>
 
            <label>Option 4:</label>
            <input type="text" name="opt4" required>
 
            <label>Correct Answer (A/B/C/D):</label>
            <input type="text" name="answer" required>
 
            <button type="submit">Add Question</button>
        </form>
    </div>
</div>
 
</body>
</html>
 