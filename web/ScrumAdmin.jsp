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
    int teamaccess = 0;

    int sprintId = 0;
    String sprintName = "";
    String username = "";
    String email = "";
    String scrumName = "";
    int userID = 0;
    int scrumID = 0;
    String scrumStatus = "";

    String userName1 = (String) session.getAttribute("email");
    ResultSet getUserInfo = userDetails.userDetails(userName1);

    while (getUserInfo.next()) {
        userID = getUserInfo.getInt(1);
        username = getUserInfo.getString(2);
        email = getUserInfo.getString(3);
        scrumName = getUserInfo.getString(5);
        scrumID = getUserInfo.getInt(4);

    }

    String sprintStatus = "";
    String sprintDateFrom = "";
    String sprintDateTo = "";
    ResultSet getSprintDetails = sprintDetails.getSprintDetails(scrumID);
    while (getSprintDetails.next()) {
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
        <script src="JS/login.js"></script>
        <script src="JS/signup.js"></script>
        <link href="CSS/scrumadmin.css" rel="stylesheet" type="text/css"/>
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
            <div id="header" class="adminheadersScrum">Scrum Details </div>
            <div id="scrumContainer" class="scrumContainer">

                <div class="spacer"><label><b>Scrumboard Name : </b></label><% out.println(scrumName);%></div> <div class="spacer"><label><b>Status : </b></label> <label>active</label></div>
                <input type="text" name="scrumName" autocomplete="off" required value="<% out.println(scrumName);%>" id="scrumName" class="inputScrumVal" readonly>
                <br>
                <button type="submit" class="createScrum">Create Scrum Board</button>
                <button type="submit" class="UpdateScrum">Update Scrum Name</button>
                <button type="submit" class="closeScrum">Delete Scrum</button>
            </div>
            <div id="header" class="adminheadersSprint"> Sprint Details</div>
            <div id="SprintContainer" class="SprintContainer">
                <div class="spacer"><label><b>Current Sprint : </b></label></b></label><% out.println(sprintName);%></div> <div class="spacer"><label><b>Status : </b></label> <label id="sprintstatus"> <% out.println(sprintStatus);%></label></div>
                <input type="text" placeholder="Username" name="uname" autocomplete="off" required value="<% out.println(sprintName); %>" id="username">
                <br> From: <input type="date" data-date="" data-date-format="YY MM DD" value="<% out.println(sprintDateFrom);%>">
                To:<input type="date" data-date="" data-date-format="YY MM DD" value="<% out.println(sprintDateTo);%>">
                <p><button type="submit" class="create">Create New Sprint</button>
                    <button type="submit" class="create">Update Sprint Details</button>
                    <button type="submit" class="closeSprint">Close Active Sprint</button></p>
            </div>

            <div id="header" class="adminheadersTeam">Team Details </div>
            <div id="TeamContainer" class="teamContainer">

                <label><b>Scrum Team</b></label>
                <table>
                    <tr>
                        <td>ID</td><td>Name</td><td>email</td><td>status</td>
                    </tr>
                    <%    ResultSet teamMembers = dao.teamMembers.teamMembers(scrumID);
                        while (teamMembers.next()) {
                            MemID = teamMembers.getInt(1);
                            memName = teamMembers.getString(2);
                            mememail = teamMembers.getString(4);
                            teamaccess = teamMembers.getInt(7);

                    %>
                    <tr>
                        <td><% out.println(MemID);%></td>
                        <td><% out.println(memName);%></td>
                        <td><% out.println(email);%></td>
                        <td><% if (teamaccess == 1) {%> 
                            <button onclick="myFunction()">Request to Join</button> 
                            <% } else { %>
                            <button onclick="myFunction()">Remove Team Member</button>
                            <%};%>
                        </td>

                    </tr>
                    <%}%>


                </table>
            </div>
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
                    if (userName != null) { %>
                <a href="http://localhost:8080/SCRUM_V2/Scrumboard.jsp" class="linkbutton" >Scrum_Board</a> 
                <a href='/SCRUM_V2/JSP/logout.jsp'class="linkbutton" >Log out</a>
                <a href='/SCRUM_V2/UserAdmin.jsp' class="linkbutton" >Profile</a>
                <% } else { %>
                <button onclick="document.getElementById('signup').style.display = 'block'" style="width:auto;" class="linkbutton">Sign Up</button>
                <button onclick="document.getElementById('id01').style.display = 'block'" style="width:auto;" class="linkbutton">login</button>
                <%};%>
            </div>
        </div>
    </body>
</html>