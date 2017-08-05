package Scrumboard;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.sql.Date;
/**
 *
 * @author steven.masters
 */
public class Story {
    
    private int ID;
    private String storyname;
    private String storynotes;
    private int storybug;
    private String storyuser1;
    private String createdate;

    public Story(int ID, String storyname, String storynotes, int storybug, String createdate) {
        this.ID = ID;
        this.storyname = storyname;
        this.storynotes = storynotes;
        this.storybug = storybug;
        this.createdate = createdate;

    }

    public Story(int aInt, String string, int aInt0) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }


    
    
    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getStoryname() {
        return storyname;
    }

    public void setStoryname(String storyname) {
        this.storyname = storyname;
    }

    public String getStorynotes() {
        return storynotes;
    }
    
    /**
     *
     * @param storynotes
     */
    public void setStorynotes(String storynotes) {
        this.storynotes = storynotes;
    }

    public int getStorybug() {
        return storybug;
    }

    public void setStorybug(int storybug) {
        this.storybug = storybug;
    }

    public String getStoryuser1() {
        return storyuser1;
    }

    public void setStoryuser1(String storyuser1) {
        this.storyuser1 = storyuser1;
    }

      public String getCreatedate() {
        return createdate;
    }
    public void setCreatedate(String createdate) {
        this.createdate = createdate;
    }   
    
        
    }
        
    

    
    