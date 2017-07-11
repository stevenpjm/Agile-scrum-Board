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

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author steven.masters
 */
public class scrumboard extends HttpServlet {
       
	
     
      public static String scrumboard (String usersinput) { 
            ResultSet scrumDetails = null;
            String scrumOptions="";
        try {
              scrumDetails = DBUtils.getPreparedStatment("SELECT teamName FROM scrumboards.scrumboard WHERE teamName LIKE \"%"+usersinput+"%\";").executeQuery();
              
              while (scrumDetails.next()) {
                    scrumOptions = scrumDetails.getString("teamName");
                }
              
              
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return scrumOptions;
    }
}