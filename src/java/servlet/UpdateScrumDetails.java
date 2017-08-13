    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;
import dao.DataAccess;
import dao.userDetails;
import db.DBUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author steven.masters
 */
@WebServlet(name = "updateScrumDetails", urlPatterns = {"/updateScrumDetails"})
public class UpdateScrumDetails extends HttpServlet {
    String updatedStatus="";


    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        Map<String, Object> map = new HashMap<String, Object>();
        boolean isValid = false;
        String email = request.getParameter("email");
        String newScrum = request.getParameter("newScrum");
        String scrumName = request.getParameter("scrumName");
        scrumName = scrumName.trim();
        String userId = request.getParameter("userId");
        userId = userId.trim();
        int userId_converted = Integer.parseInt(userId);
        String scrumId = request.getParameter("scrumId");
        scrumId = scrumId.trim();
        int scrumId_converted = Integer.parseInt(scrumId);
        
        if(userId_converted == 0){
             userId_converted = DataAccess.getUserIdByemail(email);
            
        }
        
        
        PreparedStatement ts;
        try{   
            if("1".equals(newScrum)){
                // This creates the scrum board
                ts = DBUtils.getPreparedStatment("INSERT INTO `scrumboards`.`scrumboard` (`userid`, `teamName`, `status`) VALUES (?, ?, 'active');");
                ts.setInt(1,userId_converted);
                ts.setString(2, scrumName);
                ts.executeUpdate();
                ts.close();
                scrumId_converted = DataAccess.getScrumIdOnly(userId_converted);
                DataAccess.giveAdminAccess(userId_converted, scrumId_converted);
                
         }else if("2".equals(newScrum)){
             // This updates the scrum board
                ts = DBUtils.getPreparedStatment("UPDATE `scrumboards`.`scrumboard` SET `teamName`= ? WHERE `scrumid`= ? AND userid = ?");
                ts.setString(1, scrumName);
                ts.setInt(2, scrumId_converted);
                ts.setInt(3,userId_converted); 
                ts.executeUpdate();
                ts.close();
                
         }else if("3".equals(newScrum)){
                // This closes the scrum board
                ts = DBUtils.getPreparedStatment("UPDATE `scrumboards`.`scrumboard` SET `teamName`= ? , status = 'closed' WHERE `scrumid`= ? AND userid = ?");
                ts.setString(1, scrumName);
                ts.setInt(2, scrumId_converted);
                ts.setInt(3,userId_converted); 
                ts.executeUpdate();
                ts.close();

        }     
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        updatedStatus = "updated";
        map.put("isValid", isValid);
        write(response, updatedStatus);

        }

// returns the value back to the orginating
    private void write(HttpServletResponse response, String updatedStatus) throws IOException {
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("Updated");
    }
}
