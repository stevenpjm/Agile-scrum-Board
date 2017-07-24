/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import db.DBUtils;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author steven.masters
 */
public class dbUpdateStoryCard {

      String storyNote_input = "";
        int storyID_input = 0;
        int sprintID_input = 0;
    
    public dbUpdateStoryCard(String storynote, int storyID, int sprintID){
    //public dbUpdateStoryCard(int storyid, String storyname, String storynote,String user1Task, String user1,String user2Task, String user2,String user3Task, String user3, int storybug, int swarm, String columstatus) {
         storyNote_input = storynote;
         storyID_input = storyID;
         sprintID_input = sprintID;
                 
        PreparedStatement ts;
        
        try{   
            ts = DBUtils.getPreparedStatment(" Update storycards storyname = ? WHERE storyid = ? AND sprint = ?");
            
            ts.setString(1, storyNote_input);
            ts.setInt(2, storyID_input);
            ts.setInt(3, sprintID_input);
            ts.executeUpdate();
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        
   
       
    }
}
