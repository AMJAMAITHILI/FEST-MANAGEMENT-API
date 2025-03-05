<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fest Pass Application</title>
</head>
<body style="display: flex; align-items: center; justify-content: center; height: 100vh; margin: 0; background: linear-gradient(135deg, #fda085, #f6d365); font-family: Arial, sans-serif;">
    <div style="background-color: #fff; padding: 30px; border-radius: 10px; box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.1); width: 300px; text-align: center;">
        <h2 style="color: #ff6b6b; font-size: 24px; font-weight: bold; margin-bottom: 20px;">Fest Pass Application</h2>
        <form action="submitApplication" method="post">
            <label style="display: block; text-align: left; color: #ff6b6b; font-weight: bold; margin-bottom: 5px;">Student Name</label>
            <input type="text" name="studentName" placeholder="Enter your name" required style="width: 100%; padding: 10px; margin-bottom: 15px; border: 1px solid #ddd; border-radius: 5px;">

            <label style="display: block; text-align: left; color: #ff6b6b; font-weight: bold; margin-bottom: 5px;">Student ID</label>
            <input type="text" name="studentId" placeholder="Enter your student ID" required style="width: 100%; padding: 10px; margin-bottom: 15px; border: 1px solid #ddd; border-radius: 5px;">

            <label style="display: block; text-align: left; color: #ff6b6b; font-weight: bold; margin-bottom: 5px;">Number of passes</label>
            <input type="number" name="numPasses" placeholder="Enter number of passes" required min="1" max="2" style="width: 100%; padding: 10px; margin-bottom: 15px; border: 1px solid #ddd; border-radius: 5px;">

            <button type="submit" style="width: 100%; padding: 10px; background: linear-gradient(135deg, #ff6b6b, #ff9472); color: #fff; border: none; border-radius: 5px; font-weight: bold; cursor: pointer;">
                Apply Now
            </button>
        </form>
    </div>
</body>
</html>
