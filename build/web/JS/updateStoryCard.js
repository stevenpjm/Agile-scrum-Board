/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function updateStoryCard(storyID, storyName, sprintID )
{
    var data = {storyID: storyID, storyName: storyName, sprintID: sprintID};

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
                    console.log(textStatus + " - " + errorThrown);
                }
            });
}