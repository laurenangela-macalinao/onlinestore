<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Book World - Reports</title>
        <meta charset="utf-8"/>
        <meta name="author" content=""/>
        <meta name="description" content=""/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <link rel="stylesheet" href="css/css-style.css"/>
        <link rel="stylesheet" href="css/styles.css"/>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico"/>
        <link rel="stylesheet" href="http://fonts.cdnfonts.com/css/lexend-deca"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"/>
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
