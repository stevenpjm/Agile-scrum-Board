package db;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;



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
    

    public static void close(PreparedStatement ps) throws SQLException {
        if (ps != null) {
            ps.close();
        }
    }
 
}


