
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
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mission History - CodeQuest</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .history {
            max-width: 900px;
            margin: 50px auto;
            padding: 25px;
        }

        .history h1 {
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
        <a href="leaderboard.jsp">Leaderboard</a>
        <a href="logout">Logout</a>
    </nav>
</header>

<div class="history">
    <h1>My Mission History</h1>

    <table>
        <tr>
            <th>Mission</th>
            <th>XP Earned</th>
            <th>Completed On</th>
        </tr>

        <%
            String sql =
                "SELECT m.title, m.xp_points, mc.completed_at " +
                "FROM mission_completions mc " +
                "JOIN missions m ON mc.mission_id = m.id " +
                "WHERE mc.user_id = ? " +
                "ORDER BY mc.completed_at DESC";

            boolean hasHistory = false;

            try (Connection con = DBConnection.getConnection();
                 PreparedStatement ps = con.prepareStatement(sql)) {

                ps.setInt(1, userId);

                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        hasHistory = true;
        %>
        <tr>
            <td><%= rs.getString("title") %></td>
            <td><%= rs.getInt("xp_points") %></td>
            <td><%= rs.getTimestamp("completed_at") %></td>
        </tr>
        <%
                    }
                }
            } catch (SQLException e) {
                application.log("Unable to load mission history", e);
        %>
        <tr>
            <td colspan="3">Unable to load mission history. Please try again.</td>
        </tr>
        <%
            }

            if (!hasHistory) {
        %>
        <tr>
            <td colspan="3">You have not completed any missions yet.</td>
        </tr>
        <%
            }
        %>
    </table>

    <a class="back-link" href="dashboard">Back to Dashboard</a>
</div>

</body>
</html>
