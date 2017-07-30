<%@page import="dao.dbUpdateStoryCard"%>
<%@page import="java.lang.String"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="profile.MD5Util"%>
<%@page import="dao.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
Document   : AllPost
Created on : Feb 1, 2017, 2:11:57 PM
Author     : steven.masters
--%>

<%
    int sprintId = 0;
    String sprintName = "";
    String username = "";
    String email = "";
    String scrumName = "";
    int userID = 0;
    int scrumID = 0;

    if (session.getAttribute("email") != null) {
//*******************************************
//Get All User Details 
//*******************************************

        String userName1 = (String) session.getAttribute("email");
        ResultSet getUserDetails = userDetails.userDetails(userName1);

        while (getUserDetails.next()) {
            userID = getUserDetails.getInt(1);
            username = getUserDetails.getString(2);
            email = getUserDetails.getString(3);
            scrumID = getUserDetails.getInt(4);

        }

//*******************************************
//Get All scrum details 
//*******************************************
        DataAccess da = new DataAccess();
        ResultSet getScrumDetails = da.getscrumid(email);
        while (getScrumDetails.next()) {
            scrumName = getScrumDetails.getString(getScrumDetails.getMetaData().getColumnName(3));
        }

//*******************************************
//Get All Sprint details 
//*******************************************
        ResultSet getSprintDetails = sprintDetails.getSprintDetails(scrumID);
        while (getSprintDetails.next()) {
            sprintName = getSprintDetails.getString(getSprintDetails.getMetaData().getColumnName(2));
            sprintId = getSprintDetails.getInt(getSprintDetails.getMetaData().getColumnName(1));
        }

    }
%>

