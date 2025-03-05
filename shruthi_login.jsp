<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Organizer Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background: linear-gradient(to right, #ff7bbf, #7f8cff); /* Gradient background */
        }

        /* Center the login container */
        .login-container {
            width: 100%;
            max-width: 400px;
            padding: 30px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .login-container h2 {
            text-align: center;
            color: #333;
            margin-bottom: 15px;
        }

        /* Input fields */
        input[type="text"], input[type="password"], select, button {
            width: 100%;
            padding: 12px;
            margin: 8px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
        }

        /* Input fields and button styling */
        select, button {
            cursor: pointer;
        }

        /* Gradient button */
        button {
            background: linear-gradient(to right, #ff7bbf, #7f8cff);
            color: white;
            border: none;
            transition: background 0.3s ease;
        }

        button:hover {
            background: linear-gradient(to right, #7f8cff, #ff7bbf);
        }

        /* Responsive behavior */
        @media screen and (max-width: 480px) {
            .login-container {
                padding: 20px;
            }
        }
    </style>
</head>
<body>

<div class="login-container">
    <h2>Organizer Login</h2>
    <form action=LoginServlet method="POST">
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <select name="role" required>
            <option value="coordinator">Coordinator</option>
            <option value="marketing">Marketing</option>
            <option value="techsupport">Tech Support</option>
            <option value="events">Events</option>
        </select>
        <button type="submit">Login</button>
    </form>
</div>

</body>
</html>




