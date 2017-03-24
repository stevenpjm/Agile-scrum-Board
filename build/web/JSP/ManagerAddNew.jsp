<%-- 
    Document   : ManagerAddNew
    Created on : Feb 1, 2017, 1:37:39 PM
    Author     : steven.masters
--%>

<%@page import="dao.DataAccess"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Scrumboard.Story"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Story</title>
    </head>
    <body>
        <%

            String storyname = request.getParameter("storyname");
            String storynotes = request.getParameter("storynotes");
            int storybug = request.getParameter("storybug");
            String createdate = request.getParameter("createdate");
            
            Story s = new Story (0 ,storyname, storynotes, storybug, createdate);
            
            DataAccess da = new DataAccess();
            da.addNew(s);
            
            response.sendRedirect("/CRUD_TEMP2/AllPost");
        %>
    </body>
</html>
