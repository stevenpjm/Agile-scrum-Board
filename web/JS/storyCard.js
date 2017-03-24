
//This creates the story 
    var i = 0;
    var j = 0;
    var IDNO = 0;
    var counter = 0;

    function createStory() {

        IDNO = counter++;

        //Creates the container & attributes
        var div = document.createElement('div');
        var q = document.getElementById("backlog").appendChild(div);
        q.setAttribute("draggable", true);
        q.setAttribute("id", "name"+ IDNO );

        // creates table
        var table = document.createElement('table'), tr, td, row, cell;
        var x = document.createElement("TABLE");
        x.setAttribute("id", "myTable"+ IDNO);
        document.getElementById("name"+ IDNO).appendChild(x);
        var i = 0;
        var j = 0;

        for (;i < 4; i++) {
            //This creates the TR
            counttr = counttr + 1;
            var y = document.createElement("TR");
            y.setAttribute("id", "storyTr"+ counttr);

            document.getElementById("myTable"+ IDNO).appendChild(y);

            var labels  =["Story", "Status","Person"];

            //This creates the TD
            for ( j = 0; j < 1; j++ ) {
                var y = document.createElement("TD");
                y.setAttribute("id", "labelTD"+ counttd);
                document.getElementById("storyTr"+ counttr).appendChild(y);

                if( i < 3 ) {
                    var data1 = document.createTextNode(labels[i]);
                    document.getElementById("labelTD"+ counttd).appendChild(data1);	
                }

                var z = document.createElement("TD");
                z.setAttribute("id", "inputTD"+ counttd);
                var td = document.getElementById("storyTr"+ counttr).appendChild(z);
                var inputstatus = document.createElement("input");
                inputstatus.setAttribute("type", "text");
                inputstatus.setAttribute("ID", "input" + counttd);


                if( i < 3 ) {
                    document.getElementById("inputTD"+ counttd).appendChild(inputstatus);		
                } else {
                    var img1 = document.createElement("IMG");
                    img1.src = "pic/bug1.png";
                    img1.style.height = '40px';
                    img1.style.width = '40px';
                    img1.setAttribute("class", "bug1");
                    document.getElementById("inputTD"+ counttd).appendChild(img1);

                    // image2
                    var img2 = document.createElement("IMG");
                    img2.src = "pic/bug2.png";
                    img2.style.height = '40px';
                    img2.style.width = '40px';
                    img2.style.display = "none";
                    img2.setAttribute("class", "bug2");
                    document.getElementById("inputTD"+ counttd).appendChild(img2);
                }
                counttd = counttd + 1;
                counttd = counttd + j;
            }

        }			

             // Delgate functionality for Hi lighting a selected Div 
            $(document).ready(function(){
                $("div").delegate("h1", "click",function(){	});
            });

// this bug section

       
        $(".bug1").unbind('click').click(function(){                
                var a = $(this).closest('img').attr('src');
                var b = "pic/bug1.png";

                if( a === b ){
                    $(this).closest('div').removeClass();
                    $(this).closest('div').addClass("bug");
                    $(this).attr("src","pic/bug2.png");
                    var a ="";
                    var b ="";
            } else {
                $(this).closest('div').removeClass("bug");
                    $(this).attr("src","pic/bug1.png");
                }
            });       
}