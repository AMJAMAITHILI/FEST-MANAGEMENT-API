package com.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class Sh_login
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3304/shruthi_db", "root1", "root")) {
            String query = "SELECT * FROM users WHERE username = ? AND password = ? AND role = ?";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, username);
                stmt.setString(2, password);
                stmt.setString(3, role);

                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    // Successful login
                    HttpSession session = request.getSession();
                    session.setAttribute("username", username); // Store username in session
                    response.sendRedirect(role + "-dashboard.jsp");
                }
 else {
                    // Invalid credentials: Generate error page HTML
                    response.setContentType("text/html");
                    PrintWriter out = response.getWriter();
                    out.println("<!DOCTYPE html>");
                    out.println("<html lang=\"en\">");
                    out.println("<head>");
                    out.println("<meta charset=\"UTF-8\">");
                    out.println("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">");
                    out.println("<title>Error</title>");
                    out.println("<style>");
                    out.println("body {");
                    out.println("    font-family: Arial, sans-serif;");
                    out.println("    display: flex;");
                    out.println("    justify-content: center;");
                    out.println("    align-items: center;");
                    out.println("    height: 100vh;");
                    out.println("    margin: 0;");
                    out.println("    background: linear-gradient(to right, #ff7bbf, #7f8cff);");
                    out.println("    color: #333;");
                    out.println("}");
                    out.println(".error-container {");
                    out.println("    text-align: center;");
                    out.println("    padding: 20px;");
                    out.println("    background: #fff;");
                    out.println("    border-radius: 8px;");
                    out.println("    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);");
                    out.println("}");
                    out.println(".error-container h1 {");
                    out.println("    color: #ff4c4c;");
                    out.println("}");
                    out.println(".error-container a {");
                    out.println("    display: inline-block;");
                    out.println("    margin-top: 20px;");
                    out.println("    padding: 10px 20px;");
                    out.println("    text-decoration: none;");
                    out.println("    color: #fff;");
                    out.println("    background: #7f8cff;");
                    out.println("    border-radius: 5px;");
                    out.println("}");
                    out.println(".error-container a:hover {");
                    out.println("    background: #ff7bbf;");
                    out.println("}");
                    out.println("</style>");
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<div class=\"error-container\">");
                    out.println("<h1>Error</h1>");
                    out.println("<p>Invalid username or password.</p>");
                    out.println("<a href=\"shruthi_login.jsp\">Go Back to Login</a>");
                    out.println("</div>");
                    out.println("</body>");
                    out.println("</html>");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
