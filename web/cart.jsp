
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Book World - Cart</title>
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

        <!-- Cart Page -->
        <div id="div-cart">
            <h1 id="h1-cart">Shopping Cart</h1>
            <form id="form-cart" action="">
                <h2 id="h2-cart">Select Items from Cart</h2>

                <div class="container">
                    <!-- Item 1 -->
                    <div class="row">
                        <div class="col-sm-3">
                            <input type="checkbox" name="id" value="0">
                            <img src="assets\book99-450x300.jpg"  width="90" height="60">
                        </div>
                        <div class="col-sm-9">
                            <div class="row">
                                <div class="col-8 col-sm-6">
                                    Book 1
                                </div>
                                <div class="col-4 col-sm-6">
                                    P120.00
                                    <br>
                                    1 item
                                </div>                                
                            </div>
                        </div>
                    </div>
                    <!-- Item 2 -->
                    <div class="row">
                        <div class="col-sm-3">
                            <input type="checkbox" name="id" value="0">
                            <img src="assets\book99-450x300.jpg"  width="90" height="60">
                        </div>
                        <div class="col-sm-9">
                            <div class="row">
                                <div class="col-8 col-sm-6">
                                    Book 2
                                </div>
                                <div class="col-4 col-sm-6">
                                    P120.00
                                    <br>
                                    1 item
                                </div>                                
                            </div>
                        </div>
                    </div>
                    <!-- Item 3 -->
                    <div class="row">
                        <div class="col-sm-3">
                            <input type="checkbox" name="id" value="0">
                            <img src="assets\book99-450x300.jpg"  width="90" height="60">
                        </div>
                        <div class="col-sm-9">
                            <div class="row">
                                <div class="col-8 col-sm-6">
                                    Book 3
                                </div>
                                <div class="col-4 col-sm-6">
                                    P120.00
                                    <br>
                                    1 item
                                </div>                                
                            </div>
                        </div>
                    </div>
                    <!-- Item 4 -->
                    <div class="row">
                        <div class="col-sm-3">
                            <input type="checkbox" name="id" value="0">
                            <img src="assets\book99-450x300.jpg"  width="90" height="60">
                        </div>
                        <div class="col-sm-9">
                            <div class="row">
                                <div class="col-8 col-sm-6">
                                    Book 4
                                </div>
                                <div class="col-4 col-sm-6">
                                    P120.00
                                    <br>
                                    1 item
                                </div>                                
                            </div>
                        </div>
                    </div>
                    <!-- Item 5 -->
                    <div class="row">
                        <div class="col-sm-3">
                            <input type="checkbox" name="id" value="0">
                            <img src="assets\book99-450x300.jpg"  width="90" height="60">
                        </div>
                        <div class="col-sm-9">
                            <div class="row">
                                <div class="col-8 col-sm-6">
                                    Book 5
                                </div>
                                <div class="col-4 col-sm-6">
                                    P120.00
                                    <br>
                                    1 item
                                </div>                                
                            </div>
                        </div>
                    </div>
                </div>
                <input type="submit" value="Select Items"></input>
            </form>      

            <!-- start table containing out of stock items -->
            <!-- end table containing out of stock items -->

            <%
                //table of values from cart depending on books, this will be generated by servlet
                float[] array = {120.0f, 150.0f, 210.0f, 130.0f, 180.0f};

                String s[] = request.getParameterValues("id");
                if (s != null && s.length != 0) {
                    out.println("<h2>You have selected " + s.length + " items.</h2>");
                    float total = 0.0f;
                    for (int i = 0; i < s.length; i++) {
                        int id = Integer.valueOf(s[i]);
                        total += array[id];
                        if (i > 0) {
                            out.println(",");
                        }
                        out.println("P" + array[i]);
                    }
                    out.println("<h2>Total Amount P" + total + "</h2>");
            %> 
            <br>
            <a href="CheckoutServlet.do"><button>Pay now</button></a> 
            <%
                }
            %>
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