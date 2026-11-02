
package com.codequest.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.codequest.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AddQuestionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("adminId") == null) {
            response.sendRedirect(
                request.getContextPath() + "/admin-login.jsp");
            return;
        }

        String sql = "INSERT INTO missions "
                + "(title, description, difficulty, xp_points, category, "
                + "option_a, option_b, option_c, option_d, correct_answer) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, request.getParameter("title"));
            ps.setString(2, request.getParameter("description"));
            ps.setString(3, request.getParameter("difficulty"));
            ps.setInt(4, Integer.parseInt(request.getParameter("xpPoints")));
            ps.setString(5, request.getParameter("category"));
            ps.setString(6, request.getParameter("optionA"));
            ps.setString(7, request.getParameter("optionB"));
            ps.setString(8, request.getParameter("optionC"));
            ps.setString(9, request.getParameter("optionD"));
            ps.setString(10, request.getParameter("correctAnswer"));

            int result = ps.executeUpdate();

            if (result > 0) {
                response.sendRedirect(
                    request.getContextPath()
                    + "/add-question.jsp?success=1");
            } else {
                response.sendRedirect(
                    request.getContextPath()
                    + "/add-question.jsp?error=1");
            }

        } catch (Exception e) {
            throw new ServletException("Unable to add question.", e);
        }
    }
}
