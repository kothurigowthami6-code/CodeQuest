
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Answer Result - CodeQuest</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<main class="dashboard-container">

    <div class="dashboard-card">

        <h1>Mission Result</h1>

        <h2>${missionTitle}</h2>

        <% if (Boolean.TRUE.equals(request.getAttribute("correct"))) { %>

            <h3>Correct Answer! 🎉</h3>
            <p>Excellent work! You completed the challenge.</p>
            <p><strong>XP Earned:</strong> ${earnedXP}</p>

        <% } else { %>

            <h3>Incorrect Answer</h3>
            <p>Don't give up! Review the question and try again.</p>
            <p><strong>XP Earned:</strong> 0</p>

        <% } %>

        <p>
            <a href="missions">Back to Missions</a>
        </p>

        <p>
            <a href="dashboard">Back to Dashboard</a>
        </p>

    </div>

</main>

</body>
</html>
