package modelo.daos;

/**
 * @author Kennit David Ruz Romero 
 * Fecha: 4 de de Enero de 2015
 */

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.dtos.PermisoDto;
import modelo.utilidades.Conexion;

public class PermisoDao {

    private Connection miCon = null;
    PreparedStatement pstm = null;
    int rtdo;
    ResultSet rs = null;
    String mensaje = "";
    String sqlTemp = "";

    public PermisoDao() {
        miCon = Conexion.getInstance();
    }    
    
    public List obtenerPermisosPorRol(int rol) {
        ArrayList<PermisoDto> permisos = null;
        String sql = "SELECT p.idPermiso, p.Nombre, p.Url, p.Icon, p.Estado "
                + "FROM `permisos` as p JOIN permisosrol as pr ON (p.idPermiso = pr.idPermiso) "
                + "JOIN Roles as r ON (r.idRol = pr.idRol) WHERE r.idRol = ?";
        try {
            pstm = miCon.prepareStatement(sql);
            pstm.setInt(1, rol);
            rs = pstm.executeQuery();

            permisos = new ArrayList();
            while (rs.next()) {
                PermisoDto temp = new PermisoDto();
                temp.setIdPermiso(rs.getInt("idPermiso"));
                temp.setNombre(rs.getString("Nombre"));
                temp.setUrl(rs.getString("Url"));
                temp.setIcon(rs.getString("Icon"));
                temp.setEstado(rs.getInt("Estado"));
                permisos.add(temp);
            }
        } catch (SQLException sqle) {
            System.out.println("Error, detalle: " + sqle.getMessage());
        }
        return permisos;
    }
    
    public String actualizarEstado(int idPermiso, int nuevoEstado) {
        try {
            String sqlInsert = "UPDATE `permisos` SET `Estado` = ? WHERE `idPermiso` = ?";
            pstm = miCon.prepareStatement(sqlInsert);

            pstm.setInt(1, nuevoEstado);
            pstm.setInt(2, idPermiso);
            rtdo = pstm.executeUpdate();
            
            if (rtdo != 0) {
                mensaje = "ok";
            } else {
                mensaje = "okno";
            }
        } catch (SQLException sqle) {
            mensaje = "Error, detalle " + sqle.getMessage();
        }
        return mensaje;
    }        
}
