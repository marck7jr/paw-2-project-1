<%-- 
    Document   : Cliente
    Created on : 23/11/2019, 07:37:24
    Author     : lucim
--%>

<%@page import="java.util.List"%>
<%@page import="entidades.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Projeto 1 > Usuário</title>
        <link rel="stylesheet" type="text/css" href="resources/css/bootstrap-material-design.min.css">
    </head>
    <body>
        <jsp:include page="componentes/NavBar.jsp">
            <jsp:param name="pagina" value="usuario"/>
        </jsp:include>
        <div class="container p-3">
            <%
                Usuario usuario;

                if (request.getAttribute("usuario") != null) {
                    usuario = (Usuario) request.getAttribute("usuario");
                } else {
                    usuario = new Usuario();
                }
            %>
            <h1>Usuários</h1>
            <button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#usuario-form-modal">
                Novo Usuário
            </button>

            <div class="modal fade" id="usuario-form-modal" tabindex="-1" role="dialog" aria-labelledby="usuario-form-modal-title" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="usuario-form-modal-title">Usuário</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form id="usuario-form" method="POST" action="usuario">
                                <div class="form-group" hidden>
                                    <label for="id">Id</label>
                                    <input class="form-control" id="id" name="id" type="number" value="<%= usuario.getId()%>" required />
                                </div>
                                <div class="form-group">
                                    <label for="nome">Nome</label>
                                    <input class="form-control" id="nome" name="nome" type="text" value="<%= usuario.getNome()%>" required />
                                </div>
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input class="form-control" id="email" name="email" type="email" value="<%= usuario.getEmail()%>" required />
                                </div>
                                <div class="form-group">
                                    <label for="cpf">CPF</label>
                                    <input class="form-control" id="cpf" name="cpf" type="cpf" value="<%= usuario.getCpf()%>" required />
                                </div>
                                <div class="form-group">
                                    <label for="telefone">Telefone</label>
                                    <input class="form-control" id="telefone" name="telefone" type="phone" value="<%= usuario.getTelefone()%>" />
                                </div>
                                <div class="form-group">
                                    <label for="senha">Senha</label>
                                    <input class="form-control" id="senha" name="senha" type="password" value="<%= usuario.getSenha()%>" required />
                                </div>
                                <div class="form-group">
                                    <label for="endereco">Endereço</label>
                                    <input class="form-control" id="endereco" name="endereco" type="address" value="<%= usuario.getEndereco()%>"  />
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-primary" form="usuario-form">Salvar</button>
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
                                <th scope="col">CPF</th>
                                <th scope="col">Email</th>
                                <th scope="col">Telefone</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<Usuario> usuarios = (List<Usuario>) request.getAttribute("usuarios");
                                for (Usuario u : usuarios) {
                            %>
                            <tr>
                                <td><%= u.getId()%></td>
                                <td><%= u.getNome()%></td>
                                <td><%= u.getCpf()%></td>
                                <td><%= u.getEmail()%></td>
                                <td><%= u.getTelefone()%></td>
                                <td>
                                    <a href="usuario?atualizar=<%= u.getId()%>">
                                        <button class="btn btn-primary">Editar</button>
                                    </a>
                                    <a href="usuario?excluir=<%= u.getId()%>">
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
        <script>
            <% if (request.getAttribute("usuario") != null) { %>
                $("#usuario-form-modal").modal("show");
            <%}%>
        </script>
    </body>
</html>
