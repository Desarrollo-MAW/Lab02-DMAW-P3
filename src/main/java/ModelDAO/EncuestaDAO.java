
package ModelDAO;

import DB.Connect;
import Interface.IEncuestaCRUD;
import Model.Encuesta;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class EncuestaDAO implements IEncuestaCRUD{
    Connect cn = new Connect();
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    Encuesta survey = new Encuesta();

    @Override
    public boolean addEncuesta(Encuesta encuesta) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
}
