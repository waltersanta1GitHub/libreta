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
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>

        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#miContacto">Nuevo Contacto</button>
        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#miTelefono">Nuevo Telefono</button>
        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#miDireccion">Nueva Direccion</button>
        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#miCorreo">Nuevo Correo</button>


        <form method="GET" action="ControladorLibreta">  
            <input type="submit" value="Ver Lista de Contactos" class="btn btn-default btn-lg">
        </form>



        <div>            
            <div>
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
                            <td><a href="#" data-toggle="modal" data-target="#miContactoEdit"><span class="glyphicon glyphicon-pencil"></span> Editar  ${element.id}</a></td>
                            <td><a href="#" data-toggle="modal" data-target="#miContactoDel"><span class="glyphicon glyphicon-trash"></span> Eliminar ${element.id}</a></td>
                            <td><a href="#" data-toggle="modal" data-target="#bannerformmodal"> 
                                    <form method="POST" action="ControladorLibreta">  
                                        <input type="text" value="${element.id}" name="seleccionadotxt" hidden="true" />                                      
                                        <input type="submit" value="Seleccionar">
                                    </form></a></td>
                        </tr>
                    </fatima:forEach>
                </table>

            </div>            
        </div>



        <!-- Modales  CREACION-->

        <div id="miContacto" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Nuevo Contacto</h4>
                    </div>
                    <div class="modal-body">
                        <p>Crear Contacto.</p>
                        <form method="POST" action="ControladorPersona">
                            <input type="text" placeholder="CC" name="cctxt"/>
                            <input type="text" placeholder="Nombre" name="nombretxt"/>
                            <input type="text" value="M" name="sexotxt"/>
                            <input type="text" placeholder="Edad" name="edadtxt"/>
                            <input type="submit" value="Guardar">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>

            </div>
        </div>
        <div class="modal fade" id="miTelefono" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Adicionar Telefono</h4>
                    </div>
                    <div class="modal-body">
                        <form method="POST" action="ControladorTelefono">
                            <input type="number" placeholder="Telefono.." name="telefonotxt"/>
                            <input type="text" placeholder="Ubicacion.." name="ubicaciontxt"/>           
                            <input type="submit" value="Guardar">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>

            </div>
        </div>
        <div class="modal fade" id="miDireccion" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Adicionar Direccion</h4>
                    </div>
                    <div class="modal-body">
                        <form method="POST" action="ControladorDireccion">
                            <input type="text" placeholder="Direccion.." name="direcciontxt"/>                       
                            <input type="submit" value="Guardar">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>

            </div>
        </div>
        <div class="modal fade" id="miCorreo" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Adicionar Correo</h4>
                    </div>
                    <div class="modal-body">
                        <form method="POST" action="ControladorCorreoElectronico">
                            <input type="email" placeholder="Correo Electronico.." name="correoetxt"/>                       
                            <input type="submit" value="Guardar">
                        </form>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>

            </div>
        </div>

        <!-- Modales  EDICION-->

        <div id="miContactoEdit" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Editar Contacto</h4>
                    </div>
                    <div class="modal-body">
                        <p>Editar Contacto.</p>
                        <form method="POST" action="ControladorPersona">
                            <input type="text" placeholder="CC" name="cctxt_edit"/>
                            <input type="text" placeholder="Nombre" name="nombretxt_edit"/>
                            <input type="text" value="M" name="sexotxt_edit"/>
                            <input type="text" placeholder="Edad" name="edadtxt_edit"/>
                            <input type="submit" value="Actualizar">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    </div>
                </div>

            </div>
        </div>
        <div class="modal fade" id="miTelefonoEdit" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Editar Telefono</h4>
                    </div>
                    <div class="modal-body">
                        <form method="POST" action="ControladorTelefono">
                            <input type="number" placeholder="Telefono.." name="telefonotxt_edit"/>
                            <input type="text" placeholder="Ubicacion.." name="ubicaciontxt_edit"/>           
                            <input type="submit" value="Actualizar">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    </div>
                </div>

            </div>
        </div>
        <div class="modal fade" id="miDireccionEdit" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Editar Direccion</h4>
                    </div>
                    <div class="modal-body">
                        <form method="POST" action="ControladorDireccion">
                            <input type="text" placeholder="Direccion.." name="direcciontxt_edit"/>                       
                            <input type="submit" value="Actualizar">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    </div>
                </div>

            </div>
        </div>
        <div class="modal fade" id="miCorreoEdit" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Editar Correo</h4>
                    </div>
                    <div class="modal-body">
                        <form method="POST" action="ControladorCorreoElectronico">
                            <input type="email" placeholder="Correo Electronico.." name="correoetxt_edit"/>                       
                            <input type="submit" value="Actualizar">
                        </form>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    </div>
                </div>

            </div>
        </div>

        <!-- Modales  ELIMINACION-->

        <div id="miContactoDel" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Eliminar Contacto</h4>
                    </div>
                    <div class="modal-body">
                        <p>Crear Contacto.</p>
                        <form method="POST" action="ControladorPersona">
                            <input type="text" placeholder="CC" name="cctxt_del"/>
                            <input type="text" placeholder="Nombre" name="nombretxt_del"/>
                            <input type="text" value="M" name="sexotxt_del"/>
                            <input type="text" placeholder="Edad" name="edadtxt_del"/>
                            <input type="submit" value="Eliminar">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    </div>
                </div>

            </div>
        </div>
        <div class="modal fade" id="miTelefonoDel" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Eliminar Telefono</h4>
                    </div>
                    <div class="modal-body">
                        <form method="POST" action="ControladorTelefono">
                            <input type="number" placeholder="Telefono.." name="telefonotxt_del"/>
                            <input type="text" placeholder="Ubicacion.." name="ubicaciontxt_del"/>           
                            <input type="submit" value="Eliminar">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    </div>
                </div>

            </div>
        </div>
        <div class="modal fade" id="miDireccionDel" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Eliminar Direccion</h4>
                    </div>
                    <div class="modal-body">
                        <form method="POST" action="ControladorDireccion">
                            <input type="text" placeholder="Direccion.." name="direcciontxt_del"/>                       
                            <input type="submit" value="Eliminar">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    </div>
                </div>

            </div>
        </div>
        <div class="modal fade" id="miCorreoDel" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Eliminar Correo</h4>
                    </div>
                    <div class="modal-body">
                        <form method="POST" action="ControladorCorreoElectronico">
                            <input type="email" placeholder="Correo Electronico.." name="correoetxt_del"/>                       
                            <input type="submit" value="Eliminar">
                        </form>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    </div>
                </div>

            </div>
        </div>

    </body>
</html>
