<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Page</title>

        <style>
            @import url('https://fonts.googleapis.com/css?family=Open+Sans&display=swap');

            body 
            {
                font-family: 'Open Sans', sans-serif;
                background-image: url("pictures/login_background.jpg");
                background-position: center center;
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: cover;
                color: #3a3c47;
                line-height: 1.2;
                display: flex;
                flex-direction: column;
                align-items: center;
                margin: 0;
                padding: 0;
            }

            h1
            {
                margin-top: 9px;
                color: white;
                font-size: 40px;
            }

            p
            {
                color: white;
                font-size: 14px;
                text-align: center;
            }

            form 
            {
                background: white;
                max-width: 350px;
                width: 100%;
                padding: 40px 44px;
                border: 1px solid #D6D7E7;
                border-radius: 11px;
                transition: all 0.3s ease;
            }

            .credentials
            {
                display: flex;
                flex-direction: column;
                margin-bottom: 20px;
            }

            .credentials label 
            {
                font-size: 14px;
                color: #8086a9;
            }

            .credentials input 
            {
                flex: 1;
                padding: 13px;
                background: #F7F7F7;
                border: 2px solid #555;
                border-radius: 8px;
                font-size: 16px;
            }
            

            .credentials input::placeholder 
            {
                color: #B8BDCD;
            }

            button 
            {
                width: 100%;
                padding: 10px;
                font-size: 18px;
                background: #1877f2;
                color: white;
                border: none;
                border-radius: 11px;
                cursor: pointer;
                font-family: 'Open Sans', sans-serif;
                margin-top: 15px;
            }

            .button2
            {
                width: 100%;
                padding: 10px;
                font-size: 18px;
                background: #06b909;
                color: white;
                border: none;
                border-radius: 11px;
                cursor: pointer;
                font-family: 'Open Sans', sans-serif;
                margin-top: 15px;
            }

            button:hover 
            {
                background: #B4B4B4;
            }

            @media(max-width: 458px) 
            {
                body 
                {
                    margin: 0 18px;
                }

                form 
                {
                    background: #f9faff;
                    border: none;
                    box-shadow: none;
                    padding: 20px 0;
                }
            }
            
            .error
            {
                color: #BF2727;
                text-align: center;
            }
            
            .image
            {
                width: 100%;
                max-width: 300px;
                height: auto;
            }
            
            p.home
            {
                text-align: center;
                color: #3a3c47;
            }
        </style>
    </head>
    <body>
        <p class="home"> Want to go back to Home Page? <a href="guest.jsp" style="color:#C91D1D;">Click here</a></p>
        <h1>Login</h1>
        <p>*Please fill the details below*</p>
        <form method="POST" action="LoginServlet.do" autocomplete="off">
            <div class="credentials">
                <label for="email">Username</label>
                <input type="text" name="username" placeholder="marvelouscat02" >
            </div>
            <div class="credentials">
                <label for="password">Password</label>
                <input type="password" name="password" placeholder="***********" >
            </div>
            <img class="image" src="<%=request.getContextPath()%>/simpleCaptcha.png">
            <br>
            <br>
            <div class="credentials">
                <label for="code">Characters: </label>
                <input type="text" name="code" >
            </div>
            <p class="error"> 
                <b>
                    <%
                        String error = (String) request.getAttribute("error");
                        
                        if (error == null)
                        {
                            out.println("");
                        }
                        else if(error.equals("Captcha"))
                        {
                            out.println("Error: Incorrect Captcha. Please Try Again.");
                        }
                    %>
                </b>
            </p>
            <button type="submit" name="action" value="FirstAction">Login</button>
            <br>
            <br>
            <hr>
            <button type="submit" class="button2" name="action" value="SecondAction">Create New Account</button>
        </form>
    </body>
</html>
