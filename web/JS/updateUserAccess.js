/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function updateUserAccess(UserId, userName, access)
{

    var data = {UserId:UserId, userName:userName, access:access};
     alert("start");
    $.ajax(
            {
                url: "updateUserAccess",
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