
package com.codequest.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;


import com.codequest.util.DBConnection;

import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ViewQuestionsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("adminId") == null) {
            response.sendRedirect(
                request.getContextPath() + "/admin-login.jsp");
            return;
        }

        List<HashMap<String, Object>> questions = new ArrayList<>();

        String sql = "SELECT * FROM missions WHERE is_active = 1";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                HashMap<String, Object> q = new HashMap<>();

                q.put("id", rs.getInt("id"));
                q.put("title", rs.getString("title"));
                q.put("description", rs.getString("description"));
                q.put("category", rs.getString("category"));
                q.put("difficulty", rs.getString("difficulty"));
                q.put("xpPoints", rs.getInt("xp_points"));

                questions.add(q);
            }

            request.setAttribute("questions", questions);
            request.getRequestDispatcher("/view-questions.jsp")
                   .forward(request, response);

        } catch (Exception e) {
            throw new ServletException("Unable to load questions.", e);
        }
    }
}
