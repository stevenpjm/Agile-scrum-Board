package dao;

import db.DBUtils;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author steven.masters
 */
public class storyNoteUpdate {
    int storynoteid;
//check
    public storyNoteUpdate(int storyID, String storyNote, int userID) {
        String currentStroyNote = "";
        
        PreparedStatement ns;
        try {
            ns = DBUtils.getPreparedStatment("SELECT storynote FROM scrumboards.storynotes where storyID = ? and storynote= ?;");
            ns.setInt(1, storyID);
            ns.setString(2, storyNote);
            ResultSet rs = ns.executeQuery();
            while (rs.next()) {
                currentStroyNote = rs.getString("storynote");
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        
   
        Calendar cal = Calendar.getInstance();
        SimpleDateFormat lastmod = new SimpleDateFormat("yyyy-MM-dd");
        String lastmodConvert = lastmod.format(cal.getTime());
            
        if (!storyNote.equals(currentStroyNote) || storyID == 0) {
            
            
            PreparedStatement ts;

            PreparedStatement updateStoryCard;
            try {
                ts = DBUtils.getPreparedStatment("INSERT INTO scrumboards.storynotes (storynote, userid, date, storyid) VALUES (?, ?, ?, ?)");
                ts.setString(1, storyNote);
                ts.setInt(2, userID);
                ts.setString(3, lastmodConvert);
                ts.setInt(4, storyID);
                ts.executeUpdate();
                
                ResultSet rs =  DBUtils.getPreparedStatment("SELECT max(storynoteid) FROM scrumboards.storynotes WHERE storyid ="+storyID+ " ;").executeQuery(); 
                while (rs.next()) {
                    storynoteid = rs.getInt(1);
                }
                
                
                updateStoryCard = DBUtils.getPreparedStatment("UPDATE `scrumboards`.`storycards` SET `storynoteid`=? WHERE `storyid`=?;");  
                updateStoryCard.setInt(1, storynoteid);
                updateStoryCard.setInt(2, 1);
                updateStoryCard.executeUpdate();
                
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
            }
        } else {
             PreparedStatement ts;
            try {
                ts = DBUtils.getPreparedStatment("UPDATE `scrumboards`.`storynotes` SET `storynote`=?, `userid`=?, `date`= ? WHERE `storynoteid`= ?;");
                ts.setString(1, storyNote);
                ts.setInt(2, userID);
                ts.setInt(3, storynoteid);
                ts.setString(4, lastmodConvert);
                ts.executeUpdate();
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
            }
            
        }
    }
}
