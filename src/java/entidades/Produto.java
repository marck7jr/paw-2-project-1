package entidades;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "produto")
@SequenceGenerator(name = "produto_seq", sequenceName = "produto_id_seq", allocationSize = 1)
public class Produto {
    @Id
    @Column
    @GeneratedValue(generator = "produto_seq", strategy = GenerationType.SEQUENCE)
    private int id;
    private String nome;
    private String descricao;
    @Column(name = "imagem_url")
    private String imagemUrl;
    private float valor;
    @Column(name = "quantidade_estoque")
    private int estoque;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "departamento")
    private Departamento departamento;
    
    public Produto(){
        id = 0;
        nome = "";
        descricao = "";
        imagemUrl = "";
        valor = 0;
        estoque = 0;
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

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getImagemUrl() {
        return imagemUrl;
    }

    public void setImagemUrl(String imagemUrl) {
        this.imagemUrl = imagemUrl;
    }

    public float getValor() {
        return valor;
    }

    public void setValor(float valor) {
        this.valor = valor;
    }

    public int getEstoque() {
        return estoque;
    }

    public void setEstoque(int estoque) {
        this.estoque = estoque;
    }

    public Departamento getDepartamento() {
        return departamento;
    }

    public void setDepartamento(Departamento departamento) {
        this.departamento = departamento;
    }
    
}
