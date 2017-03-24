<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit</title>
    </head>
    <body>
        <h1>Edit Story</h1>
        <div style="width: 900px; margin-left: auto; margin-right: auto">
                <c:forEach items="${getStoryById}" var="p">
                <form action="/SCRUM_V2/JSP/ManagerEditStory.jsp" method="post">
                    <input type="text" name="ID" value="${p.ID}">
                    Story name<br>
                    <input type="text" value="${p.storyname}" name="storyname" style="width: 200px"><br>
                    Story Notes :<br>
                    <input type="text" value="${p.storynotes}" name="storynotes" style="width: 200px"><br>
                    Story Bugs<br>
                     <input type="text" value="${p.storybug}" name="storybug" style="width: 200px"><br>
                     User 1 : 
                    <input type="text" value="${p.storyuser1}" name="storyuser1" style="width: 200px"><br>
                    User 1 : 
                    <input type="text" value="${p.storyuser1}" name="storyuser1" style="width: 200px"><br>
                    <br>
                    <input type="submit" value="Submit">
                </form>
            </c:forEach>

        </div>
    </body>
</html>