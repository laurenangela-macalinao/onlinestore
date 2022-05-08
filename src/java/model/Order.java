package model;

import java.sql.Connection;

public class Order {
    private Connection conn;
    
    public Order(Connection conn){
        this.conn = conn;
    }
    

}
