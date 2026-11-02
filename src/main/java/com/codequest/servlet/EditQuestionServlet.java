
package com.codequest.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.codequest.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/edit-question")
public class EditQuestionServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("adminId") == null) {
            response.sendRedirect("admin-login.jsp");
            return;
        }

        int id = Integer.parseInt(request.getParameter("id"));

        try (Connection con = DBConnection.getConnection()) {

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM missions WHERE id=?"
            );
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                request.setAttribute("question", rs);
                request.getRequestDispatcher("/edit-question.jsp")
                       .forward(request, response);
            } else {
                response.sendRedirect("view-questions");
            }

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("adminId") == null) {
            response.sendRedirect("admin-login.jsp");
            return;
        }

        try (Connection con = DBConnection.getConnection()) {

            String sql = "UPDATE missions SET title=?, description=?, " +
                         "category=?, difficulty=?, option_a=?, option_b=?, " +
                         "option_c=?, option_d=?, correct_answer=?, xp_points=? " +
                         "WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, request.getParameter("title"));
            ps.setString(2, request.getParameter("description"));
            ps.setString(3, request.getParameter("category"));
            ps.setString(4, request.getParameter("difficulty"));
            ps.setString(5, request.getParameter("optionA"));
            ps.setString(6, request.getParameter("optionB"));
            ps.setString(7, request.getParameter("optionC"));
            ps.setString(8, request.getParameter("optionD"));
            ps.setString(9, request.getParameter("correctAnswer"));
            ps.setInt(10, Integer.parseInt(request.getParameter("xpPoints")));
            ps.setInt(11, Integer.parseInt(request.getParameter("id")));

            ps.executeUpdate();

            response.sendRedirect("view-questions?updated=1");

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
