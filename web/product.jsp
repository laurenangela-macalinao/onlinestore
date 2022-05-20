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
        <div id="div-prod">
            <section class="py-5">
                <div class="container">               
                    <div class="card"> 
                        <div class="row g-0"> 
                            <!-- Product Photo -->
                            <div class="col-md-6"> 
                                <div class="align-items-center"> 
                                    <div class="mt-5 px-4"> 
                                        <img src="assets/book99-450x300.jpg" class="img-thumbnail"> 
                                    </div> 
                                </div> 
                            </div> 
                            <div class="col-md-6"> 
                                <div class="h-100 d-flex justify-content-center align-items-center"> 
                                    <div class="py-4 px-3"> 
                                        <div class="row mt-2"> 
                                            <!-- Title -->
                                            <div class="col-md-12">
                                                <div class="input-field"> 
                                                    <label for="input3">Title</label> 
                                                    <h1 id="h1-pdetail">Title</h1>
                                                </div> 
                                            </div> 
                                        </div> 
                                        <div class="row g-2 mt-1"> 
                                            <!-- ISBN -->
                                            <div class="col-md-6"> 
                                                <div class="input-field"> 
                                                    <label for="input3">ISBN</label>
                                                    <h1 id="h1-pdetail">ISBN</h1>             
                                                </div> 
                                            </div> 
                                            <!-- Author -->
                                            <div class="col-md-6"> 
                                                <div class="input-field"> 
                                                    <label for="input1">Author</label>
                                                    <h1 id="h1-pdetail">Author</h1>
                                                </div> 
                                            </div>
                                        </div> 
                                        <div class="row g-2 mt-1"> 
                                            <!-- Publisher -->
                                            <div class="col-md-6"> 
                                                <label for="input2">Publisher</label>
                                                <h1 id="h1-pdetail">Publisher</h1>       
                                            </div> 
                                            <!-- Year/Edition -->
                                            <div class="col-md-6"> 
                                                <label for="input1">Year/Edition</label>
                                                <h1 id="h1-pdetail">Year/Edition</h1>             
                                            </div> 
                                        </div>
                                        <div class="row g-2 mt-1"> 
                                            <!-- Price -->
                                            <div class="col-md-6"> 
                                                <label for="input2">Price</label>
                                                <h1 id="h1-pdetail">Price</h1>                 
                                            </div>                   
                                            <!-- Stock Count -->
                                            <div class="col-md-6"> 
                                                <label for="input1">Stock Count</label>
                                                <h1 id="h1-pdetail">Stock Count</h1>              
                                            </div> 
                                        </div> 
                                        <div class="row g-2 mt-1">
                                            <button id="btn-save" type="submit">Buy Now</button>
                                        </div>
                                    </div> 
                                </div> 
                            </div>  
                        </div>                  
                    </div> 
            </section>
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
