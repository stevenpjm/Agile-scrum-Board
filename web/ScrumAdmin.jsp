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
// form teammember varibles
    int MemID = 0;
    String memName = "";
    String mememail = "";
    String teamaccess = "";

    int sprintId = 0;
    String sprintName = "";
    String username = "";
    String email = "";
    String scrumName = "";
    int userId = 0;
    int scrumId = 0;
    String scrumStatus = "";
    String sprintStatus = "";
    String sprintDateFrom = "";
    String sprintDateTo = "";

    String userName1 = (String) session.getAttribute("email");
    ResultSet getUserInfo = userDetails.userDetails(userName1);

    while (getUserInfo.next()) {
        userId = getUserInfo.getInt(6);
        username = getUserInfo.getString(2);
        email = getUserInfo.getString(3);
        scrumName = getUserInfo.getString(5);
        scrumId = getUserInfo.getInt(4);
        scrumStatus = getUserInfo.getString(4);
        teamaccess = getUserInfo.getString(7);
    }

    String scrumName_N = scrumName;
    sprintStatus = "";
    ResultSet getSprintDetails = sprintDetails.getSprintDetails(scrumId);
    while (getSprintDetails.next()) {
        sprintId = getSprintDetails.getInt(1);
        sprintName = getSprintDetails.getString(2);
        sprintStatus = getSprintDetails.getString(6);
        sprintDateFrom = getSprintDetails.getString(3);
        sprintDateTo = getSprintDetails.getString(4);
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link href="CSS/searchoptions.css" rel="stylesheet" type="text/css"/>
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

        <script src="JS/login.js"></script>
        <script src="JS/signup.js"></script>

        <link href="CSS/scrumadmin.css" rel="stylesheet" type="text/css"/>
        <script src="JS/sprintUpdateAjaxCall.js"></script>
        <script src="JS/scrumUpdateAjaxCall.js"></script>
        <script src="JS/updateUserAccess.js"></script>

        <link href="CSS/login.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/layout.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/menubanner.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/searchoptions.css" rel="stylesheet" type="text/css"/>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <title>SCRUM BOARD</title>
    </head>

    <body>
        <div id="left">
        </div>

        <div id="main">
            <%if (session.getAttribute("email") != null) {%>  
            <div id="header" class="adminheadersScrum">Scrum Details </div>
            <div id="scrumContainer" class="scrumContainer">

                <div class="spacer"><label><b>Scrumboard Name : </b></label><text class="DBoutput" id="scrumName"><% out.println(scrumName);%></text> -: <label id="scrumId"><% out.println(scrumId);%></label></div> <div class="spacer"><label><b>Status : </b></label> <text class="DBoutput">active</text><text class="DBoutput"><b>User ID :</b> </text><text class="DBoutput" id="userId"><% out.println(userId);%></text> </div>
                <input type="text" name="scrumName" autocomplete="off" required value="<% out.println(scrumName);%>" id="scrumNameinputVal" class="inputScrumVal" >
                <br>
                <%if (scrumName == "") {%>
                <button type="submit" class="createScrum">Create Scrum Board</button>
                <% } else {%>
                <button type="submit" class="UpdateScrum">Update Scrum Name</button>
                <button type="submit" class="closeScrum">Delete Scrum</button>
                <%}%>
            </div>
            <div id="header" class="adminheadersSprint"> Sprint Details</div>
            
             <%if (scrumName != "") {%>
            <div id="SprintContainer" class="SprintContainer">
                <div class="spacer"><label><b>Current Sprint : </b></label></b></label><text class="DBoutput" id="DBoutput"><% out.println(sprintName);%></text>-:<label id="sprintID"> <% out.println(sprintId);%></label></div>  <div class="spacer"><label><b>Status : </b></label> <text class="DBoutput"><% if (sprintId != 0){out.println(sprintStatus);}else{out.println("No active Sprints");}%></text></div>
                <input type="text" placeholder="sprintName" name="sprintName" autocomplete="off" required value="<% out.println(sprintName); %>" id="sprintName">
                <br> From: <input type="" value="<% out.println(sprintDateFrom);%>" class="datePicker" id="dateFrom" > 
                To:<input type=""  value="<% out.println(sprintDateTo);%>" class="datePicker" id="dateTo">
                <p>
                    <%if (sprintName == "") {%>
                    <button type="submit" class="createSprint">Create New Sprint</button>
                    <% } else {%>
                    <button type="submit" class="UpdateSprint">Update Sprint Details</button>
                    <button type="submit" class="closeSprint">Close Active Sprint</button></p>
                    <%}%>
            </div>
            <%}%>

            <div id="header" class="adminheadersTeam"><b>Team Details</b> </div>
            <div id="TeamContainer" class="teamContainer">
               <% if (teamaccess.equals("2")) {%>
                 <table id="TeamMembers">
                    <tr>
                        <td class="tableheader">ID</td><td class="tableheader">NAME</td><td class="tableheader" >EMAIL</td><td class="tableheader">STATUS</td>
                    </tr>
                    <%
                        ResultSet teamMembers = dao.teamMembers.teamMembers(scrumId);
                        while (teamMembers.next()) {
                            MemID = teamMembers.getInt(1);
                            memName = teamMembers.getString(2);
                            mememail = teamMembers.getString(4);
                            teamaccess = teamMembers.getString(7);
                    %>
                    <tr>
                        <td id="<% out.println(MemID);%>" class="tablespacing"><% out.println(MemID);%></td>
                        <td id="Name"class="tablespacing"><% out.println(memName);%></td>
                        <td id="email" class="tablespacing"><% out.println(mememail);%></td>
                        <td id="Status" class="tablespacing">
                            <% if (teamaccess.equals("0")) {%> 
                            <button type="submit" class="RequestToJoin">Requested to Join</button> 
                            <button id="removeTeamMember" class="removeTeamMember">Remove Team Member</button>
                            <% } else { %>
                            
                            <button id="removeTeamMember" class="removeTeamMember">Remove Team Member</button>
                            
                            <%}%>
                        </td>
                    </tr>
                    <%}%>
                </table>
               
                <%}%>
            </div>
            <% } else {%>
            <div id="scrumboardContainer">
                <h2><font face="verdana"><center>Sorry! <br>You need to signed in </center></font></h2>  
            </div>
            <%}%>
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
                        email = (String) session.getAttribute("email");
                        if (email != null) {%>
                    <a href="http://localhost:8080/SCRUM_V2/Scrumboard.jsp" class="linkbutton" >Scrum_Board</a> 
                    <a href='/SCRUM_V2/JSP/logout.jsp'class="linkbutton" >Log out</a>
                    <a href='/SCRUM_V2/UserAdmin.jsp' class="linkbutton" >Profile</a>               
                 
                    <a href="http://localhost:8080/SCRUM_V2/ScrumAdmin.jsp" class="linkbutton">Scrum Setup/Admin</a>
          
                     <%};%> 
                </div>
                               <% if (session.getAttribute("email") != null){ %>
            <div id="profile">
                <center>
                <img src="https://www.gravatar.com/avatar/<% MD5Util md5u = new MD5Util();
                    email = (String) session.getAttribute("email");
                    out.println(md5u.md5Hex(email)); %>?d=identicon&r=g" title="Default Avatar" alt="Default Avatar" width="60px" height="60px">
                <br>
                
                <% out.println(username);%>
                </center>
            </div>
            <%}%>
            </div>
        </div>

            <script>
                
               var email="user1@test.com";
          
            // this bloew code either CRUD details in a 
                $(".createScrum").click(function () {
                    var scrumId = document.getElementById("scrumId").innerHTML;
                    var scrumName = document.getElementById("scrumNameinputVal").value;
                    var userId = document.getElementById("userId").innerHTML;
                    scrumUpdate("1", scrumId, userId, scrumName, email);
                });
                
                $(".updateScrum").click(function () {
                    var scrumId = document.getElementById("scrumId").innerHTML;
                    var scrumName = document.getElementById("scrumNameinputVal").value;
                    var userId = document.getElementById("userId").innerHTML;
                    scrumUpdate("2", scrumId, userId, scrumName, email);
                });

                $(".closeScrum").click(function () {
                    var scrumId = document.getElementById("scrumId").innerHTML;
                    var scrumName = document.getElementById("scrumNameinputVal").value;
                    var userId = document.getElementById("userId").innerHTML;
                    if (confirm("Are you sure you want to close this Scrum Team?!") === true) {
                      scrumUpdate("3", scrumId, userId, scrumName, email);
                    }
                });

                $(".createSprint").click(function () {
                    var scrumId = document.getElementById("scrumId").innerHTML;
                    var sprintId = document.getElementById("sprintID").innerHTML;
                    var sprintName = document.getElementById("sprintName").value;
                    var startDate = document.getElementById("dateFrom").value;
                    var endDate = document.getElementById("dateTo").value;
                    updateSprintDetails(1, sprintId, sprintName, startDate, endDate, scrumId);
                });

                $(".UpdateSprint").click(function () {
                    var scrumId = document.getElementById("scrumId").innerHTML;
                    var sprintId = document.getElementById("sprintID").innerHTML;
                    var sprintName = document.getElementById("sprintName").value;
                    var startDate = document.getElementById("dateFrom").value;
                    var endDate = document.getElementById("dateTo").value;
                    updateSprintDetails(2, sprintId, sprintName, startDate, endDate, scrumId);
                });

                $(".closeSprint").click(function () {
                    var scrumId = document.getElementById("scrumId").innerHTML;
                    var sprintId = document.getElementById("sprintID").innerHTML;
                    var sprintName = document.getElementById("sprintName").value;
                    var startDate = document.getElementById("dateFrom").value;
                    var endDate = document.getElementById("dateTo").value;
                     if (confirm("Are you sure you want to close this sprint?") === true) {
                       updateSprintDetails(3, sprintId, sprintName, startDate, endDate, scrumId);
                   }
                });

                $(".removeTeamMember").click(function (e) {
                    var row = $(this).closest('td').parent()[0].sectionRowIndex + 1;
                    var UserId = $('#TeamMembers').find('tbody tr:nth-child(' + row + ') td:nth-child(1)').html();
                    var userName = $('#TeamMembers').find('tbody tr:nth-child(' + row + ') td:nth-child(2)').html();
                    var email = $('#TeamMembers').find('tbody tr:nth-child(' + row + ') td:nth-child(3)').html();
                     if (confirm("Are you sure you want remove this team member?!") === true) {
                    updateUserAccess(UserId, userName, 0);
                }
                });

                $(".RequestToJoin").click(function (e) {
                    var row = $(this).closest('td').parent()[0].sectionRowIndex + 1;
                    var UserId = $('#TeamMembers').find('tbody tr:nth-child(' + row + ') td:nth-child(1)').html();
                    var userName = $('#TeamMembers').find('tbody tr:nth-child(' + row + ') td:nth-child(2)').html();
                    var email = $('#TeamMembers').find('tbody tr:nth-child(' + row + ') td:nth-child(3)').html();
                    updateUserAccess(UserId, userName, 1);
                });

            </script>         
    </body>
</html>