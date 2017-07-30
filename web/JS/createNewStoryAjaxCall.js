/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function createNewStoryAjaxCall(scrumID , sprintID, userID)
{
 
    var data = {scrumID: scrumID, sprintID: sprintID, userID: userID };
    
    $.ajax(
            {
                url: "createNewStory",
                type: "POST",
                data: data,
                success: function ()
                {
                  alert("Updated");
                },
                error: function (jqXHR, textStatus, errorThrown)
                {
                     alert("Could not process your request");
                    console.log(textStatus + " - " + errorThrown);
                }
            });
}