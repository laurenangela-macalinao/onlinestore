/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 */
public class Cart {
    private Connection conn;

    public int idcart;
    public int idproduct;
    public int iduser;
    
    //public int totalItem; 
    //public float totalAmount; 
          
    public Cart(Connection conn){
        this.conn = conn;
    }
    
    public List<Cart> getCartList(int userid) throws SQLException {
        List<Cart> result = new ArrayList<Cart>();
     
        return result;
    }
    
    public void addToCart(int userid, int productid){
        //
    }
    
    public void removeFromCart(int userid, int productid){
        
    }

   
    public boolean isCartEmpty()
    {
        return true;
    }
}
