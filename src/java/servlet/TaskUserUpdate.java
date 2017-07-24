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
@WebServlet(name = "TaskUserUpdate", urlPatterns = {"/TaskUserUpdate"})
public class TaskUserUpdate extends HttpServlet {
    String updatedStatus="";
    int userID_converted=0;

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

        String ProfileDiv;
        String storyID_input = request.getParameter("storyID");
        String sprintID_input = request.getParameter("sprintID");
        String targetProfile_input = request.getParameter("targetProfile");
        String userID_input = request.getParameter("userID");
        userID_input = userID_input.trim();
       
         // converts from String to Int
        if(!userID_input.equals("")){
         userID_converted = Integer.parseInt(userID_input);
        } else {userID_converted = 0;}
        int storyID_converted = Integer.parseInt(storyID_input);
        int sprintID_converted = Integer.parseInt(sprintID_input);
        //
        
        // converts the input from DIV ID to the SQL column name
        switch (targetProfile_input) {
            case "user3pic":
                ProfileDiv = "user3";
                break;
            case "user2pic":
                ProfileDiv = "user2";
                break;
            default:
                ProfileDiv = "user1";
                break;
        }
               
        PreparedStatement ts;

        try{   
            ts = DBUtils.getPreparedStatment("UPDATE scrumboards.storycards SET "+ProfileDiv+" = ?, lastupdate = current_date() WHERE storycards.storyid = ? AND storycards.sprintid = ?;");
            
            ts.setInt(1,userID_converted);
            ts.setInt(2, storyID_converted);
            ts.setInt(3, sprintID_converted);
            ts.executeUpdate();
            
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
