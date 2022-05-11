
<%@page import="model.Cart"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Book World - Cart</title>
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
        <%
            String userId = (String) request.getAttribute("userId");
            String pageId = (String) request.getAttribute("pageId");

            List<Cart> cartInStockList = (List<Cart>) request.getAttribute("cartInStockList");
            List<Cart> cartNoStockList = (List<Cart>) request.getAttribute("cartNoStockList");

            System.out.println("cart.jsp - start");
            if (cartInStockList == null) {
                System.out.println("cart.jsp - cartInStockList == null");
            }
            if (cartNoStockList == null) {
                System.out.println("cart.jsp - cartNoStockList == null");
            }

            //request.setAttribute("cartInStockList", cartInStockList);
            //request.setAttribute("cartNoStockList", cartNoStockList);

        %>

        <!--Header-->
        <nav id="header" class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="ProductServlet.do?pageId=1&userId=3">Book World</a>
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

        <!-- Cart Page -->

        <header id="welcome-message" class="bg-info py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Shopping Cart</h1>
                    <p class="lead fw-normal text-white-50 mb-0">Select items from cart.</p>
                </div>
            </div>
        </header>
        <section class="py-5">
            <div class="container mt-3">         
                <form action="form.jsp">
                    <div class="container">
                        <%      
                            for (int i = 0; i < cartInStockList.size(); i++) 
                            {
                            String title = cartInStockList.get(i).title;
                            String author = cartInStockList.get(i).author;
                            String amount = "P" + cartInStockList.get(i).amount;
                            String item = cartInStockList.get(i).itemcount + " item";
                            String image;
                            if (cartInStockList.get(i).idcart > 10)
                                image = "assets\\book" + cartInStockList.get(i).idcart + "-450x300.jpg";
                            else
                                image = "assets\\book0" + cartInStockList.get(i).idcart + "-450x300.jpg";
                        %>
                        <div id="row-cart" class="row">
                            <div class="col-sm-3">
                                <input type="checkbox" name="id" value="0">
                                <img id="img-bcart" src="<%=image%>"  width="180" height="120">
                            </div>
                            <div class="col-sm-9">
                                <div class="row">
                                    <div class="col-8 col-sm-6">
                                        <h2 id="h2-book"><%=title%></h2>
                                        <br>
                                        <h2 id="h2-book"><%=author%></h2>
                                    </div>
                                    <div class="col-4 col-sm-6">
                                        <h2 id="h2-price"><%=amount%></h2>
                                        <br>
                                        <h2 id="h2-itemno"><%=item%></h2>
                                        <br>
                                        <h2 id="h2-trash"><i class="bi bi-trash"></i></h2>
                                    </div>                                
                                </div>
                            </div>
                        </div>

                        <%
                            }
                            System.out.println("cart.jsp - cart item list - done");

                        %>

                    </div>
                    <input id="input-select" type="submit" value="Select Items"></input>
                </form>      
            </div>
            <div class="text-center">
                <div id="div-cartp">
                    <%                            String s[] = request.getParameterValues("id");
                        if (s != null && s.length != 0) {
                            //table of values from cart depending on books, this will be generated by servlet
                            float[] array = new float[cartInStockList.size()];
                            for (int i = 0; i < cartInStockList.size(); i++) {
                                array[i] = cartInStockList.get(i).amount;
                            }
                            out.println("<form action=\"\">");
                            out.println("<h2 id=\"h2-cartp\">You have selected " + s.length + " items.</h2>");
                            float total = 0.0f;
                            for (int i = 0; i < s.length; i++) {
                                int id = Integer.valueOf(s[i]);
                                total += array[id];
                                if (i > 0) {
                                    out.println(",");
                                }
                                out.println("P" + array[i]);
                            }
                            out.println("<h2 id=\"h2-cartp\">Total Amount P" + total + "</h2>");
                            out.println("<br>");
                            out.println("<input id=\"input-select\" type=\"submit\" value=\"Pay now\"></input>");
                            out.println("</form>");
                        }
                    %>
                </div>
            </div>

            <!-- Out of Stock Items -->

            <%
                if (cartNoStockList != null && cartNoStockList.size() > 0) {
            %>
            <div class="py-3 text-center">
                <form action="">
                    <h2 id="h2-cart">Out of Stock Items</h2>
                    <div class="container">
                        <!-- Item 1 -->
                        <div id="row-cart" class="row">
                            <div class="col-sm-3">
                                <input type="checkbox" name="id" value="0">
                                <img id="img-bcart" src="assets\book99-450x300.jpg"  width="180" height="120">
                            </div>
                            <div class="col-sm-9">
                                <div class="row">
                                    <div class="col-8 col-sm-6">
                                        <h2 id="h2-book">Book 1</h2>
                                    </div>
                                    <div class="col-4 col-sm-6">
                                        <h2 id="h2-itemno">Out of Stock</h2>
                                    </div>                                
                                </div>
                            </div>
                        </div>
                        <!-- Item 2 -->
                        <div id="row-cart" class="row">
                            <div class="col-sm-3">
                                <input type="checkbox" name="id" value="0">
                                <img id="img-bcart" src="assets\book99-450x300.jpg"  width="180" height="120">
                            </div>
                            <div class="col-sm-9">
                                <div class="row">
                                    <div class="col-8 col-sm-6">
                                        <h2 id="h2-book">Book 2</h2>
                                    </div>
                                    <div class="col-4 col-sm-6">
                                        <h2 id="h2-itemno">Out of Stock</h2>
                                    </div>                                 
                                </div>
                            </div>
                        </div>
                        <!-- Item 3 -->
                        <div id="row-cart" class="row">
                            <div class="col-sm-3">
                                <input type="checkbox" name="id" value="0">
                                <img id="img-bcart" src="assets\book99-450x300.jpg"  width="180" height="120">
                            </div>
                            <div class="col-sm-9">
                                <div class="row">
                                    <div class="col-8 col-sm-6">
                                        <h2 id="h2-book">Book 3</h2>
                                    </div>
                                    <div class="col-4 col-sm-6">
                                        <h2 id="h2-itemno">Out of Stock</h2>
                                    </div>                                 
                                </div>
                            </div>
                        </div>
                        <!-- Item 4 -->
                        <div id="row-cart" class="row">
                            <div class="col-sm-3">
                                <input type="checkbox" name="id" value="0">
                                <img id="img-bcart" src="assets\book99-450x300.jpg"  width="180" height="120">
                            </div>
                            <div class="col-sm-9">
                                <div class="row">
                                    <div class="col-8 col-sm-6">
                                        <h2 id="h2-book">Book 4</h2>
                                    </div>
                                    <div class="col-4 col-sm-6">
                                        <h2 id="h2-itemno">Out of Stock</h2>
                                    </div>                               
                                </div>
                            </div>
                        </div>
                        <!-- Item 5 -->
                        <div id="row-cart" class="row">
                            <div class="col-sm-3">
                                <input type="checkbox" name="id" value="0">
                                <img id="img-bcart" src="assets\book99-450x300.jpg"  width="180" height="120">
                            </div>
                            <div class="col-sm-9">
                                <div class="row">
                                    <div class="col-8 col-sm-6">
                                        <h2 id="h2-book">Book 5</h2>
                                    </div>
                                    <div class="col-4 col-sm-6">
                                        <h2 id="h2-itemno">Out of Stock</h2>
                                    </div>                                  
                                </div>
                            </div>
                        </div>
                    </div>
                    <input id="input-delete" type="submit" value="Delete Items"></input>
                </form>           
            </div>
            <%
                }
            %>

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