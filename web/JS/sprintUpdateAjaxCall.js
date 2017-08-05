/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function updateSprintDetails(SprintBlock, sprintId, sprintName, startDate, endDate, scrumID)
{

    var data = {SprintBlock:SprintBlock, sprintId:sprintId, sprintName:sprintName, startDate:startDate, endDate:endDate, scrumID: scrumID};
 
    $.ajax(
            {
                url: "UpdateSprintDetails",
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