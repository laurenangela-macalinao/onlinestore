<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Book World - Registered</title>
        <meta charset="utf-8"/>
        <meta name="author" content=""/>
        <meta name="description" content=""/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <link rel="stylesheet" href="style.css"/>
        <link rel="stylesheet" href="css/styles.css"/>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico"/>
        <link rel="stylesheet" href="http://fonts.cdnfonts.com/css/lexend-deca"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"/>
    </head>
    
    <body> 
        <!--Header-->
        <nav id="header" class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
            <a class="navbar-brand" href="#!">Book Worlds</a>
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
                    <form class="d-flex" action="cart.jsp" method="GET">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill">5</span>
                         </button>
                    </form>
                    <a class="d-flex" id="nav-login" href="LogoutServlet.do">
                        <button class="btn btn-outline-success">
                            Logout
                        </button>
                    </a>                     
                </div>
            </div>
        </nav>
        
        <!-- Registered Page -->

        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <%
                        int maxPage = 1;
                        
                        List<Product> productList = (List<Product>) request.getAttribute("productList");
                        maxPage = productList.get(0).maxPage;
                        for (Product product : productList) {
                            String img;
                            if(product.idproduct < 10)
                                img = "assets/book0" + product.idproduct + "-450x300.jpg";
                            else
                                img = "assets/book" + product.idproduct + "-450x300.jpg";
                    %>            
                            <div class="col mb-5">
                                <div id="card" class="card h-100">
                                    <img class="card-img-top" src="<%=img%>" alt="..." />
                                    <div class="card-body p-4">
                                        <div class="text-center"><h5 class="fw-bolder"><%=product.title%></h5><%=product.unitprice%></div>
                                    </div>
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        <div class="text-center">
                                            <a class="btn btn-outline-dark mt-auto" href="#">Add to Cart</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    <%
                        }
                    %>
<!-- static dummy code                    
                    <div class="col mb-5">
                        <div id="card" class="card h-100">
                            <img class="card-img-top" src="assets/book01-450x300.jpg" alt="..." />
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder">
                                        Automata Theory
                                    </h5>
                                    P498.00
                                </div>
                            </div>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <a class="btn btn-outline-dark mt-auto" href="#">
                                        Add to Cart
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div id="card" class="card h-100">
                            <img class="card-img-top" src="assets/book02-450x300.jpg" alt="..." />
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder">
                                        Applied Calculus for Business, Life and Social Sciences
                                    </h5>
                                    P648.00
                                </div>
                            </div>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <a class="btn btn-outline-dark mt-auto" href="#">
                                        Add to Cart
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div id="card" class="card h-100">
                            <img class="card-img-top" src="assets/book03-450x300.jpg" alt="..." />
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder">
                                        Head First Servlets and JSP
                                    </h5>
                                    P1099.00
                                </div>
                            </div>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <a class="btn btn-outline-dark mt-auto" href="#">
                                        Add to Cart
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div id="card" class="card h-100">
                            <img class="card-img-top" src="assets/book04-450x300.jpg" alt="..." />
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder">
                                        Adobe Photoshop CS5 for Photographer
                                    </h5>
                                    P3099.00
                                </div>
                            </div>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <a class="btn btn-outline-dark mt-auto" href="#">
                                        Add to Cart
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div id="card" class="card h-100">
                            <img class="card-img-top" src="assets/book05-450x300.jpg" alt="..." />
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder">
                                        Faces of Music: 25 Years of Lunching with Legends
                                    </h5>
                                    P1870.00
                                </div>
                            </div>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <a class="btn btn-outline-dark mt-auto" href="#">
                                        Add to Cart
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div id="card" class="card h-100">
                            <img class="card-img-top" src="assets/book06-450x300.jpg" alt="..." />
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder">
                                        21st Century Tokyo: A Guide to Contemporary Architecture
                                    </h5>
                                    P1448.00
                                </div>
                            </div>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <a class="btn btn-outline-dark mt-auto" href="#">
                                        Add to Cart
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div id="card" class="card h-100">
                            <img class="card-img-top" src="assets/book07-450x300.jpg" alt="..." />
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder">
                                        An Introduction to Object-Oriented Programming with Java
                                    </h5>
                                    P1470.00
                                </div>
                            </div>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <a class="btn btn-outline-dark mt-auto" href="#">
                                        Add to Cart
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div id="card" class="card h-100">
                            <img class="card-img-top" src="assets/book08-450x300.jpg" alt="..." />
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder">
                                        Discrete Mathematics and Its Applications
                                    </h5>
                                    P978.00
                                </div>
                            </div>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <a class="btn btn-outline-dark mt-auto" href="#">
                                        Add to Cart
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
-->
                </div>
            </div>

            
            <ul class="pagination justify-content-center" style="margin:10px 0">
                <%
                    for(int i = 1; i <= maxPage; i++) {
                %>
                    <li class="page-item"><a class="page-link" href="ProductServlet.do?page=<%=i%>"><%=i%></a></li>
                <%
                    }
                %>
              </ul>
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
