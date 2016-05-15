<%-- 
    Document   : Telefono
    Created on : 13-may-2016, 15:39:22
    Author     : jsantamaria
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Telefono</h1>

        <form method="POST" action="ControladorTelefono">
            <input type="number" placeholder="Telefono.." name="telefonotxt"/>
            <input type="text" placeholder="Ubicacion.." name="ubicaciontxt"/>           
            <input type="submit" value="Guardar">
        </form>
    </body>
</html>
