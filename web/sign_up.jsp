<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign Up Page</title>

        <style>
            @import url('https://fonts.googleapis.com/css?family=Open+Sans&display=swap');

            body 
            {
                font-family: 'Open Sans', sans-serif;
                background-image: url("pictures/signup_background.png");
                background-position: center center;
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: cover;
                color: #3a3c47;
                line-height: 1.2;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            h1
            {
                margin-top: 0px;
                font-size: 35px;
            }

            p.sub-head
            {
                margin-top: -10px;
            }

            p.header
            {
                font-size: 10px;
                text-align: center;
            }

            p.footer
            {
                font-size: 10px;
                color: #6E6E6E;
                text-align: center;
            }

            p.home
            {
                text-align: center;
                color: #3a3c47;
            }

            form 
            {
                background: white;
                max-width: 410px;
                width: 100%;
                padding: 40px 44px;
                border: 1px solid #D6D7E7;
                border-radius: 7px;
            }

            .credentials
            {
                display: flex;
                flex-direction: column;
                margin-bottom: 20px;
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

            .button2
            {
                width: 20%;
                padding: 7px;
                font-size: 18px;
                background: #06b909;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-family: 'Open Sans', sans-serif;
                margin-top: 15px;
            }

            button:hover 
            {
                background: #B4B4B4;
            }

            select
            {
                width: 20%;
                padding: 5px;
                font-size: 16px;
                background: #E1E1E1;
                color: #4C4C4C;
                border: none;
                border-radius: 8px;
                cursor: pointer;
                font-family: 'Open Sans', sans-serif;
                border: 1.5px solid #555;
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
        </style>
    </head>
    <body>
        <p class="home"> Want to go back to Home Page? <a href="guest.jsp" style="color:#C91D1D;">Click here</a></p>
        <form method="POST" action="LoginServlet">
            <h1>Sign Up </h1>
            <p class="sub-head">Please fill in this form to create an account!
            <hr>
            <br>
            <div class="credentials">
                <input type="text" name="username2" placeholder="Username" required>
            </div>
            <div class="credentials">
                <input type="text" name="password2" placeholder="Password" required>
            </div>
            <div class="credentials">
                <input type="text" name="confirm-password" placeholder="Confirm Password" required>
            </div>
            <label for="role">Choose your role:</label>
            <select name="role" id="role">
                <option value="guest">Guest</option>
                <option value="admin">Admin</option>
            </select>
            <br>
            <br>
            <img class="image" src="<%=request.getContextPath()%>/simpleCaptcha.png">
            <br>
            <label for="code">Characters: </label>
            <input type="text" name="code2" autocomplete="false" required>
            <br>
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
                        else if(error.equals("Username"))
                        {
                            out.println("Error: Username Already Exist. Please Try Again.");
                        }
                        else if(error.equals("Password"))
                        {
                            out.println("Error: Passwords Do Not Match. Please Try Again.");
                        }
                    %>
                </b>
            </p>
            <button type="submit" class="button2" name="action" value="ThirdAction">Sign Up</button>
        </form>
        <p class="home"> Already have an account? <a href="login.jsp" style="color:#1A1B20;">Login here</a></p>
    </body>
</html>
