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
import Scrumboard.scrumboard;

/**
 *
 * @author Thang
 */
public class DataAccess {

    public void addNew(Story s) {

        PreparedStatement ts;
        try {
            ts = DBUtils.getPreparedStatment("INSERT INTO scrumboards.stories (storyname, storynotes, storybug, createdate, swarm) VALUES ( ?, ?, ?, ?, ?);");
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
       // List<Story> ls = new LinkedList<>();
        ResultSet rs = null;
        try {
            rs = DBUtils.getPreparedStatment("SELECT ID, storyname, storynotes, DATE_FORMAT(createdate, '%d/%m/%Y')'createdate', user1, user2, user3,user1Task, user2Task, user3Task, DATE_FORMAT(lastupdate, '%d/%m/%Y')'lastupdate', lastupdate, storybug, swarm, columstatus,userid FROM scrumboards.stories;").executeQuery();

          //  while (rs.next()) {
           //     Story s = new Story(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5));
           //     ls.add(s);
           // }

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
         return rs;

    }

    public static List<Story> getNewById(int id) {
        List<Story> ls = new LinkedList<>();

        try {

            ResultSet rs = DBUtils.getPreparedStatment("SELECT * FROM scrumboards.stories WHERE ID =" + id + " ;").executeQuery();

            while (rs.next()) {
                Story s = new Story(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(6));
                ls.add(s);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ls;
    }

    public void edit(int ID, String storyname, String storynotes, String storybug, Date createdate) {
        PreparedStatement ps;
        try {
            ps = DBUtils.getPreparedStatment("UPDATE scrumboards.stories SET `storyname` = ?, `storynotes` = ?, `bug` = ?, `createdate` = ?, `swarm` = ? WHERE ID = " + ID + ";");
            ps.setString(1, storyname);
            ps.setString(2, storynotes);
            ps.setString(3, storybug);
            ps.setDate(6, createdate);
            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void delete(int ID) {
        PreparedStatement ps;
        try {
            ps = DBUtils.getPreparedStatment("DELETE FROM scrumboards.stories WHERE ID =" + ID + ";");

            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /*-------------------'*/
    public static int getuserid(String userName) {
        List<scrumboard> ls = new LinkedList<>();
        int id = 0;

        try {
            ResultSet rs = DBUtils.getPreparedStatment("SELECT userid FROM scrumboards.user WHERE username='" + userName + "';").executeQuery();

            while (rs.next()) {
                id = rs.getInt("userid");
            }

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

    public static ResultSet getscrumid(String userName) {
        List<scrumboard> ls = new LinkedList<>();
        String sid = "";
        ResultSet rs = null;
        try {
            rs = DBUtils.getPreparedStatment("select user.userid, user.scrum_id, scrumboard.teamName from user INNER JOIN scrumboard ON user.scrum_id = scrumboard.scrum_id where userName ='" + userName + "';").executeQuery();

            //while (rs.next()) {
            //    sid = rs.getString("teamName");
           // }

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return rs;
    }

}
