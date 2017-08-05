package dao;

import db.DBUtils;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
 */
/**
 *
 * @author steven.masters
 */
/**
 *
 * @author steven.masters
 */
public class signUp {

    public static int signUp(String emailin, String usernamein, String passwordin) throws ClassNotFoundException, SQLException {
        int test = 0;
        ResultSet rs;
        String emailCheck = null;
        PreparedStatement pstmt;
        PreparedStatement ts;
        String query;

        query = "SELECT email FROM scrumboards.users WHERE email = ?";
        pstmt = DBUtils.getPreparedStatment(query);
        pstmt.setString(1, emailin);
        rs = pstmt.executeQuery();

        while (rs.next()) {
            emailCheck = rs.getString(1);
        }

        if (emailCheck == null) {
            try {
                ts = DBUtils.getPreparedStatment("INSERT INTO scrumboards.users (username, password, email, teamaccess) VALUES ( ?, ?, ?,?);");
                ts.setString(1, usernamein);
                ts.setString(2, passwordin);
                ts.setString(3, emailin);
                ts.setInt(4, 0);
                ts.executeUpdate();
                test = 1;
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        }
        
        return test;
    }

}
