package servlet;

/*
* This block of code returns the scrum board names based on the users input
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
// returns the 
/**
 *
 * @author steven.masters
 */
public class scrumTeamReq extends HttpServlet {

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
        String userinput = request.getParameter("data");
        String scrumOptions = "";
        String scrumOptionAll = null;

        try {
            ResultSet scrumDetails = DBUtils.getPreparedStatment("SELECT teamName FROM scrumboards.scrumboard WHERE teamName LIKE \"%" + userinput + "%\";").executeQuery();
            int i = 1;
            while (scrumDetails.next()) {
                scrumOptions = scrumDetails.getString("teamName");
                if (scrumOptions != null && scrumOptions.trim().length() != 0 && scrumOptionAll != null) {
                    scrumOptionAll = scrumOptionAll + ", " + scrumOptions;
                } else {
                    scrumOptionAll = scrumOptions;
                }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (scrumOptionAll != null && scrumOptionAll.trim().length() != 0) {
            isValid = true;
            map.put("scrumOptions", scrumOptionAll);
        }
        map.put("isValid", isValid);
        write(response, scrumOptionAll);
    }
// returns the value back to the orginating

    private void write(HttpServletResponse response, String scrumOptionAll) throws IOException {
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(scrumOptionAll);
    }
}
