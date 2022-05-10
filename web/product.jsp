<%@page import="model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Book World - Product List</title>
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
              <h2>Product List</h2>

              <table class="table">
                   <thead>
                       <tr>
                           <th>#</th>
                           <th>ISBN</th>
                           <th>Title</th>
                           <th>Author</th>
                           <th>Publisher</th>
                           <th>Edition/Year</th>
                           <th>Price</th>
                           <th>StockCount</th>
                           <th> </th>
                           <th> </th>
                       </tr>
                   </thead>
                   <tbody>
                       <tr>
                           <td>1</td>
                           <td>978971980173</td>
                           <td>Automata Theory</td>
                           <td>Cecil Jose A. Delfinado</td>
                           <td>C & E Publishing, Inc.</td>
                           <td>2014</td>
                           <td>498.00</td>
                           <td>2</td>
                           <td><i class="bi bi-pencil-square"></i></td>
                           <td><i class="bi bi-trash"></i></td>
                       </tr>
                       <tr>
                           <td>2</td>
                           <td>9781285911304</td>
                           <td>Applied Calculus for Business, Life and Social Sciences</td>
                           <td>Soo Tan</td>
                           <td>Cengage Learning</td>
                           <td>9th Edition, 2013</td>
                           <td>648.00</td>
                           <td>3</td>
                           <td><i class="bi bi-pencil-square"></i></td>
                           <td><i class="bi bi-trash"></i></td>
                       </tr>
                       <tr>
                           <td>3</td>
                           <td>9780596516680</td>
                           <td>Head First Servlets and JSP</td>
                           <td>Kathy Sierra</td>
                           <td>OReilly Media, Inc.</td>
                           <td>March 2008</td>
                           <td>1099.00</td>
                           <td>2</td>
                           <td><i class="bi bi-pencil-square"></i></td>
                           <td><i class="bi bi-trash"></i></td>
                       </tr>
                       <tr>
                           <td>4</td>
                           <td>9780240522005</td>
                           <td>Adobe Photoshop CS5 for Photographers</td>
                           <td>Martin Evening</td>
                           <td>Elsevier</td>
                           <td>2010</td>
                           <td>3099.00</td>
                           <td>1</td>
                           <td><i class="bi bi-pencil-square"></i></td>
                           <td><i class="bi bi-trash"></i></td>
                       </tr>
                       <tr>
                           <td>5</td>
                           <td>9781598630244</td>
                           <td>Faces of Music: 25 Years of Lunching with Legends</td>
                           <td>Mr. Bonzai</td>
                           <td>Cengage Learning</td>
                           <td>2006</td>
                           <td>1870.00</td>
                           <td>1</td>
                           <td><i class="bi bi-pencil-square"></i></td>
                           <td><i class="bi bi-trash"></i></td>
                       </tr>
                       <tr>
                           <td>6</td>
                           <td>9784770030542</td>
                           <td>21st Century Tokyo: A Guide to Contemporary Architecture</td>
                           <td>Julian Worrall</td>
                           <td>Oxford University Press</td>
                           <td>2010</td>
                           <td>1448.00</td>
                           <td>5</td>
                           <td><i class="bi bi-pencil-square"></i></td>
                           <td><i class="bi bi-trash"></i></td>
                       </tr>
                       <tr>
                           <td>7</td>
                           <td>9780071114677</td>
                           <td>An Introduction to Object-Oriented Programming with Java</td>
                           <td>C.Thomas Wu</td>
                           <td>McGraw-Hill</td>
                           <td>3rd Edition, 2004</td>
                           <td>1470.00</td>
                           <td>2</td>
                           <td><i class="bi bi-pencil-square"></i></td>
                           <td><i class="bi bi-trash"></i></td>
                       </tr>
                       <tr>
                           <td>8</td>
                           <td>9781307428674</td>
                           <td>Discrete Mathematics and Its Applications</td>
                           <td>Kenneth H. Rosen</td>
                           <td>McGraw-Hill</td>
                           <td>8th Edition, 2019</td>
                           <td>978.00</td>
                           <td>2</td>
                           <td><i class="bi bi-pencil-square"></i></td>
                           <td><i class="bi bi-trash"></i></td>
                       </tr>
                       
                   </tbody>
              </table>
              
            </div>
           
            
            <ul class="pagination justify-content-center" style="margin:10px 0">
                <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
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
