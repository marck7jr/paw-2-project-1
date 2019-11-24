<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Projeto 1</title>
        <link rel="stylesheet" type="text/css" href="resources/css/bootstrap-material-design.min.css">
    </head>
    <body>
        <jsp:include page="componentes/NavBar.jsp">
            <jsp:param name="pagina" value="inicio"/>
        </jsp:include>
        <div class="container p-3">

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
