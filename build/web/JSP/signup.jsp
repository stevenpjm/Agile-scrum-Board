<%@page import="java.lang.String"%>
<%@page import="java.util.Arrays"%>
<%@page import="dao.signup"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  
        <link href="CSS/login.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/layout.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/menubanner.css" rel="stylesheet" type="text/css"/>
     
        <title>SCRUM BOARD</title>
      </head>

            
<body>

    <%
                String email = request.getParameter("email"); 
                String username = request.getParameter("username");    
                String password = request.getParameter("password");
                
                signup SU = new signup(email,  username, password);
               
   %>
    <div id="left">

    </div>

        
    <div id="main">
        You have created a sign in, please revert back to the home page and sign in!
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
        </div>
    </div>

  
     
        

        
        
        
    
</body>
</html>


