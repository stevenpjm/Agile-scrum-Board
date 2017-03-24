    

    
    // This is uploads pic 
     function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            
            reader.onload = function (e) {
                
                $('#blah')
                 
                .attr('src', e.target.result)
                .width(50)
                .height(50);
                              
            };
            
            reader.readAsDataURL(input.files[0]);
        }
   
    }
    


    
    

// This tracker script 
// 
// changes the class for the tracking 
    $(document).ready(function() {
        $('.steps').on('click', function() {
            $('.steps').removeClass('active');
            $(this).addClass('active');
        });
    });
    
    document.addEventListener("drop", function(event) {
        event.preventDefault();
        var data = event.dataTransfer.getData("Text");
        event.target.appendChild(document.getElementById(data));
    });

    var counttr = 0;
    var p = 0; 


     /* Event fired on the drag target*/
     document.addEventListener("dragstart", function(event) {
     event.dataTransfer.setData("Text", event.target.id);
     });

    /* Events fired on the drop target*/
    document.addEventListener("dragover", function(event) {
    event.preventDefault();
    });counttd = 0;

 

     //allow the order of the creation of sotry cards as squiencial
    $("#toolbar").sortable({
        sort: function () {},
        placeholder: 'ui-state-highlight',
        receive: function () {},
        update: function (event, ui) {}
    });
    
     $("#demo").sortable({
        sort: function () {},
        placeholder: 'ui-state-highlight',
        receive: function () {},
        update: function (event, ui) {}
    });

            //changes the pic and colour of the div
   


//This removes the div when double clicked - (This will change to a button).
    /** var oInput;
    var childdiv;
    var id;
    $(document).ready(function(){
        $('div').dblclick(function(){
          var id = $(this).attr('id');   
            $(this).bind('click',function(e) {
                  $(e.target).remove();
            });
        });
    });*/
     


         $("#droppable").droppable({

                drop: function (e, ui) {

                    if ($(ui.draggable)[0].id !== "") {
                        x = ui.helper.clone();
                    ui.helper.remove();
                    x.draggable({
                        helper: 'original',
                        containment: '#droppable',
                        tolerance: 'fit'
                    });
                    x.resizable({
                        maxHeight: 40,
                        minHeight: 40,
                        minWidth: 50
                    });
                    x.appendTo('#droppable');
                }

                }
            });
  
  
  
  
  //following funstions are for pics drag and drop
  
  function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
    
}

function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    ev.target.appendChild(document.getElementById(data));
}





