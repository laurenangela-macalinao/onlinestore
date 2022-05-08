/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
    //-----------------
    public String title;
    public float amount;
          
    public Cart(Connection conn){
        this.conn = conn;
    }
    
    public List<Cart> getCartList(int userId) throws SQLException {
        List<Cart> result = new ArrayList<Cart>();
     
        String query = "SELECT * FROM CS2609.carttbl WHERE iduser = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, userId);
        ResultSet rs = ps.executeQuery();
        while(rs.next()) {
            Cart c = new Cart(conn);
            Product p = new Product(conn);
        
            c.idcart = rs.getInt("idcart");
            c.idproduct = rs.getInt("idproduct");
            System.out.println("c.idproduct = " + c.idproduct);
            c.iduser = rs.getInt("iduser");
            //------------------------
            Product p2 = p.getProduct(c.idproduct);
            c.title = p2.title;
            c.amount = p2.unitprice;
            result.add(c);
        }        
        return result;
    }
    
    public void addToCart(int userId, int productId) throws SQLException {
        int lastId = getMaxId(); 
        System.out.println("lastId = " + lastId);
        String cmd = "INSERT INTO CS2609.carttbl (idcart,idproduct,iduser) VALUES (?,?,?)";
        PreparedStatement ps = conn.prepareStatement(cmd);
        ps.setInt(1, lastId + 1);
        ps.setInt(2, productId);
        ps.setInt(3, userId);
        ps.executeUpdate();
        ps.close();
    }
    
    public void removeFromCart(int cartId){
        
    }

    private int getMaxId() throws SQLException {
        String query = "SELECT MAX(idcart) as lastid FROM CS2609.carttbl";
        PreparedStatement ps = conn.prepareStatement(query);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getInt("lastid");
        }
        return 0;        
        
    }
   
    public boolean isCartEmpty()
    {
        return true;
    }
}
