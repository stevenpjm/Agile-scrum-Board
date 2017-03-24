
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
      <!-- <script src="JS/storyCard.js"></script> -->
        <script src="JS/existingStories.js"></script>
        <script src="JS/scrumboard.js"></script>
        <link href="CSS/layout.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/storycardnew.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/scrumboard.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/toolbar.css" rel="stylesheet" type="text/css"/>
    </head>


    <body>



        <div id="banner">

            <a href="http://localhost:8080/SCRUM_V2/index.jsp">Home Page</a>
            <a href="http://localhost:8080/SCRUM_V2/AddNew.html">add New</a>
            <a href="http://localhost:8080/SCRUM_V2/AllPost">All records</a>
            <a href="http://localhost:8080/SCRUM_V2/scrumboard.jsp">Scrum_Board</a>    


TEST TEST TEST

            <!-- grabs the scrumID-->

            <p>

        </div>
    </div>

    <div id="toolbar"> 
        <b><u>Tool Bar</u></b><br>
        <button onclick="existingstory()">Create Story</button>
        <output id="result"></output>
        <input type='file' onchange="readURL(this);" />
        <div class="div1">
            <ul><li><img id="blah" src="#" alt="your image" /></li></ul>
        </div>
        
        
        <script>
            $(".userprofilepic").draggable({ helper: 'clone'});
        </script>
        
          <div id="#user3profile" >
          <img src="pic/user3.png" class="userprofilepic" id="userprofile3" width="88" height="70">
            </div>
          

    </div>


    <div id="backlog">
        <b><u>Backlog </u></b><br>
    </div>

    <div id="active">
        <b><u>Active Stories </u></b><br>
    </div>

    
    
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
    
    
    <script>
        
       var txt3 = <%=myVar%>;
       var existingstories = $.parseJSON(txt3).employees;      
       existingstory(existingstories);
       newlayout(existingstories);
        
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

</body>
</html>


