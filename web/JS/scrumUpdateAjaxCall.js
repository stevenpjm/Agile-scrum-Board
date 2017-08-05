/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function scrumUpdate(newScrum, scrumID, userID, teamName)
{
   alert("sprint");
    var data = {newScrum:newScrum, userID:userID, scrumID:scrumID, teamName:teamName};
    
    $.ajax(
            {
                url: "updateScrumDetails",
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