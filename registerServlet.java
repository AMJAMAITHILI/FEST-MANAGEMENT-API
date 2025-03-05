package com.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

/**
 * Servlet implementation class registerServlet
 */
@WebServlet("/registerServlet")
public class registerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String name = request.getParameter("name");
        String branch = request.getParameter("branch");
        String year = request.getParameter("year");
        String section = request.getParameter("section");
        String rollno = request.getParameter("rollno");

        // Database connection setup (replace with your own database credentials)
        String dbURL = "jdbc:mysql://localhost:3304/shruthi_db";  // Corrected port to 3306
        String dbUsername = "root1";
        String dbPassword = "root";

        // SQL query to insert registration details
        String query = "INSERT INTO students (name, branch, year, section, rollno) VALUES (?, ?, ?, ?, ?)";

        try {
            // Step 1: Load database driver (MySQL in this case)
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Step 2: Establish a connection to the database
            Connection conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);
            
            // Step 3: Create a prepared statement to execute the query
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setString(1, name);
            statement.setString(2, branch);
            statement.setString(3, year);
            statement.setString(4, section);
            statement.setString(5, rollno);
            
            // Step 4: Execute the query
            int rowsAffected = statement.executeUpdate();
            
            // Step 5: Close connections
            statement.close();
            conn.close();

            // Step 6: Send response to the user
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            if (rowsAffected > 0) {
                out.println("<html><body>");
                out.println("<h1>Registration Successful!</h1>");
                out.println("<p>Thank you for registering, " + name + ".</p>");
                out.println("<a href='tech.jsp'>Go back to home</a>");
                out.println("</body></html>");
            } else {
                out.println("<html><body>");
                out.println("<h1>Registration Failed</h1>");
                out.println("<p>There was an issue processing your registration. Please try again.</p>");
                out.println("</body></html>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<h1>Registration Failed</h1>");
            out.println("<p>Error: " + e.getMessage() + "</p>");
            out.println("</body></html>");
        }
    }
}

