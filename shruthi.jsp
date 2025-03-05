<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Homepage with Alternating Images</title>
</head>
<body style="
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    color: #FFFFFF;
">

    <!-- Video Background -->
    <video autoplay loop muted style=" 
        position: fixed; 
        top: 0; 
        left: 0; 
        width: 100%; 
        height: 100%; 
        object-fit: cover; 
        z-index: -1; 
    ">
        <source src="https://v.ftcdn.net/03/58/16/25/700_F_358162555_NIhFNOaE2xCIsGHKTBcKtpAMO5mdeDpr_ST.mp4" type="video/mp4">
    </video>

    <!-- Section 1 (Image on the left) -->
    <section style=" 
        display: flex; 
        flex-direction: row; 
        height: 36vh; 
        background-color: #8E44AD; /* Dark purple */ 
        color: #FFFFFF; 
        margin-bottom: 20px; 
        align-items: center; 
        padding: 0 20px;
    ">
        <img src="https://i.imgur.com/Zfshw4C.jpeg" 
             alt="Mountains" style="width: 45%; height: 100%; object-fit: cover; margin-right: 20px;">
        <div style="flex: 1;">
            <h1 style="font-size: 2.5rem; font-weight: bold;">Click here to view about fest</h1>
            <a href="https://i.imgur.com/CZCc80s.png" style="text-decoration: none;">
                <button style="padding: 15px 30px; background-color: #C39BD3; color: #4A235A; border: none; cursor: pointer; font-size: 1.2rem;">Learn More</button>
            </a>
        </div>
    </section>

    <!-- Section 2 (Image on the right) -->
    <section style=" 
        display: flex; 
        flex-direction: row-reverse; 
        height: 36vh; 
        background-color: #A569BD; /* Medium purple */ 
        color: #FFFFFF; 
        margin-bottom: 20px; 
        align-items: center; 
        padding: 0 20px;
    ">
        <img src="https://i.imgur.com/3JsLqUP.jpeg" 
             alt="Sample Image 2" style="width: 45%; height: 100%; object-fit: cover; margin-left: 20px;">
        <div style="flex: 1;">
            <h1 style="font-size: 2.5rem; font-weight: bold;">Click here to apply for fest passes</h1>
            <a href="passes_apply.jsp" style="text-decoration: none;">
                <button style="padding: 15px 30px; background-color: #7D3C98; color: #FFF; border: none; cursor: pointer; font-size: 1.2rem;">Apply</button>
            </a>
        </div>
    </section>

    <!-- Section 3 (Image on the left) -->
    <section style=" 
        display: flex; 
        flex-direction: row; 
        height: 36vh; 
        background-color: #C870A3; /* Deep pink */ 
        color: #FFFFFF; 
        margin-bottom: 20px; 
        align-items: center; 
        padding: 0 20px;
    ">
        <img src="https://th.bing.com/th/id/OIG2.QTgEYRyk0XMSZVgU4TrZ?pid=ImgGn" 
             alt="Sample Image 3" style="width: 45%; height: 100%; object-fit: cover; margin-right: 20px;">
        <div style="flex: 1;">
            <h1 style="font-size: 2.5rem; font-weight: bold;">Click here to login</h1>
            <a href="shruthi_login.jsp" style="text-decoration: none;">
                <button style="padding: 15px 30px; background-color: #8E44AD; color: #FFF; border: none; cursor: pointer; font-size: 1.2rem;">Login</button>
            </a>
        </div>
    </section>

    <!-- Section 4 (Image on the right) -->
    <section style=" 
        display: flex; 
        flex-direction: row-reverse; 
        height: 36vh; 
        background-color: #B03A75; /* Rich pink */ 
        color: #FFFFFF; 
        align-items: center; 
        padding: 0 20px;
    ">
        <img src="https://img.lovepik.com/background/20211022/large/lovepik-contact-us-background-image_500584282.jpg" 
             alt="Sample Image 4" style="width: 45%; height: 100%; object-fit: cover; margin-left: 20px;">
        <div style="flex: 1;">
            <h2 style="font-size: 2.5rem; font-weight: bold;">Contact Us</h2>
            <a href="contactUs.jsp" style="text-decoration: none;">
                <button style="padding: 15px 30px; background-color: #6C3483; color: #FFF; border: none; cursor: pointer; font-size: 1.2rem;">Contact</button>
            </a>
        </div>
    </section>

</body>
</html>
