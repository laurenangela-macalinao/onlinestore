<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width-device-width, initial-scale=1.0">

       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css">
       <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
        
        
    </head>
    <body>

        <div  style="overflow:auto">
            <div class="container mb-3 mt-3" style="padding-bottom: 20px;">
                <h1 >Product List</h1><br>
        
                <table id="example" class="display nowrap cell-border" style="width:100%">
                   <thead>
                       <tr>
                           <th>ID</th>
                           <th>ISBN</th>
                           <th>Title</th>
                           <th>Author</th>
                           <th>Publisher</th>
                           <th>Edition/Year</th>
                           <th>Price</th>
                           <th>StockCount</th>
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
                       </tr>
                       
                    <!--                       
                        <tr>
                           <td>id1</td>
                           <td>sbn1</td>
                           <td>title1</td>
                           <td>author1</td>
                           <td>publisher1</td>
                           <td>edition1</td>
                           <td>price1</td>
                           <td>1</td>
                       </tr>-->
                   </tbody>
               </table>
            </div>
        </div>
        
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
        
        <script>
            $(document).ready(function() {
                $('#example').DataTable();
            } );
    </script>
        
    </body>
</html>
