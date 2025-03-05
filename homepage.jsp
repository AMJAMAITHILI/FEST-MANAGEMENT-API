<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Welcome to TECH FEST 2025! Explore our vibrant platform.">
    <meta name="keywords" content="Tech Fest, 2025, Technology, Innovation">
    <meta name="author" content="Your Name/Organization">
    <title>Homepage with Inline CSS</title>
</head>
<body>


<section style="
    height: 36vh; 
    background-image: url('https://i.imgur.com/UwgEGNY.png');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 20px;">
</section>

<section style="
    height: 100vh; 
    background-image: url('https://img.freepik.com/free-vector/background-realistic-abstract-technology-particle_23-2148431735.jpg?t=st=1731749104~exp=1731752704~hmac=6a0554c81e7d45842a7734d0dba3ea0b172e9f6535d36eebef3d7891448abace&w=996'); 
    background-size: cover; 
    background-position: center; 
    background-repeat: no-repeat;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    color: white;
    text-align: center;
    margin-bottom: 20px;">
    <h1 style="
        font-family: 'Poppins', sans-serif;
        font-size: 6em;
        margin: 0;
        background: linear-gradient(90deg, #4CAF50, #1E88E5);
        -webkit-background-clip: text;
        color: transparent;
        text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.3);">
        TECH FEST 2025
    </h1>

    <a href="tech.jsp" style="
        margin-top: 40px;
        display: inline-block;
        padding: 12px 30px;
        font-size: 1.5em;
        color: white;
        text-decoration: none;
        background: linear-gradient(90deg, #00bfff, #32cd32, #1e90ff, #00fa9a);
        border: none;
        border-radius: 8px;
        cursor: pointer;
        transition: background-color 0.3s, transform 0.3s;"
        onmouseover="this.style.background='linear-gradient(90deg, #1e90ff, #00fa9a, #32cd32, #00bfff)'; this.style.transform='scale(1.1)'"
        onmouseout="this.style.background='linear-gradient(90deg, #00bfff, #32cd32, #1e90ff, #00fa9a)'; this.style.transform='scale(1)'">
        Click Here
    </a>
</section>

<section style="
    height: 100vh; 
    background-image: url('https://i.imgur.com/xzpwqbr.jpeg'); 
    background-size: cover; 
    background-position: center; 
    display: flex; 
    flex-direction: column; 
    justify-content: center; 
    align-items: center; 
    color: white; 
    text-align: center;
    margin-bottom: 20px;">
    <a href="shruthi.jsp" style="
        margin-top: 40px;
        display: inline-block;
        padding: 12px 30px;
        font-size: 1.5em;
        color: white;
        text-decoration: none;
        background: linear-gradient(90deg, #ffb6c1, #dda0dd, #d8bfd8, #db7093);
        border: none;
        border-radius: 8px;
        cursor: pointer;
        transition: background-color 0.3s, transform 0.3s;"
        onmouseover="this.style.background='linear-gradient(90deg, #db7093, #d8bfd8, #dda0dd, #ffb6c1)'; this.style.transform='scale(1.1)'"
        onmouseout="this.style.background='linear-gradient(90deg, #ffb6c1, #dda0dd, #d8bfd8, #db7093)'; this.style.transform='scale(1)'">
        Click Here
    </a>
</section>



</body>
</html>