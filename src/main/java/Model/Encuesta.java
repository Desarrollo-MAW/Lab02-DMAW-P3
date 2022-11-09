package Model;

import java.util.Date;

/**
 *
 * @author deuseli
 */
public class Encuesta {
    private int id_encuesta;
    private String nombre;
    private String sexo;
    private String deporte_fav;
    private String nivel_estudio;
    private String temas_fav;
    private int id_usuario;
    private Date fecha;
    
    public Encuesta() {
        
    }

    public Encuesta(int id_encuesta, String nombre, String sexo, String deporte_fav, String nivel_estudio, String temas_fav, int id_usuario, Date fecha) {
        this.id_encuesta = id_encuesta;
        this.nombre = nombre;
        this.sexo = sexo;
        this.deporte_fav = deporte_fav;
        this.nivel_estudio = nivel_estudio;
        this.temas_fav = temas_fav;
        this.id_usuario = id_usuario;
        this.fecha = fecha;
    }

    public int getId_encuesta() {
        return id_encuesta;
    }

    public void setId_encuesta(int id_encuesta) {
        this.id_encuesta = id_encuesta;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getDeporte_fav() {
        return deporte_fav;
    }

    public void setDeporte_fav(String deporte_fav) {
        this.deporte_fav = deporte_fav;
    }

    public String getNivel_estudio() {
        return nivel_estudio;
    }

    public void setNivel_estudio(String nivel_estudio) {
        this.nivel_estudio = nivel_estudio;
    }

    public String getTemas_fav() {
        return temas_fav;
    }

    public void setTemas_fav(String temas_fav) {
        this.temas_fav = temas_fav;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
}
