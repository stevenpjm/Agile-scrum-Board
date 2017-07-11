/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import db.DBUtils;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author steven.masters
 */
public class dbUpdateStoryCard {
    public dbUpdateStoryCard(){
    //public dbUpdateStoryCard(int storyid, String storyname, String storynote,String user1Task, String user1,String user2Task, String user2,String user3Task, String user3, int storybug, int swarm, String columstatus) {
        
        
        try {
       
               DBUtils.getPreparedStatment(" Update storycards storyid = ?, storyname = ?,  storynote= ?, user1Task = ?,  user1 = ?, user2Task = ?,  user2 = ?, user3Task = ?,  user3 = ? ,  storybug = ?,  swarm = ?,  columstatus = ? WHERE storyid = ? AND sprint = ? ;").executeQuery();
     
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
       
    }   
}
