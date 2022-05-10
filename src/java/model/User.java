package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class User {
    
    private Connection conn;

    public User(Connection conn)
    {
        this.conn = conn;
    }
    
    // SELECT username FROM UserDB
    public boolean isExits(String username) throws SQLException
    {
        String query = "SELECT username FROM cs2609.userdb WHERE username = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
        if (rs.next())
        {
            return true;
        }
        return false;        
    }

    // SELECT username FROM UserDB WHERE username = __value that you enter__
    public boolean isUnique(String username) throws SQLException
    {
        String query = "SELECT username FROM cs2609.userdb WHERE username = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
        if (rs.next())
        {
            return false;
        }
        return true;        
    }

    // SELECT password FROM UserDB WHERE username = __username__
    public String getPassword(String username) throws SQLException
    {
        String query = "SELECT password FROM cs2609.userdb WHERE username = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
        if (rs.next())
        {
            return rs.getString("password");
        }
        return "";
    }
    
    // INSERT
    public void savePassword(String username, String encryptedPassword, String role) throws SQLException
    {
        String cmd = "INSERT INTO cs2609.userdb (username, password, userrole) VALUES (?,?,?)";
        PreparedStatement ps = conn.prepareStatement(cmd);
        ps.setString(1, username);
        ps.setString(2, encryptedPassword);
        ps.setString(3, role);
        ps.executeUpdate();
        ps.close();
        
    }
 
}
