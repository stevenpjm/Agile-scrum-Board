<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="profile.MD5Util"%>
<%@page import="dao.*"%>
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>


<html>
    <head>
        
  
        <link href="/SCRUM_V2/CSS/login.css" rel="stylesheet" type="text/css"/>
        <link href="/SCRUM_V2/CSS/layout.css" rel="stylesheet" type="text/css"/>
        <link href="/SCRUM_V2/CSS/menubanner.css" rel="stylesheet" type="text/css"/>
        <link href="/SCRUM_V2/CSS/layout.css" rel="stylesheet" type="text/css"/>
     
        <title>SCRUM BOARD</title>
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
                String password_new = request.getParameter("new-repeat");
                String teamNamein = request.getParameter("scrumTeamReq");
                
                String test = new userDetails(emailin, usernamein, passwordin, password_new, teamNamein) ;
               
   %>
    <div id="left">

    </div>

        
    <div id="main">
        <% %>
        <h2>You have updated your details!</h2> 
        
        <h2>Your request could not be processed at this time!</h2> 
        
    </div>

    <div id="bottom">
        
    </div>

    <div id="right">
      
    </div>


</body>
</html>


