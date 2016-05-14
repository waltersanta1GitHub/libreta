<%-- 
    Document   : Correo
    Created on : 13-may-2016, 15:39:46
    Author     : jsantamaria
--%>

<%@page import="DAO.IDAO"%>
<%@page import="DAO.DAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            IDAO contexto;
            contexto = new DAO();
            request.setAttribute("listaPersonas", contexto.ListarPersonas());
            request.setAttribute("listaTelefonos", contexto.ListarPersonas());
        %>  

        <div class="container">
            <header>
                <h1>Eliminar Correo</h1>
            </header>
            <article class="form-group">

                <select id="lsPersonas" name="names" onchange="loadValues()" class="form-control">
                    <c:forEach items="${requestScope.listaPersonas}" var="element"> 
                        <option value="<c:out value="${element}"/>"> <c:out value="${element.nombre}"/>
                        </option>
                    </c:forEach>
                </select>

                <select id="lsTelefonos" name="names" onchange="loadMails()" class="form-control">
                    <c:forEach items="${requestScope.listaPersonas}" var="element"> 
                        <option value="<c:out value="${element}"/>"> <c:out value="${element.correo}"/>
                        </option>
                    </c:forEach>
                </select>

                <form method="POST" action="ControladorCorreoElectronico">
                    <input id="personaidtxt"  type="number" name="personaidtxt" hidden="true" />
                    <input id="correoidtxt"  type="number" name="correoidtxt" hidden="true"  />
                    <input type="email"  name="correoetxt" class="form-control"/>                       
                    <input type="submit" value="Eliminar" class="form-control" />
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
                }

            }

            function loadMails() {



            }

        </script>

    </body>
</html>
