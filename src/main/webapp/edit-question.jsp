
<%@ page import="java.sql.ResultSet" %>
<%
    if (session.getAttribute("adminId") == null) {
        response.sendRedirect("admin-login.jsp");
        return;
    }

    ResultSet q = (ResultSet) request.getAttribute("question");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Question</title>
    <link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<h2>Edit Question</h2>

<% if (q != null) { %>

<form action="edit-question" method="post">

    <input type="hidden" name="id" value="<%= q.getInt("id") %>">

    Title:
    <input type="text" name="title"
           value="<%= q.getString("title") %>" required><br><br>

    Description:
    <textarea name="description" required><%= q.getString("description") %></textarea><br><br>

    Category:
    <input type="text" name="category"
           value="<%= q.getString("category") %>" required><br><br>

    Difficulty:
    <input type="text" name="difficulty"
           value="<%= q.getString("difficulty") %>" required><br><br>

    Option A:
    <input type="text" name="optionA"
           value="<%= q.getString("option_a") %>" required><br><br>

    Option B:
    <input type="text" name="optionB"
           value="<%= q.getString("option_b") %>" required><br><br>

    Option C:
    <input type="text" name="optionC"
           value="<%= q.getString("option_c") %>" required><br><br>

    Option D:
    <input type="text" name="optionD"
           value="<%= q.getString("option_d") %>" required><br><br>

    Correct Answer:
    <select name="correctAnswer" required>
        <option value="A" <%= "A".equals(q.getString("correct_answer")) ? "selected" : "" %>>A</option>
        <option value="B" <%= "B".equals(q.getString("correct_answer")) ? "selected" : "" %>>B</option>
        <option value="C" <%= "C".equals(q.getString("correct_answer")) ? "selected" : "" %>>C</option>
        <option value="D" <%= "D".equals(q.getString("correct_answer")) ? "selected" : "" %>>D</option>
    </select><br><br>

    XP Points:
    <input type="number" name="xpPoints"
           value="<%= q.getInt("xp_points") %>" required><br><br>

    <button type="submit">Update Question</button>

</form>

<% } else { %>
    <p>Question not found.</p>
<% } %>

<br>
<a href="view-questions">Back to Questions</a>

</body>
</html>
