
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Successful - CodeQuest</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>
        .success-container {
            width: 90%;
            max-width: 500px;
            margin: 100px auto;
            padding: 40px;
            text-align: center;
            background: rgba(21, 29, 50, 0.95);
            border: 1px solid rgba(255,255,255,0.12);
            border-radius: 22px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.35);
        }

        .success-icon {
            width: 75px;
            height: 75px;
            line-height: 75px;
            margin: 0 auto 20px;
            border-radius: 50%;
            background: rgba(74,222,128,0.15);
            color: #4ade80;
            font-size: 40px;
        }

        .success-container h1 {
            font-size: 28px;
            color: #4ade80;
            margin-bottom: 15px;
        }

        .success-container p {
            color: #cbd5e1;
            margin-bottom: 25px;
        }

        .success-container .btn {
            display: inline-block;
            margin-top: 15px;
        }
    </style>
</head>

<body>

    <div class="success-container">

        <div class="success-icon">✓</div>

        <h1>Registration Successful!</h1>

        <p>
            Your CodeQuest account has been created successfully.
        </p>

        <p>
            You can now log in and start completing programming missions.
        </p>

        <a href="${pageContext.request.contextPath}/login.jsp"
           class="btn">
            Login Now
        </a>

        <br><br>

        <a href="${pageContext.request.contextPath}/index.html">
            Back to Home
        </a>

    </div>

</body>
</html>
