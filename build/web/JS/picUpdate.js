/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function PicUpdate(storyID, sprintID, userID, targetProfile)
{
    var data = {storyID: storyID, userID: userID, sprintID: sprintID, targetProfile:targetProfile};
   
    $.ajax(
            {
                url: "TaskUserUpdate",
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

function PicUpdateRemove(storyID, sprintID, targetProfile)
{
    
    var data = {storyID: storyID, userID: null, sprintID: sprintID, targetProfile:targetProfile};

    $.ajax(
            {
                url: "TaskUserUpdate",
                type: "POST",
                data: data,
                success: function ()
                {
                  alert("updated");
                },
                error: function (jqXHR, textStatus, errorThrown)
                {
                    alert("not");
                    console.log(textStatus + " - " + errorThrown);
                }
            });
}