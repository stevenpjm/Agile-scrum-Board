<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>

        <link href="CSS/layout.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/menubanner.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/signup.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>



        <div id="left">

        </div>


        <div id="main">
            <form action="/action_page.php" style="border:1px solid #ccc">
                <div class="container">
                    <label><b>Scrum Name</b></label>
                    <input type="text" placeholder="Enter Email" name="email" required>

                    <label><b>Password</b></label>
                    <input type="password" placeholder="Enter Password" name="psw" required>

                    <label><b>Repeat Password</b></label>
                    <input type="password" placeholder="Repeat Password" name="psw-repeat" required>
                    <input type="checkbox" checked="checked"> Remember me
                    <p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>

                    <div class="clearfix">
                        <button action= "http://localhost:8080/SCRUM_V2/" type="button" class="cancelbtn">Cancel</button>
                        <button type="submit" class="signupbtn">Sign Up</button>
                    </div>
                </div>
            </form>   
        </div>

        <div id="bottom">

        </div>

        <div id="right">
            test right 
        </div>

        <div id="top">

            <div id="links"> 
                <a href="http://localhost:8080/SCRUM_V2/">Home Page</a>

                <a href="http://localhost:8080/SCRUM_V2/Registration.jsp">Registration</a>
                <a href="http://localhost:8080/SCRUM_V2/ContactUs.jsp">Contact Us</a>
                <a href="http://localhost:8080/SCRUM_V2/Scrumboard.jsp">Demo</a>

            </div> 
        </div>


    </body>



</html>