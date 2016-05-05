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
        <form method="POST" action="ControladorPersona">
            <input type="text" placeholder="CC" name="cctxt"/>
            <input type="text" placeholder="Nombre" name="nombretxt"/>
            <input type="text" value="M" name="sexotxt"/>
            <input type="text" placeholder="Edad" name="edadtxt"/>
            <input type="submit" value="Nuevo Contacto">
        </form>
        
        <form method="POST" action="ControladorTelefono">
            <input type="number" placeholder="Telefono.." name="telefonotxt"/>
            <input type="text" placeholder="Ubicacion.." name="ubicaciontxt"/>           
            <input type="submit" value="Nuevo Telefono">
        </form>

        <form method="POST" action="ControladorDireccion">
            <input type="text" placeholder="Direccion.." name="direcciontxt"/>                       
            <input type="submit" value="Nueva Direccion">
        </form>
        
        <form method="POST" action="ControladorCorreoElectronico">
            <input type="email" placeholder="Correo Electronico.." name="correoetxt"/>                       
            <input type="submit" value="Nuevo Correo">
        </form>
        
        
        <h2> Lista de Contactos </h2>
        
        <table>            
                <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Documeto</th>
                    <th>Edad</th>
                    <th>Sexo</th>
                </tr>
                <fatima:forEach items="${requestScope.listaPersonas}" var="element"> 
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
