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
@WebServlet(name = "updateUserAccess", urlPatterns = {"/updateUserAccess"})
public class updateUserAccess extends HttpServlet {

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
        String userId = request.getParameter("userId");
        userId = userId.trim();
        int userId_converted = Integer.parseInt(userId);

        String taskOpt = request.getParameter("taskOpt");
        String email = request.getParameter("email");
         // this block either removes the access or grants access to the user
        if (!taskOpt.equals("1") && taskOpt.equals("delete")) {

            try {
                PreparedStatement ps = DBUtils.getPreparedStatment("UPDATE `scrumboards`.`users` SET `teamaccess`= '0' , scrumid = '0' WHERE `userid`= ?;");
                ps.setInt(1, userId_converted);
                ps.execute();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(updateUserAccess.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(updateUserAccess.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else {
            // this block either removes the access or grants access to the user
            String access_input = request.getParameter("access");
            access_input = access_input.trim();
            int access_converted = Integer.parseInt(access_input);

            PreparedStatement ps;
            try {
                    ps = DBUtils.getPreparedStatment("UPDATE `scrumboards`.`users` SET `teamaccess`= '1' WHERE `userid`= ?;");      
                    ps.setInt(1, userId_converted);
                    ps.execute();
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }
}
