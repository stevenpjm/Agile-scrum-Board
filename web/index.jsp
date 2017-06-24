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
        <br>
        <img src="pic/office.jpg" alt="Office" style="width:100%;height:228px;">
        <p>
        Agile Scrumboard is a web application designed to help scrum teams<br>
        track sprints and stories. The tool is based around the life cycle of<br>
        
        track help scrum  
        
        Sprint
        Sprint Planning
        Daily Scrum
        Sprint Review
        Sprint Retrospective
        
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
            <a href="http://localhost:8080/SCRUM_V2/">Home Page</a>

            
            <a href="http://localhost:8080/SCRUM_V2/ContactUs.jsp">Contact Us</a>
            
            
            
            <% 
                  String userName = (String) session.getAttribute("userid");
               
                if (userName != null ){%>
                <a href="http://localhost:8080/SCRUM_V2/Scrumboard.jsp">Scrum_Board</a> 
                <a href='/SCRUM_V2/JSP/logout.jsp'>Log out</a>
                <a href='/SCRUM_V2/admin.jsp''>Profile</a>
            <% } else { %>
                  <button onclick="document.getElementById('signup').style.display='block'" style="width:auto;" class="linkbutton">Sign Up</button>
                   <button onclick="document.getElementById('id01').style.display='block'" style="width:auto;" class="linkbutton">login</button>
            
                <%};%>
             
        </div>

        <div id="login">
            
            <div id="id01" class="modal">

                <form class="modal-content animate" action="/SCRUM_V2/JSP/login.jsp" method="post">


                     <div class="container">
                        <label><b>Username</b></label>
                        <input type="text" placeholder="Enter Username" name="uname" required>

                        <label><b>Password</b></label>
                        <input type="password" placeholder="Enter Password" name="pass" required>

                        <button type="submit">Login</button>
                        <input type="checkbox" checked="checked"> Remember me
                        <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
                    </div>


                </form>
            </div>
     
        

        <div id="signup" class="modal">
          <span onclick="document.getElementById('signup').style.display='none'" class="close" title="Close Modal">×</span>
          <form class="modal-content animate" action="/action_page.php">
            <div class="container">
              <label><b>Email</b></label>
              <input type="text" placeholder="Enter Email" name="email" required>

              <label><b>Password</b></label>
              <input type="password" placeholder="Enter Password" name="psw" required>

              <label><b>Repeat Password</b></label>
              <input type="password" placeholder="Repeat Password" name="psw-repeat" required>
              <input type="checkbox" checked="checked"> Remember me
              <br>&nbsp;</br>
              
              By creating an account you agree to our
                  <br>&nbsp;</br>
                  <a href="terms.jsp">Terms & Privacy</a> <br>
                  <br>&nbsp;</br>
              <div class="clearfix">
                <button type="button" onclick="document.getElementById('signup').style.display='none'" class="linkbutton">Cancel</button>
                <button type="submit" class="linkbutton">Sign Up</button>
              </div>
            </div>
          </form>
        </div>
        
        
    
</body>
</html>


