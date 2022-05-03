/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.sql.Connection;

public class Payment {
    private Connection conn;
    
    public void Payment(Connection conn){
        this.conn = conn;
    }

    //how to transfer from cart to payment
    public void addToPaymentFromCart() {
        
    }
    
    
    public boolean tryToPayOnline(){
    
        //reduce stock count of each product by 1
        //set the order to paid
        
        return true;
    }
}
