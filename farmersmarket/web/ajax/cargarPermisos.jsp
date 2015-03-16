<%-- 
    Document   : cargarPermisos
    Created on : 11/03/2015, 07:06:50 PM
    Author     : kennross
--%>

<%@page import="modelo.daos.PermisoDao"%>
<%@page import="modelo.dtos.PermisoDto"%>
<%@page import="modelo.dtos.RolDto"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Permisos</title>
    </head>
    <body>
        <%
            ArrayList<PermisoDto> listaPermisos;
            PermisoDao permisoDao = new PermisoDao();

            if (request.getParameter("idRol") != null) {

                listaPermisos = (ArrayList<PermisoDto>) permisoDao.obtenerPermisosPorRol(Integer.parseInt(request.getParameter("idRol")));

                if (listaPermisos.size() > 0) {
                    for (PermisoDto temPermiso : listaPermisos) {                        
                        out.write("<li role='presentation' class='text-left'><a href='" + temPermiso.getUrl() + "'>" + temPermiso.getNombre() + " " + temPermiso.getIcon() + "</a></li>");
                    }
                }
            }
        %>
    </body>
</html>


