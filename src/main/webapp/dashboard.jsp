
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String userName = (String) session.getAttribute("userName");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Dashboard - CodeQuest</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .dashboard {
            max-width: 900px;
            margin: 50px auto;
            padding: 25px;
        }

        .welcome {
            color: #a78bfa;
            margin-bottom: 25px;
        }

        .mission-card {
            background: #11182d;
            border: 1px solid #334155;
            border-radius: 12px;
            padding: 22px;
            margin: 15px 0;
        }

        .mission-card h3 {
            color: #a78bfa;
            margin-bottom: 10px;
        }

        .mission-card p {
            color: #cbd5e1;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

<header>
    <div class="logo">CodeQuest</div>
    <nav>
    <a href="dashboard">Dashboard</a>
    <a href="profile.jsp">My Profile</a>
    <a href="history.jsp">Mission History</a>
    <a href="leaderboard.jsp">Leaderboard</a>
    <a href="logout">Logout</a>
</nav>
</header>

<div class="dashboard">
    <h1 class="welcome">
        Welcome, <%= userName %>!
    </h1>

    <p>Ready to level up your programming skills?</p>

    <div class="mission-card">
        <h3>Your Progress</h3>
        <p>XP Points: ${totalXP}</p>
<p>Completed Missions: ${completedMissions}</p>
    </div>

    <div class="mission-card">
        <h3>Programming Missions</h3>
        <p>Practice coding and earn experience points.</p>
        <a href="missions" class="btn">Explore Missions</a>
    </div>

    <div class="mission-card">
        <h3>Leaderboard</h3>
        <p>See how you rank against other students.</p>
        <a href="leaderboard.jsp" class="btn">View Leaderboard</a>
    </div>
</div>

</body>
</html>
