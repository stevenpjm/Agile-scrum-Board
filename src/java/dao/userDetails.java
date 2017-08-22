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

        ResultSet team;
        ResultSet teamNew;

        PreparedStatement ts;
        PreparedStatement pstmt;
        String query = "";

        ResultSet rs = null;
        try {
            query = "SELECT user.userid, user.username, user.email, user.scrumid, team.teamName, team.userid, user.teamaccess, team.status FROM scrumboards.users user left join scrumboards.scrumboard team on user.scrumid = team.scrumid WHERE user.email= ? AND status='active' ";
            pstmt = DBUtils.getPreparedStatment(query);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public static ResultSet userDetails(String email, int getDetails) {
        ResultSet team;
        ResultSet teamNew;
        PreparedStatement ts;
        PreparedStatement pstmt;
        String query = "";
        ResultSet rs = null;
        try {
            query = "SELECT user.userid, user.username, user.email, user.scrumid, team.teamName, team.userid, user.teamaccess, team.status FROM scrumboards.users user left join scrumboards.scrumboard team on user.scrumid = team.scrumid WHERE user.email= ?";
            pstmt = DBUtils.getPreparedStatment(query);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public static int userDetails(String emailin, String usernamein, String passwordin, String password_new_in, String teamNamein) throws ClassNotFoundException, SQLException {
        int processed = 0;

        String email_new = emailin;
        String username_new = usernamein;
        String password_cur = passwordin;
        String teamName_new = teamNamein;
        String password_in = password_new_in;
        int TeamID_new = 0;
        String query;
        String dbUserName = "";
        String dbpassword = "";
        String dbTeamName = "";
        String dbemail = "";
        int dbTeamID = 0;
        ResultSet team;
        ResultSet teamNew;
        PreparedStatement ts;
        PreparedStatement pstmt;
        ResultSet rs = null;

//============================= Check that the user name and password match 
        query = "SELECT * FROM users where email=? and password=?;";
        pstmt = DBUtils.getPreparedStatment(query);
        pstmt.setString(1, email_new);
        pstmt.setString(2, password_cur);
        rs = pstmt.executeQuery();

        while (rs.next()) {
            dbpassword = rs.getString(3);
            dbUserName = rs.getString(2);
            dbemail = rs.getString(4);
        }
//============================= if the user name and password matches it get the curr team ID

        if (dbpassword.equals(password_cur)) {
            query = "SELECT * FROM scrumboards.scrumboard WHERE scrumid = ?;";
            pstmt = DBUtils.getPreparedStatment(query);
            pstmt.setInt(1, dbTeamID);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                dbTeamName = rs.getString(3);
                dbTeamID = rs.getInt(1);
            }
        }

//============================= if the user name and password matches it get the curr team ID
        if (dbpassword.equals(password_cur)) {
            query = "SELECT * FROM scrumboards.scrumboard WHERE teamName = ?;";
            pstmt = DBUtils.getPreparedStatment(query);
            pstmt.setString(1, teamName_new);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                teamName_new = rs.getString(3);
                TeamID_new = rs.getInt(1);
            }
        }

//============================= Check if the password need to be changed as per the users request
        if (!dbpassword.equals("") && !dbpassword.equals(password_in) && !password_in.equals("") && dbpassword.equals(password_cur)) {
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
        if (!teamName_new.equals(dbTeamName) && TeamID_new != dbTeamID && dbpassword.equals(password_cur)) {
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

        if (dbpassword.equals(password_cur) && !dbUserName.equals(username_new)) {
            try {
                ts = DBUtils.getPreparedStatment("UPDATE `scrumboards`.`users` SET `username`=?, `email`=? WHERE `email`= ?;");
                ts.setString(1, username_new);
                ts.setString(2, email_new);
                ts.setString(3, emailin);

                ts.executeUpdate();
                processed = 1;
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, "issue with Updating users details", ex);
            }
            processed = 1;
        }
        return processed;
    }
}
