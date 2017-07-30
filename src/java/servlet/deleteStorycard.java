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
@WebServlet(name = "deleteStorycardServ", urlPatterns = {"/deleteStorycardServ"})
public class deleteStorycard extends HttpServlet {


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
       
   

        String storyID_input = request.getParameter("storyID");
        
        int storyID_converted = Integer.parseInt(storyID_input);
      

        PreparedStatement ps;
        PreparedStatement sd;
        PreparedStatement nd;
        PreparedStatement pd;
        try {
            ps = DBUtils.getPreparedStatment("DELETE FROM `scrumboards`.`storycards` WHERE `storyid`='"+ storyID_converted +"'; ");
            ps.execute();
            sd = DBUtils.getPreparedStatment("ALTER TABLE `scrumboards`.`storycards` AUTO_INCREMENT = 1;");
            sd.execute();
            nd = DBUtils.getPreparedStatment("DELETE FROM `scrumboards`.`storynotes` WHERE `storyid`='"+ storyID_converted +";");
            nd.execute();
            pd = DBUtils.getPreparedStatment("ALTER TABLE `scrumboards`.`storynotes` AUTO_INCREMENT = 1;");
            pd.execute();
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
