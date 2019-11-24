package dao;

import dao.interfaces.IProdutoDAO;
import entidades.Constantes;
import entidades.Produto;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class ProdutoDAO implements IProdutoDAO {

    EntityManagerFactory fac = Persistence.createEntityManagerFactory(Constantes.PU_NAME);

    @Override
    public void save(Produto produto) {
        EntityManager em = fac.createEntityManager();
        em.getTransaction().begin();
        if (produto.getId() > 0) {
            em.merge(produto);
        } else {
            em.persist(produto);
        }
        em.getTransaction().commit();
        em.close();
    }

    @Override
    public void delete(Produto produto) {
        EntityManager em = fac.createEntityManager();
        em.getTransaction().begin();
        if (!em.contains(produto)) {
            produto = em.merge(produto);
        }
        em.remove(produto);
        em.getTransaction().commit();
        em.close();
    }

    @Override
    public Produto find(int id) {
        EntityManager em = fac.createEntityManager();
        return em.find(Produto.class, id);
    }

    @Override
    public List<Produto> list() {
        EntityManager em = fac.createEntityManager();
        Query query = em.createQuery("SELECT p FROM Produto as p");
        return query.getResultList();
    }
}
