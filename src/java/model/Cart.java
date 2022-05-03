/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.sql.Connection;

/**
 *
 */
public class Cart {
    private Connection conn;

    public int idcart;
    public int idproduct;
    public int iduser;
    
    public int totalItem; 
    public float totalAmount; 
          
    public void Cart(Connection conn){
        this.conn = conn;
    }
    
    
    public void addToCart(int userid, int productid){
        
    }
    
    public void removeFromCart(int userid, int productid){
        
    }

   
    public boolean isCartEmpty()
    {
        return true;
    }
}
