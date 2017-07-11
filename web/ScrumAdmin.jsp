<html>
    <head>

        <script src="JS/login.js"></script>
        <script src="JS/signup.js"></script>
        <link href="CSS/login.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/layout.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/menubanner.css" rel="stylesheet" type="text/css"/>
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        
        <title>SCRUM BOARD</title>
      </head>

            
<body>


    <div id="left">

    </div>


    <div id="main">
        
        <form action="Update" style="border:1px solid #ccc">
            <div class="container">
              
              <label><b>Scrum Name</b></label>
              <input type="text" placeholder="First Name" name="fname" required>
              
              <label><b>Team</b></label>
          
    <table>
        <thead>
            <tr>
                <th>Student ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Course</th>
                <th>Year</th>
                <th colspan="2">Action</th>
            </tr>
        </thead>
        <tbody>
                    <c:forEach items="${students}" var="student">
                        <tr>
                            <td><c:out value="${student.Id}" /></td>
                            <td><c:out value="${student.username}" /></td>
                            <td><c:out value="${student.request}" /></td>
                            <td><c:out value="${student.course}" /></td>
                            <td><c:out value="${student.year}" /></td>
                            <td><a
                                href="StudentController.do?action=edit&studentId=<c:out value="${student.studentId }"/>">Update</a></td>
                            <td><a
                                href="StudentController.do?action=delete&studentId=<c:out value="${student.studentId }"/>">Delete</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <p>
                <a href="StudentController.do?action=insert">Add Student</a>
            </p>

              
              <div class="clearfix">
                
                <button type="submit" class="update">Update Profile</button>
                <button type="delete" class="cancelbtn">Delete Profile</button>
              </div>
            </div>
          </form>
        
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
            <a href="http://localhost:8080/SCRUM_V2/">Home Page</a>

            
            <a href="http://localhost:8080/SCRUM_V2/ContactUs.jsp">Contact Us</a>
            
            
            
            <% 
                  String userName = (String) session.getAttribute("userid");
                if (userName != null ){%>
                <a href="http://localhost:8080/SCRUM_V2/Scrumboard.jsp">Scrum_Board</a> 
                <a href='/SCRUM_V2/JSP/logout.jsp'>Log out</a>
                
            <% } else { %>
                  <button onclick="document.getElementById('signup').style.display='block'" style="width:auto;" class="linkbutton">Sign Up</button>
                   <button onclick="document.getElementById('id01').style.display='block'" style="width:auto;" class="linkbutton">login</button>
            
                <%};%>
             
        </div>
    </div>
                
    </body>
    
    </html>