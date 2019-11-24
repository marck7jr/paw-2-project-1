<%@page import="java.util.List"%>
<%@page import="entidades.Departamento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Projeto 1 > Departamento</title>
        <link rel="stylesheet" type="text/css" href="resources/css/bootstrap-material-design.min.css">
    </head>
    <body>
        <jsp:include page="componentes/NavBar.jsp">
            <jsp:param name="pagina" value="departamento"/>
        </jsp:include>
        <div class="container p-3">
            <%
                Departamento departamento;

                if (request.getAttribute("departamento") != null) {
                    departamento = (Departamento) request.getAttribute("departamento");
                } else {
                    departamento = new Departamento();
                }
            %>
            <h1>Departamentos</h1>
            <button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#departamento-form-modal">
                Novo Departamento
            </button>

            <div class="modal fade" id="departamento-form-modal" tabindex="-1" role="dialog" aria-labelledby="usuario-form-modal-title" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="usuario-form-modal-title">Departamento</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form id="departamento-form" method="POST" action="departamento">
                                <div class="form-group" hidden>
                                    <label for="id">Id</label>
                                    <input class="form-control" id="id" name="id" type="number" value="<%= departamento.getId()%>" required />
                                </div>
                                <div class="form-group">
                                    <label for="nome">Nome</label>
                                    <input class="form-control" id="nome" name="nome" type="text" value="<%= departamento.getNome()%>" required />
                                </div>
                                <div class="form-group">
                                    <label for="imagem_url">Imagem</label>
                                    <input class="form-control" id="imagem_url" name="imagem_url" type="url" value="<%= departamento.getImagemUrl()%>" required />
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-primary" form="departamento-form">Salvar</button>
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
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<Departamento> departamentos = (List<Departamento>) request.getAttribute("departamentos");
                                for (Departamento d : departamentos) {
                            %>
                            <tr>
                                <td><%= d.getId()%></td>
                                <td><%= d.getNome()%></td>
                                <td><a href="<%= d.getImagemUrl()%>"><%= d.getImagemUrl()%></a></td>
                                <td>
                                    <a href="departamento?atualizar=<%= d.getId()%>">
                                        <button class="btn btn-primary">Editar</button>
                                    </a>
                                    <a href="departamento?excluir=<%= d.getId()%>">
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
            <% if (request.getAttribute("departamento") != null) { %>
                $("#departamento-form-modal").modal("show");
            <%}%>
        </script>
    </body>
</html>
