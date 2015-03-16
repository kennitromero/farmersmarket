<%-- 
    Document   : cargarCiudades
    Created on : 7/03/2015, 08:48:47 AM
    Author     : kennross
--%>

<%@page import="modelo.daos.CiudadDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.dtos.CiudadDto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ciudades</title>
    </head>
    <body>
        <%
            CiudadDao cdao = new CiudadDao();
            ArrayList<CiudadDto> ciudades = new ArrayList();

            if (request.getParameter("idDepartamento") != null) {

                ciudades = (ArrayList<CiudadDto>) cdao.obtenerCiudadesPorId(Integer.parseInt(request.getParameter("idDepartamento")));
                if (ciudades.size() > 0) {
                    for (CiudadDto cDatos : ciudades) {
                        out.write("<option value = " + cDatos.getIdCiudad() + ">" + cDatos.getNombre() + "</option>");

                    }
                }
            }
        %>
    </body>
</html>
