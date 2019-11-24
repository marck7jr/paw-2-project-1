package entidades;

import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "departamento")
@SequenceGenerator(name = "departamento_seq", sequenceName = "departamento_id_seq", allocationSize = 1)
public class Departamento {
    @Id
    @Column
    @GeneratedValue(generator = "departamento_seq", strategy = GenerationType.SEQUENCE)
    private int id;
    private String nome;
    @Column(name = "imagem_url")
    private String imagemUrl;
    @OneToMany(
        cascade = CascadeType.ALL,
        orphanRemoval = true
    )
    @JoinColumn(name = "departamento")
    private List<Produto> produtos;
    
    public Departamento(){
        id = 0;
        nome = "";
        imagemUrl = "";
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getImagemUrl() {
        return imagemUrl;
    }

    public void setImagemUrl(String imagemUrl) {
        this.imagemUrl = imagemUrl;
    }

    public List<Produto> getProdutos() {
        return produtos;
    }

    public void setProdutos(List<Produto> produtos) {
        this.produtos = produtos;
    }
}
