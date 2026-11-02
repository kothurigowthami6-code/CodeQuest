
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List,java.util.HashMap" %>

<%
    if (session.getAttribute("adminId") == null) {
        response.sendRedirect("admin-login.jsp");
        return;
    }

    List<HashMap<String, Object>> questions =
        (List<HashMap<String, Object>>) request.getAttribute("questions");
%>

<!DOCTYPE html>
<html>
<head>
    <title>View Questions - CodeQuest</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<h1>All Questions</h1>

<% if (questions != null && !questions.isEmpty()) {
    for (HashMap<String, Object> q : questions) { %>

    <div>
        <h3><%= q.get("title") %></h3>
        <p><b>Description:</b> <%= q.get("description") %></p>
        <p><b>Category:</b> <%= q.get("category") %></p>
        <p><b>Difficulty:</b> <%= q.get("difficulty") %></p>
        <p><b>XP Points:</b> <%= q.get("xpPoints") %></p>

        <a href="<%= request.getContextPath() %>/edit-question?id=<%= q.get("id") %>">
            Edit
        </a>

        <form action="<%= request.getContextPath() %>/delete-question"
              method="post"
              onsubmit="return confirm('Are you sure you want to delete this question?');">

            <input type="hidden" name="id" value="<%= q.get("id") %>">
            <button type="submit">Delete</button>
        </form>

        <hr>
    </div>

<%  }
   } else { %>

    <p>No questions available.</p>

<% } %>

<br>
<a href="add-question.jsp">Add New Question</a>
<br><br>
<a href="admin-dashboard.jsp">Back to Dashboard</a>

</body>
</html>
