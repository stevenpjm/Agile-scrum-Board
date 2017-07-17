/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import db.DBUtils;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author steven.masters
 */
public class signIn {
    
    
     public static ResultSet signIn(String email, String pwd) {
        ResultSet rs = null;
        try { 
            rs = DBUtils.getPreparedStatment("select * from users where email='" + email + "' and password='" + pwd + "'").executeQuery();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
         
        return rs;
    }
    
    
}

    

