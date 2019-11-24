<%-- 
    Document   : NavBar
    Created on : 23/11/2019, 20:01:48
    Author     : lucim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">            
            <a class="navbar-brand" href="#">Projeto 1</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link ${param.pagina == "inicio" ? "active" : ""}" href="/Web2Projeto1/">Início</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link ${param.pagina == "usuario" ? "active" : ""}" href="/Web2Projeto1/usuario">Usuário</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link ${param.pagina == "departamento" ? "active" : ""}" href="/Web2Projeto1/departamento">Departamento</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link ${param.pagina == "produto" ? "active" : ""}" href="/Web2Projeto1/produto">Produto</a>
                    </li>
                </ul>
            </div>
        </nav>
        <script>
            
        </script>
    </body>
</html>
