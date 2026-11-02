
package com.codequest.servlet;

import com.codequest.util.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/submit-answer")
public class SubmitAnswerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        System.out.println("Session ID: "
                + (session == null ? "NULL" : session.getId()));

        System.out.println("User ID: "
                + (session == null ? "NO SESSION"
                : session.getAttribute("userId")));

        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = Integer.parseInt(
                session.getAttribute("userId").toString());

        int missionId;
        try {
            missionId = Integer.parseInt(request.getParameter("missionId"));
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid mission ID.");
            return;
        }

        String answer = request.getParameter("answer");
        if (answer == null) {
            answer = "";
        }
        answer = answer.trim();

        String missionTitle;
        int xpPoints;

        try (Connection con = DBConnection.getConnection()) {

            String sql = "SELECT title, xp_points FROM missions WHERE id = ?";

            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, missionId);

                try (ResultSet rs = ps.executeQuery()) {
                    if (!rs.next()) {
                        response.sendError(
                                HttpServletResponse.SC_NOT_FOUND,
                                "Mission not found.");
                        return;
                    }

                    missionTitle = rs.getString("title");
                    xpPoints = rs.getInt("xp_points");
                }
            }

            boolean correct = false;

            if ("Hello World".equalsIgnoreCase(missionTitle)) {
                correct = answer.equalsIgnoreCase("Hello World");
            } else if ("Even or Odd".equalsIgnoreCase(missionTitle)) {
                correct = answer.equalsIgnoreCase("Even")
                        || answer.equalsIgnoreCase("Odd");
            } else if ("Find the Largest Number".equalsIgnoreCase(missionTitle)) {
                correct = answer.equals("30");
            }

            int earnedXP = 0;
            boolean alreadyCompleted = false;

            if (correct) {
                con.setAutoCommit(false);

                try {
                    String insertCompletion =
                            "INSERT INTO mission_completions "
                            + "(user_id, mission_id) VALUES (?, ?)";

                    try (PreparedStatement ps =
                                 con.prepareStatement(insertCompletion)) {
                        ps.setInt(1, userId);
                        ps.setInt(2, missionId);
                        ps.executeUpdate();
                    }

                    String updateProgress =
                            "INSERT INTO student_progress "
                            + "(user_id, xp_points, completed_missions) "
                            + "VALUES (?, ?, 1) "
                            + "ON DUPLICATE KEY UPDATE "
                            + "xp_points = xp_points + ?, "
                            + "completed_missions = completed_missions + 1";

                    try (PreparedStatement ps =
                                 con.prepareStatement(updateProgress)) {
                        ps.setInt(1, userId);
                        ps.setInt(2, xpPoints);
                        ps.setInt(3, xpPoints);
                        ps.executeUpdate();
                    }

                    con.commit();
                    earnedXP = xpPoints;

                } catch (SQLException e) {
                    con.rollback();

                    // MySQL error 1062 means this mission was
                    // already completed by this student.
                    if (e.getErrorCode() == 1062) {
                        alreadyCompleted = true;
                    } else {
                        throw e;
                    }
                } finally {
                    con.setAutoCommit(true);
                }
            }

            request.setAttribute("correct", correct);
            request.setAttribute("missionTitle", missionTitle);
            request.setAttribute("earnedXP", earnedXP);
            request.setAttribute("alreadyCompleted", alreadyCompleted);

            request.getRequestDispatcher("/answer-result.jsp")
                    .forward(request, response);

        } catch (SQLException e) {
            throw new ServletException("Unable to save mission progress.", e);
        }
    }
}
