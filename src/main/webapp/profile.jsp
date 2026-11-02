
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.codequest.util.DBConnection" %>

<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int userId = (Integer) session.getAttribute("userId");
    String userName = (String) session.getAttribute("userName");
    String userEmail = (String) session.getAttribute("userEmail");

    int totalXP = 0;
    int completedMissions = 0;

    String sql = "SELECT xp_points, completed_missions "
               + "FROM student_progress WHERE user_id = ?";

    try (Connection con = DBConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setInt(1, userId);

        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                totalXP = rs.getInt("xp_points");
                completedMissions = rs.getInt("completed_missions");
            }
        }
    } catch (SQLException e) {
        application.log("Unable to load student profile", e);
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Profile - CodeQuest</title>
    <link rel="stylesheet" href="css/style.css">

    <style>
        .profile {
            max-width: 650px;
            margin: 50px auto;
            padding: 30px;
            background: #11182d;
            border: 1px solid #334155;
            border-radius: 15px;
            color: #e2e8f0;
        }

        .profile h1 {
            color: #a78bfa;
            margin-bottom: 25px;
        }

        .profile p {
            margin: 18px 0;
            overflow-wrap: anywhere;
        }

        .profile strong {
            color: #a78bfa;
        }

        .profile a {
            display: inline-block;
            margin-top: 20px;
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

<div class="profile">
    <h1>My Profile</h1>

    <p><strong>Name:</strong> <%= userName %></p>
    <p><strong>Email:</strong> <%= userEmail %></p>
    <p><strong>Total XP:</strong> <%= totalXP %></p>
    <p><strong>Completed Missions:</strong> <%= completedMissions %></p>

    <a href="dashboard" class="btn">Back to Dashboard</a>
</div>

</body>
</html>
