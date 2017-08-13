/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function updateStoryCard(storyID, storyName, storyNote, user1Task, user2Task, user3Task, storyBug, swarm, column, sprintID, userID)
{
 
    var data = {storyID: storyID, storyNote: storyNote, storyName: storyName, sprintID: sprintID, user1Task: user1Task, user2Task: user2Task, user3Task: user3Task, storyBug: storyBug, swarm: swarm, column: column , userID: userID };  
    $.ajax(
            {
                url: "updateStoryCardV2",
                type: "POST",
                data: data,
                success: function ()
                {
                  alert("updated");
                },
                error: function (jqXHR, textStatus, errorThrown)
                {
                    alert("Could not process your request");
                    console.log(textStatus + " - " + errorThrown);
                }
            });
}