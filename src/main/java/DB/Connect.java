package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author deuseli
 */
public class Connect {
    public Connection getConnection() throws ClassNotFoundException, SQLException{
       Connection connection;
       Class.forName("org.postgresql.Driver");
       connection=DriverManager.getConnection("jdbc:postgresql://containers-us-west-101.railway.app:6276/railway", "postgres", "QQJJNfZGJfzc7np0QFA6");
       return connection;
    }
}
