
/* global lastStoryID */

//This creates the story 
var i = 0;
var j = 0;
var IDNO = 0;
var counter = 0;
var counterstory = 0;
var t = 1;

function createNewStoryCard(lastStoryID) {
document.getElementById("newStory").disabled = true;

//sets the amount of story cards to be created


//creates an object for the individual stories
        var newID = lastStoryID;


//creates the div as the container for the story card
        var newDiv = document.createElement("div");
        newDiv.setAttribute("id", newID);
        newDiv.setAttribute("class", "storycard");
        newDiv.setAttribute("draggable", true);
        newDiv.setAttribute("ondragstart","drag(event)");
        newDiv.setAttribute("drop", "false");

//****************************
//Dates for the top of the card

// Creats a new DIV for the Dates for the top of the storycard
        var dateDiv = document.createElement("div");
        dateDiv.setAttribute("id", "date");
        var dateDivc = document.createElement("div");
        dateDivc.setAttribute("id", "datecreated");
        var dateDivl = document.createElement("div");
        dateDivl.setAttribute("id", "lastupdated");
        var adminDiv = document.createElement("div");
        adminDiv.setAttribute("id", "admindiv");
//+++++++++++++++++++++++++++

        
 // Admin button that allows to archieve the story.
 
        var admin = document.createElement("div");
        admin.setAttribute("id",newID);
        admin.setAttribute("class","dropdown");
        admin.setAttribute("drop", "false");
        admin.setAttribute("draggable", "false");
        newDiv.appendChild(admin);
        
            var button = document.createElement("button");
            button.type = "button";
            button.id = newID + " storyadmin ";
            button.class = "dropbtn";
            var txt = document.createTextNode("**");
            button.appendChild(txt);
            button.onclick = function(){ 
                    var IDNUM = $(this).parent().attr("id");
                  
                    document.getElementById("myDropdown" + IDNUM).classList.toggle("show");
                };

                // Close the dropdown if the user clicks outside of it
                window.onclick = function(event) {
                  if (!event.target.matches('.dropbtn')) {

                    var dropdowns = document.getElementsByClassName("dropdown-content");
                    var i;
                    for (i = 0; i < dropdowns.length; i++) {
                      var openDropdown = dropdowns[i];
                      if (openDropdown.classList.contains('show')) {
                        openDropdown.classList.remove('show');
                      }
                    }
                  }

            };
            admin.appendChild(button);
            
                var drop = document.createElement("div");
                drop.setAttribute("id","myDropdown"+ newID);
                drop.setAttribute("class","dropdown-content");
                
                
                    newlink = document.createElement('a');
                    newlink.setAttribute('class', 'a');
                    var ID =  $(this).parent().attr("id");
                    newlink.onclick = function(){
                        removeStoryCard(ID);
                        location.reload();
                    }; 
                    var link1 = document.createTextNode("test");
                    newlink.appendChild(link1);
                    drop.appendChild(newlink);
                    admin.appendChild(drop);    

 
//**************************************

        //creating the top div for created date , last updated and admin button  
              var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth()+1; //January is 0!
        var yyyy = today.getFullYear();

        if(dd<10) {
            dd='0'+dd;
        } 

        if(mm<10) {
            mm='0'+mm;
        } 

        today = mm+'/'+dd+'/'+yyyy;
    
        
     //Last updated 
        var cdate = document.createTextNode(today);
        // Last created 
        var ldate = document.createTextNode(today);
        
        
        dateDivc.appendChild(cdate);
        dateDivl.appendChild(ldate);
        adminDiv.appendChild(admin);
        newDiv.appendChild(dateDivc);
        newDiv.appendChild(dateDivl);
        newDiv.appendChild(adminDiv);

//**************************************                
//          story name output
//************************************** 
// 
        //creates a container div  
        var inputStoryDiv = document.createElement("div");
        inputStoryDiv.setAttribute("id", "inputStoryDiv");
        inputStoryDiv.setAttribute("drop", "false");
        inputStoryDiv.setAttribute("draggable", "false");
        //creates a the element 
        var inputstatus = document.createElement("input");
        inputstatus.setAttribute("drop", "false");
        inputstatus.setAttribute("draggable", "false");
        inputstatus.setAttribute("ID", newID + "storyname");
        inputstatus.setAttribute("class", "storyname");
        inputstatus.setAttribute("type", "text");
        //adds the element to the container than the story card.
        inputStoryDiv.appendChild(inputstatus);
        newDiv.appendChild(inputStoryDiv);
        
//**************************************  
//          story notes output
//**************************************  

        var storyNotesDiv = document.createElement("div");
        storyNotesDiv.setAttribute("id", "StoryNoteDiv");
        //creates a the element 
        storyNotesDiv.setAttribute("drop", "false");
        storyNotesDiv.setAttribute("draggable", "false");
        var storyNote = document.createElement("input");
        storyNote.setAttribute("drop", "false");
        storyNote.setAttribute("draggable", "false");
        storyNote.setAttribute("ID", newID + "storynotes");
        storyNote.setAttribute("class", "storynotes");
         //adds the element to the container than the story card.
        storyNotesDiv.appendChild(storyNote);
        newDiv.appendChild(storyNotesDiv);
        
        
//*************************************************
//           Changes the Div based on the bug 
//************************************************

        var bugDiv = document.createElement("div");
        bugDiv.setAttribute("id", "bugDiv");
        //bug image 1
        var bugimg1 = document.createElement("IMG");
        bugimg1.src = "pic/bug1.png";
         bugimg1.id = "bugImage"+newID;
        bugimg1.style.height = '45px';
        bugimg1.style.width = '45px';
        bugimg1.setAttribute("class", "bug1");
        

        
        //hidden 
        var bugInput = document.createElement("div");
        bugInput.setAttribute("id", newID+"bugInput");
        var inputBugVal = document.createTextNode("");
        bugInput.style.display = "none";
        bugInput.appendChild(inputBugVal);
        
        
        bugDiv.appendChild(bugimg1);
//        bugDiv.appendChild(bugimg2);
        bugDiv.appendChild(bugInput);
        
 
                
//*************************************************
//           Changes the Div based on the Swarm 
//************************************************
        
        // div container for bug area
        var swarmDiv = document.createElement("div");
        swarmDiv.setAttribute("id", "swarm");

        var img1swarm = document.createElement("IMG");
        img1swarm.src = "pic/swarm1.png";
        img1swarm.id = "ImageSwarm"+newID;
        img1swarm.style.height = '45px';
        img1swarm.style.width = '45px';
        img1swarm.setAttribute("class", "swarm1");
        swarmDiv.appendChild(img1swarm);
        

        // onlick image2 appears
        var img2swarm = document.createElement("IMG");
        img2swarm.src = "pic/swarm2.png";
        img2swarm.id = "ImageSwarm"+newID;
        img2swarm.style.height = '45px';
        img2swarm.style.width = '45px';
        img2swarm.style.display = "none";
        img2swarm.setAttribute("class", "swarm2");
        swarmDiv.appendChild(img2swarm);
        
        // value
        var swarmInput = document.createElement("div");
        swarmInput.setAttribute("id", newID+"swarmInput");
        var inputswarmVal = document.createTextNode("");
        swarmInput.style.display = "none";
        swarmInput.appendChild(inputswarmVal);
        
        swarmDiv.appendChild(swarmInput);
        
        
        //*************************************************
        //             happy and sad faces
        //*************************************************
        var happyFaceDiv = document.createElement("div");
        happyFaceDiv.setAttribute("id", "happyFaceDiv");
        
        var happyFace = document.createElement("IMG");
        happyFace.src = "pic/happyface.png";
       
        happyFace.id = "happyFace"+newID;
         happyFace.setAttribute("class", "happyFace");
        happyFace.style.height = '45px';
        happyFace.style.width = '45px';
        happyFaceDiv.appendChild(happyFace);
        
        var sadFaceDiv = document.createElement("div");
        sadFaceDiv.setAttribute("id", "sadFaceDiv");
        var sadFace = document.createElement("IMG");
        sadFace.src = "pic/sadface.png";
        sadFace.id = "sadFace"+newID;
        sadFace.setAttribute("class", "sadFace");
        sadFace.style.height = '45px';
        sadFace.style.width = '45px';
        sadFaceDiv.appendChild(sadFace);
        
        //*************************************************
        // Button holder for buttons on right story card 
        //*************************************************
        var buttonHolder = document.createElement("div");
        buttonHolder.setAttribute("id", "buttonHolder");
        buttonHolder.appendChild(happyFaceDiv);
        buttonHolder.appendChild(sadFaceDiv);
        buttonHolder.appendChild(bugDiv);
        buttonHolder.appendChild(swarmDiv);
        
        
        newDiv.appendChild(buttonHolder);
//**************************************************
//              Div container for Profiles user 1,2 and 3 
//**************************************************
        var profileContainer = document.createElement("div");
        profileContainer.setAttribute("id", "profileContainer");
//
//**************************************************
//              Div container user 1,2 and 3 
//**************************************************
        
        var user1Div = document.createElement("div");
        user1Div.setAttribute("id", "user1div");
        
        var user2Div = document.createElement("div");
        user2Div.setAttribute("id", "user2div");
         
        var user3Div = document.createElement("div");
        user3Div.setAttribute("id", "user3div");
        
        
        
        newDiv.appendChild(profileContainer);
        profileContainer.appendChild(user1Div);
        profileContainer.appendChild(user2Div);
        profileContainer.appendChild(user3Div);
//***************************************************
//             USER1 task and picture 
//***************************************************
       

        //Create array of options to be added
        var array = ["", "DEV", "AUTO", "QA", "RESEARCH"];

        //User1 - create the slection element
        var selectList1 = document.createElement("select");
        selectList1.setAttribute("id", newID + "user1Task");
        selectList1.setAttribute("class", "user1Task");
        user1Div.appendChild(selectList1);
        
        

        //append array of options to the user task 
        for (var i = 0; i < array.length; i++) {
            var option = document.createElement("option");
            option.setAttribute("value", array[i]);
            option.text = array[i];
            selectList1.appendChild(option);
        }

       //USER 1 - store user's 1 picture
        var user1pic = document.createElement("div");
        user1pic.setAttribute("id", "user1pic");
        user1pic.setAttribute("class", "profilepics");
        user1pic.setAttribute("ondrop", "true");
        user1pic.setAttribute("ondragover", "true");
        

        // Appends both slection list and the user picture to user 1 Div
        user1Div.appendChild(user1pic);
        
       

//***************************************************
//             USER2 -  task and picture 
//***************************************************


        //Create and append select list
        var selectList2 = document.createElement("select");
        selectList2.setAttribute("id", newID + "user2Task");
        selectList2.setAttribute("class", "user2Task");


        //Create and append the options
        for (var i = 0; i < array.length; i++) {
            var option = document.createElement("option");
            option.setAttribute("value", array[i]);
            option.text = array[i];
            selectList2.appendChild(option);
        }
        $(inputstatus).val("");

        //store area for user 3 picture
        var user2pic = document.createElement("div");
        user2pic.setAttribute("id", "user2pic");
        user2pic.setAttribute("class", "profilepics");
        
        //appends user task and picture to the user2 Div
        user2Div.appendChild(selectList2);
        user2Div.appendChild(user2pic);
      

//***************************************************
//             USER3 - task and picture 
//***************************************************


        //Create and append select list
        var selectList3 = document.createElement("select");
        selectList3.setAttribute("id", newID + "user3Task");
        selectList3.setAttribute("class", "user3Task");
   

        //Create and append the array options
        for (var i = 0; i < array.length; i++) {
            var option = document.createElement("option");
            option.setAttribute("value", array[i]);
            option.text = array[i];
            selectList3.appendChild(option);
        }

        //store area for user 3 picture
        var user3pic = document.createElement("div");
        user3pic.setAttribute("id", "user3pic");
        user3pic.setAttribute("class", "profilepics");
        
        
      //appends user task and picture to the user3 Div
        user3Div.appendChild(selectList3);
        user3Div.appendChild(user3pic);
     
     
     
  
     // This appends the story cards to the selected area
     // ++++++++++++++++++++++++++++
     //++++++++++++++
     //++++++++++

   
         document.getElementById("createStoryCard").appendChild(newDiv);
     

//****************************************************************
//          adds the values from DB to fileds in story card              
//****************************************************************
        // 
        document.getElementById(newID + 'storyname').value = "";
        document.getElementById(newID + 'storynotes').value = "";
        document.getElementById(newID + 'user1Task').value = "";
        document.getElementById(newID + 'user2Task').value = "";
        document.getElementById(newID + 'user3Task').value = "";
        //document.getElementById(newID + '').value = 
    
    
//***************************************************
//             Save Button - onclick - saves changes made to storycard 
//***************************************************
        var savButtonCon = document.createElement("div");
        savButtonCon.setAttribute("id", "savButtonContainer");
        savButtonCon.setAttribute("drop", "false");
        savButtonCon.setAttribute("draggable", "false");
        
        var savebtn = document.createElement("button");
        savebtn.type = "submit";
        savebtn.setAttribute("class", "savButtonDiv");
        savebtn.id = newID + "submit-data";
        savebtn.class = "savebtn";
        savebtn.disabled = "false";
       
        
        var buttontxt = document.createTextNode("Save changes");
        savebtn.appendChild(buttontxt);
        savButtonCon.appendChild(savebtn);
       
        
//***************************************************
//             Revert Button - onclick - reverts changes 
//***************************************************
       
        
        var revertBtn = document.createElement("button");
        revertBtn.setAttribute("class", "revertButtonDiv");
        revertBtn.type = "submit";
        revertBtn.id = newID + "revert-data";
        revertBtn.class = "revertbtn";
        revertBtn.disabled = "false";
       
        revertBtn.onclick = function(){ location.reload();};
        
        var buttontxt = document.createTextNode("Revert changes");
        revertBtn.appendChild(buttontxt);
        savButtonCon.appendChild(revertBtn);
        newDiv.appendChild(savButtonCon);
        

        // Position - hidden fields - arreange the order of the div
        var positionInput = document.createElement("input");
        positionInput.setAttribute("id", newID+"position");
        var inputBugVal = document.createTextNode("");
        positionInput.style.display = "none";
        positionInput.appendChild(inputBugVal);
        newDiv.appendChild(positionInput);
        
        // column area - hidden fields - arreange the order of the div
        var columnInput = document.createElement("input");
        columnInput.setAttribute("id", newID+"columInput");
        var columninput = document.createTextNode("");
        columnInput.style.display = "none";
        columnInput.appendChild(columninput);
        newDiv.appendChild(columnInput);
        
    
    
 
    //========================================================
    //  end of loop
    //========================================================
// Delgate functionality for Hi lighting a selected Div 
    $(document).ready(function () {
        $("div").delegate("h1", "click", function () { });
    });


    //****************************************************************************************************
    //          Bug button -  onclick changes the class and the image bug on image.
    //*****************************************************************************************************
    
            //this allows the change in stat to the main div when the bug is clicked 
     $(".bug1").unbind('click').click(function () {
        var a = $(this).closest('img').attr('src');
        var b = "pic/bug1.png";
       
        if (a === b) {
             var id = $(this).parent().parent().parent().attr('id');
             alert(id);
            $(this).parent().parent().parent().removeClass();
            $(this).parent().parent().parent().addClass("bug");
           
            $(this).attr("src", "pic/bug2.png");
            document.getElementById(id+"bugInput").innerHTML = "1";
            //enables the save button
             alert("1");
          
                  alert(id);
             $("#"+id).find("button#"+id+"submit-data").attr('disabled', null);
            $("#"+id).find("button#"+id+"revert-data").attr('disabled', null);
            
        } else {
            
                  var id = $(this).parent().parent().parent().attr('id');
                  alert(id);
             $("#"+id).find("button#"+id+"submit-data").attr('disabled', null);
            $("#"+id).find("button#"+id+"revert-data").attr('disabled', null);
            
            $(this).parent().parent().parent().removeClass("bug");
            $(this).attr("src", "pic/bug1.png");
            document.getElementById(id+"bugInput").innerHTML = "0";
        }
           
    });
    // depending storycard bug status value this applies bug class
        var inputBugVal = "1";
        if( inputBugVal === "15") {
            document.getElementById("bugImage15").src = "pic/bug1.png" ;
            document.getElementById("15").classList.add("bug");   
        } 
    

    //****************************************************************************************************
    //          Swarm button -  onclick changes the class and the image to be on.
    //*****************************************************************************************************
    
                //this allows the change in stat to the main div when the bug is clicked 
    $(".swarm1").unbind('click').click(function () {
        var a = $(this).closest('img').attr('src');
        var b = "pic/swarm1.png";

        if (a === b) {
            $(this).parent().parent().parent().removeClass();
            
             var id = $(this).parent().parent().parent().attr('id');
             
            document.getElementById(id+"swarmInput").innerHTML = "1";
           
            $(this).parent().parent().parent().addClass("swarm");
            
            $("#"+id).find("button#"+id+"submit-data").attr('disabled', null);
            $("#"+id).find("button#"+id+"revert-data").attr('disabled', null);
            
            $(this).attr("src", "pic/swarm2.png");
            var a = "";
            var b = "";
        } else {
            $(this).parent().parent().parent().removeClass("swarm");
            $(this).attr("src", "pic/swarm1.png");
            
            //changes hidden swarm input 
            var id = $(this).parent().parent().parent().attr('id');
            document.getElementById(id+"swarmInput").innerHTML = "0";
            
            $("#"+id).find("button#"+id+"submit-data").attr('disabled', null);
            $("#"+id).find("button#"+id+"revert-data").attr('disabled', null);
        }
          
    });
    
        
//        if (emp.swarm === "1") {
//              $(this).parent().parent().parent().addClass("swarm");
//              
//        }
        
//        var inputSwarmVal = emp.swarm;
//        if( inputSwarmVal === "1") {
//               document.getElementById("ImageSwarm14").src = "pic/swarm2.png";
//               document.getElementById("14").classList.add("swarm");   
//            }
   

    

    //****************************************************************************************************
    //          Save changes button - Disable - if there a change on the storycard disable is than false allowing user to save changes
    //*****************************************************************************************************
    

   var parent;

 
    // this gets the element the user clicks on
    this.onclick = function () {
        
        if( event.target.parentElement.parentElement.id !== ''){
            parent = event.target.parentElement.id;
        } 
        
        if (typeof parent!=='number' && (parent%1)!==0){
             parent = event.target.parentElement.parentElement.id;
        }  
        
        if (typeof parent!=='number' && (parent%1)!==0){
             parent = event.target.parentElement.parentElement.parentElement.id;
        }   
        
        if (parent > 0) {
           
            // If a change is made to the story card save button appears
            $('#' + parent).each(function () {
                $(this).data('serialized', $(this).serialize());
            }).on('change input', function () {

                if ( $(this).serialize() !== false) {
                    
                    $(this).find('input:submit, button:submit').attr('disabled', $(this).serialize() !== $(this).data('serialized'));
                }
            });
            }
       };
       
       
   //**************** if onclick happy face nput new value to input ************


    $( ".happyFace" ).click(function() {
            parent = event.target.parentElement.parentElement.parentElement.id;
            document.getElementById(parent+"storynotes").value = "Story will be completed on time as mention in scrum";    
            
              $("#"+parent).find("button#"+parent+"submit-data").attr('disabled', null);
             $("#"+parent).find("button#"+parent+"revert-data").attr('disabled', null);
    });

    $( ".sadFace" ).click(function() {
            parent = event.target.parentElement.parentElement.parentElement.id;
            document.getElementById(parent+"storynotes").value = "Issues!! - possible delays ";
            
             $("#"+parent).find("button#"+parent+"submit-data").attr('disabled', null);
             $("#"+parent).find("button#"+parent+"revert-data").attr('disabled', null);
             
    });


};

