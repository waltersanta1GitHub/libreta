<%-- 
    Document   : index
    Created on : 2/05/2016, 05:09:00 PM
    Author     : Developer
--%>

<%@page import="modelos.PersonaBean"%>
<%@page import="DAO.DAO"%>
<%@page import="DAO.IDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

        <div class="container">

            <button type="button" class="btn btn-info btn-md">
                <a href="Persona.jsp" > Agregar Nuevo Contacto </a>
            </button>
            <button type="button" class="btn btn-info btn-md">
                <a href="PersonaEdit.jsp" > Editar Contacto </a>
            </button>       
            <button type="button" class="btn btn-info btn-md">
                <a href="PersonaDelete.jsp" > Eliminar Contacto </a>
            </button>             



            <%
                IDAO contexto;
                contexto = new DAO();
                request.setAttribute("listaPersonas", contexto.ListarPersonas());
            %>

            <div>            
                <div>
                    <h2> Lista de Contactos </h2>

                    <table class="table">  
                        <thead class="thead-inverse">
                            <tr>                       
                                <th>Nombre</th>
                                <th>Documeto</th>
                                <th>Edad</th>
                                <th>Sexo</th>
                            </tr>    
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.listaPersonas}" var="element"> 
                                <tr>                           
                                    <td>${element.nombre}</td>
                                    <td>${element.documento}</td>
                                    <td>${element.edad}</td>
                                    <td>${element.sexo}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                </div>            
            </div>

        </div>
    </body>
</html>
