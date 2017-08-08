<%@page import="profile.MD5Util"%>
<%@page import="dao.sprintDetails"%>
<%@page import="dao.userDetails"%>
<%@page import="java.util.Arrays"%>
<%@page import="dao.DataAccess"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
    int sprintId = 0;
    String sprintName = "";
    String username = "";
    String email = "";
    String scrumName = "";
    int userID = 0;
    int scrumID = 0;
    String teamnote1 = "";
    String teamnote2 = "";
    String teamnote3 = "";
    String teamnote4 = "";
    String teamaccess = "";

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
            teamaccess = getScrumDetails.getString(getScrumDetails.getMetaData().getColumnName(8));
            if(teamaccess.equals("1") || teamaccess.equals("2")){
            scrumName = getScrumDetails.getString(getScrumDetails.getMetaData().getColumnName(3));
            teamnote1 = getScrumDetails.getString(getScrumDetails.getMetaData().getColumnName(4));
            teamnote2 = getScrumDetails.getString(getScrumDetails.getMetaData().getColumnName(5));
            teamnote3 = getScrumDetails.getString(getScrumDetails.getMetaData().getColumnName(6));
            teamnote4 = getScrumDetails.getString(getScrumDetails.getMetaData().getColumnName(7));
            }
            }

//*******************************************
//Get All Sprint details 
//*******************************************
        ResultSet getSprintDetails = sprintDetails.getSprintDetails(scrumID);
        while (getSprintDetails.next()) {
             if(teamaccess.equals("1") || teamaccess.equals("2") ){
            sprintName = getSprintDetails.getString(getSprintDetails.getMetaData().getColumnName(2));
            sprintId = getSprintDetails.getInt(getSprintDetails.getMetaData().getColumnName(1));
            }
        }
    }
%>

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
                     email = (String) session.getAttribute("email");
                    if (email != null) {%>
                <a href="http://localhost:8080/SCRUM_V2/Scrumboard.jsp" class="linkbutton" >Scrum_Board</a> 
                <a href='/SCRUM_V2/JSP/logout.jsp'class="linkbutton" >Log out</a>
                <a href='/SCRUM_V2/UserAdmin.jsp' class="linkbutton" >Profile</a>
                 
                    <a href="http://localhost:8080/SCRUM_V2/ScrumAdmin.jsp" class="linkbutton">Scrum Setup/Admin</a>
                
                
                <% } else { %>
                <button onclick="document.getElementById('signup').style.display = 'block'" style="width:auto;" class="linkbutton">Sign Up</button>
                <button onclick="document.getElementById('id01').style.display = 'block'" style="width:auto;" class="linkbutton">login</button>
                <%};%>      
            </div>
            <% if (session.getAttribute("email") != null){ %>
            <div id="profile">
                <img src="https://www.gravatar.com/avatar/<% MD5Util md5u = new MD5Util();
                    email = (String) session.getAttribute("email");
                    out.println(md5u.md5Hex(email)); %>?d=identicon&r=g" title="Default Avatar" alt="Default Avatar" width="60px" height="60px">
                <br>
                <% out.println(username);%>
            </div>
            <%}%>
            
            <div id="login">  
                <div id="id01" class="modal">
                    <form class="modal-content animate" action="/SCRUM_V2/JSP/login.jsp" method="post">
                        <div class="container">
                            <label><b>Email</b></label>
                            <input type="text" placeholder="Enter Email" name="email" required autocomplete="on">
                            <label><b>Password</b></label>
                            <input type="password" placeholder="Enter Password" name="pass" required>
                            <button type="submit">Login</button>
                            <input type="checkbox" checked="checked"> Remember me
                            <button type="button" onclick="document.getElementById('id01').style.display = 'none'" class="cancelbtn">Cancel</button>
                        </div>
                    </form>
                </div>
            </div>

            <div id="signup" class="modal">
                <span onclick="document.getElementById('signup').style.display = 'none'" class="close" title="Close Modal">×</span>
                <form  id="signup" class="modal-content animate" action="/SCRUM_V2/JSP/signup.jsp"  method="post" >
                    <div class="container">
                        <label><b>Email</b></label>
                        <input type="text" placeholder="Enter Email" name="email" id="email" autocomplete="off" placeholder="sophie@example.com"required>
                        <label><b>Full Name</b></label>
                        <input type="text" placeholder="Enter Email" name="username" autocomplete="off" id="username" required>
                        <label><b>Password</b></label>
                        <input type="password" placeholder="Enter Password" name="password" autocomplete="off" id="password" required>
                        <label><b>Repeat Password</b></label>
                        <input type="password" placeholder="Repeat Password" name="password-repeat"  autocomplete="off" id="password-repeat" required>
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
                function validatemail() {
                    var x = emailaddress.value;
                    var re = /^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$/i;
                   
                    if (re.test(x)) {
                       
                        emailaddress.setCustomValidity('');
                    } else {
                        
                        emailaddress.setCustomValidity("Invalid email address");
                        x = null;
                    }
                }
                emailaddress.onchange = validatemail;
                var password = document.getElementById("password");
                var confirm_password = document.getElementById("password-repeat");
                function validatePassword() {
                    if (password.value !== confirm_password.value) {
                        confirm_password.setCustomValidity("Passwords Don't Match");
                    } else {
                        confirm_password.setCustomValidity('');
                    }
                }

                password.onchange = validatePassword;
                confirm_password.onkeyup = validatePassword;
                function resetForm() {
                    document.getElementById('signup').style.display = 'none';
                    document.forms["signup"].reset();
                }
                ;
            </script>     
    </body>
</html>


