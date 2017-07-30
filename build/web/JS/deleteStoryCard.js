/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function deleteStorycard(storyID,  sprintID)
{

    var data = {storyID: storyID, sprintID: sprintID};

    $.ajax(
            {
                url: "deleteStorycardServ",
                type: "POST",
                data: data,
                success: function ()
                {
                  alert("updated");
                },
                error: function (jqXHR, textStatus, errorThrown)
                {
                    alert("Could not process your request");
                   
                }
            });
}