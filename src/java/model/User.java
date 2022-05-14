package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class User {
    
    private Connection conn;
    
    public int iduser;
    public String username;
    public String password;
    public String userrole;
    public String email;
    public String phonenum;
    public String address;


    public User(Connection conn)
    {
        this.conn = conn;
    }
    
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

    public User getUserInfo(String username)  throws SQLException
    {
        String query = "SELECT password FROM cs2609.userdb WHERE username = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
        if (rs.next())
        {
            User user = new User(conn);
            user.iduser  = rs.getInt("iduser");
            user.username  = rs.getString("username");
            user.password  = rs.getString("password");
            user.userrole  = rs.getString("userrole");
            user.email  = rs.getString("email");
            user.phonenum  = rs.getString("phonenum");
            user.address  = rs.getString("address");
        }
        return null;
    }

    public int getUserId(String username) throws SQLException
    {
        String query = "SELECT password FROM cs2609.userdb WHERE username = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
        if (rs.next())
        {
            return rs.getInt("iduser");
        }
        return 0;
    }
    
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

    public String getRole(String username) throws SQLException
    {
        String query = "SELECT userrole FROM cs2609.userdb WHERE username = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
        if (rs.next())
        {
            return rs.getString("userrole");
        }
        return "";
    }
    
    
    public void saveUser(String username, String encryptedPassword, String userrole) throws SQLException
    {
        String cmd = "INSERT INTO cs2609.userdb (username, password, userrole) VALUES (?,?,?)";
        PreparedStatement ps = conn.prepareStatement(cmd);
        ps.setString(1, username);
        ps.setString(2, encryptedPassword);
        ps.setString(3, userrole);
        ps.executeUpdate();
        ps.close();
        
    }
 
}
