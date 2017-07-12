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
                MaxStoryId = Integer.parseInt(StoryId);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return MaxStoryId;
    }

    public void addNew(Story s) {
        PreparedStatement ts;
        try {
            ts = DBUtils.getPreparedStatment("INSERT INTO scrumboards.storycards (storyname, storynotes, storybug, createdate, swarm) VALUES ( ?, ?, ?, ?, ?);");
            ts.setString(1, s.getStoryname());
            ts.setString(2, s.getStorynotes());
            ts.setInt(3, s.getStorybug());
            ts.setString(4, s.getStoryuser1());
            ts.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static ResultSet getAll() {
        ResultSet rs = null;
        try {
            rs = DBUtils.getPreparedStatment("select sn2.storynote, sn2.date, sc.* from scrumboards.storycards sc, scrumboards.storynotes sn2\n"
                    + "where sn2.storynoteid = (select max(sn.storynoteid) from scrumboards.storynotes sn where sn.storyid = sn2.storyid)\n"
                    + "and sc.storyid = sn2.storyid;").executeQuery();
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

    public void delete(int ID) {
        PreparedStatement ps;
        try {
            ps = DBUtils.getPreparedStatment("DELETE FROM scrumboards.storycards WHERE storyid =" + ID + ";");
            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
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

    public static ResultSet getscrumid(String userName) {
        ResultSet rs = null;
        try {
            rs = DBUtils.getPreparedStatment("select users.userid, users.scrumid, scrumboard.teamName from users INNER JOIN scrumboard ON users.scrumid = scrumboard.scrumid where userName ='" + userName + "';").executeQuery();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public static ResultSet getUserDetails() {
        ResultSet userDetails = null;
        try {
            userDetails = DBUtils.getPreparedStatment("SELECT userid, username, email  FROM USERS WHERE scrumid='4001';").executeQuery();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return userDetails;
    }

}
