
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Scrumboard.scrumboard"%>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
        <link  href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/jquery-ui.min.js"></script>
        <link href="CSS/storycard.css" rel="stylesheet" type="text/css">


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>All post</title>
        <script src="JS/storyCard.js"></script>
        <script src="JS/scrumboard.js"></script>
        <link href="CSS/layout.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/storycard.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/scrumboard.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/toolbar.css" rel="stylesheet" type="text/css"/>
    </head>


    <body>



        <div id="banner">

            <a href="http://localhost:8080/SCRUM_V2/index.jsp">Home Page</a>
            <a href="http://localhost:8080/SCRUM_V2/AddNew.html">add New</a>
            <a href="http://localhost:8080/SCRUM_V2/AllPost">All records</a>
            <a href="http://localhost:8080/SCRUM_V2/scrumboard.jsp">Scrum_Board</a>    




            <!-- grabs the scrumID-->

            <%
                if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
            %>
            You are not logged in<br/>
            <a href="/SCRUM_V2/index.jsp">Please Login</a>
            <%} else {
            %>
            <%=session.getAttribute("userid")%>
            <a href='JSP/logout.jsp'>Log out</a>


            <%
                Integer id = 0;
                
                String scrumName = "";
      
                String userName = (String) session.getAttribute("userid");
                DataAccess da = new DataAccess();

                ResultSet rs=da.getscrumid(userName);

                while (rs.next()){
                    scrumName = rs.getString(rs.getMetaData().getColumnName(3));
                }

                out.println(scrumName);
           %>
            <p>

        </div>
    </div>



    <% if (scrumName != "")
        
    {
        
   %>
    <div id="toolbar"> 
        <b><u>Tool Bar</u></b><br>
        <button onclick="createStory()">Create Story</button>
        <output id="result"></output>
        <input type='file' onchange="readURL(this);" />
        <div class="div1">
            <ul><li><img id="blah" src="#" alt="your image" /></li></ul>
        </div>

        <div id="team">

        </div>

    </div>


    <div id="backlog">
        <b><u>Backlog </u></b><br>
    </div>

    <div id="active">
        <b><u>Active Stories </u></b><br>
    </div>

    <%} else {%>
    You are not assigned to a team



    <%}%>



    <script>
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
    </script>
    <%
        }
    %>
</body>
</html>


