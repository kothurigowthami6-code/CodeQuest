
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.codequest.util.DBConnection" %>

<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Leaderboard - CodeQuest</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .leaderboard {
            max-width: 900px;
            margin: 50px auto;
            padding: 25px;
        }

        .leaderboard h1 {
            color: #a78bfa;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: #11182d;
            color: #e2e8f0;
        }

        th, td {
            padding: 14px;
            border: 1px solid #334155;
            text-align: left;
        }

        th {
            color: #a78bfa;
        }

        .back-link {
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
        <a href="logout">Logout</a>
    </nav>
</header>

<div class="leaderboard">
    <h1>Student Leaderboard</h1>

    <table>
        <tr>
            <th>Rank</th>
            <th>Student Name</th>
            <th>XP Points</th>
            <th>Completed Missions</th>
        </tr>

        <%
            String sql =
                "SELECT u.name, " +
                "COALESCE(sp.xp_points, 0) AS xp_points, " +
                "COALESCE(sp.completed_missions, 0) AS completed_missions " +
                "FROM users u " +
                "LEFT JOIN student_progress sp ON u.id = sp.user_id " +
                "ORDER BY xp_points DESC, u.name ASC";

            try (Connection con = DBConnection.getConnection();
                 PreparedStatement ps = con.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {

                int rank = 1;

                while (rs.next()) {
        %>
        <tr>
            <td><%= rank++ %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getInt("xp_points") %></td>
            <td><%= rs.getInt("completed_missions") %></td>
        </tr>
        <%
                }
            } catch (SQLException e) {
        %>
        <tr>
            <td colspan="4">Unable to load leaderboard. Please try again.</td>
        </tr>
        <%
                e.printStackTrace();
            }
        %>
    </table>

    <a class="back-link" href="dashboard">Back to Dashboard</a>
</div>

</body>
</html>
