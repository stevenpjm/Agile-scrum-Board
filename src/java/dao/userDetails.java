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
public class userDetails {

    public static ResultSet userDetails(String email) {
        String email_input = email;
        ResultSet rs = null;
        try {
            rs = DBUtils.getPreparedStatment("SELECT user.userid, user.username, user.email, user.scrumid, team.teamName, team.userid as admin FROM scrumboards.users user, scrumboards.scrumboard team WHERE user.email='" + email_input + "'AND team.scrumid = user.scrumid;").executeQuery();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }


    public static int userDetails(String emailin, String usernamein, String passwordin, String password_new_in, String teamNamein) throws ClassNotFoundException, SQLException{
        int processed=0;
        
        String email_new = emailin;
        String username_new = usernamein;
        String password_cur = passwordin;
        String teamName_new = teamNamein;
        String password_in = password_new_in;
        int TeamID_new = 0;
        
        String dbUserName="";
        String dbpassword="";
        String dbTeamName="";
        String dbemail = "";
        int dbTeamID=0;
        
        ResultSet rs;
        ResultSet team;
        ResultSet teamNew;
                 //============================= Check that the user name and password match 
        rs = DBUtils.getPreparedStatment("select * from users,scrumboard scrum where email='" + email_new + "' and password='" + password_cur + "'and users.scrumid = scrum.scrumid;").executeQuery();
        while (rs.next()) {
            dbTeamName = rs.getString(10);
            dbpassword = rs.getString(3);
            dbTeamID = rs.getInt(6);
            dbUserName = rs.getString(2);
            dbemail = rs.getString(4);
        }
         //============================= if the user name and password matches it get the curr team ID
        
         if (dbpassword.equals(password_cur)){
        team = DBUtils.getPreparedStatment("SELECT * FROM scrumboards.scrumboard WHERE scrumid ='" + dbTeamID+"';").executeQuery();
        while (team.next()) {
             dbTeamName = team.getString(3);
             dbTeamID = team.getInt(1);
        }
        }
        
                 //============================= if the user name and password matches it get the curr team ID
        if (dbpassword.equals(password_cur)){
        teamNew = DBUtils.getPreparedStatment("SELECT * FROM scrumboards.scrumboard WHERE teamName ='" + teamName_new +"';").executeQuery();
        while (teamNew.next()) {
             teamName_new = teamNew.getString(3);
             TeamID_new = teamNew.getInt(1);
        }
        }
        
           //============================= Check if the password need to be changed as per the users request
               PreparedStatement ts;
            if ( !dbpassword.equals("") && !dbpassword.equals(password_in) && !password_in.equals("")) {
                try {
                    ts = DBUtils.getPreparedStatment("UPDATE `scrumboards`.`users` SET `password`= ? WHERE `email`= ?;");
                    ts.setString(1, password_in);
                    ts.setString(2, email_new);
                    ts.executeUpdate();
                    processed = 1;
                } catch (ClassNotFoundException | SQLException ex) {
                    Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //============================= Check if the team name need to be changed as per the users request
            if(!teamName_new.equals(dbTeamName) && TeamID_new != dbTeamID){
            
                try {
                    ts = DBUtils.getPreparedStatment("UPDATE `scrumboards`.`users` SET `scrumid`= ?, teamaccess ='0' WHERE `email`= ?;");
                    ts.setInt(1, TeamID_new);
                    ts.setString(2, dbemail);
                    ts.executeUpdate(); 
                    processed = 1;
                } catch (ClassNotFoundException | SQLException ex) {
                    Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
            if ( !dbUserName.equals(username_new)) {
                try {
                    ts = DBUtils.getPreparedStatment("UPDATE `scrumboards`.`users` SET `username`=?, `email`=? WHERE `email`= ?;");
                    ts.setString(1, username_new);
                    ts.setString(2, email_new);
                    ts.setString(3, dbemail);
                  
                    ts.executeUpdate();
                    processed = 1;
                } catch (ClassNotFoundException | SQLException ex) {
                    Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
                }
                processed = 1;
            }
        return processed;  
            
       }
       
        
     
    }
     







