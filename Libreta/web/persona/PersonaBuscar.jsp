<%-- 
    Document   : BusarPersona
    Created on : 14/05/2016, 08:07:59 AM
    Author     : Developer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buscar</title>
    </head>
    <body>
        <div class="container">
            <h1>Buscar Persona</h1>
            <form method="POST" action="ControladorPersona" class="form-group">  
                    Id:<input id="personaidtxt"  type="number" name="personaidtxt" class="form-control"/>
                    CC: <input id="cctxt"  type="number" placeholder="CC" name="cctxt" class="form-control"/>
                    Nombre:<input id="nombretxt"  type="text" placeholder="Nombre" name="nombretxt" class="form-control"/>
                    Sexo:<input id="sexotxt" type="text" name="sexotxt" class="form-control"/>
                    Edad:<input id="edadtxt"  type="number" placeholder="Edad" name="edadtxt" class="form-control"/>
                    <input type="submit" value="Buscar" class="btn btn-success btn-md">            
             </form>  
        </div>
    </body>
</html>
