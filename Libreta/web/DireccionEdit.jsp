<%-- 
    Document   : Direccion
    Created on : 13-may-2016, 15:39:35
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
        <h1>Direccion</h1>
        <form method="POST" action="ControladorDireccion">
            <input type="text" placeholder="Direccion.." name="direcciontxt"/>                       
            <input type="submit" value="Guardar">
        </form>
    </body>
</html>
