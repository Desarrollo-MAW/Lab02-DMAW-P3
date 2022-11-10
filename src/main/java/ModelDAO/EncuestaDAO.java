package ModelDAO;

import DB.Connect;
import Interface.IEncuestaCRUD;
import Model.Encuesta;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

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
    Map<String, Integer> map;
    
    public Map<String, Integer> getResumenEncuestas() {
        ArrayList<Encuesta> list = new ArrayList<>();
        map = new HashMap<>();
        String sql = "SELECT sexo, deporte_fav, nivel_estudio, temas_fav FROM encuesta";
        int m = 0, f = 0, fut = 0, bas = 0, joc = 0, bei = 0, golf = 0, basico = 0, inter = 0, supe = 0, tele = 0, cocina = 0, tec = 0, mus = 0, depo = 0;
        try {
            conn = cn.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Encuesta encuesta = new Encuesta();
                encuesta.setSexo(rs.getString("sexo"));
                encuesta.setDeporte_fav(rs.getString("deporte_fav"));
                encuesta.setNivel_estudio(rs.getString("nivel_estudio"));
                encuesta.setTemas_fav(rs.getString("temas_fav"));
                list.add(encuesta);
                
                switch (encuesta.getSexo()) {
                    case "Masculino":
                        m += 1;
                        break;
                    case "Femenino":
                        f += 1;
                        break;
                    default:
                        throw new AssertionError();
                }
                
                switch (encuesta.getDeporte_fav()) {
                    case "Fútbol":
                        fut += 1;
                        break;
                    case "Básquetbol":
                        bas += 1;
                        break;
                    case "Jockey":
                        joc += 1;
                    case "Béisbol":
                        bei += 1;
                        break;
                    case "Golf":
                        golf += 1;
                        break;
                    default:
                        throw new AssertionError();
                }
                
                switch (encuesta.getNivel_estudio()) {
                    case "Básico":
                        basico += 1;
                        break;
                    case "Intermedio":
                        inter += 1;
                        break;
                    case "Superior":
                        supe += 1;
                        break;
                    default:
                        throw new AssertionError();
                }
                
                switch (encuesta.getTemas_fav()) {
                    case "Televisión":
                        tele += 1;
                        break;
                    case "Cocina":
                        cocina += 1;
                        break;
                    case "Tecnología":
                        tec += 1;
                        break;
                    case "Música":
                        mus += 1;
                        break;
                    case "Deportes":
                        depo += 1;
                        break;
                    default:
                        throw new AssertionError();
                }
            }
            
        map.put("Masculino", m);
        map.put("Femenino", f);
        map.put("Futbol", fut);
        map.put("Basquetbol", bas);
        map.put("Jockey", joc);
        map.put("Beisbol", bei);
        map.put("Golf", golf);
        map.put("Basico", basico);
        map.put("Intermedio", inter);
        map.put("Superior", supe);
        map.put("Tele", tele);
        map.put("Cocina", cocina);
        map.put("Tecno", tec);
        map.put("Musica", mus);
        map.put("Deporte", depo);
        
        } catch (Exception e) {
        }
        return map;
    }

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
        String fecha = new SimpleDateFormat("yyyy-MM-dd").format(encuesta.getFecha());
        String sql = "INSERT INTO encuesta "
                + "(nombre, sexo, deporte_fav, nivel_estudio, temas_fav, id_usuario, fecha) "
                + "VALUES(?, ?, ?, ?, ?, '"+ encuesta.getId_usuario() +"', '"+ fecha +"')";
        try {
            conn = cn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, encuesta.getNombre());
            ps.setString(2, encuesta.getSexo());
            ps.setString(3, encuesta.getDeporte_fav());
            ps.setString(4, encuesta.getNivel_estudio());
            ps.setString(5, encuesta.getTemas_fav());
            ps.executeUpdate();
            return true;
        } catch(Exception e) {

        }
        return false;
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
