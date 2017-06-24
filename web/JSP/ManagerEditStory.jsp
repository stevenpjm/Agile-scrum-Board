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
        <title>Edit Page</title>
    </head>
    <body>
        <%
            String idTemp = request.getParameter("ID");
            int ID = Integer.parseInt(idTemp);
            String storyname = request.getParameter("storyname");
            String storynotes = request.getParameter("storynotes");
            String storybug = request.getParameter("storybug");
            String storyuser1 = request.getParameter("storyuser1");
            String storyuser2 = request.getParameter("storyuser2");
            
            DataAccess da = new DataAccess();
            
            da.edit(ID, storyname);
            
            response.sendRedirect("/CRUD_TEMP2/AllPost");
        %>
    </body>
</html>
