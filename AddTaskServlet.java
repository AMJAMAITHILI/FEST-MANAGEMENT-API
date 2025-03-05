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
import java.sql.ResultSet;
import java.sql.SQLException;
 
 
@WebServlet("/AddTaskServlet")
public class AddTaskServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameters from the request
        String task = request.getParameter("task");
        String username = request.getParameter("username");
        String role = request.getParameter("role");

        // Define database connection details
        String dbURL = "jdbc:mysql://localhost:3304/shruthi_db";
        String dbUser = "root1";
        String dbPassword = "root";

        // Initialize connection objects
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Establish a connection to the database
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
            System.out.println("Connection established!");

            // SQL query to insert a new task
            String insertQuery = "INSERT INTO role_tasks (task, status, username, role) VALUES (?, 0, ?, ?)";

            // Prepare the statement to insert the task
            stmt = conn.prepareStatement(insertQuery);
            stmt.setString(1, task);
            stmt.setString(2, username);
            stmt.setString(3, role);

            // Execute the insert query
            int affectedRows = stmt.executeUpdate();
            if (affectedRows > 0) {
                System.out.println("Task added successfully, affected rows: " + affectedRows);
            }

            // Now, retrieve the last inserted ID using LAST_INSERT_ID()
            String getLastInsertIdQuery = "SELECT LAST_INSERT_ID()";
            stmt = conn.prepareStatement(getLastInsertIdQuery);  // Use PreparedStatement here as well
            rs = stmt.executeQuery();  // Execute the query to get the last inserted ID

            if (rs.next()) {
                int taskId = rs.getInt(1);  // Get the last inserted task ID
                System.out.println("Generated Task ID: " + taskId);

                // Send the task ID back to the client (optional, for confirmation)
                response.setContentType("text/plain");
                response.getWriter().write(String.valueOf(taskId));
            }

        } catch (SQLException e) {
            // Handle SQL exception
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error adding task");
        } finally {
            // Close the resources to prevent memory leaks
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}


