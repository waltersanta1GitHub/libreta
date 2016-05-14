<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        
        <p>Nuevo Contacto</p>
        
        <form method="POST" action="ControladorPersona" class="form-group">
            <input id="personaidtxt"  type="number" name="personaidtxt" hidden="true"  class="form-control"/>
            <input type="number" placeholder="CC" name="cctxt" class="form-control"/>
            <input type="text" placeholder="Nombre" name="nombretxt" class="form-control"/>
            <input type="text" value="M" name="sexotxt" class="form-control"/>
            <input type="number" placeholder="Edad" name="edadtxt" class="form-control"/>
            <input type="submit" value="Guardar" class="btn btn-success btn-md">
        </form>
        
        <div class="form-group">         
            <button type="button" class="btn btn-info btn-md form-control">
                <a href="Telefono.jsp" >Agregar Nuevo Telefono </a>
            </button>
            <button type="button" class="btn btn-info btn-md form-control">
                <a href="TelefonoEdit.jsp" >Editar Telefono </a>
            </button>       
            <button type="button" class="btn btn-info btn-md form-control">
                <a href="TelefonoDelete.jsp" >Eliminar Telefono </a>
            </button>              
        </div>
                 
        
        <footer>
            <button type="button" class="btn btn-info btn-lg">
                <a href="index.jsp" > Ir a Inicio </a>
            </button>
        </footer>
    </body>
</html>
