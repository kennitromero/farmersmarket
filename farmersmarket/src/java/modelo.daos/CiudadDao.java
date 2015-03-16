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
import modelo.dtos.CiudadDto;
import modelo.utilidades.Conexion;

public class CiudadDao {

    private Connection miCon = null;
    PreparedStatement pstm = null;
    int rtdo;
    ResultSet rs = null;
    String mensaje = "";
    String sqlTemp = "";

    public CiudadDao() {
        miCon = Conexion.getInstance();
    }

    public List obtenerCiudadesPorId(int idDepartamento) {
        ArrayList<CiudadDto> ciudades = null;
        sqlTemp = "SELECT `idCiudad`, `Nombre`, `idDepartamento` FROM `ciudades` WHERE idDepartamento = ? ORDER BY `Nombre`";
        try {
            pstm = miCon.prepareStatement(sqlTemp);
            pstm.setInt(1, idDepartamento);
            rs = pstm.executeQuery();

            ciudades = new ArrayList();
            while (rs.next()) {
                CiudadDto temp = new CiudadDto();
                temp.setIdCiudad(rs.getInt("idCiudad"));
                temp.setNombre(rs.getString("Nombre"));
                temp.setIdDepartamento(rs.getInt("idDepartamento"));
                ciudades.add(temp);
            }
        } catch (SQLException ex) {
            System.out.println("Error, detalle: " + ex.getMessage());
        }
        return ciudades;
    }

    public String obtenerNombrePorId(int idCiudad) {
        try {
            String sqlInsert = "SELECT `Nombre`, `idDepartamento` FROM `ciudades` WHERE `idCiudad` = ?";
            pstm = miCon.prepareStatement(sqlInsert);

            pstm.setInt(1, idCiudad);
            rs = pstm.executeQuery();

            while (rs.next()) {
                mensaje = rs.getString("Nombre");
            }
        } catch (SQLException sqle) {
            mensaje = "Error, detalle " + sqle.getMessage();
        }
        return mensaje;
    }
}
