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
        <img src="pic/index.jpg" alt="Office" style="width:100%;height:228px;">
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
            <a href="http://localhost:8080/SCRUM_V2/" class="linkbutton" >Home Page</a>

            
            <a href="http://localhost:8080/SCRUM_V2/ContactUs.jsp" class="linkbutton" >Contact Us</a>
            
            
            
            <% 
                  String userName = (String) session.getAttribute("userid");
               
                if (userName != null ){%>
                <a href="http://localhost:8080/SCRUM_V2/Scrumboard.jsp" class="linkbutton" >Scrum_Board</a> 
                <a href='/SCRUM_V2/JSP/logout.jsp'class="linkbutton" >Log out</a>
                <a href='/SCRUM_V2/admin.jsp' class="linkbutton" >Profile</a>
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
          
          <form  id="signup" class="modal-content animate" action="/SCRUM_V2/JSP/signup.jsp"  method="post">
            <div class="container">
              <label><b>Email</b></label>
              <input type="text" placeholder="Enter Email" name="email" id="email" placeholder="sophie@example.com"required>
              
              <label><b>Full Name</b></label>
              <input type="text" placeholder="Enter Email" name="username" id="username" required>
              
              <label><b>Password</b></label>
              <input type="password" placeholder="Enter Password" name="password" id="password" required>

              <label><b>Repeat Password</b></label>
              <input type="password" placeholder="Repeat Password" name="password-repeat" id="password-repeat" required>
              <input type="checkbox" checked="checked"> Remember me
              <br>&nbsp;</br>
              
              By creating an account you agree to our terms and conditions
                  <br>&nbsp;</br>
                  <a href="ContactUs.jsp">Terms / Privacy / About </a> <br>
                  <br>&nbsp;</br>
              <div class="clearfix">
                <button type="button" onclick="resetForm()" class="linkbutton">Cancel</button>
                <button type="submit" class="linkbutton">Sign Up</button>
              </div>
            </div>
          </form>
        </div>
        
            <script>
                
                
                
                   var emailaddress = document.getElementById("email");
           
            function validatemail(){
           
                var x = document.forms["signup"]["email"].value;
                var atpos = x.indexOf("@");
                var dotpos = x.lastIndexOf(".");
             
             
                if (atpos<1 || dotpos<atpos+2 || dotpos+1>= x.length) {
                  
                    emailaddress.setCustomValidity("Invalid email address");
                    
                    
                }
            }
            emailaddress.onchange = validatemail;
                
                
                var password = document.getElementById("password");
                var confirm_password = document.getElementById("password-repeat");

              function validatePassword(){
         
                if(password.value !== confirm_password.value) {
                  confirm_password.setCustomValidity("Passwords Don't Match");
                  
                } else {
                  confirm_password.setCustomValidity('');
                 
                }
              }

              password.onchange = validatePassword;
              confirm_password.onkeyup = validatePassword;
             
              
              function resetForm() {
                 document.getElementById('signup').style.display='none';
                 document.forms["signup"].reset();
           
                };
            
            
         
            
            </script> 
    
</body>
</html>


