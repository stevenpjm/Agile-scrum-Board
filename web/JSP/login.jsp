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
        <script src="/SCRUM_V2/JS/login.js"></script>
        <script src="/SCRUM_V2/JS/signup.js"></script>
        <link href="/SCRUM_V2/CSS/login.css" rel="stylesheet" type="text/css"/>
        <link href="/SCRUM_V2/CSS/layout.css" rel="stylesheet" type="text/css"/>
        <link href="/SCRUM_V2/CSS/menubanner.css" rel="stylesheet" type="text/css"/>
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <title>SCRUM BOARD</title>
    </head>

    <body>
        <%@ page import ="java.sql.*" %>
        <%
            String email = request.getParameter("email");
            String pwd = request.getParameter("pass");
            
      
            ResultSet rs = dao.signIn.signIn(email, pwd);
            if (rs.next()) {
                session.setAttribute("email", email);
                response.sendRedirect("/SCRUM_V2/index.jsp");
            } else {
        %>

        <div id="left">

        </div>

        <div id="main">
            <h2> Invalid details entered</h2>
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

        <div id="main">

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

        <%}%>

    </body>
</html>
