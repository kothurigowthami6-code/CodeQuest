
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("adminId") == null) {
        response.sendRedirect("admin-login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Question - CodeQuest</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <h1>Add New Question</h1>

    <form action="${pageContext.request.contextPath}/add-question"
          method="post">

        <label>Question Title:</label>
        <input type="text" name="title" required>
        <br><br>

        <label>Description:</label>
        <textarea name="description" required></textarea>
        <br><br>

        <label>Category:</label>
        <select name="category" required>
            <option value="Java">Java</option>
            <option value="SQL">SQL</option>
            <option value="DSA">DSA</option>
        </select>
        <br><br>

        <label>Difficulty:</label>
        <select name="difficulty" required>
            <option value="Easy">Easy</option>
            <option value="Medium">Medium</option>
            <option value="Hard">Hard</option>
        </select>
        <br><br>

        <label>Option A:</label>
        <input type="text" name="optionA" required>
        <br><br>

        <label>Option B:</label>
        <input type="text" name="optionB" required>
        <br><br>

        <label>Option C:</label>
        <input type="text" name="optionC" required>
        <br><br>

        <label>Option D:</label>
        <input type="text" name="optionD" required>
        <br><br>

        <label>Correct Answer:</label>
        <select name="correctAnswer" required>
            <option value="A">Option A</option>
            <option value="B">Option B</option>
            <option value="C">Option C</option>
            <option value="D">Option D</option>
        </select>
        <br><br>

        <label>XP Points:</label>
        <input type="number" name="xpPoints" min="1" required>
        <br><br>

        <button type="submit">Add Question</button>
    </form>

    <br>
    <a href="admin-dashboard.jsp">Back to Dashboard</a>

</body>

</html>
