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

<html>
       <head>
        <%--  CSS  --%>
          <link href="/SCRUM_V2/CSS/login.css" rel="stylesheet" type="text/css"/>
        <link href="/SCRUM_V2/CSS/layout.css" rel="stylesheet" type="text/css"/>
        <link href="/SCRUM_V2/CSS/menubanner.css" rel="stylesheet" type="text/css"/>
        <link href="/SCRUM_V2/CSS/layout.css" rel="stylesheet" type="text/css"/>

       
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
                
        
          
            
        </div>

        <%
            String emailin = request.getParameter("email");
            String usernamein = request.getParameter("uname");
            String passwordin = request.getParameter("old_psw");
            String passwordrepeatin = request.getParameter("new-repeat");
            String teamNamein = request.getParameter("scrumTeamReq");
            int test = dao.userDetails.userDetails(emailin, usernamein, passwordin, passwordrepeatin, teamNamein);
        %>
        <div id="left">
        </div>

        <div id="main">
            <% if (test == 1) { %>
            <h2>You have updated your details!</h2> 
            <%} else { %>
            <h2>Your request could not be processed at this time!</h2> 
            <%  }%>
        </div>

        <div id="bottom">
        </div>

        <div id="right">
        </div>


    </body>
</html>


