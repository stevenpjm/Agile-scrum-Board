package Scrumboard;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/**
 *
 * @author steven.masters
 */
public class scrumboard {
    private int ID;
    private String teamName;
    private int userid;


    public scrumboard(int ID, int userid,String teamName) {
        this.ID = ID;
        this.userid = userid;
        this.teamName = teamName;
    }

    
    
    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }
    
         
}
