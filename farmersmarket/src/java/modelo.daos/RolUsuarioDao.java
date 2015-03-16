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
import modelo.dtos.RolUsuarioDto;
import modelo.utilidades.Conexion;

public class RolUsuarioDao {

    private Connection miCon = null;
    PreparedStatement pstm = null;
    int rtdo;
    ResultSet rs = null;
    String mensaje = "";
    String sqlTemp = "";

    public RolUsuarioDao() {
        miCon = Conexion.getInstance();
    }

    public String insertRolUsuario(RolUsuarioDto nuevoRolUsuario) {
        try {
            String sqlInsert = "INSERT INTO `rolusuario`(`idRol`, `idUsuario`) VALUES (?, ?)";
            pstm = miCon.prepareStatement(sqlInsert);

            pstm.setInt(1, nuevoRolUsuario.getIdRol());
            pstm.setInt(2, nuevoRolUsuario.getIdUsuario());
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
    
    public ArrayList<RolDto> obtenerRolesParaUsuario(long documento) {
        String sqlLeerRoles = "SELECT r.idRol, r.Nombre, r.Descripcion, r.Estado "
                + "FROM roles as r JOIN rolusuario as ru ON (r.idRol = ru.idRol) "
                + "WHERE ru.idUsuario = ?";
        ArrayList<RolDto> misRoles = new ArrayList();
        try {
            pstm = miCon.prepareStatement(sqlLeerRoles);
            pstm.setLong(1, documento);
            rs = pstm.executeQuery();
            while (rs.next()) {
                RolDto tempRol = new RolDto();
                tempRol.setIdRol(rs.getInt("idRol"));
                tempRol.setNombre(rs.getString("Nombre"));
                tempRol.setDescripcion(rs.getString("Descripcion"));
                tempRol.setEstado(rs.getInt("Estado"));
                misRoles.add(tempRol);
            }
        } catch (SQLException ex) {
            System.out.println("Error, detalle: " + ex.getMessage());
        }
        return misRoles;
    }
}
