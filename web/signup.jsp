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
            String password2 = (String)session.getAttribute("password2");
            String userrole = (String)session.getAttribute("userrole");
            String email = (String)session.getAttribute("email");
            String phonenum = (String)session.getAttribute("phonenum");
            String address = (String)session.getAttribute("address");
            if(username == null) username = "";
            if(password == null) password = "";
            if(password2 == null) password2 = "";
            if(userrole == null) userrole = "";
            if(email == null) email = "";
            if(phonenum == null) phonenum = "";
            if(address == null) address = "";
        %>
         <div style="text-align: center">
            <h1>Admin Login</h1>
            <form name="captcha" action="SignupServlet.do" method="post">
                <label for="username">Username:</label>
                <input name="username" size="30" value="<%=username%>"/>
                <br><br>
                <label for="password">Password:</label>
                <input type="password" name="password" size="30" value="<%=password%>" />
                <br><br>
                <label for="password2">Password2:</label>
                <input type="password2" name="password2" size="30" value="<%=password2%>" />
                <br><br>
                <label>Role:</label>
                <select id="select" name="userrole">
                    <option value="admin">Admin</option>
                    <option value="user">Normal User</option>
                </select>
                <br><br>
                
                <label for="email">Email:</label>
                <input type="email" name="email" size="30" value="<%=email%>" />
                <br><br>
                <label for="phonenum">Phonenum:</label>
                <input type="phonenum" name="phonenum" size="30" value="<%=phonenum%>" />
                <br><br>
                <label for="address">Address:</label>
                <input type="address" name="address" size="30" value="<%=address%>" />
                <br><br>
                
                <img src="simpleImg"><br>
                <label for="answer">Answer:</label>
                <input name="answer" size="30" />
                <br><br>
                <br>${message}
                <button type="submit">Sign-up</button>
            </form>
            <p><a href="login.jsp">Login</a></p>
        </div>
                
    </body>
</html>
