
package com.codequest.servlet;

import com.codequest.util.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/start-mission")
public class StartMissionServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String idText = request.getParameter("id");

        try {
            int id = Integer.parseInt(idText);

            String sql = "SELECT * FROM missions WHERE id = ? AND is_active = 1";
            try (Connection con = DBConnection.getConnection();
                 PreparedStatement ps = con.prepareStatement(sql)) {

                ps.setInt(1, id);

                try (ResultSet rs = ps.executeQuery()) {

                    if (rs.next()) {
                        request.setAttribute("missionId", rs.getInt("id"));
                        request.setAttribute("title", rs.getString("title"));
                        request.setAttribute("description",
                                             rs.getString("description"));
                        request.setAttribute("difficulty",
                                             rs.getString("difficulty"));
                        request.setAttribute("xpPoints",
                                             rs.getInt("xp_points"));

                        request.getRequestDispatcher("/start-mission.jsp")
                               .forward(request, response);
                    } else {
                        response.sendError(
                            HttpServletResponse.SC_NOT_FOUND,
                            "Mission not found."
                        );
                    }
                }
            }

        } catch (NumberFormatException e) {
            response.sendError(
                HttpServletResponse.SC_BAD_REQUEST,
                "Invalid mission ID."
            );
        } catch (java.sql.SQLException e) {
            throw new ServletException("Unable to load mission.", e);
        }
    }
}
