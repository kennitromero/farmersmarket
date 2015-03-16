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
import modelo.dtos.PermisoRolDto;
import modelo.utilidades.Conexion;

public class PermisoRolDao {
    
    private Connection miCon = null;
    PreparedStatement pstm = null;
    int rtdo;
    ResultSet rs = null;
    String mensaje = "";
    
    public PermisoRolDao() {
        miCon = Conexion.getInstance();
    }
    
    public String insertPermisoRol(PermisoRolDto nuevoPermisoRol) {
        try {
            String sqlInsert = "INSERT INTO `permisosrol`(`idPermiso`, `idRol`) VALUES (?, ?)";
            pstm = miCon.prepareStatement(sqlInsert);
            
            pstm.setInt(2, nuevoPermisoRol.getIdPermiso());
            pstm.setInt(1, nuevoPermisoRol.getIdRol());
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
        
    public List obtenerPermisosPorRol(int idRol) {
        ArrayList<PermisoRolDto> permisosRoles = new ArrayList();
        String sql = "SELECT `idPermisos`, `idRol` FROM `permisosrol` WHERE `idRol` = ?";
        try {
            pstm = miCon.prepareStatement(sql);
            pstm.setInt(1, idRol);
            rs = pstm.executeQuery();

            while (rs.next()) {
                PermisoRolDto temp = new PermisoRolDto();
                temp.setIdPermiso(rs.getInt("idPermisos"));
                temp.setIdRol(rs.getInt("idRol"));
                permisosRoles.add(temp);
            }
        } catch (SQLException sqle) {
            System.out.println("Error, detalle: " + sqle.getMessage());
        }
        return permisosRoles;
    }        
}