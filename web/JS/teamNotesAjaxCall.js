/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function teamNotes(scrumID ,teamNote1, teamNote2, teamNote3, teamNote4)
{
  
    var data = {scrumID: scrumID, teamNote1: teamNote1, teamNote2: teamNote2, teamNote3: teamNote3,teamNote4: teamNote4};
    
    $.ajax(
            {
                url: "teamNotes",
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