<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            background: linear-gradient(to right, #00b4d8, #00ff7f); /* Blue and Green Gradient */
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .register-container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            width: 300px;
        }

        .register-container h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .register-container label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }

        .register-container select,
        .register-container input {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .register-container button {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .register-container button:hover {
            background-color: #218838;
        }

        .payment-section {
            text-align: center;
            margin-top: 20px;
        }

        .payment-section img {
            width: 150px; /* Adjust size of the QR code */
            height: 150px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <h1>Register</h1>
  <form action="registerServlet" method="post">

            <label for="name">Name</label>
            <input type="text" id="name" name="name" required>
            
            <label for="branch">Branch</label>
            <select id="branch" name="branch" required>
                <option value="CSE">CSE</option>
                <option value="CSM">CSM</option>
                <option value="CSD">CSD</option>
                <option value="INF">INF</option>
                <option value="BIOTECH">BIOTECH</option>
                <option value="CHEM">CHEM</option>
                <option value="ECE">ECE</option>
                <option value="EEE">EEE</option>
            </select>
            
            <label for="year">Year</label>
            <select id="year" name="year" required>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
            </select>

            <label for="section">Section</label>
            <select id="section" name="section" required>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
            </select>

            <label for="rollno">Roll Number</label>
            <input type="text" id="rollno" name="rollno" required>

            <div class="payment-section">
                <label for="payment">Payment</label>
                <p>Please scan the QR code below to complete the payment:</p>
                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/QR_Code_Example.svg/552px-QR_Code_Example.svg.png?20111025115625" alt="Payment QR Code">
            </div>

            <button type="submit">Register</button>
        </form>
    </div>
</body>
</html>
