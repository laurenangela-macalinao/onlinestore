
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
 <style>
      table,
      th,
      td {
        padding: 10px;
        border: 1px solid black;
        border-collapse: collapse;
      }
 </style><!-- comment -->        
    </head>
    <body>
        <h2>Select Items:</h2>
        <form ACTION="">
            <!-- 
            <input type="checkbox" name="id" value="120">Book 1 : P 120.00<BR>
            <input type="checkbox" name="id" value="150">Book 2 : P 150.00<BR>
            <input type="checkbox" name="id" value="210">Book 3 : P 210.00<BR>
            <input type="checkbox" name="id" value="130">Book 4 : P 130.00<BR>
            <input type="checkbox" name="id" value="180">Book 5 : P 180.00<BR>
            <input type="submit" value="Select Items">            
            -->            
            
            <table>
                <tr>
                    <td>Book 1</td>
                    <td>            
                        <input type="checkbox" name="id" value="120">P 120.00<BR>
                    </td>
                </tr>
                <tr>
                    <td>Book 2</td>
                    <td>            
                        <input type="checkbox" name="id" value="150">P 150.00<BR>
                    </td>
                </tr>
                <tr>
                    <td>Book 3</td>
                    <td>            
                        <input type="checkbox" name="id" value="210">P 210.00<BR>
                    </td>
                </tr>
                <tr>
                    <td>Book 4</td>
                    <td>            
                        <input type="checkbox" name="id" value="130">P 130.00<BR>
                    </td>
                </tr>
                <tr>
                    <td>Book 5</td>
                    <td>            
                        <input type="checkbox" name="id" value="180">P 180.00<BR>
                    </td>
                </tr>
                <tr>
                    <td>            
                        <input type="submit" value="Select Items">            
                    </td>
                </tr>
            </table>            
        </form>
        
        <%
            String s[] = request.getParameterValues("id");
            if (s != null && s.length != 0) {
                out.println("<h2>You have selected " + s.length + " items.</h2>");
                float total = 0.0f;
                for (int i = 0; i < s.length; i++) {
                    total += Float.valueOf(s[i]);
                }
                out.println("P" + String.join(",P",s));
                out.println("<h2>Total Amount P" + total + "</h2>");
        %> 
            <br>
            <a href="CheckoutServlet.do"><button>Pay now</button></a> 
        <%
            }
        %> 
        
    </body>
</html>



