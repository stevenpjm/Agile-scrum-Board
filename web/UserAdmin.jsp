<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <script src="JS/login.js"></script>
        <script src="JS/signup.js"></script>
        <link href="CSS/login.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/layout.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/menubanner.css" rel="stylesheet" type="text/css"/>
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <title>SCRUM BOARD</title>
      </head>

            
<body>


    <div id="left">

    </div>


    <div id="main">
        
        <%
            
            
         %>
        <form action="Update" style="border:1px solid #ccc">
            <div class="container">
              
              <label><b>First</b></label>
              <input type="text" placeholder="First Name" name="fname" required>
              
              <label><b>Surname</b></label>
              <input type="text" placeholder="Surname" name="sname" required>
              
              <label><b>Email</b></label>
              <input type="text" placeholder="Enter Email" name="email" required>

              <label><b>Old Password</b></label>
              <input type="password" placeholder="Enter Password" name="old_psw" required>

              <label><b>New Password</b></label>
              <input type="password" placeholder="Repeat Password" name="new-repeat" required>
              
              <label><b>Repeat New Password</b></label>
              <input type="password" placeholder="Repeat Password" name="psw-repeat" required>
              
              <label><b>Scrum Team</b></label>
              <input type="text" placeholder="Scrum Team" name="scrum-team" required>
              
              <div class="clearfix">
                
                <button type="submit" class="update">Update Profile</button>
                <button type="delete" class="cancelbtn">Delete Profile</button>
              </div>
            </div>
          </form>
        
     </div>

    <div id="bottom">
        
    </div>

    <div id="right">
        
    </div>

    <div id="top">
        
        <div id="Logo">
            AGILE SCRUMBOARD
        </div>
        
        <div id="linkhome"> 
            <a href="http://localhost:8080/SCRUM_V2/">Home Page</a>

            
            <a href="http://localhost:8080/SCRUM_V2/ContactUs.jsp">Contact Us</a>
            
            
            
            <% 
                  String userName = (String) session.getAttribute("userid");
                if (userName != null ){%>
                <a href="http://localhost:8080/SCRUM_V2/Scrumboard.jsp">Scrum_Board</a> 
                <a href='/SCRUM_V2/JSP/logout.jsp'>Log out</a>
                
            <% } else { %>
                  <button onclick="document.getElementById('signup').style.display='block'" style="width:auto;" class="linkbutton">Sign Up</button>
                   <button onclick="document.getElementById('id01').style.display='block'" style="width:auto;" class="linkbutton">login</button>
            
                <%};%>
             
        </div>
    </div>
                
    </body>
    
    </html>