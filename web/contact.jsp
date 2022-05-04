<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Book World - Guest</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css"/>
        <link rel="stylesheet" href="css/styles.css"/>
        <link rel="stylesheet" href="http://fonts.cdnfonts.com/css/lexend-deca"/>
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
                    <a class="d-flex" id="nav-login" href="login.jsp">
                        <button class="btn btn-outline-success">
                            Login
                        </button>
                    </a> 
                    <a class="d-flex" id="nav-signup" href="signup.jsp">
                        <button class="btn btn-outline-success">
                            Signup
                        </button>
                    </a> 
                </div>
            </div>
        </nav>
        
        <!-- Contact Page -->
        
        <div id="div-contact">
            <h1 id="h1-contact">Contact</h1>
            <table id="table-contact">
                <tr id="tr-profile">
                    <th id="th-profile">
                        <img id="img-contact"></img>
                        <h1 id="h1-name">Benedict Balancio</h1>
                        <h2 id="h2-contact">Email</h2> 
                        <h2 id="h2-detail"><button style='font-size:24px'><i class="bi bi-envelope"></i></button>Email</h2>
                        <h2 id="h2-contact">Facebook</h2> 
                        <h2 id="h2-detail"><button style='font-size:24px'><i class="bi bi-facebook"></i></button>Facebook</h2>
                        <h2 id="h2-contact">Twitter</h2> 
                        <h2 id="h2-detail"><button style='font-size:24px'><i class="bi bi-twitter"></i></button>Twitter</h2>
                        <h2 id="h2-contact">Instagram</h2> 
                        <h2 id="h2-detail"><button style='font-size:24px'><i class="bi bi-instagram"></i></button>Instagram</h2>
                    </th>
                    <th id="th-profile">
                        <img id="img-contact"></img>
                        <h1 id="h1-name">Gianina Gonzalez</h1>
                        <h2 id="h2-contact">Email</h2> 
                        <h2 id="h2-detail">Email</h2>
                        <h2 id="h2-contact">Facebook</h2> 
                        <h2 id="h2-detail">Facebook</h2>
                        <h2 id="h2-contact">Twitter</h2> 
                        <h2 id="h2-detail">Twitter</h2>
                        <h2 id="h2-contact">Instagram</h2> 
                        <h2 id="h2-detail">Instagram</h2>
                    </th>
                    <th id="th-profile">
                        <img id="img-contact"></img>
                        <h1 id="h1-name">Angela Macalinao</h1>
                        <h2 id="h2-contact">Email</h2> 
                        <h2 id="h2-detail">Email</h2>
                        <h2 id="h2-contact">Facebook</h2> 
                        <h2 id="h2-detail">Facebook</h2>
                        <h2 id="h2-contact">Twitter</h2> 
                        <h2 id="h2-detail">Twitter</h2>
                        <h2 id="h2-contact">Instagram</h2> 
                        <h2 id="h2-detail">Instagram</h2>
                    </th>
                </tr>
            </table>
        </div>
    </body>
</html>
