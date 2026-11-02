
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Start Mission - CodeQuest</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<main class="dashboard-container">

    <h1>Programming Mission</h1>

    <div class="dashboard-card">

        <h2>${title}</h2>

        <p>${description}</p>

        <p>
            <strong>Difficulty:</strong> ${difficulty}
        </p>

        <p>
            <strong>Reward:</strong> ${xpPoints} XP
        </p>

        <hr>

        <h3>Your Challenge</h3>

        <p>
            Write a program based on the mission you selected.
        </p>

        <p>
            For example, for the Hello World mission,
            display the message:
        </p>

        <pre>Hello World</pre>
        
<h3>Submit Your Answer</h3>

<form action="${pageContext.request.contextPath}/submit-answer" method="post">
    <input type="hidden" name="missionId"
           value="${missionId}">

    <label for="answer">Enter your answer:</label>
    <textarea id="answer" name="answer"
              rows="5" required
              placeholder="Type your answer here..."></textarea>

    <button type="submit">Submit Answer</button>
</form>
        

        <p>
            <a href="missions">Back to Missions</a>
        </p>

    </div>

</main>

</body>
</html>
