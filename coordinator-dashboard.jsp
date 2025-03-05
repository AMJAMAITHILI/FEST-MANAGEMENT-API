<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    // Retrieve the current user's session details
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp"); // Redirect if not logged in
        return;
    }

    // Database connection details
    String dbURL = "jdbc:mysql://localhost:3304/shruthi_db";
    String dbUser = "root1";
    String dbPassword = "root";

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        // Fetch tasks for the logged-in user
        String query = "SELECT id, task, status FROM role_tasks WHERE username = ? AND role = ?";
        stmt = conn.prepareStatement(query);
        stmt.setString(1, username);
        stmt.setString(2, "coordinator");
        rs = stmt.executeQuery();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Coordinator Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background: linear-gradient(to right, #7f8cff, #ff7bbf);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .task-table {
            width: 100%;
            margin: 20px 0;
            border-collapse: collapse;
        }
        .task-table th, .task-table td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }
        .task-table th {
            background: #f4f4f4;
        }
        form {
            margin-top: 20px;
        }
    </style>
    <script>
        function addTask() {
            var task = document.getElementById("newTask").value;
            var username = "<%= username %>";
            var role = "coordinator";

            // Create the AJAX request
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "AddTaskServlet", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

            // Send task data
            xhr.send("task=" + encodeURIComponent(task) + "&username=" + encodeURIComponent(username) + "&role=" + encodeURIComponent(role));

            // Update the table with the new task once it is added
            xhr.onload = function () {
                if (xhr.status == 200) {
                    // Optionally, you can add the new task to the table dynamically here
                    var taskId = xhr.responseText;  // taskId sent from the servlet
                    var newRow = document.createElement("tr");
                    newRow.innerHTML = "<td>" + task + "</td><td><input type='checkbox' onchange='updateTaskStatus(" + taskId + ")'></td>";
                    document.getElementById("taskTable").appendChild(newRow);
                }
            };
        }
    </script>
</head>
<body>
    <h1>Coordinator Dashboard</h1>

    <table class="task-table" id="taskTable">
        <thead>
            <tr>
                <th>Task</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <% while (rs.next()) { %>
                <tr>
                    <td><%= rs.getString("task") %></td>
                    <td>
                        <form action="UpdateTaskStatusServlet" method="POST" style="display:inline;">
                            <input type="hidden" name="task_id" value="<%= rs.getInt("id") %>">
                            <input type="checkbox" name="status" value="true" <% if (rs.getBoolean("status")) out.print("checked"); %> onchange="this.form.submit()">
                        </form>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>

    <!-- Form to Add New Tasks -->
    <h2>Add New Task</h2>
    <textarea id="newTask" rows="3" cols="40" placeholder="Enter new task here..." required></textarea><br>
    <button type="button" onclick="addTask()">Add Task</button>

</body>
</html>

<%
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>



