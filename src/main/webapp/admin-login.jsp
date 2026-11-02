
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Admin Login - CodeQuest</title>

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/css/style.css">

    <style>
        body {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .login-card {
            width: 100%;
            max-width: 420px;
            padding: 40px 35px;
            text-align: center;
            background: rgba(21, 29, 50, 0.95);
            border: 1px solid rgba(255,255,255,0.12);
            border-radius: 22px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.4);
            color: #ffffff;
        }

        .login-icon {
            font-size: 42px;
            margin-bottom: 12px;
        }

        .login-card h1 {
            color: #ffffff;
            font-size: 30px;
            margin-bottom: 8px;
        }

        .login-card .subtitle {
            color: #cbd5e1;
            margin-bottom: 28px;
        }

        .login-card form {
            text-align: left;
        }

        .login-card label {
            display: block;
            color: #f1f5f9;
            margin-bottom: 5px;
            font-weight: 600;
        }

        .login-card input {
            width: 100%;
            margin: 5px 0 18px;
            padding: 14px;
            color: #ffffff;
            background: #0e172a;
            border: 1px solid rgba(255,255,255,0.15);
            border-radius: 10px;
        }

        .login-card input::placeholder {
            color: #94a3b8;
            opacity: 1;
        }

        .login-card input:focus {
            border-color: #22d3ee;
            outline: none;
            box-shadow: 0 0 0 3px rgba(34,211,238,0.12);
        }

        .login-card button {
            width: 100%;
            margin-top: 10px;
            padding: 14px;
            font-size: 16px;
        }

        .login-card .back-link {
            display: inline-block;
            margin-top: 25px;
            color: #22d3ee;
        }

        .login-card .back-link:hover {
            color: #a78bfa;
        }

        .login-card .error {
            color: #fca5a5;
            background: rgba(251,113,133,0.1);
            padding: 12px;
            border-radius: 9px;
            margin-bottom: 15px;
        }

        @media(max-width: 480px) {
            .login-card {
                padding: 30px 22px;
            }
        }
    </style>
</head>

<body>

    <div class="login-card">

        <div class="login-icon">🔐</div>

        <h1>Admin Login</h1>

        <p class="subtitle">
            Sign in to manage programming questions.
        </p>

        <% if ("1".equals(request.getParameter("error"))) { %>
            <p class="error">Invalid username or password!</p>
        <% } %>

        <form action="<%= request.getContextPath() %>/admin-login"
              method="post"
              autocomplete="off">

            <label>Username</label>

            <input type="text"
                   name="username"
                   placeholder="Enter admin username"
                   autocomplete="off"
                   required>

            <label>Password</label>

            <input type="password"
                   name="password"
                   placeholder="Enter admin password"
                   autocomplete="new-password"
                   required>

            <button type="submit">Login to Dashboard →</button>

        </form>

        <a class="back-link"
           href="<%= request.getContextPath() %>/index.html">
            ← Back to Home
        </a>

    </div>

</body>
</html>
