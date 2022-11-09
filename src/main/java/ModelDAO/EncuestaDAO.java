package ModelDAO;

import DB.Connect;
import Interface.IEncuestaCRUD;
import Model.Encuesta;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author deuseli
 */
public class EncuestaDAO implements IEncuestaCRUD {
    Connect cn = new Connect();
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    Encuesta enc = new Encuesta();

    @Override
    public List listEncuestas() {
        ArrayList<Encuesta> list = new ArrayList<>();
        String sql = "SELECT * FROM encuesta";
        try {
            conn = cn.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Encuesta encuesta = new Encuesta();
                encuesta.setId_encuesta(rs.getInt("id_encuesta"));
                encuesta.setNombre(rs.getString("nombre"));
                encuesta.setSexo(rs.getString("sexo"));
                encuesta.setDeporte_fav(rs.getString("deporte_fav"));
                encuesta.setNivel_estudio(rs.getString("nivel_estudio"));
                encuesta.setTemas_fav(rs.getString("temas_fav"));
                encuesta.setId_usuario(rs.getInt("id_usuario"));
                encuesta.setFecha(rs.getDate("fecha"));

                list.add(encuesta);
            }
        } catch (Exception e) {
        }
        return list;
    }

    @Override
    public Encuesta getEncuesta(int id_encuesta) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean addEncuesta(Encuesta encuesta) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean updateEncuesta(Encuesta encuesta) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean deleteEncuesta(int id_encuesta) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
