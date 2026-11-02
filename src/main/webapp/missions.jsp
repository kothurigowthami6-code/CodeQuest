
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.List,java.util.Map" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Programming Missions - CodeQuest</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
<main class="dashboard-container">

    <h1>Programming Missions</h1>
    <p>Choose a mission and improve your programming skills!</p>

    <%
        List<Map<String, Object>> missions =
            (List<Map<String, Object>>) request.getAttribute("missions");
    %>

    <% if (missions != null && !missions.isEmpty()) { %>

        <% for (Map<String, Object> mission : missions) { %>

            <div class="dashboard-card">

                <h2><%= mission.get("title") %></h2>

                <p><%= mission.get("description") %></p>

                <p>
                    <strong>Difficulty:</strong>
                    <%= mission.get("difficulty") %>
                </p>

                <p>
                    <strong>Reward:</strong>
                    <%= mission.get("xpPoints") %> XP
                </p>

                <form action="<%= request.getContextPath() %>/start-mission"
                      method="get">

                    <input type="hidden" name="id"
                           value="<%= mission.get("id") %>">

                    <button type="submit">Start Mission</button>

                </form>

            </div>

        <% } %>

    <% } else { %>

        <p>No missions are available yet.</p>

    <% } %>

    <p>
        <a href="<%= request.getContextPath() %>/dashboard">
            Back to Dashboard
        </a>
    </p>

</main>
</body>
</html>
