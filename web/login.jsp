<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<!--         
        <h1>Login Page - no code yet - simulate as if login is successful!</h1>
        <a href="ProductServlet.do?pageId=1&userId=3"><button>Reg User : Testing only</button></a> 
        <br>
        <a href="admin.jsp?pageId=1&userId=1"><button>Admin    : Testing only</button></a> 
 -->
        <!-- add page id and set to 1 , add userid -->
        
        <div style="text-align: center">
            <h1>Admin Login</h1>
            <form action="login" method="post">
                <label for="username">Username:</label>
                <input name="username" size="30" />
                <br><br>
                <label for="password">Password:</label>
                <input type="password" name="password" size="30" />
                <br><br>
                <label for="answer">Answer:</label>
                <input name="answer" size="30" />
                <br><br>
                
                <br>${message}
                <br><br>           
                <button type="submit">Login</button>
            </form>
        </div>        
                
        <%
            System.out.println("Index.jps - start");
            System.out.println("Session ID: " + session.getId());
            System.out.println("Session.isNew(): " + session.isNew());
            System.out.println("Creation Time: " + new Date(session.getCreationTime()));
            System.out.println("Last Accessed Time: " + new Date(session.getLastAccessedTime()));
            System.out.println("Index.jps - end");
        %>    
        <div style="text-align: left">
            <h2>Session ID : <%=session.getId()%> </h2>
            <h2>IsNew      : <%=session.isNew()%> </h2>
            <h2>Creation Time: <%=new Date(session.getCreationTime())%> h2h1>
            <h2>Last Accessed Time: <%=new Date(session.getLastAccessedTime())%> </h2>            
        </div>        
    </body>
</html>
