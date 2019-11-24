package dao.interfaces;

import entidades.Usuario;
import java.util.List;

public interface IUsuarioDAO {
    public void save(Usuario usuario);
    public void delete(Usuario usuario);
    public Usuario find(int id);
    public List<Usuario> list();
}
