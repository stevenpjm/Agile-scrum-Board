<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="profile.MD5Util"%>
<%@page import="dao.LastStoryID"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="dao.DataAccess"%>

<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : AllPost
    Created on : Feb 1, 2017, 2:11:57 PM
    Author     : steven.masters
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
    <head>
        <%--  CSS  --%>
        <link href="CSS/storycard.css" rel="stylesheet" type="text/css"/> 
        <link href="CSS/scrumboard.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/menubanner.css" rel="stylesheet" type="text/css"/>
        
        <%--  Javscripts files  --%>
        <script src="JS/storyCard.js"></script>
        <%--<script src="JS/scrumboard.js"></script> --%>
        <script src="JS/existingStories.js"></script>
        <script src="JS/dragDropEvent.js"></script>
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
                <a href="http://localhost:8080/SCRUM_V2/index.jsp"  >Home Page</a>
                <a href="http://localhost:8080/SCRUM_V2/scrumboard.jsp">Contact Us</a>
                 <% if (session.getAttribute("userid") != null)
                {        
                %>
                <a href='/SCRUM_V2/JSP/logout.jsp' id="logoutlink">Log out</a>
                 <a href='/SCRUM_V2/admin.jsp'id="adminlink">Profile</a>
                <% }
                %>
            </div>
           
            
            <div id="profile">
                <img src="https://www.gravatar.com/avatar/<% MD5Util md5u = new MD5Util(); out.println(md5u.md5Hex("test23@email.com")); %>?d=identicon&r=g" title="Default Avatar" alt="Default Avatar" width="60px" height="60px">
                <br>
                <% out.println(session.getAttribute("userid"));%>
            </div>

            <!-- grabs the scrumID-->

            


            <%
                Integer id = 1;

                String scrumName = "";
                
                String userName = (String) session.getAttribute("userid");
                DataAccess da = new DataAccess();

                ResultSet rs = da.getscrumid(userName);

                while (rs.next()) {
                    scrumName = rs.getString(rs.getMetaData().getColumnName(3));
                }

                out.println(scrumName);

                //int num = da.getLastStoryID();   

            %>
           
       </div>
    </div>
      <% if (session.getAttribute("userid") != null)
        
    {
        
   %>
    <div id="scrumboardContainer">
    <div id="toolbar"> 

     
        
        <div id="teamNotes">
            <div id="teamNotesheader">
                <center>Team Notes</center>
            </div>
            <div class='label'>1: <input type="text" class="teamnotesinput" value="" /></div>
            <div class='label'>2: <input type="text" class="teamnotesinput" value="" /></div>
            <div class='label'>3: <input type="text" class="teamnotesinput" value="" /></div>
            <div class='label'>4: <input type="text" class="teamnotesinput" value="" /></div>
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
             <button onclick="newlayout()">+ Create Story</button>
             
        </div>
        
        <div id="team">
            <div id="teamHeader"><center>Team Members</center></div> 
        <%-- This adds the team profile pic to the web app --%>
        <script>
            $(".userprofilepic").draggable({helper: 'clone'});
        </script>
        <%
            ResultSet userDetails = dao.DataAccess.getUserDetails();
            while(userDetails.next()) {
                %>
                <div id="userFrame"> 
                    <div data-id="<% out.println(userDetails.getString("userid")); %>" class="teamProfilePics" >
                        <img src="https://www.gravatar.com/avatar/<% MD5Util md5u2 = new MD5Util(); out.println(md5u2.md5Hex(userDetails.getString("email"))); %>?d=identicon&r=g" id="<% out.println(userDetails.getString("userid")); %>" draggable="true" ondragstart="drag(event)" width="70" height="70">
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
   

    <div id="complete" ondrop="drop(event)" ondragover="allowDrop(event)">
        <h3 id = "completeHeader"><center>Complete</center></h3>
    </div>
        
     <div id="active" ondrop="drop(event)" ondragover="allowDrop(event)">
        <h3 id = "activeheader"><center>Active</center></h3>
    </div>
        
     <div id="backlog" ondrop="drop(event)" ondragover="allowDrop(event)">
        <h3 id = "backlogheader"><center>Backlog</center></h3>
    </div>
</div>

    <%        StringBuilder sb = new StringBuilder();
        sb.append("'{\"employees\":['+");
        //DataAccess da = new DataAccess();
        ResultSet ls = da.getAll();

        ResultSetMetaData rsmd = ls.getMetaData();
        int columnCount = rsmd.getColumnCount();
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

        String test1 = sb.toString();

        String myVar = test1;

    %>


    <script>
        


   
// this counts the amount of storycards in each column

   

    
        var txt3 = <%=myVar%>;
        var existingstories = $.parseJSON(txt3).employees;
        storyCard(existingstories);


        $('#sprint tr #date').each(function () {
            var rowDate = $(this).html();
            console.log(rowDate);

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
        
  
    
    


    
    
    
    </script>

    
    <% } else { %>
    <div id="scrumboardContainer">
    Please sign in
    </div>


    <%}%>

    </body>
</html>


