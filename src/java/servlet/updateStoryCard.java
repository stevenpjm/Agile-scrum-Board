package servlet;

/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
 */
import dao.DataAccess;
import db.DBUtils;
import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet(name = "scrumTeamReq", urlPatterns = {"/scrumTeamReq"})

/**
 *
 * @author steven.masters
 */
public class updateStoryCard extends HttpServlet {

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
            
        String storyid = request.getParameter("storyid");
        String storyname = request.getParameter("storyname");
        
        String lastupdate = request.getParameter("lastupdate");
        
        String storynoteid = request.getParameter("storynoteid");
        String storynote = request.getParameter("torynote");
        
        String user1Task = request.getParameter("user1Task");
        String user1 = request.getParameter("user1");
        String user2Task = request.getParameter("user2Task");
        String user2 = request.getParameter("user2");
        String user3Task = request.getParameter("user3Task");
        String user3 = request.getParameter("user3");
        String storybug = request.getParameter("storybug");
        String swarm = request.getParameter("swarm");
        String columstatus = request.getParameter("columstatus");
        
        String sprintid = request.getParameter("sprintid");
        
        // control the insert to the new insert here if this is a new note.  
        
        
        try {
            
            
                
           DBUtils.getPreparedStatment("UPDATE `scrumboards`.`storycards` SET `storyname`="+ storyname +", `lastupdate`="+lastupdate+"`user1Task`="+user1Task+", `user2Task`="+user2Task+", `user3Task`="+user3Task+", `user1`="+user1+",`user2`="+user2+", , `user3`="+user3+", `storybug`="+storybug+", `swarm`="+swarm+", `columstatus`="+columstatus+" WHERE `storyid`="+ storyid +", `scrumid`="+ storyid +", `sprintid`="+ sprintid +";").executeQuery();     

            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }

 

   }

// returns the value back to the orginating
    private void write(HttpServletResponse response, String scrumOptionAll) throws IOException {

    }

}
