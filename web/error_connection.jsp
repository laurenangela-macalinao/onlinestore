<%-- 
    Document   : error_connection
    Created on : 04 15, 22, 9:28:20 PM
    Author     : Benedict Balancio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Connection Page</title>
        
        <style>
           body 
            {
                font-family: 'Open Sans', sans-serif;
                background-image: url("pictures/error_connection_background.jpg");
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            h1
            {
                font-family: 'Open Sans', sans-serif;
                color: black;
                font-size: 50px;
                text-align: center;
            }

            .image
            {
                width: 100%;
                max-width: 160px;
                height: auto;
                margin-top: 100px;
            }
            
            .sub-head
            {
                font-size: 12px;
                margin-bottom: 50px;
                text-align: center;
            }

            .small-font
            {
                font-size: 10px;
                color: black;
            }

            button 
            {
                font-family: 'Open Sans', sans-serif;
                padding: 7px;
                font-size: 14px;
                background: #E10840;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            
            p
            {
                color: white;
            }
        </style>
    </head>
    <body>
        <img class="image" src="pictures/db_not_found.png" alt="databaselogo">
        <h1>Connection is Null</h1>
        <p class="sub-head"> Sorry! You are not connected to the database. Please try again.</p>
        <a href="guest.jsp">
            <button id="submit" name="logbutton" type="submit">Go Back</button>
        </a>
    </body>
</html>
