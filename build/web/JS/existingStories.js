
//This creates the story 
var i = 0;
var j = 0;
var IDNO = 0;
var counter = 0;
var counterstory = 0;
function existingstory(existingstories) {
}


function newlayout(existingstories) {


//sets the amount of story cards to be created
    for (var p = 0; p < existingstories.length; p++) {

//creates an object for the individual stories
        var emp = existingstories[p];

//creates the div as the container for the story card
        var newDiv = document.createElement("div");
        newDiv.setAttribute("id",emp.ID);
        newDiv.setAttribute("class", "storycard");
        newDiv.setAttribute("draggable", true);
        
//****************************
//Dates for the top of the card

// Creats a new DIV for the Dates for the top of the storycard
        var dateDiv = document.createElement("div");
        dateDiv.setAttribute("id", "dates");
//+++++++++++++++++++++++++++
//Last updated
        var cdate = document.createTextNode("created:       " + emp.createdate);
        
// Last created 
        var ldate = document.createTextNode("   Last updated:   " + emp.lastupdate);
//+++++++++++++++++++++++++++
        dateDiv.appendChild(cdate);
        dateDiv.appendChild(ldate);
        newDiv.appendChild(dateDiv);
//Last updated
        var cdate = document.createTextNode(emp.createdate);
// Last created 
        var ldate = document.createTextNode(emp.lastupdate);

//****************************                

//story name output
        var inputstatus = document.createElement("input");
        inputstatus.setAttribute("ID", "storyname");
        $(inputstatus).val(emp.storyname);

        newDiv.appendChild(inputstatus);

//story notes output
        var inputstatus = document.createElement("input");
        inputstatus.setAttribute("ID", "storynotes");
        $(inputstatus).val(emp.storynotes);
        newDiv.appendChild(inputstatus);
//****************************     


//********************************
//**********
//**********  Changes the Div based on the bug 
//********************************  


        var img1 = document.createElement("IMG");
        img1.src = "pic/bug1.png";
        img1.style.height = '40px';
        img1.style.width = '40px';
        img1.setAttribute("class", "bug1");
        newDiv.appendChild(img1);
        

// image2
        var img2 = document.createElement("IMG");
        img2.src = "pic/bug2.png";
        img2.style.height = '40px';
        img2.style.width = '40px';
        img2.style.display = "none";
        img2.setAttribute("class", "bug2");
        newDiv.appendChild(img2);







//********************************
//**********
//**********   Creates the users 1 task and div to drag and drop in 
//********************************  


//Create array of options to be added
        var array = ["", "DEV", "AUTO", "QA", "RESEARCH"];

//Create and append select list
        var selectList = document.createElement("select");
        selectList.setAttribute("id",emp.ID+"user1Task");
        selectList.setAttribute("class","user1Task");
        newDiv.appendChild(selectList);
        $(inputstatus).val(emp.storynotes);
  

        
//Create and append the options
        for (var i = 0; i < array.length; i++) {
            var option = document.createElement("option");
            option.setAttribute("value", array[i]);
            option.text = array[i];
            selectList.appendChild(option);
        }
        

        
        
        //document.getElementById(emp.ID+ "user1Task").value = '10';  
        

//store user 1 picture
        var user1pic = document.createElement("div");
        user1pic.setAttribute("id", "user1pic");
        user1pic.setAttribute("class", "profilepics");
        newDiv.appendChild(user1pic);
        //var testdiv = document.createTextNode("User1 Pic");
        //user1pic.appendChild(testdiv);
        
        

//********************************
//**********
//**********   Creates the users s task and div to drag and drop in 
//********************************  

//Create array of options to be added
        var array = ["", "DEV", "AUTO", "QA", "RESEARCH"];

//Create and append select list
        var selectList = document.createElement("select");
        selectList.setAttribute("id", emp.ID+"user2Task");
        selectList.setAttribute("class","user2Task");
        newDiv.appendChild(selectList);

//Create and append the options
        for (var i = 0; i < array.length; i++) {
            var option = document.createElement("option");
            option.setAttribute("value", array[i]);
            option.text = array[i];
            selectList.appendChild(option);
        }
         $(inputstatus).val(emp.storynotes);

//store user 1 picture
        var user1pic = document.createElement("div");
        user1pic.setAttribute("id", "user2pic");
        user1pic.setAttribute("class", "profilepics");
        newDiv.appendChild(user1pic);
        //var testdiv = document.createTextNode("User2 pic");
        //user1pic.appendChild(testdiv);

//********************************
//**********
//**********   Creates the users 3 task and div to drag and drop in 
//********************************  

//Create array of options to be added
        var array = ["", "DEV", "AUTO", "QA", "RESEARCH"];

//Create and append select list
        var selectList = document.createElement("select");
        selectList.setAttribute("id", emp.ID+"user3Task");
        selectList.setAttribute("class", "user3Task");
        newDiv.appendChild(selectList);

//Create and append the options
        for (var i = 0; i < array.length; i++) {
            var option = document.createElement("option");
            option.setAttribute("value", array[i]);
            option.text = array[i];
            selectList.appendChild(option);
        }

//store user 1 picture
        var user1pic = document.createElement("div");
        user1pic.setAttribute("id", "user3pic");
        user1pic.setAttribute("class", "profilepics");
        newDiv.appendChild(user1pic);

    
                
        document.getElementById("backlog").appendChild(newDiv);
        
        document.getElementById(emp.ID+'user1Task').value = emp.user1Task;
        document.getElementById(emp.ID+'user2Task').value = emp.user2Task;
        document.getElementById(emp.ID+'user3Task').value = emp.user3Task;

    }
    
       
// Delgate functionality for Hi lighting a selected Div 
            $(document).ready(function(){
                $("div").delegate("h1", "click",function(){	});
            });
            
            
            
            
          //this allows the change in stat to the main div when the bug is clicked 
                $(".bug1").unbind('click').click(function () {
                    var a = $(this).closest('img').attr('src');
                    var b = "pic/bug1.png";

                    if (a === b) {
                        $(this).closest('div').removeClass();
                        $(this).closest('div').addClass("bug");
                        $(this).attr("src", "pic/bug2.png");
                        var a = "";
                        var b = "";
                    } else {
                        $(this).closest('div').removeClass("bug");
                        $(this).attr("src", "pic/bug1.png");
                    }
                });         

}



