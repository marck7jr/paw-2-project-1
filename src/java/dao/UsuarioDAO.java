package dao;

import dao.interfaces.IUsuarioDAO;
import entidades.Constantes;
import entidades.Usuario;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class UsuarioDAO implements IUsuarioDAO {
    private final EntityManagerFactory fac = Persistence.createEntityManagerFactory(Constantes.PU_NAME);
    
    @Override
    public void save(Usuario usuario) {
        EntityManager em = fac.createEntityManager();
        em.getTransaction().begin();
        
        if (usuario.getId() > 0){
            em.merge(usuario);
        } else {
            em.persist(usuario);
        }
        em.getTransaction().commit();
        em.close();
    }
    
    @Override
    public void delete(Usuario usuario) {
        EntityManager em = fac.createEntityManager();
        em.getTransaction().begin();
        if (!em.contains(usuario)){
            usuario = em.merge(usuario);
        }
        
        em.remove(usuario);
        em.getTransaction().commit();
        em.close();
    }
    
    @Override
    public Usuario find(int id) {
        EntityManager em = fac.createEntityManager();
        return em.find(Usuario.class, id);
    }
    
    @Override
    public List<Usuario> list() {
        EntityManager em = fac.createEntityManager();
        Query q = em.createQuery("SELECT u FROM Usuario as u");
        return q.getResultList();
    }
}