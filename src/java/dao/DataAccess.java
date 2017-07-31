/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
 */
package dao;

import db.DBUtils;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.*;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import Scrumboard.Story;

/**
 *
 * @author Thang
 */
public class DataAccess {

    static int getLastStoryID() {
        String StoryId;
        int MaxStoryId = 0;
        try {
            ResultSet rs = DBUtils.getPreparedStatment("SELECT MAX(storyid) FROM scrumboards.storycards;").executeQuery();
            while (rs.next()) {
                StoryId = rs.getString(1);
                if(StoryId==null){
                    MaxStoryId=0;
                }else{
                    MaxStoryId = Integer.parseInt(StoryId);
                }
                }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return MaxStoryId;
    }

    

    public static ResultSet getAll(int sprintid) {
        ResultSet rs = null;
        try {
            rs = DBUtils.getPreparedStatment("select sn2.storynote, sn2.date, sc.* from scrumboards.storycards sc, scrumboards.storynotes sn2\n"
                    + "where sn2.storynoteid = (select max(sn.storynoteid) from scrumboards.storynotes sn where sn.storynoteid = sc.storynoteid)\n"
                    + " AND sc.sprintID ="+ sprintid +";").executeQuery();
        
            //Old Verion
//             rs = DBUtils.getPreparedStatment("select sn2.storynote, sn2.date, sc.* from scrumboards.storycards sc, scrumboards.storynotes sn2\n"
//                    + "where sn2.storynoteid = (select max(sn.storynoteid) from scrumboards.storynotes sn where sn.storyid = sn2.storyid)\n"
//                    + "and sc.storyid = sn2.storyid AND sc.sprintID ="+ sprintid +";").executeQuery();
            
             } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public static List<Story> getNewById(int id) {
        List<Story> ls = new LinkedList<>();
        try {
            ResultSet rs = DBUtils.getPreparedStatment("SELECT * FROM scrumboards.storycards WHERE storyid =" + id + " ;").executeQuery();
            while (rs.next()) {
                Story s = new Story(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(6));
                ls.add(s);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ls;
    }

    
    /*-------------------'*/
    public static int getuserid(String userName) {
        int id = 0;
        try {
            ResultSet rs = DBUtils.getPreparedStatment("SELECT userid FROM scrumboards.users WHERE username='" + userName + "';").executeQuery();
            while (rs.next()) {
                id = rs.getInt("userid");
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

    public static ResultSet getscrumid(String email) {
        ResultSet rs = null;
        try {
            rs = DBUtils.getPreparedStatment("select users.userid, users.scrumid, scrumboard.teamName, teamnote1, teamnote2, teamnote3, teamnote4 from users INNER JOIN scrumboard ON users.scrumid = scrumboard.scrumid where email ='" + email + "';").executeQuery();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

   // this gets the user datils based on Scrum ID

    public static ResultSet getUserDetails(int scrumID) {
        ResultSet userDetails = null;
        try {
            userDetails = DBUtils.getPreparedStatment("SELECT userid, username, email  FROM USERS WHERE scrumid="+scrumID+";").executeQuery();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return userDetails;
    }
    
       // this gets the user datils based on Scrum ID
    public static String getUserDetailsByUserId(int userID) {
        ResultSet userDetails = null;
        String email="";
        try {
            userDetails = DBUtils.getPreparedStatment("SELECT userid, username, email  FROM USERS WHERE userid="+userID+";").executeQuery();
            email = userDetails.getString(2);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return email;
    }

}