<!DOCTYPE html>
<html>
    <head>
        <%--  CSS  --%>
        <link href="CSS/storycard.css" rel="stylesheet" type="text/css"/> 
        <link href="CSS/scrumboard.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/menubanner.css" rel="stylesheet" type="text/css"/>

        <%--  Javscripts files  --%>
        <script src="JS/createNewStoryCard.js"></script>
        <script src="JS/createNewStoryAjaxCall.js"></script>
        <script src="JS/updateStoryCard.js"></script>
        <script src="JS/deleteStoryCard.js"></script>
      
        <%--<script src="JS/scrumboard.js"></script> --%>
        <script src="JS/existingStories.js"></script>
        <script src="JS/dragDropEvent.js"></script>
        <script src="JS/picUpdate.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
        <%--<link  href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css">--%>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/jquery-ui.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All post</title>
    </head>

    <body>
        <div id="banner">
            <div id="Logo">
                AGILE SCRUMBOARD
            </div>
            <div id="linksScrum">
                <a href="http://localhost:8080/SCRUM_V2/index.jsp" class="linkbutton"  >Home Page</a>
                <a href="http://localhost:8080/SCRUM_V2/scrumboard.jsp" class="linkbutton" >Contact Us</a>
                <% if (session.getAttribute("email") != null) {%>
                <a href='/SCRUM_V2/JSP/logout.jsp' id="logoutlink" class="linkbutton" >Log out</a>
                <a href='/SCRUM_V2/UserAdmin.jsp' class="linkbutton" >Profile</a>
                <%}%>
            </div>

            <div id="profile">
                <img src="https://www.gravatar.com/avatar/<% MD5Util md5u = new MD5Util();
                    email = (String) session.getAttribute("email");
                    out.println(md5u.md5Hex(email)); %>?d=identicon&r=g" title="Default Avatar" alt="Default Avatar" width="60px" height="60px">
                <br>
                <% out.println(username);%>
            </div>

            <div class="scrumdropdown">
                <center>Scrum Team</center>
                <button class="scrumbtn">  
                    <%out.println(scrumName);%>
                </button>

                <div class="scrum-content">
                    <a href="http://localhost:8080/SCRUM_V2/scrumadmin.jsp">Scrum Admin</a>
                    <a href="http://localhost:8080/SCRUM_V2/deletescrumteam.jsp">Delete Scrum Team</a>
                </div>
            </div>

            <div class="sprintdropdown">
                <center>Sprint Name</center>
                <button class="sprintbtn"><%out.println(sprintName);%> </button>
                <div class="scrum-content">
                    <a href="">Close Sprint</a>
                    <a href="#">Delete Sprint</a>
                    <a href="#">Create Sprint</a>
                </div>
            </div>
        </div>

        <% if (session.getAttribute("email") != null) {%>
        <div id="scrumboardContainer">
            <div id="toolbar"> 

                <div id="teamNotes">
                    <div id="teamNotesheader">
                        <center>Team Notes</center>
                    </div>
                    <div class='label'>1: <input type="text" class="teamnotesinput" value="" id="teamNotes1"/></div>
                    <div class='label'>2: <input type="text" class="teamnotesinput" value="" id="teamNotes2" /></div>
                    <div class='label'>3: <input type="text" class="teamnotesinput" value="" id="teamNotes3"/></div>
                    <div class='label'>4: <input type="text" class="teamnotesinput" value="" id="teamNotes4"/></div>
                    <button type="button" class="button">Save</button>
                </div>

                <div id="teamStats">
                    <div id="teamStatsHeader"><center>Team Stats</center></div>
                    <table id="Stats">
                        <%-- --%>
                        <tr>
                            <td>Total:</td><td id="storyTotal"></td><td></td><td id="daysRemain"></td>
                        </tr>
                        <%-- --%>
                        <tr>
                            <td>Completed</td><td id="completedtotal"></td><td></td><td id="daysLeft"></td>
                        </tr>
                        <%-- --%>
                        <tr>
                            <td>In progress :</td><td id="progresstotal"></td><td></td><td id="bug"></td>
                        </tr>
                        <%-- --%>
                        <tr>
                            <td>Back Log : </td><td id="backlogtotal"></td><td></td><td></td>
                        </tr>
                    </table>
                </div>

                <div id="createStoryCard">
                    <div id="storyCardHeader"> <center>Create Story Card</center></div>
                    <button onclick="createNewStory()" id="newStory" class="button">+ Create Story</button>

                    <input type="hidden" name="fname" id="storyCardcontainer">
                </div>

                <div id="team">
                    <div id="teamHeader"><center>Team Members</center></div> 
                            <%-- This adds the team profile pic to the web app --%>
                    <script>
                        $(".userprofilepic").draggable({helper: 'clone'});
                    </script>
                    <%    ResultSet userDetails = dao.DataAccess.getUserDetails(scrumID);
                        while (userDetails.next()) {
                    %>
                    <div id="userFrame"> 
                        <div data-id="<% out.println(userDetails.getString("email")); %>" class="teamProfilePics" >
                            <img src="https://www.gravatar.com/avatar/<% MD5Util md5u2 = new MD5Util();
    out.println(md5u2.md5Hex(userDetails.getString("email"))); %>?d=identicon&r=g" id="<% out.println(userDetails.getString("userid")); %>" draggable="true" ondragstart="drag(event)" width="70" height="70" class="profilePicture">
                        </div>  

                        <div id="username" class="profileUsername">
                            <% out.println(userDetails.getString("username")); %>
                        </div>
                    </div>

                    <%
                        }
                    %>
                </div>
            </div>

            <div id="complete" ondrop="drop(event,<% out.println(sprintId);%>)" ondragover="allowDrop(event)">
                <h3 id = "completeHeader"><center>Complete</center></h3>
            </div>
            <div id="active" ondrop="drop(event,<% out.println(sprintId);%>)" ondragover="allowDrop(event)">
                <h3 id = "activeheader"><center>Active</center></h3>
            </div>
            <div id="backlog" ondrop="drop(event,<% out.println(sprintId);%>)" ondragover="allowDrop(event)">
                <h3 id = "backlogheader"><center>Backlog</center></h3>
            </div>
        </div>

        <%StringBuilder sb = new StringBuilder();
            String myVar = "";
            sb.append("'{\"employees\":['+");
            ResultSet ls = dao.DataAccess.getAll(sprintId);

            ResultSetMetaData rsmd = ls.getMetaData();
            int columnCount = rsmd.getColumnCount();

            if (columnCount != 0) {

                boolean lastRow;
                while (ls.next()) {
                    for (int i = 1; i <= columnCount; i++) {
                        if (i == 1) {
                            sb.append("'{");
                        }
                        if (i > 1) {
                            sb.append(",");
                        }
                        String columnValue = ls.getString(i);
                        sb.append("\"" + rsmd.getColumnName(i) + "\":\"" + columnValue + "\"");
                    }
                    lastRow = ls.isLast();

                    if (lastRow == false) {
                        sb.append("},' + ");
                    }
                }
                sb.append("}]}';");
                String getAllSprintStories = sb.toString();
                getAllSprintStories = getAllSprintStories;
        %>

        <script>
           
            var txt3 = <%=getAllSprintStories%>;
            var existingstories = $.parseJSON(txt3).employees;
            storyCard(existingstories);
        </script>
        <% }%>

        <script>
            $('#sprint tr #date').each(function () {
                var rowDate = $(this).html();
                var today = new Date();
                var dd = today.getDate();
                var mm = today.getMonth() + 1;
                var yyyy = today.getFullYear();
                if (dd < 10)
                {
                    dd = '0' + dd;
                }
                if (mm < 10)
                {
                    mm = '0' + mm;
                }
                todaysdate = dd + '/' + mm + '/' + yyyy;

                if (todaysdate - rowDate < 1 && rowDate < todaysdate) {
                    $(this).parent('tr').addClass('');
                } else {
                    if (rowDate < todaysdate) {
                        $(this).parent('tr').addClass('old');
                    }
                }
            });
     
            // loads up the teamstats
            teamsats();
            
            //This allow the user to create a new storycard
            var sprintID =<%=sprintId%>;
            var scrumID =<%=scrumID%>;
            var userID =<%=userID%>;
            // creates a new storycard
            function createNewStory() {
            <% int newid = dao.LastStoryID.LastStoryID();%>
                    lastStoryID = <%= newid%>;
                    document.getElementById('storyCardcontainer').value = lastStoryID;
                    createNewStoryCard(lastStoryID);
                    createNewStoryAjaxCall(scrumID , sprintID, userID);
            }

            
            // this removes the profile pic when double clicked
            $(this).dblclick(function (event) {
                var currentEl1 = $(event.target).closest('img').attr('class');
                var currentEl2 = $(event.target).parent().attr('class');
                if (currentEl1 === "profilePicture" && currentEl2 !== "teamProfilePics") {
                    //Gets the relevant details to remove pic user from story card.
                    var storyID = $(event.target).closest('.storycard').attr('id');
                    var targetProfile = $(event.target).closest('.profilepicsholder').attr('id');
                    PicUpdateRemove(storyID, sprintID, targetProfile);
                    $(event.target).closest('IMG').remove();
                }
            });
      
            // This adds the pic to the profilePic Area
            var storyID = "";
            var storyName = "";
            var userID =<%=userID%>;
            function updateP1(storyID, storyName, storyNote, user1Task, user2Task, user3Task, storyBug, swarm, column) {
                updateStoryCard(storyID, storyName, storyNote, user1Task, user2Task, user3Task, storyBug, swarm, column, sprintID,userID);
            }
            
            
            //this delete the storycard
             $(".deleteButton").click(function () {
                 var storyID = $(this).parent().parent().parent().parent().attr('id');
                 $(this).parent().parent().parent().parent().remove();
                 deleteStorycard(storyID,  sprintID);
             });
            
        </script>

        <%-- The below block of code helps maintain Sprint  --%>

        <div id="signup" class="modal">
            <span onclick="document.getElementById('sprintCreated').style.display = 'none'" class="close" title="Close Modal">×</span>
            <form  id="SCRUMNAME" class="modal-content animate" action="/SCRUM_V2/JSP/scrumsetup.jsp"  method="post" >
                <div class="container">
                    <label><b>Scrum Name</b></label>
                    <input type="text" placeholder="Enter Email" name="email" id="email" autocomplete="off" placeholder="sophie@example.com"required>
                    Team
                </div>
        </div>
    </form>
</div>

<% } else { %>

<div id="scrumboardContainer">
    Please sign in!!  
</div>

<%}%>
</body>
</html>


