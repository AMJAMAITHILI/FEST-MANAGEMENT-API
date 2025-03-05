package com.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class UpdateTaskStatusServlet
 */
@WebServlet("/UpdateTaskStatusServlet")
public class UpdateTaskStatusServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the task ID and status from the request
        int taskId = Integer.parseInt(request.getParameter("task_id"));
        boolean status = Boolean.parseBoolean(request.getParameter("status"));  // true/false

        // Database connection details
        String dbURL = "jdbc:mysql://localhost:3304/shruthi_db";
        String dbUser = "root1";
        String dbPassword = "root";

        // Initialize connection objects
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Establish a connection to the database
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // SQL query to update the task status
            String updateQuery = "UPDATE role_tasks SET status = ? WHERE id = ?";

            // Prepare the statement to update the task status
            stmt = conn.prepareStatement(updateQuery);
            stmt.setBoolean(1, status);
            stmt.setInt(2, taskId);

            // Execute the update query
            int affectedRows = stmt.executeUpdate();
            if (affectedRows > 0) {
                // Send success response back to the client
                response.setContentType("application/json");  // Set content type as JSON
                response.setStatus(HttpServletResponse.SC_OK);  // HTTP 200 OK
                response.getWriter().write("{\"status\": \"success\", \"message\": \"Task status updated successfully!\"}");
            } else {
                // If no rows were affected, send an error response
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);  // HTTP 500
                response.getWriter().write("{\"status\": \"error\", \"message\": \"Failed to update task status!\"}");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            // Send error response on exception
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"status\": \"error\", \"message\": \"Error updating task status!\"}");
        } finally {
            // Close the resources to prevent memory leaks
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}


