<%@page import="profile.MD5Util"%>
<%@page import="dao.userDetails"%>
<%@page import="java.lang.String"%>
<%@page import="dao.*"%>
<%@page import="java.sql.ResultSet"%>
<%
                String username = "";
                String email = "";
                String userName1 = (String) session.getAttribute("email");
                String teamName = "";
                ResultSet rs = userDetails.userDetails(userName1);

                while (rs.next()) {
                    username = rs.getString(2);
                    email = rs.getString(3);
                    teamName = rs.getString(5);
                }
            %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link href="CSS/searchoptions.css" rel="stylesheet" type="text/css"/>
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
       
        <script src="JS/ajaxCall.js"></script>
        <link href="CSS/login.css" rel="stylesheet" type="text/css"/>
       
        <link href="CSS/layout.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/menubanner.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/searchoptions.css" rel="stylesheet" type="text/css"/>
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <title>SCRUM BOARD</title>
    </head>

    <body>
        <div id="left">
        </div>
        
       <% if (session.getAttribute("email") != null)
          {
       %>

        <div id="main">
            
            <form  method="post" style="border:1px solid #ccc">
                <div class="container" id="userform">
                    
                    <img src="https://www.gravatar.com/avatar/<% MD5Util md5u = new MD5Util();
                                        email = (String) session.getAttribute("email");
                                        out.println(md5u.md5Hex(email)); %>?d=identicon&r=g" title="Default Avatar" alt="Default Avatar" width="120px" height="120px">
                                    <br>
                
                    
                    <label><b>Email   :    You can not amend your email, you must sign up with a new user.</b></label>
                    <input type="text" placeholder="Enter Email" name="email" autocomplete="off" required value="<% out.println(email);%>" id="email" readonly>
                    <br>
                   
                    <label><b>Username</b></label>
                    <input type="text" placeholder="Username" name="uname" autocomplete="off" required value="<% out.println(username); %>" id="username">
                    <br>

                    <label><b>Password</b></label>
                    <input type="password" placeholder="Enter Password" autocomplete="off" name="old_psw" required value="<% %>" id="password">
                    <br>
                    <div id="password"><br>
                        Password Reset!<br>
                        <label><b>New Password</b></label><br>
                        <input type="password" placeholder="new Password" name="new-repeat" autocomplete="off" id="newpassword"><br>

                        <label><b>Repeat New Password</b></label><br>
                        <input type="password" placeholder="Repeat Password" name="password-repeat"  autocomplete="off" id="password-repeat">

                    </div>

                    <label><b>Scrum Team</b></label>
                    <input type="text" placeholder="Scrum Team" name="scrumTeamReq" autocomplete="off" value="<% out.println(teamName);%>" id="scrumNamevalue">
                    <div id="scrumSearchOptions"> 


                    </div>
                    <div class="clearfix">
                        <button type="submit" class="update" formaction="/SCRUM_V2/JSP/userAdmin.jsp">Update Profile</button>
                        <button type="delete" class="cancelbtn">Delete Profile</button>
                    </div>

                </div>
            </form>

        </div>
           <% } else { %>
   <div id="main">
    <h2><font face="verdana"><center>Sorry! <br>You need to signed in<br>  OR<br> Join a Scrum Team!<br> Let the Agile force be with you! </center></font></h2>  
</div>
<%}%>

        <div id="bottom">

        </div>

        <div id="right">
            
        </div>

        <div id="top">

            <div id="Logo">
                AGILE SCRUMBOARD
            </div>

            <div id="linkhome"> 
                <a href="http://localhost:8080/SCRUM_V2/" class="linkbutton" >Home Page</a>
                <a href="http://localhost:8080/SCRUM_V2/ContactUs.jsp" class="linkbutton" >Contact Us</a>
                
                 <% if (session.getAttribute("email") != null){ %>
                 <a href="http://localhost:8080/SCRUM_V2/Scrumboard.jsp" class="linkbutton" >Scrum_Board</a>
            <div id="profile">
                
              
            </div>
            <%}%>
            
            </div>
        </div>

        <script>
            // Using the userinput to retrieve scrumteam. 
            $("#scrumNamevalue").keyup(function (event) {
              
                $("#scrumOptionsSelect").remove();
                var searchVal = $(this).val();

                if (searchVal !== "") {
                    ajaxCall('#scrumSearchOptions', 1, searchVal);
                }
            });

            $("#scrumSearchOptions").click(function () {
                var optionSelected = $("#scrumSearchOptions").find(":selected").val();
                var targetVal = document.getElementById("scrumNamevalue");
                targetVal.value = optionSelected;
                $("#scrumOptionsSelect").remove();
            });
            
            
             $(".deleteBtn").click(function () {
                    var email = document.getElementById("email").value;
                    alert(email);
                     if (confirm("Are you sure you want to delete this profile?") === true) {
                       DataAccess.deleteUserDetails(email);
                   }
                });
        </script>   
    </body>
</html>