/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Benedict Balancio
 */

public class DBConnectionModel 
{
    private String dbDriver;
    private String dbUsername;
    private String dbPassword;
    private String dbURL;
    
    private String userName;
    private String passWord;
    
    private int executeValue;

    public DBConnectionModel(String dbDriver, String dbUsername, String dbPassword, String dbURL) 
    {
        this.dbDriver = dbDriver;
        this.dbUsername = dbUsername;
        this.dbPassword = dbPassword;
        this.dbURL = dbURL;
    }
    
    public Connection getConnection()
    {
        Connection conn = null;
        
        try
        {
            Class.forName(dbDriver);
            String username = dbUsername;
            String password = dbPassword;
            String url = dbURL;
            conn = DriverManager.getConnection(url, username, password);
        }
        catch (SQLException sqle) 
        {
            System.out.println("SQLException error occured - "
                    + sqle.getMessage());
        } 
        catch (ClassNotFoundException nfe) 
        {
            System.out.println("ClassNotFoundException error occured - "
                    + nfe.getMessage());
        }
        
        return conn;
    }
    
    public void setUserName(String userName) 
    {
        this.userName = userName;
    }

    public String getUserName() 
    {
        return userName;
    }

    public void setPassWord(String passWord) 
    {
        this.passWord = passWord;
    }
    
    public ResultSet checkUserName() 
    {
        ResultSet records = null;
        try 
        {
            String query = "SELECT * FROM USER_INFO WHERE USERNAME = ?";
            PreparedStatement ps = getConnection().prepareStatement(query);
            ps.setString(1, userName);
            records = ps.executeQuery();
        } 
        catch (SQLException sqle) 
        {
            sqle.printStackTrace();
        }
        
       return records;
    }
    
    public String getPassword() 
    {
        ResultSet records = null;
        String password = "";
        
        try 
        { 
            String query = "SELECT * FROM USER_INFO WHERE USERNAME = ?";
            PreparedStatement ps = getConnection().prepareStatement(query);
            ps.setString(1, userName);
            records = ps.executeQuery();
            
            while(records.next())
            {
                password = records.getString("PASSWORD").trim();
            }
        } 
        catch (SQLException sqle) 
        {
            sqle.printStackTrace();
        }
        
        return password;
    }
    
    public void insertUserRecord(String username, String password, String role)
    {
        try 
        {
            String query = "INSERT INTO USER_INFO (Username, Password, User_Role) VALUES (?, ?, ?)";

            PreparedStatement statement = getConnection().prepareStatement(query);
            statement.setString(1, username);
            statement.setString(2, password);
            statement.setString(3, role);
         
            this.executeValue = statement.executeUpdate();
        } 
        catch (SQLException sqle) 
        {
            sqle.printStackTrace();
        }
    }
    
    public String getRole() 
    {
        ResultSet records = null;
        String role = "";
        
        try 
        { 
            String query = "SELECT * FROM USER_INFO WHERE USERNAME = ?";
            PreparedStatement ps = getConnection().prepareStatement(query);
            ps.setString(1, userName);
            records = ps.executeQuery();
            
            while(records.next())
            {
                role = records.getString("USER_ROLE").trim();
            }
        } 
        catch (SQLException sqle) 
        {
            sqle.printStackTrace();
        }
        
        return role;
    }
    
    public ResultSet getAllRecords() 
    {
        ResultSet records = null;
        
        try 
        {
            String query = "SELECT * FROM USER_INFO";
            PreparedStatement ps = getConnection().prepareStatement(query);
            records = ps.executeQuery();  
        } 
        catch (SQLException sqle) 
        {
            sqle.printStackTrace();
        }
        
       return records;
    }

}
