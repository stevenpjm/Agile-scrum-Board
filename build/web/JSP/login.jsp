<%-- 
    Document   : login.jsp
    Created on : Feb 16, 2017, 12:18:24 PM
    Author     : steven.masters
--%>

<%@page import="db.DBUtils"%>
<%@page import="dao.DataAccess"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ page import ="java.sql.*" %>
            <%
                String email = request.getParameter("email");    
                String pwd = request.getParameter("pass");
                ResultSet rs;
                rs = DBUtils.getPreparedStatment("select * from users where email='" + email + "' and password='" + pwd + "'").executeQuery();
                if (rs.next()) {
                    session.setAttribute("email", email);
                    response.sendRedirect("/SCRUM_V2/Scrumboard.jsp");   
                } else {
                    %>
                 
        <% 
            
            response.sendRedirect("/SCRUM_V2/index.jsp");}
%>  
    </body>
</html>
