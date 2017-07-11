/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import db.DBUtils;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author steven.masters
 */
public class userAdmin {
    
       public static ResultSet userAdmin (String username) {
      
       String check_username = username;
        ResultSet rs = null;
        
        try {
            rs = DBUtils.getPreparedStatment("SELECT * FROM scrumboards.users WHERE username='" + check_username + "';").executeQuery();


        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
            
        }
       
        
        return rs;
    
}
}
