package serveyweb;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
public class ConnUtil {
    private static DataSource ds;
    static {
        try{
            InitialContext ctx = new InitialContext();
            if(ds ==null) {
            	ds = (DataSource)ctx.lookup("java:comp/env/jdbc/myOracle");	
            }
        } catch(NamingException e){}
    }
    public static Connection getConnection() throws SQLException{
        return ds.getConnection();
    }
}
