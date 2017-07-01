var src;

function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {

    ev.dataTransfer.setData("text", ev.target.id);
    
}

function drop(ev){
        

    

    gettargetlocation(ev);
    teamsats();
    updatposition();
    
        
    
};


//****************************************************
//        TEAM stats
// ****************************************************


    //This gives the team stats for backlog           
   
   function teamsats(){
    var numBacklog = $('div#backlog').children().length;
    numBacklog = numBacklog - 1;
    if(numBacklog !== 0) {
        document.getElementById('backlogtotal').innerHTML = numBacklog;
    }else { 
        document.getElementById('backlogtotal').innerHTML ="0";
    }
    
     //This gives the team stats for active 
    var numactivelog = $('div#active').children().length; 
    numactivelog = numactivelog - 1;
    if(numactivelog !== 0) {
        document.getElementById('progresstotal').innerHTML = numactivelog;
    } else { 
        document.getElementById('progresstotal').innerHTML ="0";
    }
    
    //This gives the team stats for complete 
    var numcompletelog = $('div#completed').children().length;
    
    if(numcompletelog !== 0) {
        document.getElementById('completedtotal').innerHTML = numcompletelog;
    } else { 
        document.getElementById('completedtotal').innerHTML ="0";
    }
    
     //This gives the team stats for complete 
   
    var total = numcompletelog + numBacklog + numactivelog ;
    document.getElementById('storyTotal').innerHTML = total;
    
    };
    

    
    
    function gettargetlocation(ev){
                $('.dropzone').droppable({
            drop: function(event, ui) {
            console.log('dragged ' + ui.draggable.attr('id') + ' onto ' + this.id); 
            }
        });
      
        var targetDiv = event.target.id;
       // alert(targetDiv);
       
          
    if ( targetDiv === "user1pic" || targetDiv === "user2pic" || targetDiv === "user3pic" ){
        ev.preventDefault();
        var data = ev.dataTransfer.getData("text");
       // ev.target.appendChild(document.getElementById(data).cloneNode(true));  
    
    } else if (targetDiv === "active" || targetDiv === "backlog" || targetDiv === "complete" ){

        ev.preventDefault();
        var data = ev.dataTransfer.getData("text");
        ev.target.appendChild(document.getElementById(data));
    }
    
    alert("getloc");
    }
    
    
        
    function updatposition(){
       
        event.preventDefault();
        var position = $(".storycard").position();
        var parentid = event.target.parentElement.id;
        var positionInput = position.top;
        alert(positionInput);
        alert(parentid +"parent id"); 
        document.getElementById(parentid+"columInput").value = positionInput;
        
        
        var column = event.target.parentElement.parentElement.id;
        document.getElementById(parentid+"columInput").value = column;
         alert("position complete");
    }