package Interface;

import java.util.List;
import Model.Usuario;

/**
 *
 * @author deuseli
 */
public interface IUsuarioCRUD {
    public List listUsuarios();
    public Usuario getUsuario(int id_usuario);
    public boolean addUsuario(Usuario usuario);
    public boolean updateUsuario(Usuario usuario);
    public boolean deleteUsuario(int id_usuario);
}
