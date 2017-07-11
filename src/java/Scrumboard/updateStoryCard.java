package Scrumboard;

import dao.dbUpdateStoryCard;


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author steven.masters
 */
public class updateStoryCard {
    
    

    private final int storyid;
    private final String storyname;
    private final String storynote;
    private final String user1Task;
    private final String user1;
    private final String user2Task;
    private final String user2;
    private final String user3Task;
    private final String user3;
    private final int storybug;
    private final int swarm;
    private final String columstatus;

    public updateStoryCard(int storyid, String storyname, String storynote, String user1Task, String user1, String user2Task, String user2, String user3Task, String user3, int storybug, int swarm, String columstatus) {

        this.storyid = storyid;
        this.storyname = storyname;
        this.storynote = storynote;
        this.user1Task = user1Task;
        this.user1 = user1;
        this.user2Task = user2Task;
        this.user2 = user2;
        this.user3Task = user3Task;
        this.user3 = user3;
        this.storybug = storybug;
        this.swarm = swarm;
        this.columstatus = columstatus;
                                    
      //  dbUpdateStoryCard rs = new dbUpdateStoryCard(this.storyid, this.storyname, this.storynote, this.user1Task, this.user1, this.user2Task, this.user2, this.user3Task, this.user3, this.storybug, this.swarm, this.columstatus);

    }

}
