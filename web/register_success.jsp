<%-- 
    Document   : register_sucess
    Created on : 04 30, 22, 2:11:21 AM
    Author     : Benedict Balancio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Success Page</title>
        
        <style>
            body 
            {
                font-family: 'Open Sans', sans-serif;
                background-image: url("pictures/signup_background.png");
                background-position: center center;
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: cover;
                color: #474747;
                line-height: 1.6;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            h1
            {
                font-family: 'Open Sans', sans-serif;
                color: white;
            }

            .sub-head
            {
                margin-top: -20px;
            }

            .image
            {
                width: 100%;
                max-width: 300px;
                height: auto;
                margin-top: 50px;
            }
            
            button 
            {
                font-family: 'Open Sans', sans-serif;
                width: 100%;
                padding: 7px;
                font-size: 17px;
                background: #27BED8;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <img class="image" src="pictures/correct_mark.png" alt="checklogo">
        <h1>Sign Up is Sucessful!</h1>
        <a href ="login.jsp">
            <button href="login.jsp" name="home_button" type="submit">Go to Login Page</button>
        </a>
    </body>
</html>
