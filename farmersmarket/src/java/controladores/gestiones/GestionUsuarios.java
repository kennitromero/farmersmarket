package controladores.gestiones;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.daos.ContactoDao;
import modelo.daos.UsuarioDao;
import modelo.dtos.ContactoDto;
import modelo.dtos.RolDto;
import modelo.dtos.UsuarioDto;
import modelo.utilidades.Correo;

/**
 *
 * @author kennross
 */
public class GestionUsuarios extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        String correo = "";
        String mensajeCorreo = "";

        //Registro de un usuario dentro del sistema
        if (request.getParameter("botonRegistro") != null && request.getParameter("botonRegistro").equals("Registrarme")) {
            RolDto suRol = new RolDto();
            suRol.setIdRol(Integer.parseInt(request.getParameter("ruRol")));

            UsuarioDto nuevoUsuario = new UsuarioDto();
            nuevoUsuario.setIdUsuario(Long.parseLong(request.getParameter("ruDocumento")));
            nuevoUsuario.setNombres(request.getParameter("ruNombres"));
            nuevoUsuario.setApellidos(request.getParameter("ruApellidos"));
            nuevoUsuario.setClave(request.getParameter("ruClave"));
            nuevoUsuario.setCorreo(request.getParameter("ruCorreo"));
            nuevoUsuario.setFechaNacimiento(null);
            nuevoUsuario.setDireccion(request.getParameter("ruDireccion"));
            nuevoUsuario.setIdCiudad(Integer.parseInt(request.getParameter("ruCiudad")));
            nuevoUsuario.setImagen("img/avatars/avatar-productor.png");
            nuevoUsuario.setEstado(1);

            UsuarioDao realizarRegistro = new UsuarioDao();
            String salida = realizarRegistro.insertUsuarioProcedimiento(nuevoUsuario, suRol);

            if (salida.equals("ok")) {
                response.sendRedirect("index.jsp?msg=<strong><i class='glyphicon glyphicon-ok'></i> ¡Registro Éxitoso!</strong> Revise su correo para activar cuenta, puede iniciar sesión.&tipoAlert=success");
            } else if (salida.equals("okno")) {
                response.sendRedirect("../index.jsp?msg=<strong><i class='glyphicon glyphicon-exclamation-sign'></i> ¡Algo salió mal!</strong> Por favor intentelo de nuevo.&tipoAlert=warning");
            } else {
                response.sendRedirect("../index.jsp?msg=<strong><i class='glyphicon glyphicon-exclamation-sign'></i> ¡Ocurrió un error!</strong> Detalle: " + salida + "&tipoAlert=danger");
            }
        } else if (request.getParameter("formCambiarClave") != null && request.getParameter("formCambiarClave").equals("ok")) {
            String claveAntigua = request.getParameter("ccClaveAntigua");
            String claveNueva = request.getParameter("ccClaveNueva");
            String claveNuevaRepetida = request.getParameter("ccClaveRepetida");
            long documento = Long.parseLong(request.getParameter("ccDocumento"));
            String viene = request.getParameter("ccViene");

            if (claveAntigua != null && claveNueva != null && claveNuevaRepetida != null && documento != 0) {
                UsuarioDao validar = new UsuarioDao();
                UsuarioDto usuario;

                usuario = validar.validarSesion(documento);

                if (usuario.getClave().equals(claveAntigua)) {
                    String salida = validar.actualizarClave(claveNueva, documento);

                    mensajeCorreo = "Se ha cambiado su contraseña, a nueva contraseña es: " + claveNueva + " y la antigua era: " + claveAntigua;

                    correo = validar.obtenerCorreoPorId(documento);

                    if (salida.equals("ok")) {
                        if (Correo.sendMail("Contraseña Cambiada", mensajeCorreo, correo)) {
                            response.sendRedirect("pages/" + viene + ".jsp?msg=<strong>¡Cambio Éxitoso! <i class='glyphicon glyphicon-ok'></i></strong> La contraseña se cambió correctamente, revise su correo.&tipoAlert=success");
                        } else {
                            response.sendRedirect("pages/" + viene + ".jsp?msg=<strong>¡Cambio Éxitoso! <i class='glyphicon glyphicon-ok'></i></strong> La contraseña se cambió correctamente, " + usuario.getCorreo() + " no envió correo.&tipoAlert=success");
                        }
                    } else if (salida.equals("okno")) {
                        response.sendRedirect("pages/" + viene + ".jsp?msg=<strong><i class='glyphicon glyphicon-exclamation-sign'></i> ¡Algo salió mal!</strong> Por favor intentelo de nuevo.&tipoAlert=warning");
                    } else {
                        response.sendRedirect("pages/" + viene + ".jsp?msg=<strong><i class='glyphicon glyphicon-exclamation-sign'></i> ¡Ocurrió un error!</strong> Detalle: " + salida + "&tipoAlert=danger");
                    }
                } else {
                    response.sendRedirect("pages/" + viene + ".jsp?msg=<strong>¡Contraseña Antigua Incorrecta!</strong> Por favor, Intente de nuevo <i class='glyphicon glyphicon-remove'></i>&tipoAlert=danger");
                }
            }
        } else if (request.getParameter("mcEnviar") != null && request.getParameter("mcEnviar").equals("ok")) {
            ContactoDto nuevoMensajeContacto = new ContactoDto();
            nuevoMensajeContacto.setNombreCompleto(request.getParameter("mcNombre"));
            nuevoMensajeContacto.setCorreo(request.getParameter("mcCorreo"));
            nuevoMensajeContacto.setMensaje(request.getParameter("mcMensaje"));

            String viene = request.getParameter("mcViene");

            ContactoDao enviarContacto = new ContactoDao();
            String salida = enviarContacto.insertContactenos(nuevoMensajeContacto);

            if (salida.equals("ok")) {
                response.sendRedirect("pages/" + viene + ".jsp?msg=<strong>¡Mensaje Enviado Éxitosamente! <i class='glyphicon glyphicon-ok'></i></strong> Nos pondremos en contacto con usted cuando leamos el mensaje.&tipoAlert=success");
            } else if (salida.equals("okno")) {
                response.sendRedirect("pages/" + viene + ".jsp?msg=<strong><i class='glyphicon glyphicon-exclamation-sign'></i> ¡Algo salió mal!</strong> Por favor intentelo de nuevo.&tipoAlert=warning");
            } else {
                response.sendRedirect("pages/" + viene + ".jsp?msg=<strong><i class='glyphicon glyphicon-exclamation-sign'></i> ¡Ocurrió un error!</strong> Detalle: " + salida + "&tipoAlert=danger");
            }
        } else if (request.getParameter("rcEnviar") != null && request.getParameter("rcEnviar").equals("ok")) {
            
            correo = request.getParameter("rcCorreo");
            UsuarioDao validar = new UsuarioDao();
            UsuarioDto usuario;
            
            usuario = validar.obtenerUsuarioPorCorreo(correo);
            
            correo = usuario.getCorreo();
            mensajeCorreo = "Usted ha pedido recuperar su contraseña, su contraseña es: " + usuario.getClave() + " <br><strong>Le recomendamos que la cambie a penas ingrese</strong>";
            
            
            if (Correo.sendMail("Recuperar Contraseña", mensajeCorreo, correo)) {
                response.sendRedirect("index.jsp?msg=<strong>¡Recuperación Éxitosa! <i class='glyphicon glyphicon-ok'></i></strong> Revise su correo obtener su contaseña, <strong> Recuerde cambiarla, por su seguridad.</strong>&tipoAlert=success");
            } else {
                
            }
        }

        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GestionUsuarios</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GestionUsuarios at " + request.getContextPath() + "</h1>");
            out.println(request.getCharacterEncoding());
            out.println(request.getParameter("var"));
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
