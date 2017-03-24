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
       
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <link href="CSS/login.css" rel="stylesheet" type="text/css"/>
    <link href="CSS/layout.css" rel="stylesheet" type="text/css"/>


 <script src="JS/existingStories.js"/></script>
    <title>SCRUM BOARD</title>
</head>

            
<body>


    <div id="left">




    </div>


    <div id="main">
              
               
        
    <button onclick="oldstory()">Create Story</button>      
    
    <p id="demo"></p>


<% 
                
                StringBuilder sb = new StringBuilder();
                sb.append("'{\"employees\":['+"); 
                DataAccess da = new DataAccess();
                ResultSet ls = da.getAll();

                ResultSetMetaData rsmd = ls.getMetaData();
                int columnCount = rsmd.getColumnCount();
                boolean lastRow;

                while (ls.next()) {
                    for (int i = 1; i <= columnCount; i++) {
                        if (i == 1) sb.append("'{");
                        if (i > 1) sb.append(",");
                        
                        String columnValue = ls.getString(i);
                        sb.append("\"" + rsmd.getColumnName(i) + "\":\"" + columnValue + "\"");
                    }
                    lastRow = ls.isLast();
                    if (lastRow == false) sb.append("},' + ");
                }
                sb.append("}]}';");
       
                String test1 = sb.toString();
                
                String myVar=test1;
         
%>



    </div>

    <div id="bottom">

    </div>

    <div id="right">
        test right 
    </div>

    <div id="top">

        <div id="links"> 
            <a href="http://localhost:8080/SCRUM_V2/">Home Page</a>
            <a href="http://localhost:8080/SCRUM_V2/AddNew.html">add New</a>
            <a href="http://localhost:8080/SCRUM_V2/AllPost.jsp">All records</a>
            <a href="http://localhost:8080/SCRUM_V2/scrumboard.jsp">Scrum_Board</a>
            <a href="http://localhost:8080/SCRUM_V2/">Scrum_Board</a>
            <p>
                <b><a href="http://localhost:8080/SCRUM_V2/test.jsp">Scrum_Board</a></b>
            </p>
        </div>

        <div id="login">
            <button onclick="document.getElementById('id01').style.display = 'block'" style="width:auto;">Login</button>

            <div id="id01" class="modal">

                <form class="modal-content animate" action="/SCRUM_V2/JSP/login.jsp">


                    <div class="container">
                        <label><b>Username</b></label>
                        <input type="text" placeholder="Enter Username" name="uname" required>

                        <label><b>Password</b></label>
                        <input type="password" placeholder="Enter Password" name="pass" required>

                        <button type="submit">Login</button>
                        <input type="checkbox" checked="checked"> Remember me
                    </div>


                </form>
            </div>
        </div>
        
        
    
</body>
</html>


