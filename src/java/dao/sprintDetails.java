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
public class sprintDetails {
    
    public static ResultSet getSprintDetails(int scrumID) {
        ResultSet userDetails = null;
        try {
            userDetails = DBUtils.getPreparedStatment("SELECT * FROM sprints WHERE scrumid="+scrumID+" AND status='active';").executeQuery();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return userDetails;
    }
    
    public void updateSprintDetails(int sprintID, String sprintName, String sprintDateFrom, String sprintDateTo, Boolean sprintInsert) {
       
        PreparedStatement UpdateSprintDeatils;
        try {
            UpdateSprintDeatils = DBUtils.getPreparedStatment("UPDATE `scrumboards`.`sprints` SET `sprintname`= ?, `startdate`= ?, `enddate`= ? WHERE `sprintid`= ?;");
            UpdateSprintDeatils.setString(1, sprintName);
            UpdateSprintDeatils.setString(2, sprintDateFrom);
            UpdateSprintDeatils.setString(3, sprintDateTo);
            UpdateSprintDeatils.setInt(4, sprintID);
        
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
