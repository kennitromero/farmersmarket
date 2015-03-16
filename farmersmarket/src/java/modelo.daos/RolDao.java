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
import modelo.dtos.RolDto;
import modelo.utilidades.Conexion;

public class RolDao {

    private Connection miCon = null;
    PreparedStatement pstm = null;
    int rtdo;
    ResultSet rs = null;
    String mensaje = "";
    String sqlTemp = "";

    public RolDao() {
        miCon = Conexion.getInstance();
    }

    public String insertRol(RolDto nuevoRol) {
        try {
            String sqlInsert = "INSERT INTO `roles`(`idRol`, `Nombre`, `Descripcion`, `Estado`) VALUES (null, ?, ?, ?)";
            pstm = miCon.prepareStatement(sqlInsert);

            pstm.setString(1, nuevoRol.getNombre());
            pstm.setString(2, nuevoRol.getDescripcion());
            pstm.setInt(3, nuevoRol.getEstado());
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

    public List obtenerRoles() {
        ArrayList<RolDto> roles = null;
        sqlTemp = "SELECT `idRol`, `Nombre`, `Descripcion`, `Estado` FROM `roles`";
        try {
            pstm = miCon.prepareStatement(sqlTemp);
            rs = pstm.executeQuery();

            roles = new ArrayList();
            while (rs.next()) {
                RolDto temp = new RolDto();
                temp.setIdRol(rs.getInt("idRol"));
                temp.setNombre(rs.getString("Nombre"));
                temp.setDescripcion(rs.getString("Descripcion"));
                temp.setEstado(rs.getInt("Estado"));
                roles.add(temp);
            }
        } catch (SQLException ex) {
            System.out.println("Error, detalle: " + ex.getMessage());
        }
        return roles;
    }

    public String actualizarRol(RolDto rolActualizado) {
        try {
            String sqlInsert = "UPDATE `roles` SET `Nombre` = ?, `Descripcion` = ?, `Estado` = ? WHERE `idRol` = ?";
            pstm = miCon.prepareStatement(sqlInsert);

            pstm.setString(1, rolActualizado.getNombre());
            pstm.setString(2, rolActualizado.getDescripcion());
            pstm.setInt(3, rolActualizado.getEstado());
            pstm.setInt(4, rolActualizado.getIdRol());
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
