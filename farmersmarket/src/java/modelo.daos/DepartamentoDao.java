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
import modelo.dtos.DepartamentoDto;
import modelo.utilidades.Conexion;

public class DepartamentoDao {

    private Connection miCon = null;
    PreparedStatement pstm = null;
    int rtdo;
    ResultSet rs = null;
    String mensaje = "";
    String sqlTemp = "";

    public DepartamentoDao() {
        miCon = Conexion.getInstance();
    }

    public List obtenerDepartamentos() {
        ArrayList<DepartamentoDto> departamentos = null;
        sqlTemp = "SELECT `idDepartamento`, `Nombre` FROM `departamentos` ORDER BY `Nombre`";
        try {
            pstm = miCon.prepareStatement(sqlTemp);
            rs = pstm.executeQuery();

            departamentos = new ArrayList();
            while (rs.next()) {
                DepartamentoDto temp = new DepartamentoDto();
                temp.setIdDepartamento(rs.getInt("idDepartamento"));
                temp.setNombre(rs.getString("Nombre"));
                departamentos.add(temp);
            }
        } catch (SQLException ex) {
            System.out.println("Error, detalle: " + ex.getMessage());
        }
        return departamentos;
    }

    public String obtenerNombrePorId(int idDepartamento) {
        try {
            String sqlInsert = "SELECT `Nombre` FROM `departamentos` WHERE `idDepartamento` = ?";
            pstm = miCon.prepareStatement(sqlInsert);

            pstm.setInt(1, idDepartamento);
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
