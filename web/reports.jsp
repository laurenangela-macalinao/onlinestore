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
        <!--Header-->
        <nav id="header" class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#!">Book World</a>
                <button class="navbar-toggler" 
                        type="button" 
                        data-bs-toggle="collapse" 
                        data-bs-target="#navbarSupportedContent" 
                        aria-controls="navbarSupportedContent" 
                        aria-expanded="false" 
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" 
                     id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4"></ul>
                    <a class="d-flex" id="nav-login" href="reports.jsp">
                        <button class="btn btn-outline-success">
                            Reports
                        </button>
                    </a>                     
                    <a class="d-flex" id="nav-login" href="LogoutServlet.do">
                        <button class="btn btn-outline-success">
                            Logout
                        </button>
                    </a>                     
                </div>
            </div>
        </nav>

        <!-- Reports Page -->

        <header id="welcome-message" class="bg-info py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Administrator</h1>
                    <p class="lead fw-normal text-white-50 mb-0">Reports</p>
                </div>
            </div>
        </header>

        <div id="div-reports">
            <div class="row">
                <div class="col-sm" id="div-reportcol">
                    <label for="list">List</label><br>
                    <select name="list" id="list">
                        <option value="admin">Admin</option>
                        <option value="registered user">Registered User</option>
                    </select><br>
                    <button id="btn-list" type="submit">Submit</button>
                </div>
                <div class="col-sm">

                </div>
                <div class="col-sm">

                </div>
            </div>
        </div>

        <!-- Footer -->
        <footer id="footer" class="py-5 bg-dark">
            <div class="container">
                <p class="m-0 text-center text-white">
                    Copyright &copy; Book World 2022<br>
                    Balancio, Gonzalez, & Macalinao<br>
                    <a id="contact" class="nav-link" href="contact.jsp">
                        Contact Us
                    </a>
                </p>
            </div>
        </footer>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
