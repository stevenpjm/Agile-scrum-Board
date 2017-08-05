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
public class teamMembers {
    public static ResultSet teamMembers(int scrumID) {
        ResultSet userDetails = null;
        try {
            userDetails = DBUtils.getPreparedStatment("SELECT * FROM users WHERE scrumid="+scrumID+";").executeQuery();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return userDetails;
    }
    
      
      
}
