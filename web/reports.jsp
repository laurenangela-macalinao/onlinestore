<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>This generate sales reports</h1>
        <form action="ReportSalesServlet.do" method="POST">
            <label for="report">Choose a report:</label>
            <select id="report" name="reporttype" size="3">
                <option value="sales" selected="selected">Sales Report</option>
                <option value="inventory">Inventory Report</option>
            </select><br>
            <input type="submit" value="Submit" />
        </form>        
    </body>
</html>
