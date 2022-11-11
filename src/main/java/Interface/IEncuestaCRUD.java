package Interface;

import Model.Encuesta;
import java.util.List;

/**
 *
 * @author deuseli
 */
public interface IEncuestaCRUD {
    public List listEncuestas();
    public List getEncuesta(int id_encuesta);
    public boolean addEncuesta(Encuesta encuesta);
    public boolean updateEncuesta(Encuesta encuesta);
    public boolean deleteEncuesta(int id_encuesta);
}
