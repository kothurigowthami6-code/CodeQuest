<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Registration - CodeQuest</title>
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
            text-align: center;
            margin-bottom: 25px;
            color: #a78bfa;
        }

        .form-container label {
            display: block;
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
        

body {
    color: #f8fafc;
}


.form-container h2 {
    color: #a78bfa;
}


.form-container label {
    color: #e2e8f0;
}


.form-container input {
    color: #ffffff;
}


.form-container p {
    color: #cbd5e1;
}

/* Login link */
.form-container p a {
    color: #a78bfa;
    text-decoration: none;
}

.form-container p a:hover {
    color: #c4b5fd;
}
        
    </style>
</head>
<body>

<header>
    <div class="logo">CodeQuest</div>
    <nav><a href="index.html">Home</a></nav>
</header>

<div class="form-container">
    <h2>Create Student Account</h2>

    <form action="register" method="post">
        <label for="name">Full Name</label>
        <input type="text" id="name" name="name" required>

        <label for="email">Email Address</label>
        <input type="email" id="email" name="email" required>

        <label for="password">Password</label>
        <input type="password" id="password" name="password"
               minlength="8" required>

        <button type="submit" class="btn">Register</button>
    </form>

    <p style="text-align:center; margin-top:20px;">
        Already registered? <a href="login.jsp">Login</a>
    </p>
</div>

</body>
</html>
