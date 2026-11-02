
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%
    if (session.getAttribute("adminId") == null) {
        response.sendRedirect(request.getContextPath() + "/admin-login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Admin Dashboard - CodeQuest</title>

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

        .admin-container {
            width: 100%;
            max-width: 750px;
            padding: 45px 35px;
            text-align: center;
            background: rgba(21, 29, 50, 0.95);
            border: 1px solid rgba(255,255,255,0.12);
            border-radius: 22px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.4);
        }

        .admin-container h1 {
            color: #ffffff;
            font-size: 32px;
            margin-bottom: 10px;
        }

        .admin-container .subtitle {
            color: #cbd5e1;
            margin-bottom: 30px;
        }

        .admin-welcome {
            color: #22d3ee;
            font-weight: 700;
        }

        .admin-options {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
            margin-top: 25px;
        }

        .option-card {
            padding: 28px 20px;
            background: #1d2942;
            border: 1px solid rgba(255,255,255,0.1);
            border-radius: 16px;
            transition: 0.3s;
        }

        .option-card:hover {
            transform: translateY(-5px);
            border-color: #8b5cf6;
            box-shadow: 0 10px 25px rgba(139,92,246,0.15);
        }

        .option-card h2 {
            color: #ffffff;
            font-size: 20px;
            margin-bottom: 10px;
        }

        .option-card p {
            color: #cbd5e1;
            font-size: 14px;
            margin-bottom: 18px;
        }

        .option-card a {
            display: inline-block;
            padding: 11px 20px;
            background: linear-gradient(100deg, #8b5cf6, #6366f1);
            color: white;
            border-radius: 9px;
            font-weight: 600;
        }

        .logout {
            display: inline-block;
            margin-top: 30px;
            padding: 12px 28px;
            background: #be123c;
            color: white;
            border-radius: 9px;
            font-weight: 600;
        }

        .logout:hover {
            background: #e11d48;
            color: white;
        }

        @media(max-width: 550px) {
            .admin-container {
                padding: 30px 20px;
            }

            .admin-options {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>

<body>

    <main class="admin-container">

        <h1>⚙ Admin Dashboard</h1>

        <p class="subtitle">
            Welcome,
            <span class="admin-welcome">
                <%= session.getAttribute("adminUsername") %>
            </span>
        </p>

        <p class="subtitle">
            Manage programming questions and missions from here.
        </p>

        <div class="admin-options">

            <div class="option-card">
                <h2>➕ Add Question</h2>
                <p>Create new programming questions and missions.</p>

                <a href="<%= request.getContextPath() %>/add-question.jsp">
                    Add Question
                </a>
            </div>

            <div class="option-card">
                <h2>📚 View Questions</h2>
                <p>View, edit and manage existing questions.</p>

                <a href="<%= request.getContextPath() %>/view-questions">
                    View Questions
                </a>
            </div>

        </div>

        <a class="logout"
           href="<%= request.getContextPath() %>/admin-logout">
            Logout
        </a>

    </main>

</body>
</html>
