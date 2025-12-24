<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz Portal</title>
 
<style>
/* FULLSCREEN BACKGROUND WITH BLUR */
body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    height: 100vh;
    overflow: hidden;
}
 

.bg-image {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-image: url('images/quiz.jpg'); /* <-- put your image in /images folder */
    background-size: cover;
    background-position: center;
    filter: blur(6px);              /* BLUR EFFECT */
    transform: scale(1.1);          /* removes border gaps from blur */
    z-index: -2;
}
 
/* Dark overlay to improve readability */
.overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,0.45);
    z-index: -1;
}
 
/* CENTER BOX */
.box {
    background: rgba(255, 255, 255, 0.88);
    padding: 40px;
    width: 420px;
    text-align: center;
    border-radius: 18px;
    box-shadow: 0 0 25px rgba(0,0,0,0.35);
    position: relative;
    z-index: 1;
}
 
h2 {
    margin-bottom: 20px;
    font-size: 26px;
    color: #333;
}
 
p {
    font-size: 16px;
    color: #444;
    margin-bottom: 25px;
}
 
/* BUTTONS */
button {
    width: 80%;
    padding: 14px;
    margin: 15px 0;
    font-size: 16px;
    background: #1976d2;
    border: none;
    color: white;
    border-radius: 7px;
    cursor: pointer;
    transition: 0.25s;
}
 
button:hover {
    background: #0d47a1;
    transform: scale(1.04);
}
</style>
 
</head>
 
<body>
 
<!-- BLURRED BACKGROUND IMAGE -->
<div class="bg-image"></div>
 
<!-- DARK OVERLAY -->
<div class="overlay"></div>
 
<!-- CENTERED LOGIN BOX -->
<div style="display:flex; justify-content:center; align-items:center; height:100vh;">
    <div class="box">
        <h2>Welcome to Quiz Portal</h2>
        <p>Select your login type</p>
 
        <!-- ADMIN -->
        <form action="admin/admin.jsp">
            <button type="submit">Admin Login</button>
        </form>
 
        <!-- USER -->
        <form action="user/login.jsp">
            <button type="submit">User Login</button>
        </form>
 
    </div>
</div>
 
</body>
</html>