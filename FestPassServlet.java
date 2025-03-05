package com.Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/submitApplication")
public class FestPassServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database configuration
    private static final String DB_URL = "jdbc:mysql://localhost:3304/shruthi_db";
    private static final String DB_USER = "root1";
    private static final String DB_PASSWORD = "root";

    // JDBC driver
    private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentName = request.getParameter("studentName");
        String studentId = request.getParameter("studentId");
        String numPassesStr = request.getParameter("numPasses");

        int numPasses;
        try {
            numPasses = Integer.parseInt(numPassesStr);

            if (numPasses < 1 || numPasses > 2) {
                response.getWriter().println("Error: You can only request between 1 and 2 passes.");
                return;
            }

            // Register JDBC driver
            Class.forName(JDBC_DRIVER);

            try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                // Check the total number of passes already issued to this student
                String checkSql = "SELECT SUM(num_passes) FROM fest_pass_applications WHERE student_id = ?";
                PreparedStatement checkStmt = connection.prepareStatement(checkSql);
                checkStmt.setString(1, studentId);
                ResultSet resultSet = checkStmt.executeQuery();

                int totalPasses = 0;
                if (resultSet.next()) {
                    totalPasses = resultSet.getInt(1);
                }

                // If total passes exceed the limit, show an error
                if (totalPasses + numPasses > 2) {
                    response.setContentType("text/html"); // Set the content type to HTML
                    response.getWriter().println("<html><body>");
                    response.getWriter().println("<h2 style='color: red;'>Error: You can only apply for a maximum of 2 passes!</h2>");
                    response.getWriter().println("<a href='festPassForm.html' style='text-decoration: none; font-weight: bold; color: blue;'>Go Back</a>");
                    response.getWriter().println("</body></html>");
                    return;
                }

                // If user already exists, update their pass count
                String sql = totalPasses > 0
                        ? "UPDATE fest_pass_applications SET num_passes = num_passes + ? WHERE student_id = ?"
                        : "INSERT INTO fest_pass_applications (student_name, student_id, num_passes) VALUES (?, ?, ?)";
                
                PreparedStatement statement = connection.prepareStatement(sql);
                if (totalPasses > 0) {
                    statement.setInt(1, numPasses);
                    statement.setString(2, studentId);
                } else {
                    statement.setString(1, studentName);
                    statement.setString(2, studentId);
                    statement.setInt(3, numPasses);
                }

                int rowsAffected = statement.executeUpdate();
                if (rowsAffected > 0) {
                    // Generate colorful pass page
                    response.setContentType("text/html");
                    response.getWriter().println("<html><body>");
                    response.getWriter().println("<div style='text-align: center; font-family: Arial, sans-serif; margin-top: 50px;'>");
                    response.getWriter().println("<div style='background: linear-gradient(135deg, #89fffd, #6bb5ff); border: 2px solid #6bb5ff; padding: 20px; border-radius: 20px; width: 400px; margin: 0 auto; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);'>");
                    response.getWriter().println("<h2 style='color: #ffffff;'>Pass Generated Successfully!</h2>");
                    response.getWriter().println("<h3 style='color: #ffffff;'>Pass Details</h3>");
                    response.getWriter().println("<p style='color: #ffffff;'><strong>Student Name:</strong> " + studentName + "</p>");
                    response.getWriter().println("<p style='color: #ffffff;'><strong>Student ID:</strong> " + studentId + "</p>");
                    response.getWriter().println("<p style='color: #ffffff;'><strong>Number of Passes:</strong> " + numPasses + "</p>");
                    response.getWriter().println("<img src='https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/QR_code_for_mobile_English_Wikipedia.svg/1024px-QR_code_for_mobile_English_Wikipedia.svg.png' alt='QR Code' style='width:200px; height:auto; margin-top: 10px;' />");
                    response.getWriter().println("</div>");
                    response.getWriter().println("<p style='margin-top: 20px;'><a href='passes_apply.jsp' style='text-decoration: none; font-weight: bold; color: #6bb5ff;'>Apply Again</a></p>");
                    response.getWriter().println("</div>");
                    response.getWriter().println("</body></html>");
                } else {
                    response.getWriter().println("<h2 style='color: red;'>Error: Unable to process your application. Please try again!</h2>");
                }
            }
        } catch (NumberFormatException e) {
            response.getWriter().println("<h2 style='color: red;'>Error: Invalid number of passes. Please enter a valid number!</h2>");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h2 style='color: red;'>Error: " + e.getMessage() + "</h2>");
        }
    }
}



