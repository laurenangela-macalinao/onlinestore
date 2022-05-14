<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="http://fonts.cdnfonts.com/css/dunkin-lyons" rel="stylesheet">
        <link rel="stylesheet" href="sc.css"/>
        <title>Login</title>
    </head>
    <body>
        <%
            //try to get previous value
            String username = (String)session.getAttribute("username");
            String password = (String)session.getAttribute("password");
            if(username == null) username = "";
            if(password == null) password = "";
        %>
         <div style="text-align: center">
            <h1>Admin Login</h1>
            <form name="captcha" action="LoginServlet.do" method="post">
                <label for="username">Username:</label>
                <input name="username" size="30" value="<%=username%>"/>
                <br><br>
                <label for="password">Password:</label>
                <input type="password" name="password" size="30" value="<%=password%>" />
                <br><br>
                <img src="simpleImg"><br>
                <label for="answer">Answer:</label>
                <input name="answer" size="30" />
                <br>${message}
                <br>
                <button type="submit">Login</button>
            </form>
            <p><a href="signup.jsp">Sign-up</a></p>
        </div>
                
    </body>
</html>
