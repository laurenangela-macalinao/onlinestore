/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

public class Product{
    private Connection conn;
    
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
            
    public void Product(Connection conn){
        this.conn = conn;
    }

    //one or more
    public List<Product> GetProducts() {
        List<Product> result = new ArrayList<Product>();
        
        return result;
    }
    
    //unique - just one
    public Product GetProduct(String id) {
        return this;
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
