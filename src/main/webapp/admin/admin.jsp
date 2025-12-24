<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
 
<style>
    body {
        margin: 0;
        padding: 0;
        font-family: Arial;
        background: #e3f2fd;
    }
    .container {
        width: 100%;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .login-box {
        width: 800px;
        background: white;
        display: flex;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0px 0px 10px rgba(0,0,0,0.2);
    }
    .left {
        width: 50%;
    }
    .left img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
    .right {
        width: 50%;
        padding: 40px;
        background: #e3f2fd;
    }
    .right h2 {
        margin-bottom: 20px;
        text-align: center;
    }
    .input-box {
        width: 100%;
        margin-bottom: 20px;
    }
    .input-box input {
        width: 100%;
        padding: 12px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    button {
        width: 100%;
        padding: 12px;
        border: none;
        border-radius: 5px;
        background: #2196f3;
        color: white;
        font-size: 16px;
        cursor: pointer;
    }
</style>
 
</head>
<body>
 
<div class="container">
    <div class="login-box">
    
        <div class="left">
            <img src="../images/scenery.jpg" alt="Login Image">
        </div>
 
        <div class="right">
            <h2>Welcome Back!</h2>
 
            <form action="../AdminLogin" method="post">
 
                <div class="input-box">
                    <input type="text" name="email" placeholder="Enter Email Address..." required>
                </div>
 
                <div class="input-box">
                    <input type="password" name="password" placeholder="Password" required>
                </div>
 
                <button type="submit">Login</button>
            </form>
        </div>
 
    </div>
</div>
 
</body>
</html>
 