package com.codequest.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.codequest.util.PasswordUtil;

import com.codequest.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String sql = "INSERT INTO users (name, email, password) "
                   + "VALUES (?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, PasswordUtil.hashPassword(password));

            int result = ps.executeUpdate();

            if (result > 0) {
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().println(
                    "<h2>Registration Successful!</h2>"
                    + "<a href='login.jsp'>Go to Login</a>"
                );
            }

        } catch (SQLException e) {
            if ("23000".equals(e.getSQLState())) {
                response.sendError(
                    HttpServletResponse.SC_CONFLICT,
                    "This email is already registered."
                );
            } else {
                throw new ServletException(
                    "Unable to register student.", e
                );
            }
        }
    }
}
