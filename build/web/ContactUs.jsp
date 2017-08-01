<%@page import="java.util.Arrays"%>
<%@page import="dao.DataAccess"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
            <br><center>
                <img src="pic/contact_us.png" alt="Office" style="width:70%;height:228px;">
            </center>        
            <p>
            <h2><u>About Us</u></h2>  
            Agile Scrumboard is a web application designed to help scrum teams
            track sprints and stories. The tool is based around the life cycle of
            of a story this web application is still in a beta phase.         
            <h2><u>Contact Us</u></h2>       
            If you have any issue or requests, please wait until the email form has been created      
            <br>
            <h2><u>Terms and Conditions</u></h2>
            These terms and conditions govern your use of this website; by using this website, you accept these terms and conditions in full.   If you disagree with these terms and conditions or any part of these terms and conditions, you must not use this website.
            <ol>
                <li>Republish material from this website (including republication on another website)</li>
                <li>Sell, rent or sub-license material from this website</li>
                <li>Agile scrumboard may, at its discretion, remove any post or user that is deems unsuitable by posting unsuitble content or acting inappropriately to other Users or in general terms,
                    by using profanity, insults, racism or sexually explicit content.</li> 
                <li>Using this web application for marketing and solicitation of products or services is also prohibited. 
            </ol>    
            <br>
            Agile Scrumboard members who post content deemed unsuitable by Agile Scrumboard may have their access revoked at any time, without warning. Agile Scrumboard may, but is not obliged to monitor submissions on each scrum boards.
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
            </div>
        </div>
    </body>
</html>


