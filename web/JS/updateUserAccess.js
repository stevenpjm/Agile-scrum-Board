    /* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var userName="";
var UserId="";
var access="";

function addUserAccess(userId, userName, taskOpt)
{
   
    var data = {userId:userId, userName:userName, taskOpt:taskOpt};

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


// if you are removing the profile from the scrum team
function removeUserAccess(email,userId,userName,email,taskOpt)
{  
    
   
        
     var data = {email:email, taskOpt:taskOpt,userName:userName,userId:userId};
  
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