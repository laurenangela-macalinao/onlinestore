<%@page import="model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Book World - Add Product</title>
        <meta charset="utf-8"/>
        <meta name="author" content=""/>
        <meta name="description" content=""/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
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
        

        <!-- Section-->
        <section class="py-5">
            <div class="container mt-3">
                <div class="py-5 text-center">
                    <h2>Add Product</h2>
                </div>
                
              <div class="card"> 
                <div class="row g-0"> 
                    <div class="col-md-6"> 
                        <div class="h-100 d-flex justify-content-center align-items-center"> 
                            <div class="py-4 px-3"> 
                                <div class="row g-2 mt-1"> 
                                    <div class="col-md-6"> 
                                        <div class="input-field"> 
                                            <input class="form-control" id="title" placeholder="Enter Title" required> 
                                            <label for="input1">Title</label> 
                                        </div> 
                                    </div> 
                                    <div class="col-md-6"> <div class="input-field"> 
                                            <input class="form-control" id="isbn" placeholder="Enter ISBN" required> 
                                            <label for="input2">ISBN</label> 
                                        </div> 
                                    </div> 
                                </div> 
                                <div class="row g-2 mt-1"> 
                                    <div class="col-md-6"> 
                                        <div class="input-field"> 
                                            <input class="form-control" id="author" placeholder="Enter Author" required> 
                                            <label for="input1">Author</label> 
                                        </div> 
                                    </div> 
                                    <div class="col-md-6"> <div class="input-field"> 
                                            <input class="form-control" id="publisher" placeholder="Enter Publisher" required> 
                                            <label for="input2">Publisher</label> 
                                        </div> 
                                    </div> 
                                </div> 
                                
                                <div class="row g-2 mt-1"> 
                                    <div class="col-md-6"> 
                                        <div class="input-field"> 
                                            <input class="form-control" id="edition" placeholder="Enter Year/Edition" required> 
                                            <label for="input1">Year/Edition</label> 
                                        </div> 
                                    </div> 
                                    <div class="col-md-6"> <div class="input-field"> 
                                            <input class="form-control" id="price" placeholder="Enter Price" required> 
                                            <label for="input2">Price</label> 
                                        </div> 
                                    </div> 
                                </div> 
                                
                                <div class="row mt-2"> 
                                    <div class="col-md-12"> <div class="input-field"> 
                                            <input class="form-control" id="description" placeholder="Enter Description" required> 
                                            <label for="input3">Description</label> 
                                        </div> 
                                    </div> 
                                </div> 
                                
                                <div class="row g-2 mt-1"> 
                                    <div class="col-md-6"> 
                                        <div class="input-field"> 
                                            <input class="form-control" id="stockcount" placeholder="Enter Stock Count" required> 
                                            <label for="input1">Stock Count</label> 
                                        </div> 
                                    </div> 
                                    <div class="col-md-6"> <div class="input-field"> 
                                            <input class="form-control" id="imageid" placeholder="Enter Image Location" required> 
                                            <label for="input2">Image Location</label> 
                                        </div> 
                                    </div> 
                                </div> 
                            </div> 
                        </div> 
                    </div> 
                    <div class="col-md-6"> 
                        <div class="right-side-content"> 
                            <div class="right-side mt-5"> 
                                <img src="assets/book99-450x300.jpg" class="img-thumbnail"> 
                            </div> 
                        </div> 
                    </div> 
                    
                    <div class="container "> 
                        <button class="w-100 btn btn-danger btn-lg justify-content-center" type="submit">Save</button>
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
