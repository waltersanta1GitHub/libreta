<%@page import="DAO.DAO"%>
<%@page import="DAO.IDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>

        <%
            IDAO contexto;
            contexto = new DAO();
            request.setAttribute("listaPersonas", contexto.ListarPersonas());
        %>  

        <div class="container">
            <header>
                <h1>Eliminar Contacto</h1>
            </header>
            <article class="form-group">

                <select id="lsPersonas" name="names" onchange="loadValues()" class="form-control">
                    <c:forEach items="${requestScope.listaPersonas}" var="element"> 
                        <option value="<c:out value="${element}"/>"> <c:out value="${element.nombre}"/>
                        </option>
                    </c:forEach>
                </select>
                <br/>

                <form method="POST" action="ControladorPersona" class="form-group">  
                    <input id="personaidtxt"  type="number" name="personaidtxt" hidden="true"  class="form-control"/>
                    CC: <input id="cctxt"  type="number" placeholder="CC" name="cctxt" class="form-control"/>
                    Nombre:<input id="nombretxt"  type="text" placeholder="Nombre" name="nombretxt" class="form-control"/>
                    Sexo:<input id="sexotxt" type="text" name="sexotxt" class="form-control"/>
                    Edad:<input id="edadtxt"  type="number" placeholder="Edad" name="edadtxt" class="form-control"/>
                    <input type="submit" value="Eliminar" class="btn btn-success btn-md">            
                </form>


            </article>

            <footer>
                <button type="button" class="btn btn-info btn-lg col-md-4">
                    <a href="index.jsp" > Ir a Inicio </a>
                </button>
            </footer>

        </div>

        <script type="text/javascript">

            function loadValues() {
                var e = document.getElementById("lsPersonas");
                var strSelect = e.options[e.selectedIndex].value;

                if (strSelect !== null) {

                    var arraItem = strSelect.split(',');
                    document.getElementById("personaidtxt").value = arraItem[0];
                    document.getElementById("nombretxt").value = arraItem[1];
                    document.getElementById("cctxt").value = arraItem[2];
                    document.getElementById("edadtxt").value = arraItem[3];
                    document.getElementById("sexotxt").value = arraItem[4];
                    document.getElementById("borrartxt").value = document.getElementById("personaidtxt").value;


                }

            }


        </script>

    </body>
</html>
