<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registration</title>
 
<style>
body {
    margin: 0;
    padding: 0;
    background: #e3f2fd;
    font-family: Arial;
}
.container {
    width: 100%;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}
.form-box {
    background: white;
    padding: 35px;
    width: 420px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0,0,0,0.2);
}
h2 {
    text-align: center;
    margin-bottom: 25px;
}
input {
    width: 100%;
    padding: 12px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
}
button {
    width: 100%;
    padding: 12px;
    background: #1976d2;
    border: none;
    color: white;
    font-size: 16px;
    border-radius: 5px;
    cursor: pointer;
}
a {
    display: block;
    text-align: center;
    margin-top: 15px;
    color: #1976d2;
    text-decoration: none;
}
</style>
 
</head>
<body>
 
<div class="container">
    <div class="form-box">
        <h2>Create Account</h2>
 
        <form action="../UserRegisterServlet" method="post">
            <input type="text" name="name" placeholder="Full Name" required>
 
            <input type="email" name="email" placeholder="Email Address" required>
 
            <input type="password" name="password" placeholder="Password" required>
 
            <button type="submit">Sign Up</button>
        </form>
 
        <a href="login.jsp">Already have an account? Login</a>
    </div>
</div>
 
</body>
</html>
 