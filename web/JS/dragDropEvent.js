var src;
var parentid;

function allowDrop(ev) {
    ev.preventDefault();

}

function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
    
    parentid = ev.target.id;
    return parentid;
}

function drop(ev) {
    gettargetlocation(ev);
    teamsats();
    

 

   
      //if there are no storycards in the create story card div than it will enable the button
    if($('#createStoryCard').find('div.storycard').length !== 0 ){
        document.getElementById("newStory").disabled = true;
    }else{
        document.getElementById("newStory").disabled = false;
    }
    updateposition(parentid);
    
  
}

//****************************************************
//        TEAM stats
// ****************************************************


//This gives the team stats for backlog           

function teamsats() {
    var numBacklog = $('div#backlog').children().length;
    numBacklog = numBacklog - 1;
    if (numBacklog !== 0) {
        document.getElementById('backlogtotal').innerHTML = numBacklog;
    } else {
        document.getElementById('backlogtotal').innerHTML = "0";
    }

//This gives the team stats for active 
    var numactivelog = $('div#active').children().length;
    numactivelog = numactivelog - 1;
    if (numactivelog !== 0) {
        document.getElementById('progresstotal').innerHTML = numactivelog;
    } else {
        document.getElementById('progresstotal').innerHTML = "0";
    }

//This gives the team stats for complete 
    var numcompletelog = $('div#complete').children().length;
     numcompletelog = numcompletelog - 1;
    if (numcompletelog !== 0) {
        document.getElementById('completedtotal').innerHTML = numcompletelog;
    } else {
        document.getElementById('completedtotal').innerHTML = "0";
    }

    //This gives the team stats for complete  
    var total = numcompletelog + numBacklog + numactivelog;
    document.getElementById('storyTotal').innerHTML = total;
}
;




function gettargetlocation(ev) {
    $('.dropzone').droppable({
        drop: function (event, ui) {
            console.log('dragged ' + ui.draggable.attr('id') + ' onto ' + this.id);
        }
    });

    var targetDiv = event.target.id;


    if (targetDiv === "user1pic" || targetDiv === "user2pic" || targetDiv === "user3pic") {
        ev.preventDefault();
        var data = ev.dataTransfer.getData("text");
        ev.target.appendChild(document.getElementById(data).cloneNode(true));  

    } else if (targetDiv === "active" || targetDiv === "backlog" || targetDiv === "complete") {

        ev.preventDefault();
        var data = ev.dataTransfer.getData("text");
        ev.target.appendChild(document.getElementById(data));
    }

}



function updateposition(parentid) {
    event.preventDefault();
    var position = $(".storycard").position();
    var positionInput = position.top;
    document.getElementById(parentid + "position").value = positionInput;
    var column = event.target.id;
    if (column === "active" || column === "backlog" || column === "complete") {
        document.getElementById(parentid + "columInput").value = column;
    } 
    
    
    
}
