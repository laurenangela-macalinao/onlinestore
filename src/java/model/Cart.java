package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Cart {

    public int idcart;
    public int idproduct;
    public int iduser;
    //-----------------
    public String title;
    public String author;
    public float amount;
    public int itemcount;
    
    private Connection conn;
    
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
            c.iduser = rs.getInt("iduser");
            //------------------------
            Product p2 = p.getProduct(c.idproduct);
            c.title = p2.title;
            c.amount = p2.unitprice;
            c.itemcount = 1;
            result.add(c);
        }        
        return result;
    }
    
    public List<Cart> getInStockCartList(int userId) throws SQLException {
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
            c.iduser = rs.getInt("iduser");
            //------------------------
            Product p2 = p.getProduct(c.idproduct);
            c.title = p2.title;
            c.author = p2.author;
            c.amount = p2.unitprice;
            c.itemcount = 1;
            if(p2.stockcount > 0) {
                result.add(c);
            }
        }        
        return result;
    }
    
    public List<Cart> getNoStockCartList(int userId) throws SQLException {
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
            c.iduser = rs.getInt("iduser");
            //------------------------
            Product p2 = p.getProduct(c.idproduct);
            c.title = p2.title;
            c.author = p2.author;
            c.amount = p2.unitprice;
            if(p2.stockcount == 0) {
                result.add(c);
            }
        }        
        return result;
    }
    
    
    public void addToCart(int userId, int productId) throws SQLException {
        int lastId = getMaxId(); 
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
