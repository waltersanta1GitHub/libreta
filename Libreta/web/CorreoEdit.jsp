<%-- 
    Document   : Correo
    Created on : 13-may-2016, 15:39:46
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
        <h1>Correo</h1>
        <form method="POST" action="ControladorCorreoElectronico">
            <input type="email" placeholder="Correo Electronico.." name="correoetxt"/>                       
            <input type="submit" value="Guardar">
        </form>
    </body>
</html>
