package dao.interfaces;

import entidades.Departamento;
import java.util.List;

public interface IDepartamentoDAO {
    public void save(Departamento departamento);
    public void delete(Departamento departamento);
    public Departamento find(int id);
    public List<Departamento> list();    
}
