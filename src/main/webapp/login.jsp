
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Login - CodeQuest</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .form-container {
            max-width: 420px;
            margin: 50px auto;
            padding: 30px;
            background: #11182d;
            border-radius: 12px;
        }

        .form-container h2 {
            color: #a78bfa;
            text-align: center;
            margin-bottom: 25px;
        }

        .form-container label {
            display: block;
            color: #e2e8f0;
            margin: 12px 0 6px;
        }

        .form-container input {
            width: 100%;
            padding: 12px;
            border: 1px solid #334155;
            border-radius: 6px;
            background: #0b1020;
            color: white;
        }

        .form-container button {
            width: 100%;
            margin-top: 22px;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }
    </style>
</head>
<body>

<header>
    <div class="logo">CodeQuest</div>
    <nav><a href="index.html">Home</a></nav>
</header>

<div class="form-container">
    <h2>Student Login</h2>
    
<%
    if ("1".equals(request.getParameter("error"))) {
%>
    <p style="color:#f87171; text-align:center;">
        Invalid email or password. Please try again.
    </p>
<%
    }
%>
    

    <form action="<%= request.getContextPath() %>/login"
      method="post"
      autocomplete="off">

    <label>Email</label>
    <input type="email"
           name="email"
           placeholder="Enter your email"
           autocomplete="off"
           required>

    <label>Password</label>
    <input type="password"
           name="password"
           placeholder="Enter your password"
           autocomplete="new-password"
           required>

    <button type="submit">Login</button>

</form>

    <p style="text-align:center; margin-top:20px; color:#cbd5e1;">
        Don't have an account?
        <a href="register.jsp" style="color:#a78bfa;">Register</a>
    </p>
</div>

</body>
</html>
