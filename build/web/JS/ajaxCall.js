/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function updateStoryCard(element, callId, dataIn)
{
    var data = {id: callId, data: dataIn};

    $.ajax(
            {
                url: "scrumTeamReq",
                type: "POST",
                data: data,
                success: function (data, textStatus, jqXHR)
                {
                    var returnValues = data;
                    var returnValuesSplit = returnValues.split(',');

//create the selection element
                    var scrumOptionsSelect = document.createElement("select");
                    scrumOptionsSelect.setAttribute("id", "scrumOptionsSelect");
                    scrumOptionsSelect.setAttribute("class", "scrumOptions");

                    if (returnValuesSplit.length < 5) {
                        scrumOptionsSelect.size = returnValuesSplit.length;
                    } else {
                        scrumOptionsSelect.size = 5;
                    }

//append array of options to for a dynamic search
                    for (var i = 0; i < returnValuesSplit.length; i++) {
                        var option = document.createElement("option");
                        option.setAttribute("value", returnValuesSplit[i]);
                        option.setAttribute("id", "scrumopt"+i);
                        option.text = returnValuesSplit[i];
                        scrumOptionsSelect.appendChild(option);
                    }

                    //$("scrumOptionsSelect").remove();
                    $(element).append(scrumOptionsSelect);
                },
                error: function (jqXHR, textStatus, errorThrown)
                {
                    console.log(textStatus + " - " + errorThrown);
                }
            });
}