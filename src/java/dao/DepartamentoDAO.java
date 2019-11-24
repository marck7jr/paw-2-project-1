package dao;

import dao.interfaces.IDepartamentoDAO;
import entidades.Constantes;
import entidades.Departamento;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class DepartamentoDAO implements IDepartamentoDAO {

    private final EntityManagerFactory fac = Persistence.createEntityManagerFactory(Constantes.PU_NAME);

    @Override
    public void save(Departamento departamento) {
        EntityManager em = fac.createEntityManager();
        em.getTransaction().begin();
        if (departamento.getId() > 0) {
            em.merge(departamento);
        } else {
            em.persist(departamento);
        }
        em.getTransaction().commit();
        em.close();
    }

    @Override
    public void delete(Departamento departamento) {
        EntityManager em = fac.createEntityManager();
        em.getTransaction().begin();
        if (!em.contains(departamento)){
            departamento = em.merge(departamento);
        }
        em.remove(departamento);
        em.getTransaction().commit();
        em.close();
    }

    @Override
    public Departamento find(int id) {
        EntityManager em = fac.createEntityManager();
        return em.find(Departamento.class, id);
    }

    @Override
    public List<Departamento> list() {
        EntityManager em = fac.createEntityManager();
        Query query = em.createQuery("SELECT d FROM Departamento as d");
        return query.getResultList();
    }
}
