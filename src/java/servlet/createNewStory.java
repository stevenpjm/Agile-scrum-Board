 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;
import dao.DataAccess;
import dao.storyNoteUpdate;
import db.DBUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
@WebServlet(name = "createNewStory", urlPatterns = {"/createNewStory"})
public class createNewStory extends HttpServlet {
    
    Calendar cal = Calendar.getInstance();
    SimpleDateFormat lastmod = new SimpleDateFormat("yyyy-MM-dd");
    String lastmodConvert = lastmod.format(cal.getTime());
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
        
        
        String sprintID_input = request.getParameter("sprintID");
        int sprintID_converted = Integer.parseInt(sprintID_input);
        
        String userID = request.getParameter("userID");
        int userID_converted = Integer.parseInt(userID);
        
        String scrumID = request.getParameter("scrumID");
        int scrumID_converted = Integer.parseInt(scrumID);
        
        int storyID_converted = 0;
        String storyNote = "";
      
        
        
        
        dao.storyNoteUpdate check = new storyNoteUpdate(storyID_converted, storyNote, userID_converted);
           
        PreparedStatement ts;
        try {
            ts = DBUtils.getPreparedStatment("INSERT INTO scrumboards.storycards (userid, scrumid, sprintid, storynoteid, datecreated, lastupdate) VALUES ( ?, ?, ?, ?, ?, ?);");
            ts.setInt(1, userID_converted);
            ts.setInt(2, scrumID_converted);
            ts.setInt(3, sprintID_converted);
            ts.setInt(4, 1);
            ts.setString(5, lastmodConvert);
            ts.setString(6, lastmodConvert);
            ts.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
    
            
       

        }


}
