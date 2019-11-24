<%@page import="java.util.List"%>
<%@page import="entidades.Departamento"%>
<%@page import="dao.DepartamentoDAO"%>
<%@page import="entidades.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Projeto 1 > Produtos</title>
        <link rel="stylesheet" type="text/css" href="resources/css/bootstrap-material-design.min.css">
    </head>
    <body>
        <jsp:include page="componentes/NavBar.jsp">
            <jsp:param name="pagina" value="produto"/>
        </jsp:include>
        <div class="container p-3">
            <%
                Produto produto;

                if (request.getAttribute("produto") != null) {
                    produto = (Produto) request.getAttribute("departamento");
                } else {
                    produto = new Produto();
                }
            %>
            <h1>Produtos</h1>
            <button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#produto-form-modal">
                Novo Produto
            </button>

            <div class="modal fade" id="produto-form-modal" tabindex="-1" role="dialog" aria-labelledby="usuario-form-modal-title" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="usuario-form-modal-title">Produto</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form id="produto-form" method="POST" action="produto">
                                <div class="form-group" hidden>
                                    <label for="id">Id</label>
                                    <input class="form-control" id="id" name="id" type="number" value="<%= produto.getId()%>" required />
                                </div>
                                <div class="form-group">
                                    <label for="nome">Nome</label>
                                    <input class="form-control" id="nome" name="nome" type="text" value="<%= produto.getNome()%>" required />
                                </div>
                                <div class="form-group">
                                    <label for="nome">Descrição</label>
                                    <input class="form-control" id="nome" name="nome" type="text" value="<%= produto.getDescricao()%>" required />
                                </div>
                                <div class="form-group">
                                    <label for="imagem_url">Imagem</label>
                                    <input class="form-control" id="imagem_url" name="imagem_url" type="url" value="<%= produto.getImagemUrl()%>" required />
                                </div>
                                <div class="form-group">
                                    <label for="valor">Valor</label>
                                    <input class="form-control" id="valor" name="valor" type="number" step=".01" value="<%= produto.getValor()%>" required />
                                </div>
                                <div class="form-group">
                                    <label for="valor">Estoque</label>
                                    <input class="form-control" id="estoque" name="estoque" type="number" step="1" value="<%= produto.getEstoque()%>" required />
                                </div>
                                <div class="form-group">
                                    <% int departamentoId = 0; %>
                                    <input class="form-control" id="departamento" name="departamento" type="number" step="1" value="<%= departamentoId %>" required hidden />
                                    <div class="dropdown">
                                        <button class="btn btn-secondary dropdown-toggle" type="button" id="departamento-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Departamento
                                        </button>
                                        <div class="dropdown-menu" aria-labelledby="departamento-dropdown-menu">
                                            <%
                                                DepartamentoDAO dao = new DepartamentoDAO();
                                                for (Departamento d : dao.list()) {%>
                                                <button class="dropdown-item" type="button" onclick="<% departamentoId = d.getId(); %>"><%= d.getNome()%></button>
                                            <%}%>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-primary" form="produto-form">Salvar</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container">
                <table class="table">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Nome</th>
                                <th scope="col">Imagem</th>                                
                                <th scope="col">Valor</th>                                
                                <th scope="col">Estoque</th>                                
                                <th scope="col">Departamento</th>                                
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<Produto> produtos = (List<Produto>) request.getAttribute("produtos");
                                for (Produto p : produtos) {
                            %>
                            <tr>
                                <td><%= p.getId()%></td>
                                <td><%= p.getNome()%></td>
                                <td><%= p.getDescricao()%></td>
                                <td><%= p.getValor()%></td>
                                <td><%= p.getEstoque()%></td>
                                <td><%= p.getDepartamento().getNome()%></td>
                                <td><a href="<%= p.getImagemUrl()%>"><%= p.getImagemUrl()%></a></td>
                                <td>
                                    <a href="produto?atualizar=<%= p.getId()%>">
                                        <button class="btn btn-primary">Editar</button>
                                    </a>
                                    <a href="produto?excluir=<%= p.getId()%>">
                                        <button class="btn btn-danger">Excluir</button>
                                    </a>
                                </td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </table>
            </div>
        </div>
        <script src="resources/js/jquery-3.4.1.min.js"></script>
        <script src="resources/js/popper.min.js"></script>
        <script src="resources/js/bootstrap-material-design.min.js"></script>
        <script>
            $(document).ready(function () {
                $('body').bootstrapMaterialDesign();
            });
        </script>
    </body>
</html>
