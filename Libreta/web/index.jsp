<%-- 
    Document   : index
    Created on : 2/05/2016, 05:09:00 PM
    Author     : Developer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fatima" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>

        <form method="POST" action="ControladorLibreta">
            <input type="text" placeholder="CC" name="cctxt"/>
            <input type="text" placeholder="Nombre" name="nombretxt"/>
            <input type="text" placeholder="Sexo" name="sexotxt"/>
            <input type="text" placeholder="Edad" name="edadtxt"/>
            <input type="submit" value="Nuevo">
        </form>

        <table>            
                <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Documeto</th>
                    <th>Edad</th>
                    <th>Sexo</th>
                </tr>
                <fatima:forEach items="${requestScope.myResultado}" var="element"> 
                <tr>
                    <td>${element.id}</td>
                    <td>${element.nombre}</td>
                    <td>${element.documento}</td>
                    <td>${element.edad}</td>
                    <td>${element.sexo}</td>
                </tr>
                </fatima:forEach>
           </table>
    </body>
</html>
