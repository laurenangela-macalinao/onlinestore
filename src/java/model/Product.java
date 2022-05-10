package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Product{
    public int idproduct;
    public String title;
    public String description;
    //image BLOB(1048576),
    public int stockcount;
    public float unitprice;
    //---- unique na approve final project
    public String edition;
    public String author;
    public String isbn;
    public String publisher;

    public int maxPage;

    private Connection conn;
    
    
    public Product(Connection conn){
        this.conn = conn;
        maxPage = 1;
    }

    //one or more
    public List<Product> getProductList(int targetPage) throws SQLException {
        List<Product> result = new ArrayList<Product>();
        String query = "SELECT * FROM cs2609.producttbl";
        PreparedStatement ps = conn.prepareStatement(query);
        ResultSet rs = ps.executeQuery();
        while (rs.next())
        {
            Product p = new Product(conn);
            p.idproduct = rs.getInt("idproduct");
            p.title  = rs.getString("title");
            p.description  = rs.getString("description");
            p.stockcount  = rs.getInt("stockcount");
            p.unitprice  = rs.getFloat("unitprice");
            p.edition  = rs.getString("edition");
            p.author  = rs.getString("author");
            p.isbn  = rs.getString("isbn");
            p.publisher  = rs.getString("publisher");
            result.add(p);
        }    
        ps.close();
        this.maxPage = (result.size() / 8) + 1;
        System.out.println("maxPage = " + this.maxPage);
        
        List<Product> activePage = new ArrayList<Product>();
        for(int i = 0; i < result.size(); i++)
        {
            if((((i) / 8)+ 1) == targetPage)
            {
               //System.out.println("Adding " + i);
               Product p = result.get(i);
               p.maxPage = maxPage;
               activePage.add(p);
            }
        }
        return activePage;
    }
    
    //unique - just one
    public Product getProduct(int prodId) throws SQLException {
        String query = "SELECT * FROM cs2609.producttbl WHERE idproduct = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, prodId);
        
        ResultSet rs = ps.executeQuery();
        if(rs.next())
        {
            Product p = new Product(conn);
            p.idproduct = rs.getInt("idproduct");
            p.title  = rs.getString("title");
            p.description  = rs.getString("description");
            p.stockcount  = rs.getInt("stockcount");
            p.unitprice  = rs.getFloat("unitprice");
            p.edition  = rs.getString("edition");
            p.author  = rs.getString("author");
            p.isbn  = rs.getString("isbn");
            p.publisher  = rs.getString("publisher");
            ps.close();
            return p;
        }    
        ps.close();
        return null;
    }

    public void AddProduct(Product prod)
    {
        
    }
    
    public void EditProduct(Product prod)
    {
        
    }
    
    public void ReduceProductStock(Product prod)
    {
        
    }
    
}
