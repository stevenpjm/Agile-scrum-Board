package dao;

import db.DBUtils;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author steven.masters
 */


/**
 *
 * @author steven.masters
 */

public class signup {
    
    private final String email;
    private final String username;
    private final String password;
    

    public signup(String emailin, String usernamein, String passwordin) {
       this.email = emailin;
       this.username = usernamein;
       this.password = passwordin;          
        
        PreparedStatement ts;
        try {
            ts = DBUtils.getPreparedStatment("INSERT INTO scrumboards.users (username, password, email) VALUES ( ?, ?, ?);");
            ts.setString(1, this.username);
            ts.setString(2, this.password);
            ts.setString(3, this.email);
            ts.executeUpdate();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        finally{ }
}
    
    
}
