    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;
import dao.DataAccess;
import db.DBUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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
@WebServlet(name = "UpdateSprintDetails", urlPatterns = {"/UpdateSprintDetails"})
public class UpdateSprintDetails extends HttpServlet {
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

        String newSprint = request.getParameter("SprintBlock");
        String sprintID_input = request.getParameter("sprintId");
        String sprintName = request.getParameter("sprintName");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String scrumID = request.getParameter("scrumID");
        sprintID_input = sprintID_input.trim();
        int sprintID_converted = Integer.parseInt(sprintID_input);
        scrumID=scrumID.trim();
        int scrumID_converted = Integer.parseInt(scrumID);

        PreparedStatement ts;
        try{   
            if(!"1".equals(newSprint)){
                ts = DBUtils.getPreparedStatment("UPDATE `scrumboards`.`sprints` SET `sprintname`=?, `startdate`=?, `enddate`=?, `scrumid`=? WHERE `sprintid`=? and status = 'active';");
                ts.setString(1, sprintName);
                ts.setString(2, startDate);
                ts.setString(3, endDate);
                ts.setInt(4, scrumID_converted);
                ts.setInt(5, sprintID_converted);
                ts.executeUpdate();
                ts.close();
         }else{
        
                ts = DBUtils.getPreparedStatment("INSERT INTO `scrumboards`.`sprints` (`sprintname`, `startdate`, `enddate`, `scrumid`, `status`) VALUES (?, ?, ?, ?, ?);");
                ts.setString(1, sprintName);
                ts.setString(2, startDate);
                ts.setString(3, endDate);
                ts.setInt(4, sprintID_converted);
                ts.setString(5, "active");
                ts.executeUpdate();
                ts.close();
        }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }


        }

    

// returns the value back to the orginating
    private void write(HttpServletResponse response, String updatedStatus) throws IOException {
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("Updated");
    }
}
