<%@page import="model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Book World - Product</title>
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
                    <a class="d-flex" id="nav-login" href="LogoutServlet.do">
                        <button class="btn btn-outline-success">
                            Logout
                        </button>
                    </a>                     
                </div>
            </div>
        </nav>

        <!-- Registered User: Product Details Page -->

        <header id="welcome-message" class="bg-info py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Product Details</h1>
                </div>
            </div>
        </header>
        <section class="py-5">
            <div class="container">               
                <div class="row" id="div-contact">
                    <div class="col-sm" id="div-bga">
                        <img src="
                             <%
                                String book = (String) request.getAttribute("book");
                                
                                out.println(book);
                                 
                             %>" class="img-thumbnail">
                    </div>
                    <div class="col-sm">
                        <div class="row-sm" id="div-bga1">
                            <h3 id="h1-cname">Title</h3>
                            <h1 id="h1-prod">Title</h1>
                        </div>
                        <div class="row-sm" id="div-bga1">
                            <h3 id="h1-cname">Author</h3>
                            <h1 id="h1-prod">Author</h1>
                        </div>
                        <div class="row-sm" id="div-bga1">
                            <h3 id="h1-cname">Publisher</h3>
                            <h1 id="h1-prod">Publisher</h1>
                        </div>
                        <div class="row-sm" id="div-bga1">
                            <h3 id="h1-cname">Order Quantity</h3>
                            <input id="input-prodamnt"></input>
                        </div>
                    </div>
                    <div class="col-sm">
                        <div class="row-sm" id="div-bga1">
                            <h3 id="h1-cname">Year/Edition</h3>
                            <h1 id="h1-prod">Year/Edition</h1>
                        </div>
                        <div class="row-sm" id="div-bga1">
                            <h3 id="h1-cname">Price</h3>
                            <h1 id="h1-prod">Price</h1>
                        </div>
                        <div class="row-sm" id="div-bga1">
                            <h3 id="h1-cname">Stock Count</h3>
                            <h1 id="h1-prod">Stock Count</h1>
                        </div>
                        <div class="row-sm">
                            <button id="btn-buy" type="submit">Buy Now</button>
                        </div>
                    </div>
                </div>               
            </div> 
        </section>

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
