<%-- 
Document   : logout
Created on : Feb 16, 2017, 12:41:01 PM
Author     : steven.masters
--%>


<%
    session.setAttribute("userid", null);
    session.invalidate();
    response.sendRedirect("/SCRUM_V2/");
%>

