/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import javax.swing.JApplet;



/**
 *
 * @author steven.masters
 */
public class LastStoryID extends JApplet{
 
    public static int LastStoryID() {
        
            int getLastStoryID;
             
            getLastStoryID = DataAccess.getLastStoryID(); 
            
            getLastStoryID = getLastStoryID + 1;
        return getLastStoryID;
    }

}
