<%@page import="dao.userDetails"%>
<%@page import="java.lang.String"%>
<%@page import="dao.scrumboard"%>
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
        <script src="JS/login.js"></script>
        <script src="JS/signup.js"></script>
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

        <div id="main">
            
            <form  method="post" style="border:1px solid #ccc">
                <div class="container" id="userform">

                    <label><b>Email</b></label>
                    <input type="text" placeholder="Enter Email" name="email" autocomplete="off" required value="<% out.println(email);%>" id="email">
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
                        <input type="password" placeholder="Repeat new Password" name="psw-repeat" autocomplete="off" id="confirm-password">

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

                <%
                    String userName = (String) session.getAttribute("userid");
                    if (userName != null) {%>
                <a href="http://localhost:8080/SCRUM_V2/Scrumboard.jsp" class="linkbutton" >Scrum_Board</a> 
                <a href='/SCRUM_V2/JSP/logout.jsp'class="linkbutton" >Log out</a>
                <a href='/SCRUM_V2/UserAdmin.jsp' class="linkbutton" >Profile</a>
                <% } else { %>
                <button onclick="document.getElementById('signup').style.display = 'block'" style="width:auto;" class="linkbutton">Sign Up</button>
                <button onclick="document.getElementById('id01').style.display = 'block'" style="width:auto;" class="linkbutton">login</button>
                <%};%>
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
        </script>   
    </body>
</html>