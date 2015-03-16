<%-- 
    Document   : pruebas
    Created on : 11/03/2015, 05:53:22 PM
    Author     : kennross
--%>

<%@page import="modelo.dtos.DepartamentoDto"%>
<%@page import="modelo.daos.DepartamentoDao"%>
<%@page import="modelo.dtos.RolDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.dtos.UsuarioDto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
        <script type="text/javascript" src="../js/jquery-1.11.2.js"></script>
        <script type="text/javascript" src="../js/bootstrap.js"></script>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            HttpSession miSesion = request.getSession(false);
            HttpSession miSesionRoles = request.getSession(false);

            UsuarioDto actualUsuario;
            actualUsuario = (UsuarioDto) miSesion.getAttribute("usuarioEntro");

            if (actualUsuario == null) {
                out.print("Se cerró la sesión y está null");
            } else {
                out.print("La sesión está abierta");

                ArrayList<RolDto> rolesActuales;

                actualUsuario = (UsuarioDto) miSesion.getAttribute("usuarioEntro");
                rolesActuales = (ArrayList<RolDto>) miSesionRoles.getAttribute("roles");

                out.print(miSesionRoles.getAttribute("roles"));

                RolDto primerRol = rolesActuales.get(0);
            }
        %>

        <p class="text-lowercase">Elige Un Trabajo Que Te Guste Y No Tendrás Que Trabajar Ni Un Día De Tu Vida.</p>
        
        <button class="btn btn-success" role="button" data-toggle="modal" data-target="#modalRegistrarse">Registrarse</button>

        <!-- Inicio de Ventana Modal Registro de usuarios -->
        <div class="modal fade bs-example-modal-lg" id="modalRegistrarse" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <!-- La ventana en Sí -->
            <div class="modal-dialog modal-lg">
                <!-- Contenedor de la ventana -->
                <div class="modal-content">
                    <!-- Título de la ventana de registro -->
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h2 class="modal-title text-center text-success">Registrárse en Farmer's Market</h2>
                    </div>
                    <!-- Fin del título de la ventana de registro -->
                    <br>
                    <!-- Contenedor del formulario de registro -->
                    <div class="container-fluid">
                        <div class="col-md-12">
                            <form method="POST" action="captchaEnviado.jsp">
                                <div class="col-md-6">
                                    <div class="form-group has-feedback" id="inpRol">
                                        <label for="ruRol" class="control-label">Yo soy:</label>
                                        <select name="ruRol" id="ruRol" class="form-control" tabindex="1" required autofocus onblur="validarSeleccionRol(this)">
                                            <option value="0">Seleccione un rol</option>
                                            <option value="1" selected>Cliente</option>
                                            <option value="2">Productor</option>                                                        
                                        </select>
                                    </div>

                                    <div class="form-group has-feedback" id="inpDocumento">
                                        <label class="control-label" for="ruDocumento">N° de Documento:</label>
                                        <input type="text" class="form-control" tabindex="2" name="ruDocumento"
                                               id="ruDocumento" value="64569185" maxlength="10" required onblur="validarUsuarioYaRegistrado(this);
                                                                   validarDocumento(this)">
                                        <i id="iconFeedbackDocumento"></i>
                                    </div>                           

                                    <div class="form-group has-feedback" id="inpNombres">
                                        <label class="control-label" for="ruNombres">Nombres:</label>
                                        <input type="text" class="form-control" name="ruNombres" maxlength="30" onblur="validarNombres(this);"
                                               id="ruNombres" tabindex="3" value="Alyson" required>
                                        <i id="iconFeedbackNombres"></i>
                                    </div>

                                    <div class="form-group has-feedback" id="inpApellidos">
                                        <label class="control-label" for="ruApellidos">Apellidos:</label>
                                        <input type="text" class="form-control" name="ruApellidos" maxlength="30"
                                               id="ruApellidos" tabindex="4" value="Romero Oviedo" onblur="validarApellidos(this)" required>
                                        <i id="iconFeedbackApellidos"></i>
                                    </div>

                                    <div class="form-group has-feedback" id="inpCorreo">
                                        <label class="control-label" for="ruCorreo">Correo:</label>
                                        <input type="text" class="form-control" name="ruCorreo" tabindex="5" onblur="validarCorreo(this);
                                                            validaCorreoYaRegistrado(this)"
                                               id="ruCorreo" value="alyssa-luna@hotmail.com" required>
                                        <i id="iconFeedbackCorreo"></i>
                                    </div>

                                    <div class="form-group has-feedback" id="inpCorreoRepetido">
                                        <label class="control-label" for="ruCorreo2">Repetir Correo:</label>
                                        <input type="text" class="form-control" name="ruCorreo2" tabindex="6" onblur="validarRepetirCorreo(this)"
                                               id="ruCorreo2" value="alyssa-luna@hotmail.com" required>
                                        <i id="iconFeedbackCorreo2"></i>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group has-feedback" id="inpDireccion">
                                        <label class="control-label" for="ruDireccion">Dirección:</label>
                                        <input type="text" class="form-control" name="ruDireccion" 
                                               id="ruDireccion" tabindex="7" value="Carrera 19 Bis 8 - 19" onblur="validarDireccion(this)" required>
                                        <i id="iconFeedbackDireccion"></i>
                                    </div>

                                    <div class="form-group has-feedback" id="inpDepartamento">
                                        <label class="control-label" for="ruDepartamento">Departamento:</label>
                                        <select name="ruDepartamento" id="ruDepartamento" class="form-control" tabindex="7" onblur="validarDepartamento(this);" onchange="getSubcategorias(this.value);" required>
                                            <option value="">Seleccione un departamento</option>
                                            <%
                                                DepartamentoDao departDao = new DepartamentoDao();
                                                ArrayList<DepartamentoDto> listDepartamentos;
                                                listDepartamentos = (ArrayList<DepartamentoDto>) departDao.obtenerDepartamentos();
                                                for (DepartamentoDto d : listDepartamentos) {
                                            %>
                                            <option value="<%= d.getIdDepartamento()%>"><%= d.getNombre()%></option>
                                            <%
                                                }
                                            %>
                                        </select>
                                    </div>

                                    <div class="form-group has-feedback" id="inpCiudad">
                                        <label class="control-label" for="ruCiudad">Ciudad:</label>
                                        <select name="ruCiudad" id="ruCiudad" class="form-control" tabindex="7" onblur="validarCiudad(this)" required>
                                            <option value="">Seleccione una ciudad</option>                                                        
                                        </select>
                                    </div>

                                    <div class="form-group has-feedback" id="inpClave">
                                        <label class="control-label" for="ruClave">Contraseña:</label>
                                        <input type="password" class="form-control" value="mark42" name="ruClave" id="ruClave" tabindex="8" required onblur="validarClave(this)">
                                        <i id="iconFeedbackClave"></i>
                                    </div>

                                    <div class="form-group has-feedback" id="answer">
                                        <label class="control-label" for="answer"><img src="ocaptcha"></label>
                                        <input type="text" name="answer" id="answer" class="form-control" 
                                               placeholder="Ingrese los caracteres de la figura" tabindex="9" required onblur="validarCaptcha(this)">                                                    
                                    </div>

                                    <div class="checkbox has-feedback">
                                        <label class="control-label">
                                            <input required type="checkbox" tabindex="10"> Acepto <a href="#" data-toggle="modal" data-target="#modalTerminos">Terminos y Condiciones</a>
                                        </label>
                                    </div>

                                    <input type="submit" id="botonRegistro" name="botonRegistro" class="btn btn-success" value="Registrarme">
                                </div>
                            </form>  
                        </div>
                        <!-- -->
                    </div>
                    <!-- Contenedor del formulario de registro -->
                </div>
                <!-- Fin del contenedor de la ventana -->
            </div>
            <!-- Fin de la ventana en Sí -->
        </div>
        <!-- Fin de Ventana Modal Larga -->
    </body>
</html>
