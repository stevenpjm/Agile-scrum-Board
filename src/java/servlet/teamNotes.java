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
@WebServlet(name = "teamNotes", urlPatterns = {"/teamNotes"})
public class teamNotes extends HttpServlet {
    
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
        
        String teamnoteInput1 = request.getParameter("teamNote1");
        String teamnoteInput2 = request.getParameter("teamNote2");
        String teamnoteInput3 = request.getParameter("teamNote3");
        String teamnoteInput4 = request.getParameter("teamNote4");
        String scrumID =request.getParameter("scrumID");
        int scrumid_converted = Integer.parseInt(scrumID);

        PreparedStatement ts;
        
        try{   
            ts = DBUtils.getPreparedStatment("UPDATE scrumboards.scrumboard SET teamnote1= ?, teamnote2= ?, teamnote3= ?, teamnote4= ? WHERE scrumid= ?;");
            ts.setString(1, teamnoteInput1);
            ts.setString(2, teamnoteInput2);
            ts.setString(3, teamnoteInput3);
            ts.setString(4, teamnoteInput4);
            ts.setInt(5, scrumid_converted);
            
            ts.execute();
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        

        }
    }



