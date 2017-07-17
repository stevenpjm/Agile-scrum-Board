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
            rs = DBUtils.getPreparedStatment("SELECT user.userid, user.username, user.email,user.scrumid,team.teamName, team.userid as admin FROM scrumboards.users user, scrumboards.scrumboard team WHERE user.email='" + email_input + "'AND team.scrumid = user.scrumid;").executeQuery();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    String password_new;
    String password;
    String username;
    String email;
    String teamNamein;

    public static String userDetails(String emailin, String usernamein, String passwordin, String password_new_in, String teamNamein) throws ClassNotFoundException, SQLException {
        String email = emailin;
        String username = usernamein;
        String password = passwordin;
        password_new = password_new_in;
        String teamNamein = teamNamein;
        String email_verify = this.email;
        String pwd_verify = this.password;
        ResultSet rs;
        ResultSet team;
        String curpassword="";
        String curTeamName="";
         String newTeam="";
         int newTeamID= 0;
         int curTeamID=0;
        
        rs = DBUtils.getPreparedStatment("select * from users,scrumboard scrum where email='" + email_verify + "' and password='" + pwd_verify + "'and users.scrumid = scrum.scrumid;").executeQuery();
        while (rs.next()) {
             curTeamName = rs.getString(10);
             curpassword = rs.getString(3);
             curTeamID = rs.getInt(6);
        }
        
        if (curpassword.equals("password")){
        team = DBUtils.getPreparedStatment("SELECT * FROM scrumboards.scrumboard WHERE teamName ='" + teamNamein +"';").executeQuery();
        while (team.next()) {
             newTeam = team.getString(3);
             newTeamID = team.getInt(1);
        }
        
  
               PreparedStatement ts;
            if ( !curpassword.equals("") && !password_new.equals(curpassword) && !password_new.equals("")) {
                try {
                    ts = DBUtils.getPreparedStatment("UPDATE `scrumboards`.`users` SET `password`= ? WHERE `email`= ?;");
                    ts.setString(1, password_new);
                    ts.setString(2, email);
                    ts.executeUpdate();
                } catch (ClassNotFoundException | SQLException ex) {
                    Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
            if(!newTeam.equals(curTeamName) && newTeamID != curTeamID){
            
                try {
                    ts = DBUtils.getPreparedStatment("UPDATE `scrumboards`.`users` SET `scrumid`= ?, teamaccess ='0' WHERE `email`= ?;");
                    ts.setInt(1, newTeamID);
                    ts.setString(2, email);
                    ts.executeUpdate();
                } catch (ClassNotFoundException | SQLException ex) {
                    Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
       }
        
        return processed
    }
}



