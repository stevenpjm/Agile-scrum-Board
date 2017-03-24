package db;


import java.sql.Connection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;


public class DBUtils {

    public static PreparedStatement getPreparedStatment (String sql) throws ClassNotFoundException, SQLException {
    PreparedStatement ps = null;
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/scrumboards";
    String user = "root";
    String pass = "root";
    
    Connection con = DriverManager.getConnection(url, user, pass);
    ps = con.prepareStatement(sql);
        
      
    return ps;
    
    }
 
}




/*
    public static PreparedStatement getPreparedStatement(String insert_into_sprint_values) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
*/



